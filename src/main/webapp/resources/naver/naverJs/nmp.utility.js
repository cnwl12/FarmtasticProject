/**
 * @namespace utility 메소드 집합
 */
nmp.utility = {
    name: "nmp.utility",
    /**
     * 스크립트 추출 시에 사용할 정규표현식 문자열
     * type==template인 경우는 예외한다.
     * @type {String}
     */
    _sScriptFragment: "<script[^>]*>([\\S\\s]*?)<\/script>",

    _welDimmedLayer: null,

    _oTplDimmedLayer: jindo.$Template([
        '{set nOpacityAlpha=(=nOpacity * 10)}',
        '<div class="_stopDefault _stopBubble" style="z-index:{=nZIndex};width:100%;height:100%;position:fixed;top:0;left:0;background:#000;opacity:{=nOpacity};filter:alpha(opacity={=nOpacityAlpha})"></div>'
    ].join('')),

    _htAttribute: null,

    _bResizeFlag: false,
    /**
     * Destination HashTable 객체 내용을 Source HashTable객체에 복사하는 메소드
     * @param {HashTable} oSource
     * @param {HashTable} oDestination
     */
    extend: function(oSource, oDestination) {
        for (var x in oDestination) {
            oSource[x] = oDestination[x];
        }
        return oSource;
    },

    /**
     * sString에서 스크립트 부분을 제거한다.
     *
     * @param {String} sString 스크립트를 제거할 문자열
     * @return {String} 스크립트가 제거된 문자열
     */
    stripScript: function(sString) {
        return sString.replace(new RegExp(this._sScriptFragment, 'img'), '');
    },

    /**
     * sString에서 스크립트 부분만을 추출한다.
     *
     * @param {String} sString 스크립트를 추출할 문자열
     * @return {String} 추출된 스크립트 문자열
     */
    extractScript: function(sString) {
        var matchAll = new RegExp(this._sScriptFragment, 'img');
        var matchOne = new RegExp(this._sScriptFragment, 'im');
        return jindo.$A(sString.match(matchAll) || []).map(function(scriptTag) {
            return (scriptTag.match(matchOne) || ['', ''])[1];
        }).$value();
    },

    /**
     * sString에서 스크립트 부분만을 추출하여 실행한다.
     *
     * @param {String} sString 스크립트를 추출하여 실행할 문자열
     * @return {Boolean} 실행 결과
     */
    evaluateScript: function(sString) {
        return jindo.$A(this.extractScript(sString)).map(function(sScript) {
            return eval(sScript);
        });
    },

    /**
     * 확인 창 없이 창 닫는 함수
     */
    closeWindow: function() {
        self.window.open('', '_self', '');
        self.opener = self;
        window.close();
    },

    /**
     * 객체 생성자 이름을 얻어 옴
     * @param {Object} oTarget 생성자 이름을 얻어올 객체
     * @return {String} 생성자 이름
     */
    getConstructorName: function(oTarget) {
        if (oTarget && oTarget.constructor) {
            var sCode = oTarget.constructor.toString();
            var aMatch = sCode.match(/function ([^\(]*)/);
            return (aMatch && aMatch[1]) || null;
        }
        return null;
    },

    /**
     * 객체 Deep Copy 함수
     * @param {Object} oSourceTarget 복사할 객체
     * @return {Object} 복사된 객체
     */
    cloningObject: function(oSourceTarget) {
        var sConstructor;
        var oDestinationTarget;

        if ((typeof oSourceTarget == "object") && (sConstructor = this.getConstructorName(oSourceTarget))) {
            oDestinationTarget = eval("new " + sConstructor + "()");

            if (oSourceTarget.prototype) {
                for (var x in oSourceTarget.prototype) {
                    oDestinationTarget.prototype[x] = this.cloningObject(oSourceTarget.prototype[x]);
                }
            }

            for (var y in oSourceTarget) {
                if (oSourceTarget[y] instanceof RegExp) {
                    oDestinationTarget[y] = eval(oSourceTarget[y].toString());
                } else {
                    oDestinationTarget[y] = this.cloningObject(oSourceTarget[y]);
                }
            }
            return oDestinationTarget;
        }

        oDestinationTarget = oSourceTarget;
        return oDestinationTarget;
    },

    /**
     * 윈도우 사이즈 변경 함수
     * 파라미터를 넘기지 않으면 컨텐츠 사이즈에 맞게 윈도우 사이즈가 변경된다.
     * nWidth, nHeight 둘중 1개만 넘기면 나머지 값은 컨텐츠 사이즈에 맞게 조절된다.
     * nWidth, nHeight를 넘길 경우 값은 0보다 커야한다.
     * Windows(IE 6~8, Chrome,FireFox),Mac(safari,FireFox)에서 확인
     * @param {HashTable} htSize 설정할 넓이,높이값 ex){'nWidth'100:,'nHeight'100:}
     */
    setWindowSize: function(htSize) {
        try {
            var _htSize = {
                "nWidth": -1,
                "nHeight": -1,
                "nMaxWidth": 0,
                "nMaxHeight": 0
            };
            for (var x in htSize) {
                _htSize[x] = htSize[x];
            }
            if (_htSize.nWidth != -1 && _htSize.nHeight != -1) { //지정된 width,height 값으로 세팅하는 경우
                var htOldClientSize = jindo.$Document().clientSize();
                jindo.$Window().resizeBy(_htSize.nWidth - htOldClientSize.width, _htSize.nHeight - htOldClientSize.height);
            } else { // 어느 한쪽이라도 컨텐츠에 맞춰야 하는 경우
                var oNavigator = jindo.$Agent().navigator();
                /*
                 * ie,safari,chrome인 경우 변경된 width값을 제대로 알 수가 없어서 창 사이즈를 줄였다가 재 조정 한다.
                 * ie는 깜빡임을 줄이기 위해 document.body의 width를 조절하였다. safari나 chrome은 이것으로 해결이 안되어서 창사이즈를 줄였다 재조정했다.
                 * chrome은 창사이즈를 줄이고 바로 재 조정을 하면 재조정이 안된어서 setTimeout으로 해결했다.
                 */
                if (oNavigator.ie) { //ie
                    jindo.$Element(document.body).width(100); // IE에서 깜빡임을 없애기 위해 document.body의 width값을 100으로 조정하고 나중에 복원한다.
                    this._sizeToContent(_htSize.nWidth, _htSize.nHeight, _htSize.nMaxWidth, _htSize.nMaxHeight);
                    jindo.$Element(document.body).width(jindo.$Document().clientSize().width); // width값 복원

                    /*
                     * [SELLBLOG-4123] 팝업크기가 screen 영역 밖으로 나가면, IE에서는 팝업 크기를 screen 크기에 맞게 강제로 조절한다.
                     * 사이즈 조절 량에 맞게 조절되면서, screen영역 밖으로 나가는 경우 window의 위치를 이동시킨다.
                     */
                    var htChangedSize = this._sizeToContent(_htSize.nWidth, _htSize.nHeight, _htSize.nMaxWidth, _htSize.nMaxHeight, true);
                    this._moveAndResizeWindow(htChangedSize, 2);

                } else if (oNavigator.safari) { //safari
                    jindo.$Window().resizeTo(100, 100);
                    this._sizeToContent(_htSize.nWidth, _htSize.nHeight, _htSize.nMaxWidth, _htSize.nMaxHeight);
                } else if (oNavigator.chrome) { // chrome
                    this._bResizeFlag = true;
                    var wfResize = jindo.$Fn(function() {
                        if (this._bResizeFlag) {
                            wfResize.detach(window, "resize");
                            this._sizeToContent(_htSize.nWidth, _htSize.nHeight, _htSize.nMaxWidth, _htSize.nMaxHeight);
                            this._bResizeFlag = false;
                        }
                    }, this).attach(window, "resize");
                    jindo.$Window().resizeTo(133, 53);
                    /*
                    					$Window().resizeTo(100,100);
                    					setTimeout($Fn(function(){
                    						this._sizeToContent(_htSize.nWidth,_htSize.nHeight, _htSize.nMaxWidth,_htSize.nMaxHeight);
                    					}, this).bind(),50);
                    */
                } else { //ff
                    this._sizeToContent(_htSize.nWidth, _htSize.nHeight, _htSize.nMaxWidth, _htSize.nMaxHeight);
                }
            }
        } catch (me) {
            jindo.$Fn(function() {
                this.setWindowSize(htSize);
            }, this).delay(0.5);
        }
    },

    /**
     * window의 위치가 screen 밖으로 넘어가면 위치를 조정하고, 팝업의 리사이즈를 다시 수행한다.
     * SELLBLOG-4123 이슈를 해결하기 위해 추가된 함수이며, 재귀적으로 동작한다.(nLimitedCallCount 값이 횟수제한, default 1)
     * IE 외의 브라우저에서는 이 기능이 꼭 필요한지 검토 후 적용하는 것을 권장한다.
     * @param {HashTable} htChangeAmount 조정되어야 할, window의 사이즈
     * @param {Number} nLimitedCallCount 최대 조정 횟수, 2번을 넘기면 최대 3회까지 수행된다. default 값은 1
     */
    _moveAndResizeWindow: function(htChangeAmount, nLimitedCallCount) {
        nLimitedCallCount = (typeof nLimitedCallCount == "undefined") ? 1 : nLimitedCallCount;
        if (htChangeAmount.bOverflowMaxHeight) {
            htChangeAmount.width = htChangeAmount.width - 17;
        }
        // 수행 제한 수가 남고, 조정해야 할 수치가 있으면 사이즈 조정을 수행한다.
        if (nLimitedCallCount >= 1 && (htChangeAmount.width > 0 || htChangeAmount.height > 0)) {
            jindo.$Window().moveBy(-(htChangeAmount.width), -(htChangeAmount.height));
            jindo.$Window().resizeBy(htChangeAmount.width, htChangeAmount.height);

            var nWindowLeft = window.screenLeft || window.screenX;
            var nWindowTop = window.screenTop || window.screenY;

            /*
             * 윈도우 사이즈가 조정되면서,
             * 팝업의 window의 시작점이 음수가 되면 0으로 조절하고, 사이즈 조정을 중단한다.
             */
            if (nWindowLeft < 0 || nWindowTop < 0) {
                if (nWindowLeft < 0) {
                    jindo.$Window().moveTo(0, nWindowTop);
                }
                if (nWindowTop < 0) {
                    jindo.$Window().moveTo(nWindowLeft, 0);
                }
            } else {
                /*
                 * 조정되어야 할 사이즈를 계산한 다음 재귀호출로 사이즈를 조정한다.
                 */
                var htAfter = this._sizeToContent(-1, -1, 0, 0, true);
                this._moveAndResizeWindow(htAfter, nLimitedCallCount - 1);
            }
        }
    },

    /**
     * 컨텐츠에 맞게 윈도우 사이즈 변경 함수
     * nFixWidth,nFixHeight의 default 값은 -1이며 이경우 컨텐츠에 맞춘다.
     * @param {Number} nFixWidth 설정할 넓이값
     * @param {Number} nFixHeight 설정할 높이값
     * @param {Boolean} bInspect resize 없이 계산된 값만 반환한다.
     */
    _sizeToContent: function(nFixWidth, nFixHeight, nMaxWidth, nMaxHeight, bInspect) {
        var htOldClientSize = null;
        var nChangeWidth = null;
        var nChangeHeight = null;
        if (typeof window.sizeToContent == "function") { // ff
            window.sizeToContent();
            if (!(nFixWidth == -1 && nFixHeight == -1)) {
                htOldClientSize = jindo.$Document().clientSize();
                nChangeWidth = (nFixWidth == -1) ? 0 : nFixWidth - htOldClientSize.width;
                nChangeHeight = (nFixHeight == -1) ? 0 : nFixHeight - htOldClientSize.height;
                jindo.$Window().resizeBy(nChangeWidth, nChangeHeight);
            }
        } else { // ff이외의 브라우져
            var self = window;
            var doc = self.document;
            var nContentWidth = null;
            var nContentHeight = null;
            if (self.innerHeight) {
                // all except Explorer
                nContentWidth = self.innerWidth;
                nContentHeight = self.innerHeight;
            } else if (doc.documentElement && doc.documentElement.clientHeight) {
                // Explorer 6 Strict Mode
                nContentWidth = doc.documentElement.clientWidth;
                nContentHeight = doc.documentElement.clientHeight;
            } else if (doc.body) {
                // other Explorers
                nContentWidth = doc.body.clientWidth;
                nContentHeight = doc.body.clientHeight;
            }
            /*
            // all but Explorer Mac
            	nBodyWidth = doc.body.scrollWidth;

            	// Explorer Mac;
            	//would also work in Explorer 6 Strict, Mozilla and Safari
            	nBodyWidth = doc.body.offsetWidth;
             */
            var nBodyWidth = Math.max(doc.body.scrollWidth, doc.body.offsetWidth);

            /*
            	// all but Explorer Mac
            	nBodyHeight = doc.body.scrollHeight;

            	//would also work in Explorer 6 Strict, Mozilla and Safari
            	nBodyHeight = doc.body.offsetHeight;
             */
            var nBodyHeight = Math.max(doc.body.scrollHeight, doc.body.offsetHeight);
            htOldClientSize = jindo.$Document().clientSize();
            nChangeWidth = (nFixWidth == -1) ? (nBodyWidth - Math.min(nContentWidth, nMaxWidth || 9999)) : (nFixWidth - htOldClientSize.width);
            nChangeHeight = (nFixHeight == -1) ? (Math.min(nBodyHeight, nMaxHeight || 9999) - nContentHeight) : (nFixHeight - htOldClientSize.height);
            var bOverflowMaxHeight = false;
            if (nMaxHeight && nMaxHeight < nBodyHeight) {
                nChangeWidth += 17;
                bOverflowMaxHeight = true;
            }

            if (!bInspect) {
                jindo.$Window().resizeBy(nChangeWidth, nChangeHeight);
            }

            return {
                "width": nChangeWidth,
                "height": nChangeHeight,
                "bOverflowMaxHeight": bOverflowMaxHeight
            };
        }
    },

    /**
     * 지정한 selectbox에 option 항목 추가
     * @param 	{HTMLElement} 	elSelectbox 		셀렉트박스 엘리먼트
     * @param 	{String} 			sOptionText 		추가할 옵션의 text 값
     * @param 	{String} 			sOptionValue 		추가할 옵션의 value 값
     * @param 	{Boolean} 		[bOptionSelected] 	추가할 옵션을 선택된 상태로 할지 여부 (default: false, true: 선택, false: 선택 안함)
     * @see		removeSelectboxOption
     * @example
     * <select id="sel"></select>
     *
     * <script type="text/javascript">
     * 	var elSelect = document.getElementById("sel");
     *
     * 	// options[0]에 <option value="value1" selected="false">text1</option> 생성
     *	addSelectboxOption(elSelect, "text1", "value1");
     *
     *	// options[1]에 <option value="value2" selected="false">text2</option> 생성
     *	addSelectboxOption(elSelect, "text2", "value2", false);
     *
     * 	// options[2]에 <option value="value3" selected="true">text3</option> 생성
     *	addSelectboxOption(elSelect, "text3", "value3", true);
     * </script>
     */
    addSelectboxOption: function(elSelectbox, sOptionText, sOptionValue, bOptionSelected) {
        var elNewOption = new Option(sOptionText, sOptionValue, bOptionSelected || false);
        elSelectbox.options[elSelectbox.options.length] = elNewOption;
        elNewOption = null;
    },


    /**
     * 지정한 selectbox에 option 항목 삭제
     * @param 	{HTMLElement} 	elSelectbox 		셀렉트박스 엘리먼트
     * @param 	{Number} 	[nOptionIndex] 	삭제할 옵션의 인덱스 값(선언하지 않을 경우 전체 삭제)
     * @see		addSelectboxOption
     * @example
     * <select id="sel">
     * 	<option value="value1">text1</option>	// options[0]
     *	<option value="value2">text2</option>	// options[1]
     *	<option value="value3">text3</option>	// options[2]
     * </select>
     *
     * <script type="text/javascript">
     *	var elSelect = document.getElementById("sel");
     *
     *	// options[1] 을 삭제
     *	removeSelectboxOption(elSelect, 1);
     *
     *	// 모든 options 를 삭제 => options.length = 0
     *	removeSelectboxOption(elSelect);
     * </script>
     */
    removeSelectboxOption: function(elSelectbox, nOptionIndex) {
        if (nOptionIndex) {
            elSelectbox.options[nOptionIndex] = null;
        } else {
            elSelectbox.options.length = 0;
        }
    },


    /**
     * 배열을 원하는 방식/기준으로  정렬
     * @param 	{Array} 	aTargetArray 	원본 배열
     * @param 	{String} 	sSortType 	정렬 방식 (asc: 오름차순, desc: 내림차순)
     * @param 	{String} 	[sFieldName] 	배열 요소가 Hash Table 형태일 때, 특정 필드(key)를 지정하면 그 것의 값(value)을 비교하여 정렬
     * @returns 	{Array} 				정렬이 된 배열
     * @example
     * // 일반 배열일 경우
     * sortArray(["가", "1", "ab", "나", "a", "b", "3", "ac", "2", "다"], "asc");	// 오름차순 정렬
     * // 결과: ["1", "2", "3", "a", "ab", "ac", "b", "가", "나", "다"]
     *
     * // Hash Table을 요소로하는 배열일 경우
     * var aData = [
     * 	{name: "c", value: "3"},
     * 	{name: "b", value: "4"},
     * 	{name: "a", value: "2"},
     * 	{name: "d", value: "1"}
     * ]
     * sortArray(aData, "asc", "name"); 	// "name"필드를 기준으로 오름차순 정렬
     * // 결과: [
     * // 	{name: "a", value: "2"},
     * // 	{name: "b", value: "4"},
     * // 	{name: "c", value: "3"},
     * // 	{name: "d", value: "1"}
     * // ]
     */
    sortArray: function(aTargetArray, sSortType, sFieldName) {
        var aSortedArray;
        var nTargetArrayLength = aTargetArray.length;
        var vCompareA, vCompareB;

        if (nTargetArrayLength / 2 < 1) {
            // 배열의 길이가 1인 경우  그대로 return
            aSortedArray = aTargetArray;
        } else if (nTargetArrayLength / 2 == 1) {
            // 배열의 길이가 2인 경우 정렬
            var nTemp;
            vCompareA = (sFieldName) ? aTargetArray[0][sFieldName] : aTargetArray[0];
            vCompareB = (sFieldName) ? aTargetArray[1][sFieldName] : aTargetArray[1];

            if (sSortType == "asc") {
                // 오름차순 정렬
                if (vCompareA > vCompareB) {
                    nTemp = aTargetArray[1];
                    aTargetArray[1] = aTargetArray[0];
                    aTargetArray[0] = nTemp;
                }
            } else {
                // 내림차순 정렬
                if (vCompareA < vCompareB) {
                    nTemp = aTargetArray[1];
                    aTargetArray[1] = aTargetArray[0];
                    aTargetArray[0] = nTemp;
                }
            }
            aSortedArray = [aTargetArray[0], aTargetArray[1]];
        } else {
            // 배열의 길이가 3이상인 경우 이진트리 알고리즘 정렬
            var nMiddleIndex = Math.round(nTargetArrayLength / 2) - 1;
            var nLeftIndex = 0;
            var nRightIndex = 0;

            var aLeftArray = [];
            var aRightArray = [];

            if (sSortType == "asc") { // 오름차순 정렬
                //큰수 우측으로 보냄
                for (var i = 0; i < nMiddleIndex; i++) {
                    vCompareA = (sFieldName) ? aTargetArray[i][sFieldName] : aTargetArray[i];
                    vCompareB = (sFieldName) ? aTargetArray[nMiddleIndex][sFieldName] : aTargetArray[nMiddleIndex];
                    if (vCompareA > vCompareB) {
                        aRightArray[nRightIndex++] = aTargetArray[i];
                    } else {
                        aLeftArray[nLeftIndex++] = aTargetArray[i];
                    }
                }
                //작은수 좌측으로 보냄
                for (var j = nMiddleIndex + 1; j < nTargetArrayLength; j++) {
                    vCompareA = (sFieldName) ? aTargetArray[j][sFieldName] : aTargetArray[j];
                    vCompareB = (sFieldName) ? aTargetArray[nMiddleIndex][sFieldName] : aTargetArray[nMiddleIndex];
                    if (vCompareA < vCompareB) {
                        aLeftArray[nLeftIndex++] = aTargetArray[j];
                    } else {
                        aRightArray[nRightIndex++] = aTargetArray[j];
                    }
                }
            } else { // 내림차순 정렬
                // 작은수 우측보냄
                for (var i = 0; i < nMiddleIndex; i++) {
                    vCompareA = (sFieldName) ? aTargetArray[i][sFieldName] : aTargetArray[i];
                    vCompareB = (sFieldName) ? aTargetArray[nMiddleIndex][sFieldName] : aTargetArray[nMiddleIndex];
                    if (vCompareA < vCompareB) {
                        aRightArray[nRightIndex++] = aTargetArray[i];
                    } else {
                        aLeftArray[nLeftIndex++] = aTargetArray[i];
                    }
                }
                // 크거나같은수 죄측보냄
                for (var j = nMiddleIndex + 1; j < nTargetArrayLength; j++) {
                    vCompareA = (sFieldName) ? aTargetArray[j][sFieldName] : aTargetArray[j];
                    vCompareB = (sFieldName) ? aTargetArray[nMiddleIndex][sFieldName] : aTargetArray[nMiddleIndex];
                    if (vCompareA > vCompareB) {
                        aLeftArray[nLeftIndex++] = aTargetArray[j];
                    } else {
                        aRightArray[nRightIndex++] = aTargetArray[j];
                    }
                }
            }

            //재귀정렬
            var nLeftArrayLength = aLeftArray.length;
            var nRigthArrayLength = aRightArray.length;
            var aLeft, aRight;
            if (nLeftArrayLength > 1) {
                aLeft = arguments.callee(aLeftArray, sSortType, sFieldName);
            } else {
                aLeft = aLeftArray;
            }

            if (nRigthArrayLength > 1) {
                aRight = arguments.callee(aRightArray, sSortType, sFieldName);
            } else {
                aRight = aRightArray;
            }

            aSortedArray = new Array(nLeftArrayLength + nRigthArrayLength - 1);
            var nSortedIndex = 0;
            for (var i = 0, nLeftLen = aLeft.length; i < nLeftLen; i++) {
                aSortedArray[nSortedIndex++] = aLeft[i];
            }
            aSortedArray[nSortedIndex++] = aTargetArray[nMiddleIndex];
            for (var i = 0, nRightLen = aRight.length; i < nRightLen; i++) {
                aSortedArray[nSortedIndex++] = aRight[i];
            }
        }

        return aSortedArray;
    },

    /**
     * 전달된 문자열에 모든 HTML Entity 타입의 문자열을 원래의 문자로 반환
     * @param {String} sString 문자열
     * @return {String} 문자열
     */
    restoreAllSpecialChar: function(sString) {
        var elDummy = document.createElement('div');
        elDummy.innerHTML = sString;

        try {
            return elDummy.textContent || elDummy.innerText;
        } finally {
            elDummy = null;
        }
    },

    /**
     * 파라미터를 필터링하는 메소드
     * @param aSource
     * @param aInclude
     * @returns {Array}
     */
    filterOutParameter: function(aSource, aInclude) {
        var aTemp = [];
        for (var i = 0, nLen = aSource.length; i < nLen; i++) {
            var htSourceData = aSource[i],
                htTemp = {};

            for (var j = 0, nLenInner = aInclude.length; j < nLenInner; j++) {
                var sKey = aInclude[j];
                htTemp[sKey] = htSourceData[sKey];
            }
            aTemp.push(htTemp);
        }
        return aTemp;
    },

    /**
     * 빈문자열이 아닌지 체크
     * @param sSrc
     * @returns {Boolean}
     */
    isNotEmpty: function(sSrc) {
        if (sSrc && jindo.$S(sSrc).trim().$value() != "") {
            return true;
        }
        return false;
    },

    /**
     * 빈문자열이 인지 체크
     * @param sSrc
     * @returns boolean
     */
    isEmpty: function(sSrc) {
        return !this.isNotEmpty(sSrc);
    },
    /**
     * 문자열 중 정수만 추출
     * @param sValue
     */
    getOnlyNumber: function(sValue) {
        return sValue.replace(/^0/, "").replace(/[^0-9]/ig, "");
    },

    toFlatten: function(htSource, aKeyList, htResult) {
        aKeyList = aKeyList || [];
        htResult = htResult || {};

        var sType = "";
        for (var x in htSource) {
            aKeyList.push(x);
            sType = Object.prototype.toString.call(htSource[x]);
            if (sType == "[object Array]" || sType == "[object Object]") {
                this.toFlatten(htSource[x], aKeyList, htResult);
            } else {
                htResult[aKeyList.join(".")] = htSource[x];
            }
            aKeyList.pop();
        }

        return htResult;
    },
    /**
     * HTML 태그에 해당하는 글자가 먹히지 않도록 바꿔주기
     *
     * 동작) & 를 &amp; 로, < 를 &lt; 로, > 를 &gt; 로 바꿔준다
     *
     * @param {String} sText
     * @return {String}
     */
    toHtmlEntitySpecialChars: function(sText) {
        return sText.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/ /g, '&nbsp;');
    },

    /**
     * htmlSpecialChars 의 반대 기능의 함수
     *
     * 동작) &amp, &lt, &gt, &nbsp 를 각각 &, <, >, 빈칸으로 바꿔준다
     *
     * @param {String} sText
     * @return {String}
     */
    toHtmlTagSpecialChars: function(sText) {
        return sText.replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&nbsp;/g, ' ');
    },

    /**
     * 인스턴스 메소드 체크
     * @param {Object} oInstance
     * @param {String} ...
     */
    checkInstanceMethod: function(oInstance) {
        var oComponent = arguments[0];
        for (var i = 1, nLen = arguments.length; i < nLen; i++) {
            var sMethodName = arguments[i];
            if (typeof oComponent[sMethodName] != "function") {
                alert(sMethodName + " 메소드를 정의 하지 않았습니다.");
                break;
            }
        }
    },

    /**
     * 서브밋 버튼 생성
     * @param elForm
     * @param sValue
     */
    createSubmitButton: function(elForm, sValue) {
        if (jindo.$Element(elForm).test("input[type=image],input[type=submit]")) {
            return;
        }

        sValue = sValue || "검색";
        jindo.$Element(elForm).prepend('<input type="submit" style="position:absolute;left:-5000px;top:-5000px" value="' + sValue + '">');
    },

    /**
     * 컴포넌트 메소드 머지
     * @param {Object} oComponent
     * @param {String} sName
     */
    mergeComponentMethod: function(oInstance, oComponent, sName) {
        for (var sKey in oComponent) {
            if (/^_|^\$|^option$|^optionSetter$|^fireEvent$|^attach$|^detach$|^detachAll$|^destroy$|^constructor$|^activate$|^deactivate$|^isActivating$/.test(sKey) ||
                typeof oComponent[sKey] != "function") {
                continue;
            }
            if (oInstance[sKey]) { // 중복이 존재하는 경우 처리
                sKey += sName;
            }
            oInstance[sKey] = jindo.$Fn(oComponent[sKey], oComponent).bind();
        }
    },

    /**
     * sString을 nMaxLength 만큼의 크기로 자른 후 끝에 sTail을 붙여 반환
     * @param 	{String} 		sString 		원본 문자열
     * @param 	{Number} 	nMaxLength 	수정할 최대 length 크기
     * @param 	{String} 		[sTail] 		수정 후 끝에 붙일 문자열
     * @returns 	{String} 					수정된 문자열
     * @see		cutString
     * @see		cutStringByPixel
     * @see		cutFilenameByByte
     * @example
     * cutStringByByte("abcde 가나다라마 12345", 10);
     * // 결과: "abcde 가나"
     *
     * cutStringByByte("abcde 가나다라마 12345", 10, "...");
     * // 결과: "abcde 가나..."
     *
     * cutStringByByte("abcde 가나다라마 12345", 9, "..."); 	// 2byte 문자 중간에 짤리는 경우
     * // 결과: "abcde 가..."
     */
    cutString: function(sString, nMaxLength, sTail) {
        var sSource = (typeof sString != "String") ? sString.toString() : sString;
        var nLimit = parseInt(nMaxLength, 10);
        var sAdd = sTail || "";

        for (var i = 0, nLen = sSource.length; i < nLen; i++) {
            if (i > nLimit) {
                return sSource.substring(0, i) + sAdd;
            }
        }

        return sSource;
    },

    /**
     * sString을 nMaxByte 만큼의 크기로 자른 후 끝에 sTail을 붙여 반환
     * @param 	{String} 		sString 		원본 문자열
     * @param 	{Number} 	nMaxByte 	수정할 최대 byte 크기
     * @param 	{String} 		[sTail] 		수정 후 끝에 붙일 문자열
     * @returns 	{String} 					수정된 문자열
     * @see		cutString
     * @see		cutStringByPixel
     * @see		cutFilenameByByte
     * @example
     * cutStringByByte("abcde 가나다라마 12345", 10);
     * // 결과: "abcde 가나"
     *
     * cutStringByByte("abcde 가나다라마 12345", 10, "...");
     * // 결과: "abcde 가나..."
     *
     * cutStringByByte("abcde 가나다라마 12345", 9, "..."); 	// 2byte 문자 중간에 짤리는 경우
     * // 결과: "abcde 가..."
     */
    cutStringByByte: function(sString, nMaxByte, sTail) {
        var sSource = (typeof sString != "String") ? sString.toString() : sString;
        var nLimit = parseInt(nMaxByte, 10);
        var sAdd = sTail || "";

        for (var i = 0, nLen = sSource.length, nCurrentByte = 0; i < nLen; i++) {
            nCurrentByte += (sSource.charCodeAt(i) > 128) ? 2 : 1;
            if (nCurrentByte > nLimit) {
                return sSource.substring(0, i) + sAdd;
            }
        }

        return sSource;
    },

    /**
     * sString  + sTail을 nMaxPixel 만큼의 넓이로 자른 후 반환
     * @param 	{String} 		sString 		원본 문자열
     * @param 	{Number} 	nMaxPixel 	수정할 최대 pixel 크기
     * @param 	{String} 		[sTail] 		수정 후 끝에 붙일 문자열 (default : "")
     * @param 	{Number} 		[nStartIndex] 		 속도향상을 위해 일정 글자수 이상부터 체크하기위한 index
     * @returns 	{String} 					수정된 문자열
     * @requires 	Jindo.$Element
     * @see		cutString
     * @see		cutStringByByte
     * @example
     * cutStringByPixel("abcde 가나다라마 12345", 100)
     * // 결과: "abcde 가나다"
     *
     * cutStringByPixel("abcde 가나다라마 12345", 100, "...")
     * // 결과: "abcde 가나..."
     */
    cutStringByPixel: function(sString, nMaxPixel, sTail, nStartIndex) {
        var sSource = (typeof sString != "String") ? sString.toString() : sString;
        var nLimit = parseInt(nMaxPixel, 10);
        var sAdd = sTail || "";
        var aResultString = [];
        var sTmpChat = "";

        if (!this.welMeasure) {
            this.welMeasure = jindo.$Element("<span>");
            this.welMeasure.css({
                "position": "absolute",
                "top": "-1000px",
                "left": "-1000px"
            });
            this.welMeasure.prependTo(document.body);
        } else {
            this.welMeasure.empty();
        }

        sSource = sSource.replace(/\r?\n/gim, " ");
        var nStart = 0;
        if (nStartIndex) {
            aResultString.push(sSource.substring(0, nStartIndex));
            var nStart = nStartIndex;
        } else {
            nStartIndex = 0;
        }
        for (var i = nStart, nLen = sSource.length; i < nLen; i++) {
            sTmpChat = sSource.charAt(i);
            if (sTmpChat === " ") {
                aResultString.push(";");
            } else {
                aResultString.push(sTmpChat);
            }
            this.welMeasure.text(aResultString.join("") + sAdd);
            if (this.welMeasure.width() > nLimit) {
                return sSource.substring(0, ((aResultString.length - 1) + (nStartIndex ? (-1 + nStart) : (nStart)))) + sAdd;
            }
        }

        return sSource;
    },


    /**
     * sString  + sTail을 nMaxPixel 만큼의 넓이로 자른 후 반환
     * @param 	{String} 		sString 		원본 문자열
     * @param 	{Number} 	nMaxPixel 	수정할 최대 pixel 크기
     * @param 	{String} 		[sTail] 		수정 후 끝에 붙일 문자열 (default : "")
     * @param 	{Number} 		[nStartIndex] 		 속도향상을 위해 일정 글자수 이상부터 체크하기위한 index
     * @returns 	{String} 					수정된 문자열
     * @requires 	Jindo.$Element
     * @see		cutString
     * @see		cutStringByByte
     * @example
     * cutStringByPixel("abcde 가나다라마 12345", 100)
     * // 결과: "abcde 가나다"
     *
     * cutStringByPixel("abcde 가나다라마 12345", 100, "...")
     * // 결과: "abcde 가나..."
     */
    cutStringByPixelMultiLine: function(sString, elSource, nLineNum, sTail) {
        var sSource = (typeof sString != "String") ? sString.toString() : sString;
        var sAdd = sTail || "";
        var aResultString = [];
        var sTmpChat = "";
        var elTemp = elSource.cloneNode(true);
        var elParent = jindo.$Element(elSource).parent();
        //		var nSourceWidth = $Element(elSource).width();
        //		var nWidth = nSourceWidth?nSourceWidth:$Element(elParent).width();
        var nWidth = jindo.$Element(elParent).width();

        var welMeasure = jindo.$Element(elTemp);
        welMeasure.css({
            "position": "absolute",
            "top": "-1000px",
            "left": "-1000px",
            "width": nWidth + "px"
        });
        welMeasure.appendTo(elParent);

        var nHeight = 0;
        var nRealHeight = 0;
        var nLine = 0;
        for (var i = 0, nLen = sSource.length; i < nLen; i++) {
            sTmpChat = sSource.charAt(i);
            aResultString.push(sTmpChat);
            if (nLine == nLineNum) {
                welMeasure.text(aResultString.join("") + sAdd);
                nRealHeight = welMeasure.height();
                if (nRealHeight > nHeight) {
                    welMeasure.leave();
                    return sSource.substring(0, i - 1) + sAdd;
                }
            } else {
                welMeasure.text(aResultString.join(""));
                nRealHeight = welMeasure.height();
                if (nRealHeight > nHeight) {
                    nHeight = nRealHeight;
                    nLine++;
                }
            }
        }
        welMeasure.leave();
        return sSource;
    },

    /**
     * 컴마추가 메소드
     * @param {String||Number} vNumber
     * @return {String}
     */
    comma: function(vNumber) {
        var sUnderNumber = "";
        var sNumberString = vNumber || 0;
        sNumberString = (typeof sNumberString != "String") ? String(sNumberString) : sNumberString;

        if (sNumberString.indexOf(".") > -1) {
            var aNumber = sNumberString.split(".");
            sNumberString = aNumber[0];
            sUnderNumber = "." + aNumber[1];
        }

        return sNumberString.replace(/(\d)(?=(\d{3})+$)/igm, "$1,") + sUnderNumber;
    },

    /**
     * sTarget 문자열 내에, {0}, {1}과 같은 형태의 문자열이 있을 경우, aParameter 배열의 값으로 치환하는 함수
     *
     * @param {String} sTarget 치환할 문자열
     * @param {Array} [aParameter] 치환할 문자열이 있을 경우 배열로 전달 함 (배열 순서대로 치환 됨)
     * @return {String} 치환된 문자열
     * @example
     * // 배열 길이에 따라 치환
     * // sResult is "1 - 2"
     * var sResult = nmp._replaceString("{0} - {1}", [1, 2]);
     *
     * // 치환할 개수와 배열의 길이가 다른 경우
     * // sResult2 is "1 - "
     * var sResult2 = nmp._replaceString("{0} - {1}", [1]);
     */
    replaceString: function(sTarget, aParameter) {
        if (sTarget) {
            var aList = sTarget.match(/\{[0-9]\}*/g);
            if (aList && aParameter) {
                for (var i = 0; i < aList.length; i++) {
                    sTarget = sTarget.replace(aList[i], (typeof aParameter[i] != "undefined" && aParameter[i] != null) ? aParameter[i] : "");
                }
                return sTarget;
            } else {
                return sTarget;
            }
        } else {
            return "";
        }
    },

    /**
     * 숫자 반환
     * @param {String} sValue
     * @return {Number}
     */
    convertNumber: function(sValue) {
        return parseFloat(String(sValue).replace(/,/g, ""));
    },

    /**
     * 숫자 형식으로 변환 메소드
     * @param vValue
     * @returns {String}
     */
    convertNumberFormat: function(vValue) {
        var sValue = String(vValue) || "0";
        return sValue.replace(/(\d)(?=(\d{3})+$)/gi, "$1,");
    },

    /**
     * 숫자 형식으로 변환하는 메소드
     * 숫자나 split에 템플릿을 적용하는 경우 사용한다.
     * @param vValue
     * @param sNumberTemplate
     * @param sSplitTemplate
     */
    convertNumberFormatWithTemplate: function(vValue, sNumberTemplate, sSplitTemplate) {
        var sFormatedNumber = this.convertNumberFormat(vValue);
        if (typeof sNumberTemplate == "undefined" || typeof sSplitTemplate == "undefined") {
            return sFormatedNumber;
        }
        var oNumberTemplate = jindo.$Template(sNumberTemplate);
        var oSplitTemplate = jindo.$Template(sSplitTemplate);
        var aReturn = [];
        for (var i = 0, len = sFormatedNumber.length; i < len; i++) {
            var sChar = sFormatedNumber.charAt(i);
            var data = {
                "char": sChar
            };
            if (sChar == ",") {
                aReturn.push(oSplitTemplate.process(data));
            } else {
                aReturn.push(oNumberTemplate.process(data));
            }
        }
        return aReturn.join("");
    },

    /**
     * NMP에서 사용하는 썸네일에서 원본이미지 반환 메소드
     * @param {String} sUrl
     * @return {String}
     */
    getImageOrignalUrl: function(sUrl) {
        if (!sUrl) {
            return "";
        }
        return sUrl.replace(/\?type=.*$/, "");
    },

    /**
     * 배열타입검사
     * @param {Object} o
     * @return {boolean}
     */
    isArray: function(o) {
        return Object.prototype.toString.call(o) == '[object Array]';
    },

    /**
     * HTMLElement타입 검사
     * @param test
     */
    isHTMLElement: function(test) {
        if (typeof(HTMLElement) === 'object') {
            return (test && (test instanceof HTMLElement));
        }
        return !!(test && test.nodeType);
    },

    /**
     * 빈HTML인지 검사하는 함수
     * @param {String} value
     * @return {boolean}
     * @example
     *	if(nmp.utility.isBlankHTML(sHtml)){
     *		somethingDo();
     *	}
     */
    isBlankHTML: function(sHtml) {
        return !sHtml.replace(/<(?!table|img|div|embed|iframe|object)[^>]*>|&nbsp;|\s*/gi, '');
    },

    getTextLengthInHtml: function(sHtml) {
        var wel = jindo.$Element("<div>" + sHtml + "</div>"),
            nCount = wel.text().length;
        wel.leave();
        return nCount;
    },

    /**
     * 오른쪽 마우스 및 셀렉션 금지 이벤트 해지 함수
     */
    detachPreventSelect: function(wel) {
        if (!this._wfStopEvent) {
            this._wfStopEvent = jindo.$Fn(this._stopEvent, this);
        }

        wel = jindo.$Element(wel || document.body);

        jindo.$Fn(this._wfStopEvent, this).detach(wel, "contextmenu");
        jindo.$Fn(this._wfStopEvent, this).detach(wel, "dragstart");
        jindo.$Fn(this._wfStopEvent, this).detach(wel, "selectstart");
        wel.css("MozUserSelect", "");
    },

    /**
     * 오른쪽 마우스 및 셀렉션 금지 이벤트 등록 함수
     */
    attachPreventSelect: function(wel) {
        this.detachPreventSelect(wel);

        wel = jindo.$Element(wel || document.body);

        jindo.$Fn(this._wfStopEvent, this).attach(wel, "contextmenu");
        jindo.$Fn(this._wfStopEvent, this).attach(wel, "dragstart");
        jindo.$Fn(this._wfStopEvent, this).attach(wel, "selectstart");
        wel.css("MozUserSelect", "none");
    },

    /**
     * 이벤트 기본동작 및 버블링을 취소 시키는 함수
     * @param {Event} we
     */
    _stopEvent: function(we) {
        we.stop();
    },


    /**
     * trim 메소드
     * @param {String||Array} oSource
     * @return {String||Array}
     */
    trim: function(oSource) {
        if (this.isArray(oSource)) {
            for (var i = 0, nLen = oSource.length; i < nLen; i++) {
                oSource[i] = this.trim(oSource[i]);
            }
            return oSource;
        }
        return jindo.$S(oSource).trim().$value();
    },

    /**
     * 숫자를 한글단위로 변환 메소드
     * - 일단 억단위까지만 처리 하도록 함
     * - 그 이상은 리팩토링 필요
     * @param nPrice
     * @param nBase
     * @param sSplit
     */
    convertPrice: function(nPrice, nBase, sSplit) {
        var sPrice = "",
            sMinus = "",
            sPostfix = "",
            aUnit = ["십", "백", "천", "만", "십", "백", "천", "억"],
            aTemp = [];

        nBase = nBase || 1000;
        sSplit = typeof sSplit == "string" ? sSplit : " ";

        nPrice = parseInt(nPrice, 10);
        if (isNaN(nPrice)) {
            return "";
        }

        if (nPrice < 0) {
            sMinus = "-";
        }
        nPrice = Math.abs(nPrice);

        if (nPrice % nBase != 0 || nPrice == 0) {
            return sMinus + nPrice;
        }

        for (var i = 0, nLen = aUnit.length; i < nLen; i++) {
            if (nPrice < nBase) {
                break;
            }
            var nUnit = Math.floor((nPrice / nBase) % 10);
            if (nUnit != 0) {
                sPrice = (nUnit == 1 ? "" : nUnit) + aUnit[(String(nBase).length - 2)];
                aTemp.push(sPrice);
            }
            nBase = nBase * 10;
        }

        sPrice = jindo.$A(aTemp).reverse().$value().join(sSplit);
        if (sPrice[sPrice.length - 1] != "억" && (nPrice / 10000) % 10 == 0) {
            sPostfix = "만";
        }

        return sMinus + sPrice + sPostfix;
    },

    /**
     * RegExp escape 처리
     * @param {String} sSource
     * @example
     * var rxMatch = new RegExp(nmp.utility.escapeRegExp("가구(4인용)"), "g");
     */
    escapeRegExp: function(sSource) {
        return sSource.replace(/([{}\(\)\^$&.\*\?\/\+\|\[\\\\]|\]|\-)/g, "\\$1");
    },

    dimmmedElement: function(elBase, sClass) {
        var welBase = jindo.$Element(elBase);
        var nWidth = welBase.width();
        var nHeight = welBase.height();
        var sTagName = welBase.$value().tagName.toLocaleLowerCase();
        var bInElement = (sTagName == "p" || sTagName == "a") ? false : true;
        var nHeightIE8 = 4096;
        if (bInElement) {
            var bRelative = (welBase.css("position") == "relative") ? true : false;
            if (jindo.$Agent().navigator().ie && jindo.$Agent().navigator().version <= 8 && nHeight > nHeightIE8) {
                var nSubDiv = Math.ceil(nHeight / nHeightIE8);
                var nLastHeight = nHeight % nHeightIE8;
                var aHtml = [];
                var nHeightMargin = 0;
                while (nSubDiv != 1) {
                    nSubDiv--;
                    nHeightMargin += nHeightIE8;
                    aHtml.push('<div style="margin-top:-' + nHeightMargin + 'px;position:absolute;z-index:999;height:' + nHeightIE8 + 'px;width:' + nWidth + 'px;opacity:0;filter:alpha(opacity=0);background:#000"></div>');

                }
                nHeightMargin += nLastHeight;
                aHtml.push('<div style="margin-top:-' + nHeightMargin + 'px;position:absolute;z-index:999;height:' + nLastHeight + 'px;width:' + nWidth + 'px;opacity:0;filter:alpha(opacity=0);background:#000"></div>');
                jindo.$A(aHtml).forEach(function(wel) {
                    welBase.append(wel);
                }, this);
            } else {
                var welTemp = jindo.$Element("<div>");
                welTemp.css({
                    "position": "absolute",
                    "width": nWidth + "px",
                    "height": nHeight + "px",
                    "zIndex": 999,
                    "background": "#000000",
                    "opacity": 0.0,
                    "filter": "alpha(opacity=0)"
                });
                if (bRelative) {
                    welTemp.css({
                        "left": "0px"
                    });
                    welTemp.css({
                        "top": "0px"
                    });
                } else {
                    welTemp.css({
                        "marginTop": -nHeight + "px"
                    });
                }
                welBase.append(welTemp);
            }
        } else {
            var htPos = welBase.offset();
            var bAbsolute = (welBase.css("position") == "absolute") ? true : false;
            var sMarginBottom = welBase.css("marginBottom");
            var nMarginBottomTemp = parseInt(welBase.css("marginBottom").toLowerCase().replace("px", ""), 10);
            var nMarginBottom = (nMarginBottomTemp) ? nMarginBottomTemp : 0;
            var nMargin = (bAbsolute) ? 0 : -(nHeight + nMarginBottom);
            var welTemp = jindo.$Element("<div>");
            var sMarginLeft = welBase.css("marginLeft");
            var sMarginRight = welBase.css("marginRight");
            welTemp.css({
                "marginBottom": sMarginBottom,
                "marginTop": nMargin + "px",
                "width": nWidth + "px",
                "height": nHeight + "px",
                "zIndex": 999,
                "background": "#000000",
                "opacity": 0.0,
                "filter": "alpha(opacity=0)"
            });
            if (bAbsolute) {
                welTemp.css({
                    "position": "absolute"
                });
            } else {
                var sMarginLeft = welBase.css("marginLeft");
                var sMarginRight = welBase.css("marginRight");
                welTemp.css({
                    "marginLeft": sMarginLeft,
                    "marginRight": sMarginRight
                });
                var sFloat = welBase.css("cssFloat");
                if (sFloat) {
                    welTemp.css({
                        "cssFloat": sFloat
                    });
                }
            }
            welBase.after(welTemp);
        }
        if (sClass) {
            welTemp.addClass(sClass);
        }
        return welTemp;
    },

    changeClass: function(elBase, sOldClassPrefixName, sNewClass) {
        var welEventElement = jindo.$Element(elBase);
        var aClass = welEventElement.className().split(" ");
        for (var i = 0; i < aClass.length; i++) {
            if (aClass[i].indexOf(sOldClassPrefixName) == 0) {
                welEventElement.removeClass(aClass[i]);
                break;
            }
        }
        welEventElement.addClass(sNewClass);
    },

    resizeIframe: function(elIframe, nMinHeight) {
        var elDoc, nHeight, elTemp,
            oAgent = jindo.$Agent().navigator();

        nMinHeight = nMinHeight || 10;

        try {
            elDoc = elIframe.contentWindow.document;
        } catch (me) {
            return;
        }

        if (elDoc.location.href == 'about:blank') {
            elIframe.style.height = nMinHeight + 'px';
            return;
        }

        if (oAgent.ie && oAgent.version < 8) {
            nHeight = elDoc.body.scrollHeight;
        } else {
            elTemp = elDoc.body.appendChild(jindo.$('<DIV>'));
            elTemp.style.clear = 'both';

            nHeight = elTemp.offsetTop;
            elTemp.parentNode.removeChild(elTemp);
        }

        if (nHeight < nMinHeight) {
            nHeight = nMinHeight;
        }

        elIframe.style.height = nHeight + 'px';
    },

    resizeIframeWithMargin: function(elIframe, nMinHeight, nMarginBottom) {
        var elDoc, nHeight, elTemp,
            oAgent = jindo.$Agent().navigator();

        nMinHeight = nMinHeight || 10;

        try {
            elDoc = elIframe.contentWindow.document;
        } catch (me) {
            return;
        }

        if (elDoc.location.href == 'about:blank') {
            elIframe.style.height = nMinHeight + 'px';
            return;
        }

        if (oAgent.ie && oAgent.version < 8) {
            nHeight = elDoc.body.scrollHeight;
        } else {
            elTemp = elDoc.body.appendChild(jindo.$('<DIV>'));
            elTemp.style.clear = 'both';

            nHeight = elTemp.offsetTop;
            elTemp.parentNode.removeChild(elTemp);
        }

        if (nHeight < nMinHeight) {
            nHeight = nMinHeight;
        }

        elIframe.style.height = (nHeight + nMarginBottom) + 'px';
    },

    /**
     * Attribute를 지원하는지 체크하는 메소드
     * - autocomplete autofocus list placeholder max min multiple pattern required step
     */
    isSupportAttribute: function(sAttribute) {
        if (!this._htAttribute) {
            var elInput = document.createElement('input'),
                htAttr = {};

            this._htAttribute = (function(aProperty) {
                for (var i = 0, nLen = aProperty.length; i < nLen; i++) {
                    htAttr[aProperty[i]] = !!(aProperty[i] in elInput);
                }
                return htAttr;
            })('autocomplete autofocus list placeholder max min multiple pattern required step'.split(' '));
        }
        return this._htAttribute[sAttribute];
    },

    /**
     * Caret이 선택된 영역을 가져온다.
     * @param {HTMLElement} el
     * @return {Array} Caret의 시작위치와 끝위치
     */
    getSelection: function(el) {
        var aSelection = [-1, -1];

        if (isNaN(el.selectionStart)) { //IE
            var oRange = document.selection.createRange().duplicate(),
                nLength = el.value.length,
                nRangeLength = oRange.text.length;

            for (var i = 0; i < nLength; i++) {
                if (oRange.parentElement() !== el) {
                    break;
                }
                oRange.moveStart('character', -1);
            }
            aSelection[1] = oRange.text.length;
            aSelection[0] = aSelection[1] - nRangeLength;
        } else {
            aSelection[0] = el.selectionStart;
            aSelection[1] = el.selectionEnd;
        }

        this.setSelection(el, aSelection[0], aSelection[1]);
        return aSelection;
    },

    /**
     * Caret의 선택영역을 설정한다.
     * @remark nStart, nEnd를 동일하게 지정하거나 nEnd 생략시 nStart로 지정된 위치로 캐럿을 이동한다.
     * @param {HTMLElement} el
     * @param {Number} nStart 시작지점
     * @param {Number} nEnd 끝지점 (생략가능)
     */
    setSelection: function(el, nStart, nEnd) {
        if (typeof nEnd == 'undefined') {
            nEnd = nStart;
        }

        if (el.setSelectionRange) {
            el.setSelectionRange(nStart, nEnd);
        } else if (el.createTextRange) { //IE
            var oRange = el.createTextRange();
            oRange.collapse(true);
            oRange.moveStart("character", nStart);
            oRange.moveEnd("character", nEnd - nStart);
            oRange.select();
        }
    },

    /**
     * 미리보기용 레이어 가드(IE7이상부터만 가능)
     */
    showDimmedLayer: function(htOption) {
        if (this._welDimmedLayer) {
            this.hideDimmedLayer();
        }

        var htDefaultOption = {
            "nOpacity": 0,
            "nZIndex": 10000
        };
        htOption = this.extend(htDefaultOption, htOption || {});

        this._welDimmedLayer = jindo.$Element(this._oTplDimmedLayer.process(htOption));
        this._welDimmedLayer.appendTo(document.body);
    },

    /**
     * DimmedLayer hide
     */
    hideDimmedLayer: function() {
        this._welDimmedLayer.leave();
        this._welDimmedLayer = null;
    },

    /**
     * lcs adaptor
     * @param {HashTable}htAddInfo
     */
    lcs: function(htAddInfo) {
        // LCS 호출을 최대한 늦게 하도록 수정
        jindo.$Fn(function() {
            lcs_do(htAddInfo || {});
        }, this).delay(0);
    },

    /**
     * sEmail이 전체 이메일 주소로 유효한 값인지 여부를 반환
     * @name		isEmail
     * @function
     * @param 	{String} 		sEmail 	검사하려는 전체 이메일 주소 문자열
     * @returns 	{Boolean} 			결과 (true: 유효한 값, false: 잘못된 값)
     * @requires 	trim
     * @see		isEmailFirst
     * @see		isEmailLast
     * @example
     * isEmail(123);
     * isEmail("@test.com");
     * // 결과: false
     *
     * isEmail("test@test.com");
     * isEmail("test.test@test.co.kr");
     * isEmail("-!#$%&'*+\/^_~{}@-!#$%&'*+\/^_~{}.com");
     * // 결과: true
     */
    isEmail: function(sEmail) {
        var sEmailTrim = (typeof sEmail == "string") ? this.trim(sEmail) : "";
        var aResult = sEmailTrim.match(/[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*@[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)+/);

        if (aResult && aResult[0] == sEmailTrim) {
            return true;
        } else {
            return false;
        }
    },

    /**
     * sEmailFirst가 이메일 중 @ 앞부분의 값으로 유효한지 여부를 반환
     * @name		isEmailFirst
     * @function
     * @param 	{String} 		sEmailFirst 	검사하려는 이메일 주소 중 @ 앞부분의 문자열
     * @returns 	{Boolean} 				결과 (true: 유효한 값, false: 잘못된 값)
     * @see		isEmailLast
     * @see		isEmail
     * @example
     * isEmailFirst(undefined);
     * isEmailFirst(null);
     * isemailFirst("test#test");  // 특수문자는 hyphen(-), underbar(_), dot(.)만 가능하다.
     * //결과: false
     *
     * isEmailFirst("Test.1-2_3");
     * // 결과: true
     */
    isEmailFirst: function(sEmailFirst) {
        var rxEmailFirst = /^[\w\d]+([-_\.]?[\w\d])*$/i;
        if (sEmailFirst && rxEmailFirst.test(sEmailFirst)) {
            return true;
        }
        return false;
    },

    /**
     * sEmailLast가 이메일 중 @ 뒤부분의 값으로 유효한지 여부를 반환
     * @name		isEmailLast
     * @function
     * @param 	{String} 		sEmailLast 	검사하려는 이메일 주소 중 @ 뒷부분의 문자열
     * @returns 	{Boolean} 				결과 (true: 유효한 값, false: 잘못된 값)
     * @see		isEmailFirst
     * @see		isEmail
     * @example
     * isEmailLast(undefined);
     * isEmailLast(null);
     * isEmailLast("test#test");  // 특수문자는 hyphen(-), underbar(_), dot(.)만 가능하다.
     * isEmailLast("test.cokr");  // 마지막 dot(.) 다음 문자의 자리수는 2~3자리만 가능하다.
     * //결과: false
     *
     * isEmailLast("Test.1-2_3.co.kr");
     * // 결과: true
     */
    isEmailLast: function(sEmailLast) {
        var rxEmailLast = /^[\w\d]([-_\.]?[\w\d])*\.[\w]{2,3}$/i;
        if (sEmailLast && rxEmailLast.test(sEmailLast)) {
            return true;
        }
        return false;
    }
};
/**
 * @fileOverview 이벤트 딜리게이트를 활용해서 편리한 이벤트를 사용하도록 한다.
 * @author <a href="mailto:niceilm@nhn.com">박종욱</a>
 * @link <a href="http://wiki.nhncorp.com/display/cec/nmp.validator">http://wiki.nhncorp.com/display/cec/nmp.validator</a>
 */
/** @ignore */
if (typeof nmp == "undefined") {
    nmp = {};
}
/**
 * @namespace 이벤트 딜리게이트를 활용해서 편리한 이벤트를 사용하도록 한다.
 * @author <a href="mailto:niceilm@nhn.com">박종욱</a>
 * @require jindo
 * @link <a href="http://wiki.nhncorp.com/display/cec/nmp.validator">http://wiki.nhncorp.com/display/cec/nmp.event_delegator</a>
 */
nmp.event_delegator = {
    name: "nmp.event_delegator",
    /**
     * {String} 버블 되지 않는 이벤트 리스트
     * - window event 제외(load,unload,resize)
     */
    _sNonBubbleEvent: "scroll,select,change,focus,blur,submit,reset",

    /**
     * {String} disabled 속성을 가질 수 있는 태그 리스트
     */
    _sDisabledAttributeTag: "input,select,textarea,option,button",

    /**
     * {Array} 바인딩되는 이벤트 정보 저장
     */
    _aEventData: [],

    /**
     * @constant
     */
    /**
     * 기본동작취소 클래스 시그니처
     */
    STOP_DEFAULT: "_stopDefault",
    /**
     * 버블링취소 클래스 시그니처
     */
    STOP_BUBBLE: "_stopBubble",
    /**
     * 이벤트정지 클래스 시그니처
     */
    DISABLED: "_disabled",

    /**
     * 이벤트 공용 처리
     * @param {Object} oContext
     * @param {boolean} bNotEventObject
     * @param {jindo.$Event} we
     */
    _onEvent: function(oContext, bNotEventObject, we) {
        var sEventType = we.type,
            rxContextMatch = new RegExp("_" + sEventType + "\\((" + oContext.name.replace(/\./g, "\\.") + ".*?)"),
            rxFullMatch = new RegExp("_" + sEventType + "\\((" + oContext.name.replace(/\./g, "\\.") + ".*?)\\((.*?)\\)\\)"),
            aEl = this._findDelegatedElements(we, rxFullMatch, rxContextMatch, this._isNonBubbleEvent(sEventType));
        for (var i = 0, nLen = aEl.length; i < nLen; i++) {
            this._dispatchEvent(we, aEl[i], oContext, rxFullMatch, bNotEventObject);
        }
    },

    /**
     * 딜리게이트 될 엘리먼트 찾기
     * 중첩된 태그의 경우 이벤트 딜리게이트 엘리먼트를 찾는다.
     * @param {jindo.$Event} we
     * @param {RegExp} rxFullMatch
     * @param {RegExp} rxContextMatch
     * @param {boolean} bNonBubble
     * @return {Array} // 딜리게이트 엘리먼트 리스트 반환
     */
    _findDelegatedElements: function(we, rxFullMatch, rxContextMatch, bNonBubble) {
        var el = we.element, // 이벤트가 발생한 엘리먼트
            elCurrent = we.currentElement, // 이벤트가 정의된 엘리먼트
            sClass, bMatch,
            aEl = [];

        do {
            // disabled 인 경우 모두 무시
            if (this._isDisabled(el)) {
                return [];
            }
            sClass = el.className;
            bMatch = rxFullMatch.test(sClass);

            if (rxContextMatch.test(sClass) && !bMatch) {
                nmp.error("nmp.event_delegator > check class value : " + sClass + " ex) _click(nmp.moduleName.someMethod(someParameter))");
            }

            if (bMatch || this._hasClass(sClass, this.STOP_DEFAULT)) {
                aEl.push(el);

                // 버블링 되지 않는 이벤트 패스
                // STOP_BUBBLE 명시된 경우 패스
                if (bNonBubble || this._hasClass(sClass, this.STOP_BUBBLE)) {
                    break;
                }
            }

            // 이벤트 발생한 엘리먼트와 이벤트가 정의된 엘리먼트가 같은 경우
            if (el == elCurrent) {
                break;
            }
            el = el.parentNode;

            // el 존재하고 body 아니고 document 아닌 경우에만 계속
        } while (el && el != document.body && el != document);

        return aEl;
    },

    /**
     * disabled 속성이 활성화 되었는지 확인
     * - 단 disabled 속성을 가질 수 있는 태그 필터링
     * @param {HTMLElement} el
     */
    _isDisabled: function(el) {
        if (!el || !el.tagName) {
            return false;
        }
        var sTagName = el.tagName.toLowerCase();
        return this._sDisabledAttributeTag.indexOf(sTagName) > -1 && el.disabled;
    },

    /**
     * 디스패치 이벤트
     * @param {jindo.$Event} we
     * @param {HTMLElement} el
     * @param {Object} oContext
     * @param {RegExp} rxFullMatch
     * @param {boolean} bNotEventObject
     * - 시그니처를 분석한다.
     * - 컨텍스트 메소드를 호출한다.
     */
    _dispatchEvent: function(we, el, oContext, rxFullMatch, bNotEventObject) {
        //		console.log("_dispatchEvent : ", arguments)
        var sClass = el.className;

        if (this._hasClass(sClass, this.STOP_DEFAULT)) {
            we.stopDefault();
        } // 기본동작취소
        if (this._hasClass(sClass, this.STOP_BUBBLE)) {
            we.stopBubble();
        } // 버블링 취소
        if (this._hasClass(sClass, this.DISABLED)) {
            return;
        } // 이벤트 정지
        if (!rxFullMatch.test(sClass)) {
            return;
        } // 매칭 확인

        var aMatch = rxFullMatch.exec(sClass),
            aContext = aMatch[1].split("."),
            sMethod = aContext.pop(),
            sContextName = aContext.join(".");

        if (typeof oContext != "object" || oContext.name != sContextName) {
            return;
        } // 컨텍스트 검사

        var fFunc = oContext[sMethod];
        // 메소드 검사
        if (typeof fFunc != "function") {
            nmp.error("nmp.event_delegator > function check : " + sMethod + " is not exist");
        }

        // 파라미터 유효성 검사
        // 공백 검사
        if (/ /.test(aMatch[2])) {
            nmp.error("nmp.event_delegator > parameter check : Spaces are not allowed.");
        }
        var aParam = aMatch[2].split(",");
        we.delegatedElement = el; // 엘리먼트 할당
        // 이벤트 추가
        if (!bNotEventObject) {
            aParam.unshift(we);
        }
        fFunc.apply(oContext, aParam); // 메소드 호출
    },

    /**
     * 클래스 존재 여부
     * @param {String} sClassName
     * @param {String} sFindClass
     * @returns {boolean}
     */
    _hasClass: function(sClassName, sFindClass) {
        return (" " + sClassName + " ").indexOf(" " + sFindClass + " ") > -1;
    },

    /**
     * 버블되지 않는 이벤트 여부
     * @param {String} sEventType
     * @returns {boolean}
     */
    _isNonBubbleEvent: function(sEventType) {
        return this._sNonBubbleEvent.indexOf(sEventType) > -1;
    },

    /**
     * 이벤트 바인딩
     * @param {jindo.$Element|HTMLElement|String} wel 이벤트 바인딩 하고 싶은 엘리먼트
     * @param {String} sEventType 바인딩 이벤트
     * @param {Object} oContext 바인딩 네임스페이스
     * @param {boolean} bNotEventObject 핸들러 호출시 이벤트 객체 넘기지 않는 설정
     * @return {jindo.$Fn} 이벤트바인딩핸들러
     * @example
     * var wfClick = nmp.event_delegator.attach(elTarget, "click", this);
     */
    attach: function(wel, sEventType, oContext, bNotEventObject) {
        //		console.log("attach : ", arguments);
        wel = jindo.$Element(wel);

        if (!(wel && sEventType && oContext)) {
            nmp.error("nmp.event_delegator > check parameter : nmp.event_delegator.attach(wel, sEventType, oContext), oContext.name : " + oContext.name);
        }
        var sContextName = oContext.name;
        if (typeof sContextName != "string") {
            nmp.error("nmp.event_delegator > empty context name : this.name : \"module fullname\"");
        }

        var el = wel.$value(),
            fHandler = jindo.$Fn(jindo.$Fn(this._onEvent, this).bind(oContext, bNotEventObject), this).attach(el, sEventType);

        this._aEventData.push({
            "el": el,
            "sEventType": sEventType,
            "fHandler": fHandler,
            "sContextName": oContext.name
        });

        return fHandler;
    },

    /**
     * 단일 이벤트 해제
     * @param wel
     * @param sEventType
     * @param oContext
     */
    detach: function(wel, sEventType, oContext) {
        wel = jindo.$Element(wel);
        var el = wel.$value(),
            sContextName = oContext.name;

        for (var i = 0, nLen = this._aEventData.length; i < nLen; i++) {
            var oEventData = this._aEventData[i];
            if (oEventData["el"] == el && oEventData["sEventType"] == sEventType && oEventData["sContextName"] == sContextName) {
                oEventData["fHandler"].detach(oEventData["el"], oEventData["sEventType"]);
                this._aEventData = jindo.$A(this._aEventData).refuse(oEventData).$value();
                break;
            }
        }
    },

    /**
     * 이벤트 전체 해제
     * @example
     * nmp.event_delegator.detachAll();
     */
    detachAll: function() {
        for (var i = 0, nLen = this._aEventData.length; i < nLen; i++) {
            var oEventData = this._aEventData[i];
            oEventData["fHandler"].detach(oEventData["el"], oEventData["sEventType"]);
        }
    }
};
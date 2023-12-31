/**
 * @fileOverview Grid
 * @class
 * @name nmp.component.Grid
 * @author EC전시서비스개발팀 윤흥기
 * @example
 */

nmp.component.Grid = jindo.$Class( /** @lends nmp.component.Grid.prototype */ {
    _htElementSelector: {
        "initializing_layer": "._initializing_layer",
        "no_row_layer": "._no_row_layer",
        "loading_layer": "._loading_layer",
        "clipboard": "._clipboard",
        "configurator": "._configurator",
        "area_inflexible": "._inflexible_area",
        "area_flexible": "._flexible_area",
        "header_inflexible": "._inflexible_area ._header",
        "header_flexible": "._flexible_area ._header",
        "header_table_inflexible": "._inflexible_area ._header table",
        "header_table_flexible": "._flexible_area ._header table",
        "header_table_colgroup_inflexible": "._inflexible_area ._header colgroup",
        "header_table_colgroup_flexible": "._flexible_area ._header colgroup",
        "header_table_cols_inflexible": "._inflexible_area ._header colgroup col",
        "header_table_cols_flexible": "._flexible_area ._header colgroup col",
        "header_table_tbody_inflexible": "._inflexible_area ._header tbody",
        "header_table_tbody_flexible": "._flexible_area ._header tbody",
        "data_inflexible": "._inflexible_area ._body",
        "data_flexible": "._flexible_area ._body",
        "data_table_inflexible": "._inflexible_area ._body table",
        "data_table_flexible": "._flexible_area ._body table",
        "data_table_colgroup_inflexible": "._inflexible_area ._body colgroup",
        "data_table_colgroup_flexible": "._flexible_area ._body colgroup",
        "data_table_cols_inflexible": "._inflexible_area ._body colgroup col",
        "data_table_cols_flexible": "._flexible_area ._body colgroup col",
        "data_table_tbody_inflexible": "._inflexible_area ._body tbody",
        "data_table_tbody_flexible": "._flexible_area ._body tbody",
        "data_table_container_inflexible": "._inflexible_area ._body ._table_container",
        "data_table_container_flexible": "._flexible_area ._body ._table_container",
        "space_flexible": "._flexible_area ._space",
        "virtual_bar_inflexible": "._inflexible_area ._body ._virtual_bar",
        "virtual_bar_flexible": "._flexible_area ._body ._virtual_bar",
        "selection_layer_inflexible": "._inflexible_area ._body ._selection_layer",
        "selection_layer_flexible": "._flexible_area ._body ._selection_layer",
        "virtual_scrollbar": "._flexible_area ._virtual_scrollbar",
        "virtual_scrollbar_content": "._flexible_area ._virtual_scrollbar ._content",
        "resize_handle_container_inflexible": "._inflexible_area ._resize_handle_container",
        "resize_handle_container_flexible": "._flexible_area ._resize_handle_container",
        "resize_handle_list_inflexible": "._inflexible_area ._resize_handle_container ._resize_handle",
        "resize_handle_list_flexible": "._flexible_area ._resize_handle_container ._resize_handle",
        "check_all_inflexible": "._inflexible_area ._header table ._check_all",
        "check_all_flexible": "._flexible_area ._header table ._check_all"
    },
    _aPublicMethod: ["setGridWidth", "setGridHeight", "setColumnFixIndex", "reDraw", "setColumnList", "getRowByIndex", "setRowList", "refreshOriginalData", "setRow", "setColumn", "insertRow", "deleteRow", "getModifiedRowList", "isRowExist", "addClassNameToRow", "addClassNameToColumn", "removeClassNameFromRow", "removeClassNameFromColumn"],
    _htInstance: {},
    _htLayoutData: {},
    _htEventData: {},
    _htSelectionData: {},
    _aRowList: [],
    _aOriginalRowList: [],
    _htRowList: {},
    _htOriginalRowList: {},
    _aColumnModel: [],
    _aOriginalColumnModel: [],
    _htColumnResizeData: {},
    _htColElementList: {},
    _aSelectedRowKey: [],
    _aDisabledRowKey: [],
    _aEventTarget: [],
    _htDefaultOption: {},
    _htRenderedRow: {},
    _htRowState: {},
    _aDynamicWidthList: [],
    _bAllItemChecked: false,
    _nColumnFixIndex: 0,
    _nLastIndex: 0,
    _sUniqueKey: "",
    _nBeforeStartOffset: -1,
    _nBeforeEndOffset: -1,
    _nStep: 0,
    _nSetTimeoutId: 0,
    _nSetTimeoutId2: 0,
    _nRenderingTimeoutId: 0,
    _sScrollEventType: "",
    _nMinimumWidth: 500,
    _nMinimumHeight: 200,
    _sDragType: "",
    _nBeforePageY: -1,
    _nBeforeRowIndex: -1,
    _nSetIntervalId: -1,
    _nTotalColumnWidth: 0,
    _nColumnLeft: 0,
    _bChangeText: false,
    _bTextBoxKeyDown: false,
    _nVerticalPadding: 0,
    _nHorizontalPadding: 20,
    _vDefaultValue: null,
    _nBeforeScrollTop: 0,
    _nTotalBaseColumnWidth: 0,
    _nDisplayedColumnCount: 0,
    _bIE6: false,
    _bIE7Under: false,
    _bIE8Under: false,




    /*************************************************************************************************************************************
     * 컴포넌트 초기화 관련
     *************************************************************************************************************************************/

    /**
     * @class 그리드 컴포넌트
     * @constructs
     * @author TarauS
     * @param {HashTable} htOption
     */
    $init: function(htOption) {
        this._initializeVariables();
        this._initializeOption(htOption);
        this._initializeLayout(htOption);

        if (htOption["htConfigurator"] && htOption["htConfigurator"]["bUse"]) {
            this._initializeByConfig(htOption);
        } else {
            this._initialize();
        }
    },

    _initializeVariables: function() {
        var oNavigator = jindo.$Agent().navigator();
        this._bIE6 = oNavigator.ie && oNavigator.version == 6;
        this._bIE7Under = oNavigator.ie && oNavigator.version <= 7;
        this._bIE8Under = oNavigator.ie && oNavigator.version <= 8;
        this._sUniqueKey = String(parseInt(Math.random() * 1000000000, 10));
        this._htInstance = {};
        this._htLayoutData = {};
        this._htEventData = {};
        this._htSelectionData = {};
        this._aRowList = [];
        this._aOriginalRowList = [];
        this._htRowList = {};
        this._htOriginalRowList = {};
        this._aColumnModel = [];
        this._aOriginalColumnModel = [];
        this._htColumnResizeData = {};
        this._htColElementList = {};
        this._aSelectedRowKey = [];
        this._aDisabledRowKey = [];
        this._aEventTarget = [];
        this._htDefaultOption = {};
        this._htRenderedRow = {};
        this._htRowState = {};
        this._aDynamicWidthList = [];
    },

    _initializeOption: function(htOption) {
        this._htDefaultOption = htOption;
        this.option({
            "sSelectType": "",
            "nColumnFixIndex": 0,
            "nWidth": "100%",
            "nHeight": "100%",
            "nDefaultColumnWidth": 50,
            "nHeaderHeight": 32,
            "nRowHeight": 37,
            "bUseAutoNumbering": false,
            "bUseColumnResizing": false,
            "bUseRowCopy": false,
            "sKeyColumnName": "",
            "htConfigurator": {},
            "aColumnMerge": [],
            "aColumnModel": [],
            "nDisplayCount": 0,
            "elReferenceElement": null,
            "sNoRowMessage": ""
        });
        this.option(htOption);
        if (this.option("aColumnPadding")) {
            this._nVerticalPadding = this.option("aColumnPadding")[0] + this.option("aColumnPadding")[2];
            this._nHorizontalPadding = this.option("aColumnPadding")[1] + this.option("aColumnPadding")[3];
        }

        if (this.option("vDefaultValue")) {
            this._vDefaultValue = this.option("vDefaultValue");
        }

        if (this.option("nHeaderHeight") < 32) {
            this.option("nHeaderHeight", 32)
        }
    },

    _initializeLayout: function(htOption) {
        this._nMinimumHeight = this.option("nHeaderHeight") + 2 + ((this.option("nMinimumDisplayRowCount") || 3) * (this.option("nRowHeight") + 1)) + 1 + (this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarX") ? 0 : 17);

        if (/\d{1,3}%/.test(this.option("nWidth"))) {
            this._getElement("root").css("width", this.option("nWidth"));
        } else if (this.option("nWidth")) {
            this._getElement("root").css("width", this.option("nWidth") + "px");
        }

        if (this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarY")) {
            this._getElement("root").css({
                "minHeight": Math.max(parseInt(this.option("nHeight"), 10), this._nMinimumHeight) + "px"
            });
        } else {
            if (/\d{1,3}%/.test(this.option("nHeight"))) {
                var nHeight = Math.max(this._getElement("root").parent().height() * parseInt(this.option("nHeight"), 10) / 100 - 1, this._nMinimumHeight);
                this._getElement("root").css("height", nHeight + "px");
            } else if (this.option("nHeight")) {
                this._getElement("root").css("height", (this.option("nHeight") - 1) + "px");
            }
        }
    },

    _initialize: function() {
        this._setColumnModel(this.option("aColumnModel"));
        this._aOriginalColumnModel = nmp.utility.cloningObject(this._aColumnModel);
        this._setLayoutData();
        this._drawGridLayout();
        this._attachEvent();
        this._setVirtualScrollBar();
        this._render();
    },

    _initializeByConfig: function(htOption) {
        this._setProxyMethod();
        this._htInstance["configurator"] = new nmp.component.Grid.Configurator({
            "htDefaultConfig": htOption,
            "sRootElementSelector": this._getElementSelector("root") + " > ._configurator",
            "sGridId": htOption["htConfigurator"]["sGridId"],
            "sUserId": htOption["htConfigurator"]["sUserId"],
            "sLoadAPI": htOption["htConfigurator"]["sLoadAPI"],
            "sSaveAPI": htOption["htConfigurator"]["sSaveAPI"]
        }).attach({
            "loadConfig": jindo.$Fn(function(weLoadConfig) {
                this._applyConfig(weLoadConfig.htUserConfig);
                this._initialize();
                this._executeQueue();
            }, this).bind(),
            "saveConfig": jindo.$Fn(function(weSaveConfig) {
                this._applyConfig(weSaveConfig.htUserConfig);
                this._setColumnModel(this.option("aColumnModel"));
                if (!weSaveConfig.bSkipRedraw) {
                    this._setLayoutData();
                    this._drawGridLayout();
                    this._setVirtualScrollBar();
                    this._render();
                }
            }, this).bind()
        });
    },




    /*************************************************************************************************************************************
     * 그리드 설정 기능 관련
     *************************************************************************************************************************************/

    _setProxyMethod: function() {
        this._aQueue = [];
        for (var sMethod = "", i = 0; i < this._aPublicMethod.length; i++) {
            sMethod = this._aPublicMethod[i];
            this["_" + sMethod] = this[sMethod];
            this[sMethod] = jindo.$Fn(function(sMethod) {
                this._aQueue.push({
                    "sMethod": sMethod,
                    "aArguments": jindo.$A(arguments).slice(1, arguments.length).$value()
                });
            }, this).bind(sMethod);
        }
    },

    _executeQueue: function() {
        for (var sMethod = "", i = 0; i < this._aPublicMethod.length; i++) {
            sMethod = this._aPublicMethod[i];
            this[sMethod] = this["_" + sMethod];
            delete this["_" + sMethod];
        }

        for (var i = 0; i < this._aQueue.length; i++) {
            sMethod = this._aQueue[i]["sMethod"];
            this[sMethod].apply(this, this._aQueue[i]["aArguments"]);
        }
        this._aQueue = null;
        this._aPublicMethod = null;
    },

    _applyConfig: function(htConfig) {
        if (htConfig) {
            htConfig = nmp.utility.cloningObject(htConfig);
            this._htDefaultOption["nWidth"] = htConfig["nWidth"];
            this._htDefaultOption["nHeight"] = htConfig["nHeight"];
            var htDefaultColumnModel = {};
            for (var i = 0, aColumnModel = this._htDefaultOption.aColumnModel; i < aColumnModel.length; i++) {
                htDefaultColumnModel[aColumnModel[i]["sColumnName"]] = aColumnModel[i];
            }

            var htOption = {};
            for (i = 0, aColumnModel = htConfig.aColumnModel; i < aColumnModel.length; i++) {
                sColumnName = aColumnModel[i]["sColumnName"];
                htColumnModel = htDefaultColumnModel[sColumnName];

                for (var x in htColumnModel) {
                    if (!jindo.$A(["bHidden", "nWidth", "sAlign"]).has(x)) {
                        aColumnModel[i][x] = htColumnModel[x];
                    }
                }
            }

            for (var x in htConfig) {
                htOption[x] = htConfig[x];
            }

            this.option(htOption);
        }
    },




    /*************************************************************************************************************************************
     * 스마트 렌더링 기능 관련
     *************************************************************************************************************************************/

    _setVirtualScrollBar: function() {
        if (this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarY")) {
            this._getElement("virtual_scrollbar").hide();
            this._getElement("virtual_bar_inflexible").hide();
            this._getElement("virtual_bar_flexible").hide();
            this._getElement("selection_layer_inflexible").addClass("no_scroll");
            this._getElement("selection_layer_flexible").addClass("no_scroll");
        } else {
            var nRowHeight = this.option("nRowHeight") + 1;
            var nBufferCount = parseInt(this._htLayoutData["data_height"] / nRowHeight + 1, 10);
            var nDisplayCount = nBufferCount;
            this.option("nBufferCount", nBufferCount);
            this.option("nDisplayCount", nDisplayCount);

            this._getElement("virtual_bar_inflexible").show();
            this._getElement("virtual_bar_flexible").show();
            this._getElement("virtual_scrollbar").show().css({
                "height": this._htLayoutData["data_height"] - this._htLayoutData["horizontal_scrollbar_height"] + "px",
                "top": this._htLayoutData["real_header_height"] + "px"
            });
        }
    },

    _setVirtualScrollBarHeight: function() {
        var nTotalHeight = (this.option("nRowHeight") + 1) * this.getRowCount();
        this._getElement("virtual_scrollbar_content").height(nTotalHeight);
        this._getElement("virtual_bar_inflexible").height(nTotalHeight);
        this._getElement("virtual_bar_flexible").height(nTotalHeight);
    },

    _render: function(bSkipRenderingCheck) {
        if (this.getRowCount() == 0) {
            this.clear();
        } else {
            if (bSkipRenderingCheck) {
                this._renderingRow();
            } else {
                clearTimeout(this._nRenderingTimeoutId);
                this._nRenderingTimeoutId = setTimeout(jindo.$Fn(this._renderingRow, this).bind(), 50);
            }
        }
    },

    _renderingRow: function() {
        this._getElement("no_row_layer").hide();
        this.hideLoadingLayer();

        if (this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarY")) {
            this._detachEventForInputElement();
            this._drawGridRow(this._aRowList);
            this._attachEventForInputElement();
        } else {
            if (this.option("nAutoResizeLimitCount")) {
                var nHeight = this._htLayoutData["real_header_height"] + (Math.min(this.getRowCount(), this.option("nAutoResizeLimitCount")) * (this.option("nRowHeight") + 1)) + 1 + this._htLayoutData["horizontal_scrollbar_height"];
                this.setGridHeight(nHeight, true);
            }
            this._setVirtualScrollBarHeight();
            this._onScroll(null, true);
        }

        this._setAllCheckState();
        this.fireEvent("render");
    },

    _onScroll: function(weScroll, bForce) {
        var elFlexibleGrid = this._getElement("data_flexible", true);
        var elInflexibleGrid = this._getElement("data_inflexible", true);
        var elVirtualScrollBar = this._getElement("virtual_scrollbar", true);
        var nScrollTop = weScroll ? weScroll.element.scrollTop : elVirtualScrollBar.scrollTop;

        if (!weScroll || this._nBeforeScrollTop != nScrollTop) {
            var nDisplayCount = this.option("nDisplayCount");
            var nInnerClientHeight = elFlexibleGrid.clientHeight;
            var nRowHeight = this.option("nRowHeight") + 1;
            this._nStep = parseInt((nScrollTop) / (nDisplayCount * nRowHeight), 10);
            this._nBeforeScrollTop = nScrollTop;
            var nStartOffset = Math.max(0, (this._nStep) * nDisplayCount);
            var nEndOffset = this._nStep ? (this._nStep + 2) * nDisplayCount : nDisplayCount * 2;

            if (bForce || (nStartOffset != this._nBeforeStartOffset && nEndOffset != this._nBeforeEndOffset)) {
                var nTop = this._nStep ? (this._nStep * nDisplayCount * nRowHeight) - 1 : 0;
                this._nBeforeStartOffset = nStartOffset;
                this._nBeforeEndOffset = nEndOffset;
                this._detachEventForInputElement();
                this._drawGridRow(this._aRowList.slice(nStartOffset, nEndOffset));
                this._getElement("data_table_container_inflexible").css("marginTop", nTop + "px");
                this._getElement("data_table_container_flexible").css("marginTop", nTop + "px");
                this._attachEventForInputElement();
                //console.log("render : ", this._nStep, nTop, elFlexibleGrid.scrollTop, elFlexibleGrid.scrollHeight, nStartOffset, nEndOffset);
            }

            elFlexibleGrid.scrollTop = elInflexibleGrid.scrollTop = elVirtualScrollBar.scrollTop = nScrollTop;
        }

        if (weScroll && weScroll.element == elFlexibleGrid) {
            this._refreshHeaderTableScrollPosition(elFlexibleGrid);
        }
    },



    /*************************************************************************************************************************************
     * 컬럼 모델 초기 설정 관련
     *************************************************************************************************************************************/

    _setColumnModel: function(aColumnModel, bReDraw) {
        var wfTextBoxFocus = jindo.$Fn(this._onTextBoxFocus, this).bind();
        var wfSelectBoxChange = jindo.$Fn(this._onSelectBoxChange, this).bind();
        var sParent = "";

        this._aColumnModel = nmp.utility.cloningObject(aColumnModel);
        this._nColumnFixIndex = this.option("nColumnFixIndex");
        this._aEventTarget = [];
        this._aDynamicWidthList = [];
        this._nTotalBaseColumnWidth = 0;
        this._nDisplayedColumnCount = 0;

        if (this.option("bUseAutoNumbering")) {
            this._addNumberToModel(bReDraw);
        }

        if (this.option("sSelectType") == "checkbox") {
            this._addCheckBoxToModel(bReDraw);
        } else if (this.option("sSelectType") == "radiobox") {
            this._addRadioBoxToModel(bReDraw);
        }

        for (var i = 0; i < this._aColumnModel.length; i++) {
            if (this._aColumnModel[i]["bHidden"]) {
                if (i < this._nColumnFixIndex) {
                    this._nColumnFixIndex++;
                }
                continue;
            }

            if (i < this._nColumnFixIndex) {
                this._aColumnModel[i]["bInflexible"] = true;
                this._aColumnModel[i]["sGridType"] = "inflexible";
            } else {
                this._aColumnModel[i]["bInflexible"] = false;
                this._aColumnModel[i]["sGridType"] = "flexible";
            }

            if (this._aColumnModel[i]["nWidth"] && !/\d{1,3}%/.test(this._aColumnModel[i]["nWidth"])) {
                this._nTotalBaseColumnWidth += this._aColumnModel[i]["nWidth"];
            }

            if (this._aColumnModel[i]["htEditOption"] && this._aColumnModel[i]["htEditOption"]["bFixed"]) {
                sParent = this._nColumnFixIndex <= i ? "data_flexible" : "data_inflexible";
                if (this._aColumnModel[i]["sEditType"] == "textbox") {
                    this._aEventTarget.push({
                        "sParent": sParent,
                        "sSelector": "td[columnName=" + this._aColumnModel[i]["sColumnName"] + "] > input[type=text]",
                        "sEvent": "focus",
                        "fCallback": wfTextBoxFocus
                    });
                } else if (this._aColumnModel[i]["sEditType"] == "selectbox") {
                    this._aEventTarget.push({
                        "sParent": sParent,
                        "sSelector": "td[columnName=" + this._aColumnModel[i]["sColumnName"] + "] > select",
                        "sEvent": "change",
                        "fCallback": wfSelectBoxChange
                    });
                }
            }

            this._nDisplayedColumnCount++;
        }
    },

    _addNumberToModel: function(bReDraw) {
        this._aColumnModel.unshift({
            "sTitle": "No.",
            "sColumnName": "_number",
            "nWidth": 60
        });
        if (this._nColumnFixIndex && !bReDraw) {
            this._nColumnFixIndex++;
        }
    },

    _addCheckBoxToModel: function(bReDraw) {
        this._aColumnModel.unshift({
            "sTitle": "<input type='checkbox' class='_check_all'>",
            "sColumnName": "_checkbox",
            "nWidth": 50,
            "sAlign": "center"
        });
        if (this._nColumnFixIndex && !bReDraw) {
            this._nColumnFixIndex++;
        }
    },

    _addRadioBoxToModel: function(bReDraw) {
        this._aColumnModel.unshift({
            "sTitle": "선택",
            "sColumnName": "_radiobox",
            "nWidth": 50,
            "sAlign": "center"
        });
        if (this._nColumnFixIndex && !bReDraw) {
            this._nColumnFixIndex++;
        }
    },




    /*************************************************************************************************************************************
     * 이벤트 핸들러 처리 관련
     *************************************************************************************************************************************/

    _attachEvent: function() {
        this._attachEventHandler(window, "resize", jindo.$Fn(this._onResize, this).bind());
        if (this.option("sMouseOverClass")) {
            this._attachEventHandler(this._getElement("root"), "mouseover", jindo.$Fn(this._onMouseOver, this).bind());
            this._attachEventHandler(this._getElement("root"), "mouseout", jindo.$Fn(this._onMouseOut, this).bind());
        }
        if (this._nColumnFixIndex) {
            this._attachEventHandler(this._getElement("data_inflexible"), "scroll", jindo.$Fn(this._onScroll, this).bind());
        }
        this._attachEventHandler(this._getElement("data_flexible"), "scroll", jindo.$Fn(this._onScroll, this).bind());
        this._attachEventHandler(this._getElement("virtual_scrollbar"), "scroll", jindo.$Fn(this._onScroll, this).bind());
        this._attachEventHandler(this._getElement("root"), "click", jindo.$Fn(this._onClick, this).bind());
        this._attachEventHandler(this._getElement("root"), "dblclick", jindo.$Fn(this._onDoubleClick, this).bind());
        this._attachEventHandler(this._getElement("root"), "mousedown", jindo.$Fn(this._onMouseDown, this).bind());
    },

    _onMouseOver: function(weMouseOver) {
        var welTR = this._getRowElement(weMouseOver.element);

        if (welTR) {
            welTR.addClass(this.option("sMouseOverClass"));
            if (this._nColumnFixIndex) {
                this._getAnotherRowElement(welTR).addClass(this.option("sMouseOverClass"));
            }
        }
    },

    _onMouseOut: function(weMouseOut) {
        var welTR = this._getRowElement(weMouseOut.element);

        if (welTR) {
            welTR.removeClass(this.option("sMouseOverClass"));
            if (this._nColumnFixIndex) {
                this._getAnotherRowElement(welTR).removeClass(this.option("sMouseOverClass"));
            }
        }
    },

    _attachEventForInputElement: function() {
        //console.log("attach event start : ", $H(this._htEventData).length(), this._htEventData, this._aEventTarget)
        var aInputElementList = [];
        for (var i = 0, aList = this._aEventTarget; i < aList.length; i++) {
            aInputElementList = this._getElement(aList[i]["sParent"]).queryAll(aList[i]["sSelector"]);
            for (var j = 0; j < aInputElementList.length; j++) {
                this._htEventData[aInputElementList[j].name] = this._attachEventHandler(aInputElementList[j], aList[i]["sEvent"], aList[i]["fCallback"]);
            }
            aList[i]["aInputElementList"] = aInputElementList;
        }
        //console.log("attach event end : ", $H(this._htEventData).length(), this._htEventData)
    },

    _detachEventForInputElement: function() {
        //console.log("detach event start : ", $H(this._htEventData).length(), this._htEventData)
        var aInputElementList = [];
        for (var i = 0, aList = this._aEventTarget; i < aList.length; i++) {
            aInputElementList = aList[i]["aInputElementList"];
            if (aInputElementList && aInputElementList.length) {
                for (var j = 0; j < aInputElementList.length; j++) {
                    if (this._htEventData[aInputElementList[j].name]) {
                        this._detachEventHandler(this._htEventData[aInputElementList[j].name]);
                        delete this._htEventData[aInputElementList[j].name];
                    }
                }
            }
            aList["aInputElementList"] = [];
        }
        //console.log("detach event end : ", $H(this._htEventData).length(), this._htEventData)
    },



    /*************************************************************************************************************************************
     * 레이아웃 구성 관련
     *************************************************************************************************************************************/
    _setLayoutData: function() {
        var bHided = false;

        if (!this._getElement("root").visible()) {
            bHided = true;
            this._getElement("root").show();
        }

        this._htLayoutData["width"] = Math.max(this._getElement("root").width(), this._nMinimumWidth);
        this._htLayoutData["height"] = Math.max(this._getElement("root").height() - 1, this._nMinimumHeight);
        this._htLayoutData["header_height"] = this.option("nHeaderHeight");
        this._htLayoutData["real_header_height"] = this._htLayoutData["header_height"] + 2;
        this._htLayoutData["data_height"] = this._htLayoutData["height"] - this._htLayoutData["real_header_height"];
        this._calculateColumnWidth();
        this._calculateAreaWidth();

        if (bHided) {
            this._getElement("root").hide();
        }
    },

    _calculateColumnWidth: function() {
        var nTotalWidth = this._nTotalBaseColumnWidth;
        var nDefaultColumnWidth = this.option("nDefaultColumnWidth");

        for (var i = 0; i < this._aColumnModel.length; i++) {
            if (!this._aColumnModel[i]["bHidden"]) {
                if (!this._aColumnModel[i]["nWidth"]) {
                    if (!jindo.$A(this._aDynamicWidthList).has(this._aColumnModel[i])) {
                        this._aDynamicWidthList.push(this._aColumnModel[i]);
                    }
                } else if (/\d{1,3}%/.test(this._aColumnModel[i]["nWidth"])) {
                    this._aColumnModel[i]["nAssignWidth"] = Math.max(Math.floor(this._htLayoutData["width"] * parseInt(this._aColumnModel[i]["nWidth"], 10) / 100), nDefaultColumnWidth);
                    nTotalWidth += this._aColumnModel[i]["nAssignWidth"] || 0;
                } else {
                    this._aColumnModel[i]["nAssignWidth"] = this._aColumnModel[i]["nWidth"];
                }
            }
        }

        var nRemainWidth = this._htLayoutData["width"] - nTotalWidth - (this._nDisplayedColumnCount + 2) - (this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarX") ? 0 : 17);
        if (this._aDynamicWidthList.length) {
            for (var i = 0; i < this._aDynamicWidthList.length; i++) {
                this._aDynamicWidthList[i]["nAssignWidth"] = Math.max(Math.floor(nRemainWidth / this._aDynamicWidthList.length), nDefaultColumnWidth);
            }
        }
    },

    _calculateAreaWidth: function() {
        this._htLayoutData["inflexible_width"] = 0;
        if (this._nColumnFixIndex > 0) {
            for (var i = 0; i < this._nColumnFixIndex; i++) {
                if (!this._aColumnModel[i]["bHidden"]) {
                    this._htLayoutData["inflexible_width"] += this._aColumnModel[i]["nAssignWidth"] + 1;
                }
            }
            this._htLayoutData["inflexible_width"] += 1;
        }

        this._htLayoutData["flexible_width"] = this._htLayoutData["width"] - this._htLayoutData["inflexible_width"]; // - ($Agent().navigator().ie && $Agent().navigator().version == 6 ? this._nColumnFixIndex + 1 : 0);
    },

    _refreshColumnWidth: function() {
        for (var i = 0, j = 0; i < this._aColumnModel.length; i++) {
            if (!this._aColumnModel[i]["bHidden"]) {
                jindo.$Element(this._htColElementList["header"][j]).css("width", this._aColumnModel[i]["nAssignWidth"] + "px");
                jindo.$Element(this._htColElementList["body"][j]).attr("style", "width:" + this._aColumnModel[i]["nAssignWidth"] + "px;*width:" + (this._aColumnModel[i]["nAssignWidth"] - this._nHorizontalPadding) + "px;");
                j++;
            }
        }
    },

    _drawGridLayout: function(bSkipDrawGridHeader) {
        var aColumnModel = this._aColumnModel;

        // 스크롤바를 안 쓰는 경우, IE7에서는 paddingRight를 0으로 설정해야 함 (스크롤바 크기만큼의 여백 때문)
        if (this.option("bNotUseScrollBar")) {
            this._htLayoutData["vertical_scrollbar_width"] = 0;
            this._htLayoutData["horizontal_scrollbar_height"] = 0;
            this._getElement("header_flexible").css({
                "overflow": "hidden",
                "paddingRight": "0px"
            });
            this._getElement("data_flexible").css({
                "overflow": "hidden",
                "paddingRight": "0px",
                "minHeight": this._htLayoutData["data_height"] + "px"
            });
            this._getElement("data_inflexible").css({
                "overflowX": "hidden",
                "minHeight": this._htLayoutData["data_height"] + "px"
            });
            this._getElement("data_table_inflexible").css("position", "relative");
            this._getElement("data_table_flexible").css("position", "relative");
            this._getElement("space_flexible").hide();
        } else if (this.option("bNotUseScrollBarX")) {
            this._htLayoutData["vertical_scrollbar_width"] = 17;
            this._htLayoutData["horizontal_scrollbar_height"] = 0;
            this._getElement("data_flexible").height(this._htLayoutData["data_height"]).css({
                "overflowY": "scroll",
                "overflowX": "hidden"
            });
            this._getElement("data_inflexible").height(this._htLayoutData["data_height"]).css({
                "overflowY": "scroll",
                "overflowX": "hidden"
            });
            this._getElement("space_flexible").show().height(this._htLayoutData["header_height"]);
        } else if (this.option("bNotUseScrollBarY")) {
            this._htLayoutData["vertical_scrollbar_width"] = 0;
            this._htLayoutData["horizontal_scrollbar_height"] = 17;
            this._getElement("header_flexible").css({
                "overflow": "hidden",
                "paddingRight": "0px"
            });
            this._getElement("data_flexible").css({
                "overflowX": "scroll",
                "overflowY": "hidden",
                "paddingRight": "0px",
                "minHeight": this._htLayoutData["data_height"] + "px"
            });
            this._getElement("data_inflexible").css({
                "overflow": "scroll",
                "minHeight": this._htLayoutData["data_height"] + "px"
            });
            this._getElement("data_table_inflexible").css("position", "relative");
            this._getElement("data_table_flexible").css("position", "relative");
            this._getElement("space_flexible").hide();
        } else {
            this._htLayoutData["vertical_scrollbar_width"] = 17;
            this._htLayoutData["horizontal_scrollbar_height"] = 17;
            this._getElement("space_flexible").show().height(this._htLayoutData["header_height"]);
            this._getElement("data_inflexible").height(this._htLayoutData["data_height"]);
            this._getElement("data_flexible").height(this._htLayoutData["data_height"]);
            // TODO IE 6에 대한 지원이 필요한 경우 검토
            //			if(this._bIE6){
            //				this._getElement("area_flexible").width(this._htLayoutData["width"] - this._htLayoutData["inflexible_width"]);
            //			}
        }

        this._getElement("area_flexible").show();
        this._getElement("header_flexible").height(this._htLayoutData["real_header_height"]);
        if (this._nColumnFixIndex > 0) {
            // TODO setInflexibleWidth() 함수 호출하는 것을 검토
            this._getElement("area_inflexible").show().width(this._htLayoutData["inflexible_width"]);
            this._getElement("area_flexible").css("marginLeft", (this._htLayoutData["inflexible_width"]) + "px");
            this._getElement("header_inflexible").height(this._htLayoutData["real_header_height"]);
            if (!bSkipDrawGridHeader) {
                this._drawGridHeader(aColumnModel.slice(0, this._nColumnFixIndex), true);
                this._drawGridHeader(aColumnModel.slice(this._nColumnFixIndex));
            }
        } else if (!bSkipDrawGridHeader) {
            this._drawGridHeader(aColumnModel);
        }

        if (this.option("sNoRowMessage")) {
            this._getElement("no_row_layer").html(this.option("sNoRowMessage"));
        }

        this._getElement("initializing_layer").hide();

        jindo.$Fn(function() {
            var aFlexibleHeaderColElement = this._getElementList("header_table_cols_flexible", true);
            var aFlexibleBodyColElement = this._getElementList("data_table_cols_flexible", true);
            var aInflexibleHeaderColElement = this._getElementList("header_table_cols_inflexible", true);
            var aInflexibleBodyColElement = this._getElementList("data_table_cols_inflexible", true);

            this._htColElementList = {
                "header_flexible": aFlexibleHeaderColElement,
                "header_inflexible": aInflexibleHeaderColElement,
                "body_flexible": aFlexibleBodyColElement,
                "body_inflexible": aInflexibleBodyColElement,
                "header": aInflexibleHeaderColElement.concat(aFlexibleHeaderColElement),
                "body": aInflexibleBodyColElement.concat(aFlexibleBodyColElement)
            }
        }, this).delay(0);
    },

    _onResize: function(weResize) {
        this.setGridWidth();
        if (!this.option("bNotUseScrollBar") && !this.option("bNotUseScrollBarY")) {
            this.setGridHeight();
        }
    },



    /*************************************************************************************************************************************
     * 그리드 헤더 드로잉 관련
     *************************************************************************************************************************************/

    _getColumnHierarchy: function(htColumnModel, aResult) {
        var aColumnMerge = this.option("aColumnMerge");

        aResult = aResult || [];
        if (htColumnModel) {
            aResult.push(htColumnModel);
            if (aColumnMerge) {
                for (var i = 0; i < aColumnMerge.length; i++) {
                    if (jindo.$A(aColumnMerge[i]["aColumnNameList"]).has(htColumnModel["sColumnName"])) {
                        aResult = this._getColumnHierarchy(aColumnMerge[i], aResult);
                    }
                }
            }
        }
        return aResult;
    },

    _getShowedColumnModel: function(aColumnModel) {
        return jindo.$A(aColumnModel || this._aColumnModel).filter(function(v) {
            if (!v["bHidden"]) {
                return true;
            }
        }).$value();
    },

    _drawGridHeader: function(aColumnModel, bInflexibleGrid) {
        var sGridType = bInflexibleGrid ? "inflexible" : "flexible";
        var welContainer = this._getElement("header_" + sGridType);
        var aColGroupHTML = [],
            aColGroupHTML2 = [],
            aHeaderTableHTML = [],
            aBodyTableHTML = [],
            aResizeHandleHTML = [];
        var nMaxRowCount = 0,
            nLeft = 0,
            nWidth = 0,
            nTotalWidth = 0;
        var aHierarchyList = [],
            aResult = [],
            htCCRD = {};
        var sClassName = "";

        aColumnModel = this._getShowedColumnModel(aColumnModel);
        for (var i = 0; i < aColumnModel.length; i++) {
            if (this.option("bUseColumnResizing")) {
                aResizeHandleHTML.push("<div gridType='" + sGridType + "' columnIndex='" + i + "' columnName='" + aColumnModel[i]["sColumnName"] + "' class='_resize_handle resize_handle " + (i + 1 == aColumnModel.length ? "resize_handle_last" : "") + "' style='height:" + this._htLayoutData["header_height"] + "px;' title='마우스 드래그를 통해 컬럼의 넓이를 변경할 수 있고,\n더블클릭을 통해 넓이를 초기화할 수 있습니다.'></div>");
            }

            aResult = this._getColumnHierarchy(aColumnModel[i]).reverse();
            aHierarchyList.push(aResult);
            nMaxRowCount = nMaxRowCount < aResult.length ? aResult.length : nMaxRowCount;
            sClassName = aColumnModel[i]["sClassName"] ? " class='" + aColumnModel[i]["sClassName"] + "'" : "";
            aColGroupHTML.push("<col columnName='" + aColumnModel[i]["sColumnName"] + "' " + sClassName + " style='width:" + aColumnModel[i]["nAssignWidth"] + "px;'>");
            aColGroupHTML2.push("<col columnName='" + aColumnModel[i]["sColumnName"] + "' " + sClassName + " style='width:" + aColumnModel[i]["nAssignWidth"] + "px;*width:" + (aColumnModel[i]["nAssignWidth"] - this._nHorizontalPadding) + "px'>");
        }

        if (this.option("bUseColumnResizing")) {
            this._getElement("resize_handle_container_" + sGridType).show().css({
                "marginTop": -this._htLayoutData["header_height"] + "px",
                "height": this._htLayoutData["header_height"] + "px"
            }).html(aResizeHandleHTML.join(""));
        }

        var sColumnName = "",
            sRole = "",
            sWidth = "",
            sHeight = "",
            sColSpan = "",
            sRowSpan = "";
        var aMarkupList = new Array(nMaxRowCount);
        var aColumnName = new Array(nMaxRowCount),
            aColSpan = [];
        var nLength, nRowSpan = 1;
        var nRowHeight = this._htLayoutData["header_height"] / nMaxRowCount;
        for (var i = 0; i < aHierarchyList.length; i++) {
            nLength = aHierarchyList[i].length;
            for (var j = 0; j < nLength; j++) {
                if (aColumnName[j] == aHierarchyList[i][j]["sColumnName"]) {
                    aMarkupList[j].pop();
                    aColSpan[j] += 1;
                } else {
                    aColSpan[j] = 1;
                }

                aColumnName[j] = aHierarchyList[i][j]["sColumnName"];
                sColumnName = " columnName='" + aHierarchyList[i][j]["sColumnName"] + "'";
                nRowSpan = (nLength - 1 == j && (nMaxRowCount - nLength + 1) > 1) ? (nMaxRowCount - nLength + 1) : 1;
                sRole = " role='" + sGridType + "_header_" + i + "'";
                sHeight = " height='" + (nRowHeight * nRowSpan) + "'";
                sRowSpan = nRowSpan > 1 ? " rowSpan='" + nRowSpan + "'" : "";
                sColSpan = (aColSpan[j] > 1) ? " colSpan='" + aColSpan[j] + "'" : "";
                aMarkupList[j] = aMarkupList[j] || [];
                aMarkupList[j].push("<th" + sColumnName + sRole + sHeight + sRowSpan + sColSpan + ">" + aHierarchyList[i][j]["sTitle"] + "</th>");
            }
        }

        for (var i = 0; i < aMarkupList.length; i++) {
            aHeaderTableHTML.push("<tr>" + aMarkupList[i].join("") + "</tr>");
        }

        this._getElement("header_table_colgroup_" + sGridType).leave();
        this._getElement("data_table_colgroup_" + sGridType).leave();
        this._getElement("header_table_" + sGridType).prepend("<colgroup>");
        this._getElement("data_table_" + sGridType).prepend("<colgroup>");
        this._clearElement("header_table_colgroup_" + sGridType);
        this._clearElement("data_table_colgroup_" + sGridType);
        this._clearElement("header_table_cols_" + sGridType);
        this._clearElement("data_table_cols_" + sGridType);
        this._getElement("header_table_colgroup_" + sGridType).html(aColGroupHTML.join(""));
        this._getElement("data_table_colgroup_" + sGridType).html(aColGroupHTML2.join(""));
        this._getElement("header_table_tbody_" + sGridType).html(aHeaderTableHTML.join(""));

        if (!bInflexibleGrid) {
            this._refreshColumnResizingBarPosition();
        }
    },



    /*************************************************************************************************************************************
     * 그리드 데이터 드로잉 관련
     *************************************************************************************************************************************/

    _drawGridRow: function(aRowList) {
        var welTBody, welTBody2, aElement, aElement2;
        var sKeyColumnName = this._getKeyColumnName();

        if (this._nColumnFixIndex) {
            welTBody = this._getElement("data_table_tbody_inflexible").html(this._makeRowMarkup(aRowList, true));
            aElement = welTBody.queryAll("tr[rowType=inflexible]");
        }
        welTBody2 = this._getElement("data_table_tbody_flexible").html(this._makeRowMarkup(aRowList, false));
        aElement2 = welTBody2.queryAll("tr[rowType=flexible]");

        for (var i = 0; i < aRowList.length; i++) {
            if (aElement) {
                this._htRenderedRow["inflexible_" + aRowList[i][sKeyColumnName]] = aElement[i];
            }
            this._htRenderedRow["flexible_" + aRowList[i][sKeyColumnName]] = aElement2[i];
        }
    },

    _makeRowMarkup: function(aRowList, bInflexible) {
        aRowList = aRowList || this._aRowList;
        var nColumnFixIndex = this._nColumnFixIndex;
        var aColumnModel = this._aColumnModel;
        var sKeyColumnName = this._getKeyColumnName();
        var sGridType = nColumnFixIndex > 0 && bInflexible ? "inflexible" : "flexible";
        var aHTML = [],
            nStart = 0,
            nLimit = aColumnModel.length;
        var nRowHeight = this._bIE7Under ? this.option("nRowHeight") - this._nVerticalPadding : this.option("nRowHeight");

        if (nColumnFixIndex > 0) {
            if (bInflexible) {
                nLimit = nColumnFixIndex;
            } else {
                nStart = nColumnFixIndex;
            }
        }

        var sClassName = "";
        var htRow = {};
        var aClassNameList = [];
        for (var i = 0; i < aRowList.length; i++) {
            htRow = aRowList[i];
            aClassNameList = htRow["_className"] && htRow["_className"]["row"] ? htRow["_className"]["row"] : [];
            if (this._checkRowState(htRow["rowKey"], ["CHECKED"])) {
                aClassNameList.push("selected");
            } else if (this._checkRowState(htRow["rowKey"], ["DISABLED"])) {
                aClassNameList.push("disabled");
            }
            sClassName = aClassNameList.length ? " class='" + aClassNameList.join(" ") + "'" : "";

            aHTML.push("<tr height='" + nRowHeight + "' rowType='" + sGridType + "' key='" + htRow[sKeyColumnName] + "' " + sClassName + ">");
            for (var j = nStart; j < nLimit; j++) {
                if (!aColumnModel[j]["bHidden"]) {
                    aHTML.push(this._makeColumnMarkup(aColumnModel[j], htRow, true));
                }
            }
            aHTML.push("</tr>");
        }
        return aHTML.join("");
    },

    _makeColumnMarkup: function(htColumnModel, htRow, bMakeTD, bForceEditInputElement) {
        htColumnModel = this._cloneObject(htColumnModel);
        var aHTML = [],
            aClassNameList = [],
            aStyleList = [];
        var sColumnName = htColumnModel["sColumnName"];
        var sColumnEditType = htColumnModel["sEditType"];
        var sColumnAlign = htColumnModel["sAlign"] ? " align='" + htColumnModel["sAlign"] + "' " : "";
        var vColumnValue = htRow[sColumnName] === null || htRow[sColumnName] === undefined ? "" : htRow[sColumnName];
        var sChecked = "",
            sDisabled = "",
            sTitle = "";
        var htEditOption = htColumnModel["htEditOption"];

        if (htColumnModel["fFormater"] && typeof(htColumnModel["fFormater"]) == "function") {
            vColumnValue = htColumnModel["fFormater"](vColumnValue, htRow, htColumnModel);
            vColumnValue = typeof(vColumnValue) == "number" ? String(vColumnValue) : (vColumnValue || "");
            htEditOption = htColumnModel["htEditOption"];
        }

        if (htColumnModel["bEscapeHTML"]) {
            vColumnValue = jindo.$S(vColumnValue).escapeHTML().$value();
        }

        if (vColumnValue == "DISABLED" || this._checkRowState(htRow["rowKey"], ["DISABLED"]) || htColumnModel.bDisabled === true) {
            sDisabled = " disabled='disabled'";
            vColumnValue = vColumnValue == "DISABLED" ? "" : vColumnValue;
        }

        if (sColumnEditType && htEditOption) {
            bForceEditInputElement = htEditOption["bFixed"] || bForceEditInputElement;
        }

        if (bForceEditInputElement) {
            var sInputName = sColumnName + "_" + this._sUniqueKey + "_" + htRow[this._getKeyColumnName()];
            var sBeforeText, sAfterText, sWidth = "",
                sDisplay = htColumnModel.bHideInputElement ? "display:none;" : "";

            if (htEditOption) {
                sBeforeText = htEditOption["sBeforeText"] || "";
                sAfterText = htEditOption["sAfterText"] || "";
                sWidth = htEditOption["nWidth"] ? "width:" + htEditOption["nWidth"] + (/\d{1,3}%/.test(htEditOption["nWidth"]) ? "" : "px;") : "";
            }

            aHTML.push(sBeforeText);
            switch (sColumnEditType) {
                case "textbox":
                    var sTextBoxAlign = htColumnModel["sAlign"] ? " text-align:" + htColumnModel["sAlign"] : "";
                    var sMaxLength = htEditOption && htEditOption["nMaxLength"] ? " maxLength='" + htEditOption["nMaxLength"] + "'" : "";
                    aHTML.push("<input type='text' name='" + sInputName + "' value='" + vColumnValue + "'" + sMaxLength + " style='" + sDisplay + sWidth + sTextBoxAlign + "' " + sDisabled + "/>");
                    break;
                case "selectbox":
                    aHTML.push("<select name='" + sInputName + "' style='" + sDisplay + sWidth + "'" + sDisabled + ">");
                    for (var i = 0, aOptionList = htColumnModel["htEditOption"]["aList"]; i < aOptionList.length; i++) {
                        aHTML.push("<option value='" + aOptionList[i]["value"] + "' " + (String(vColumnValue) == String(aOptionList[i]["value"]) ? "selected" : "") + ">" + aOptionList[i]["text"] + "</option>");
                    }
                    aHTML.push("</select>");
                    break;
                case "checkbox":
                    var waValueList = jindo.$A(String(vColumnValue).split(","));
                    var sCheckState = "",
                        sCheckBoxId = "";
                    for (var i = 0, aOptionList = htColumnModel["htEditOption"]["aList"]; i < aOptionList.length; i++) {
                        sCheckState = waValueList.has(aOptionList[i]["value"]) ? "checked='checked'" : "";
                        sCheckBoxId = "checkbox_" + sInputName + "_" + aOptionList[i]["value"];
                        aHTML.push("<input id='" + sCheckBoxId + "' type='checkbox' name='" + sInputName + "' value='" + aOptionList[i]["value"] + "' style='" + sDisplay + "' " + sCheckState + " " + sDisabled + "/>");
                        aHTML.push("<label for='" + sCheckBoxId + "' style='" + sDisplay + "'>" + aOptionList[i]["text"] + "</label>");
                    }
                    break;
                case "radiobox":
                    var sCheckState = "",
                        sRadioBoxId = "";
                    var bChecked = false;

                    for (var aOptionList = htColumnModel["htEditOption"]["aList"], i = aOptionList.length - 1; i >= 0; i--) {
                        if ((aOptionList[i]["value"] == vColumnValue) || (i == 0 && !bChecked)) {
                            bChecked = true;
                            sCheckState = "checked='checked'";
                        }
                        sRadioBoxId = "radiobox_" + sInputName + "_" + aOptionList[i]["value"];
                        aHTML.push("<label for='" + sRadioBoxId + "' style='" + sDisplay + "'>" + aOptionList[i]["text"] + "</label>");
                        aHTML.push("<input type='radio' id='" + sRadioBoxId + "' name='" + sInputName + "' value='" + aOptionList[i]["value"] + "' style='" + sDisplay + "' " + sCheckState + " " + sDisabled + "/>");
                    }
                    aHTML = aHTML.reverse();
                    break;
                case "date":
                    break;
                default:
            }
            aHTML.push(sAfterText);
        } else {
            if (sColumnName == "_checkbox") {
                sChecked = this._checkRowState(htRow["rowKey"], ["CHECKED"]) ? " checked='checked'" : "";
                sDisabled = sDisabled || (this._checkRowState(htRow["rowKey"], ["DISABLED_SELECT"]) ? " disabled='disabled'" : "");
                aHTML.push("<input type='checkbox' name='check_item' class='_check_item' " + sChecked + sDisabled + ">");
            } else if (sColumnName == "_radiobox") {
                sChecked = this._checkRowState(htRow["rowKey"], ["CHECKED"]) ? " checked='checked'" : "";
                sDisabled = sDisabled || (this._checkRowState(htRow["rowKey"], ["DISABLED_SELECT"]) ? " disabled='disabled'" : "");
                aHTML.push("<input type='radio' name='radio_item' class='_radio_item' " + sChecked + sDisabled + ">");
            } else if (sColumnName == "_number") {
                aHTML.push(htRow["_number"]);
            } else {
                aHTML.push(String(vColumnValue) || this._vDefaultValue);
            }
        }

        if (bMakeTD) {
            if (htRow["_className"] && htRow["_className"]["column"] && htRow["_className"]["column"][sColumnName]) {
                aClassNameList.push(htRow["_className"]["column"][sColumnName]);
            }
            if (!bForceEditInputElement && !htColumnModel.bHideInputElement && htColumnModel["bEllipsis"]) {
                aClassNameList.push("ellipsis");
                sTitle = " title='" + jindo.$S(aHTML.join("")).stripTags().trim().$value() + "'";
            }
            if (sColumnEditType) {
                aClassNameList.push("editable");
            }
            if (htColumnModel["sAlign"]) {
                aStyleList.push("text-align:" + htColumnModel["sAlign"] + ";");
            }

            if (htColumnModel["sColumnStyle"]) {
                aStyleList.push(htColumnModel["sColumnStyle"]);
            }

            var sClassName = aClassNameList.length ? " class='" + aClassNameList.join(" ") + "'" : "";
            var sStyle = aStyleList.length ? " style='" + aStyleList.join(";") + "'" : "";
            return "<td " + sTitle + sColumnAlign + " columnName='" + sColumnName + "'" + sClassName + sStyle + ">" + aHTML.join("") + "</td>";
        } else {
            return aHTML.join("");
        }
    },

    /**
     * _rowState는 CHECKED, DISABLED, DISABLED_SELECT 값을 갖을 수 있다.
     * CHECKED는 _rowState 값이 비어있을 때만 설정이 가능하다.
     */


    /*************************************************************************************************************************************
     * 행 선택 관련
     *************************************************************************************************************************************/

    _selectRow: function(elTarget, bSkipAddKey) {
        if (elTarget) {
            var welParent = this._getRowElement(elTarget),
                welAnotherParent, welTarget;
            var sKey = welParent.attr("key"),
                sSelector = "";
            var htRow = this.getRow(sKey);

            if (this._checkRowState(sKey, ["DISABLED", "DISABLED_SELECT"])) {
                return false;
            }

            welParent.addClass("selected");
            if (this._nColumnFixIndex) {
                welAnotherParent = this._getAnotherRowElement(welParent).addClass("selected");
            }

            if (welParent.attr("rowType") == "flexible") {
                welTarget = welAnotherParent ? welAnotherParent : welParent;
            } else {
                welTarget = welParent;
            }

            if (this.option("sSelectType") == "checkbox") {
                sSelector = "input[type=checkbox][name=check_item]";
                this._htRowList[sKey]["_rowState"] = "CHECKED";
            } else if (this.option("sSelectType") == "radiobox" && this._htRowList[sKey]) {
                sSelector = "input[type=radio][name=radio_item]";
                this._htRowList[sKey]["_rowState"] = "CHECKED";
            }

            if (welTarget && sSelector) {
                welTarget.query(sSelector).checked = true;
            }

            if (!bSkipAddKey && !jindo.$A(this._aSelectedRowKey).has(sKey)) {
                this._aSelectedRowKey.push(sKey);
                this.fireEvent("select", htRow);
            }

            this._setAllCheckState();
        }
    },

    _unselectRow: function(elTarget) {
        var welParent, welAnotherParent, welTarget;
        var sCheckBoxSelector = "input[type=checkbox][name=check_item]";
        var sSelectType = this.option("sSelectType");
        var sColumnType = "_" + sSelectType;

        if (elTarget) {
            welParent = this._getRowElement(elTarget).removeClass("selected");
            var sKey = welParent.attr("key");
            //console.log("unselect row and remove key", sKey)
            if (this._nColumnFixIndex) {
                welAnotherParent = this._getAnotherRowElement(elTarget).removeClass("selected");
            }

            if (sSelectType == "checkbox") {
                if (welParent.attr("rowType") == "flexible" && welAnotherParent) {
                    welAnotherParent.query(sCheckBoxSelector).checked = false;
                } else {
                    welParent.query(sCheckBoxSelector).checked = false;
                }
            }
            this._htRowList[sKey]["_rowState"] = "";
            this._aSelectedRowKey = jindo.$A(this._aSelectedRowKey).refuse(sKey).$value();
            this.fireEvent("unselect", this.getRow(sKey));
        } else {
            //console.log("unselect row and reset key array", this._aSelectedRowKey.length)
            var aRowList = jindo.$ElementList(this._getElement("data_flexible").queryAll("tr[class*=selected]")).removeClass("selected").$value();
            if (this._nColumnFixIndex) {
                aRowList = jindo.$ElementList(this._getElement("data_inflexible").queryAll("tr[class*=selected]")).removeClass("selected").$value();
            }
            for (var i = 0; i < aRowList.length; i++) {
                if (sSelectType == "checkbox") {
                    aRowList[i].query(sCheckBoxSelector).checked = false;
                }
            }
            for (var i = 0; i < this._aSelectedRowKey.length; i++) {
                if (this._htRowList[this._aSelectedRowKey[i]]) {
                    this._htRowList[this._aSelectedRowKey[i]]["_rowState"] = "";
                }
            }

            this._aSelectedRowKey = [];
            this.fireEvent("unselectAll");
        }
        this._setAllCheckState();
    },

    _setAllCheckState: function() {
        if (this.option("sSelectType") == "checkbox") {
            var elCheckBox = this._getElement("check_all_" + (this._nColumnFixIndex ? "inflexible" : "flexible"), true);
            var nRowCount = this.getRowCount();
            elCheckBox.disabled = nRowCount == this._aDisabledRowKey.length;

            if (nRowCount && this._aSelectedRowKey.length + this._aDisabledRowKey.length == nRowCount && this._aDisabledRowKey.length != nRowCount) {
                elCheckBox.checked = true;
                this._bAllItemChecked = true;
            } else {
                elCheckBox.checked = false;
                this._bAllItemChecked = false;
            }
        }
    },

    _checkAllItem: function() {
        var sKey = "",
            sKeyColumnName = this._getKeyColumnName();

        this._bAllItemChecked = !this._bAllItemChecked;
        if (this._bAllItemChecked) {
            var aElementList = this._getElement("data_" + (this._nColumnFixIndex ? "inflexible" : "flexible")).queryAll("._check_item");

            for (i = 0; i < this._aRowList.length; i++) {
                if (!this._checkRowState(this._aRowList[i]["rowKey"], ["CHECKED", "DISABLED", "DISABLED_SELECT"])) { // != "CHECKED" && this._aRowList[i]["_rowState"] != "DISABLED" && this._aRowList[i]["_rowState"] != "DISABLED_SELECT"){
                    this._aRowList[i]["_rowState"] = "CHECKED";
                    this._aSelectedRowKey.push(String(this._aRowList[i][sKeyColumnName]));
                }
            }
            for (var i = 0, nLen = aElementList.length; i < nLen; i++) {
                sKey = this._getRowElement(aElementList[i]).attr("key");
                if (this._checkRowState(sKey, ["CHECKED"])) {
                    this._selectRow(aElementList[i], true);
                }
            }
            this.fireEvent("selectAll");
        } else {
            for (i = 0; i < this._aRowList.length; i++) {
                if (this._checkRowState(this._aRowList[i]["rowKey"], ["CHECKED"])) {
                    this._aRowList[i]["_rowState"] = "";
                }
            }
            this._unselectRow();
        }
    },




    /*************************************************************************************************************************************
     * 이벤트 핸들러
     *************************************************************************************************************************************/
    _onDoubleClick: function(weDblClick) {
        var welTarget = jindo.$Element(weDblClick.element);
        var welColumn = this._getColumnElement(weDblClick.element);
        var welRow = this._getRowElement(welColumn);
        var sKey = welRow ? welRow.attr("key") : "";
        var sColumnName = welColumn ? welColumn.attr("columnName") : "";
        var htRow = this.getRow(sKey);
        var sSelectType = this.option("sSelectType");

        if (this._checkRowState(sKey, ["DISABLED", "DISABLED_SELECT"])) {
            weDblClick.stop();
            return false;
        }

        var bResult = this.fireEvent("dblclick", {
            "rowKey": sKey,
            "rowData": htRow,
            "rowElement": welRow,
            "columnElement": welColumn,
            "columnName": sColumnName,
            "columnData": this.getColumn(sKey, sColumnName),
            "element": welTarget
        });

        if (!bResult) {
            weDblClick.stop();
            return false;
        }

        if (welTarget.hasClass("_resize_handle")) {
            this._resetColumnWidth();
        }
    },

    _onClick: function(weClick) {
        var welTarget = jindo.$Element(weClick.element);
        var sTagName = weClick.element.tagName.toLowerCase();
        var sInputType = "";
        var welColumn = this._getColumnElement(weClick.element);
        var welRow = this._getRowElement(welColumn);
        var sKey = welRow ? welRow.attr("key") : "";
        var sColumnName = welColumn ? welColumn.attr("columnName") : "";
        var htRow = this.getRow(sKey);
        var sSelectType = this.option("sSelectType");

        if (this._checkRowState(sKey, ["DISABLED", "DISABLED_SELECT"])) {
            weClick.stop();
            return false;
        }

        var bResult = this.fireEvent("click", {
            "rowKey": sKey,
            "rowData": htRow,
            "rowElement": welRow,
            "columnElement": welColumn,
            "columnName": sColumnName,
            "columnData": htRow[sColumnName],
            "element": welTarget,
            "instance": this
        });

        if (!bResult) {
            weClick.stop();
            return false;
        }

        if (welTarget.hasClass("_check_all")) {
            this._checkAllItem();
        } else if (welTarget.hasClass("_check_item")) {
            if (weClick.element.checked) {
                this._selectRow(welRow);
            } else {
                this._unselectRow(welRow);
            }
        } else if (welTarget.hasClass("_radio_item")) {
            this._unselectRow();
            this._selectRow(welRow);
        } else if (welRow) {
            if (sColumnName) {
                var htColumnModel = this._getColumnModelData(sColumnName);
                if (bResult && htColumnModel["sEditType"] == "textbox" && (!htColumnModel["htEditOption"] || (htColumnModel["htEditOption"] && !htColumnModel["htEditOption"]["bFixed"]))) {
                    this._showEditingTextBox(sKey, sColumnName, welColumn);
                    return false;
                }
            }

            if (sTagName == "input" && (weClick.element.type == "checkbox" || weClick.element.type == "radio")) {
                var sNewValue = this.getColumn(sKey, sColumnName, true);
                var bChangeCallbackResult = true;
                if (this.getColumn(sKey, sColumnName) != sNewValue) {
                    bChangeCallbackResult = this._executeChangeCallback(sKey, sColumnName, sNewValue, welColumn);
                }

                if (bChangeCallbackResult === false) {
                    this.setColumn(sKey, sColumnName, this.getColumn(sKey, sColumnName));
                } else {
                    this._htRowList[sKey][sColumnName] = sNewValue;
                    this._executeChangeCallback(sKey, sColumnName, sNewValue, welColumn, true);
                }
            }

            if (!(sTagName == "input" || sTagName == "select" || sTagName == "option" || sTagName == "label" || sTagName == "a" || Boolean(welTarget.attr("disableSelect")))) {
                if (sSelectType == "checkbox" && this._checkRowState(sKey, ["CHECKED"])) {
                    this._unselectRow(welRow);
                } else if (sSelectType == "radiobox" || !sSelectType) {
                    this._unselectRow();
                    this._selectRow(welRow);
                } else {
                    this._selectRow(welRow);
                }
            }
        }
    },

    _startMouseDrag: function() {
        if (this._bIE8Under) {
            document.body.setCapture(false);
        }
        this._htEventData["mousemove"] = this._attachEventHandler(document, "mousemove", jindo.$Fn(this._onMouseMove, this).bind());
        this._htEventData["mouseup"] = this._attachEventHandler(document, "mouseup", jindo.$Fn(this._onMouseUp, this).bind());
        this._htEventData["prevent_select"] = this._attachEventHandler(document, "selectstart", function(weSelectStart) {
            weSelectStart.stop();
        });
        jindo.$Element(document.body).css("MozUserSelect", "none");
    },

    _stopMouseDrag: function() {
        if (this._bIE8Under) {
            document.body.releaseCapture(false);
        }
        this._detachEventHandler(this._htEventData["mousemove"]);
        this._detachEventHandler(this._htEventData["mouseup"]);
        this._detachEventHandler(this._htEventData["prevent_select"]);
        jindo.$Element(document.body).css("MozUserSelect", "");
    },

    _onMouseDown: function(weMouseDown) {
        var welTarget = jindo.$Element(weMouseDown.element);

        if (welTarget.hasClass("_resize_handle")) {
            this._startMouseDrag();
            this._onMouseDownForResizing(weMouseDown);
        } else if (this.option("bUseRowCopy") && this._getRowElement(weMouseDown.element) && welTarget.tag != "select" && welTarget.tag != "input" && welTarget.tag != "a") {
            this._startMouseDrag();
            this._onMouseDownForCopy(weMouseDown);
        }
    },

    _onMouseMove: function(weMouseMove) {
        if (this._sDragType == "column_resizing") {
            this._onMouseMoveForResizing(weMouseMove);
        } else if (this._sDragType == "row_selecting" && weMouseMove.element != document) {
            this._onMouseMoveForCopy(weMouseMove);
        }
    },

    _onMouseUp: function(weMouseUp) {
        if (this._sDragType == "column_resizing") {
            this._stopMouseDrag();
            this._onMouseUpForResizing(weMouseUp);
        } else if (this.option("bUseRowCopy") && this._sDragType == "row_selecting") {
            this._stopMouseDrag();
            if (this._getElement("selection_layer_flexible").visible()) {
                this._onMouseUpForCopy(weMouseUp);
            }
        }
        this._sDragType = "";
    },



    /*************************************************************************************************************************************
     * 컬럼 직접 수정 기능 관련
     *************************************************************************************************************************************/
    _showEditingTextBox: function(sKey, sColumnName, welColumn) {
        if (!this._welEditingTextBox || !this._welEditingTextBox.isChildOf(welColumn)) {
            var htColumnModel = this._getColumnModelData(sColumnName);
            var sValue = String(this.getColumn(sKey, sColumnName) || "");
            var sWidth = "100%";
            var sAlign = htColumnModel["sAlign"] || "";
            var sBeforeText = "",
                sAfterText = "";
            var nMaxLength = 255;
            this._welEditingColumn = welColumn;

            if (htColumnModel["htEditOption"]) {
                sWidth = htColumnModel["htEditOption"]["nWidth"] || sWidth;
                nMaxLength = htColumnModel["htEditOption"]["nMaxLength"] || nMaxLength;
                sBeforeText = htColumnModel["htEditOption"]["sBeforeText"] || "";
                sAfterText = htColumnModel["htEditOption"]["sAfterText"] || "";
            }

            if (!this._welEditingTextBox) {
                nmp.checkClass(["jindo.Timer", "jindo.WatchInput"]);
                this._welEditingTextBox = jindo.$Element("<input type='text'>");
                this._attachEventHandler(this._welEditingTextBox, "keydown", jindo.$Fn(this._onTextBoxKeyDown, this).bind());
                this._htInstance["watch_input"] = new jindo.WatchInput(this._welEditingTextBox.$value(), {
                    'nInterval': 10,
                    'bUseTimerOnIE': true
                }).attach({
                    "blur": jindo.$Fn(this._onTextBoxBlur, this).bind(),
                    "change": jindo.$Fn(this._onTextBoxChange, this).bind()
                });
            } else {
                this._htInstance["watch_input"].start();
            }
            jindo.$Element(welColumn.html(sBeforeText + "<span class='_tmp'></span>" + sAfterText).query("span._tmp")).replace(this._welEditingTextBox);

            this._welEditingTextBox.attr({
                "key": sKey,
                "columnName": sColumnName,
                "value": sValue,
                "maxLength": nMaxLength
            }).show().css({
                "width": (/\d{1,3}%/.test(sWidth) ? sWidth : sWidth + "px"),
                "textAlign": sAlign
            }).addClass("editing");
            this._setCursorToEnd(this._welEditingTextBox.$value());
        }
    },

    _hideEditingTextBox: function() {
        if (this._welEditingTextBox) {
            this._welEditingTextBox.hide().appendTo(this._getElement("root"));
            this._welEditingColumn = null;
            this._htInstance["watch_input"].stop();
        }
    },

    _executeChangeCallback: function(sKey, sColumnName, vValue, welColumn, bAfter) {
        if (sKey && sColumnName) {
            var htEditOption = this._getColumnModelData(sColumnName, "htEditOption");
            if (htEditOption) {
                var fChangeCallback = htEditOption[bAfter ? "fChangeAfterCallback" : "fChangeCallback"];
                if (typeof(fChangeCallback) == "function") {
                    return fChangeCallback({
                        "rowKey": sKey,
                        "columnName": sColumnName,
                        "columnData": vValue,
                        "columnElement": welColumn,
                        "gridInstance": this
                    });
                }
            }
        }
        return true;
    },

    _onSelectBoxChange: function(weChange) {
        var welColumn = this._getColumnElement(weChange.element);
        var welRow = this._getRowElement(welColumn);
        var sKey = welRow ? welRow.attr("key") : "";
        var sColumnName = welColumn ? welColumn.attr("columnName") : "";
        var bResult = this._executeChangeCallback(sKey, sColumnName, weChange.element.value, welColumn);

        if (bResult === false) {
            this.setColumn(sKey, sColumnName, this._htRowList[sKey][sColumnName]);
        } else {
            this._htRowList[sKey][sColumnName] = weChange.element.value;
            this._executeChangeCallback(sKey, sColumnName, weChange.element.value, welColumn, true);
        }
    },

    _onTextBoxKeyDown: function(weKeyDown) {
        var welTarget = jindo.$Element(weKeyDown.element);
        var htKey = weKeyDown.key();
        var sKey = welTarget.attr("key");
        var sColumnName = welTarget.attr("columnName");
        var sValue = welTarget.attr("value");
        var sOldValue = this.getColumn(sKey, sColumnName);

        if (htKey.enter) {
            if (sValue != sOldValue) {
                this._bTextBoxKeyDown = true;
                var bResult = this._executeChangeCallback(sKey, sColumnName, sValue, welTarget.parent());
                if (bResult !== false) {
                    this.setColumn(sKey, sColumnName, sValue);
                    this._executeChangeCallback(sKey, sColumnName, sValue, welTarget.parent(), true);
                } else {
                    this.setColumn(sKey, sColumnName, sOldValue);
                }
                this._bTextBoxKeyDown = false;
            } else {
                this.setColumn(sKey, sColumnName, sValue);
            }
            this._hideEditingTextBox();
        } else if (htKey.esc) {
            this.setColumn(sKey, sColumnName, this.getColumn(sKey, sColumnName));
            this._hideEditingTextBox();
        }
    },

    _onTextBoxFocus: function(weFocus) {
        var welColumn = this._getColumnElement(weFocus.element);
        var welRow = this._getRowElement(welColumn);
        var sKey = welRow ? welRow.attr("key") : "";
        var sColumnName = welColumn ? welColumn.attr("columnName") : "";

        if (welColumn) {
            var htColumnModel = this._getColumnModelData(sColumnName);
            if (htColumnModel["sEditType"] == "textbox" && htColumnModel["htEditOption"] && htColumnModel["htEditOption"]["bFixed"]) {
                this._showEditingTextBox(sKey, sColumnName, welColumn);
            }
        }
    },

    _onTextBoxBlur: function(weBlur) {
        if (this._bChangeText === false && this._bTextBoxKeyDown === false) {
            var welTarget = this._welEditingTextBox;
            var sKey = welTarget.attr("key");
            var sColumnName = welTarget.attr("columnName");
            var sOldValue = this.getColumn(sKey, sColumnName);
            var sValue = welTarget.attr("value");
            var bResult = true;

            if (sOldValue != sValue) {
                bResult = this._executeChangeCallback(sKey, sColumnName, sValue, welTarget.parent());
                if (bResult !== false) {
                    this.setColumn(sKey, sColumnName, sValue);
                    this._executeChangeCallback(sKey, sColumnName, sValue, welTarget.parent(), true);
                } else {
                    this.setColumn(sKey, sColumnName, sOldValue);
                }
            } else {
                this.setColumn(sKey, sColumnName, sOldValue);
            }
            this._hideEditingTextBox();
        }
    },

    _onTextBoxChange: function(weChange) {
        var welTarget = jindo.$Element(this._welEditingTextBox);
        var htColumnModel = this._getColumnModelData(welTarget.attr("columnName"));

        if (htColumnModel["htEditOption"] && htColumnModel["htEditOption"]["rxCheckPattern"]) {
            var sOldValue = this._welEditingTextBox.attr("value");
            var aMatches = sOldValue.match(htColumnModel["htEditOption"]["rxCheckPattern"]);
            var sNewValue = (aMatches) ? aMatches.join("") : "";

            if (sOldValue != sNewValue) {
                this._bChangeText = true;
                this._welEditingTextBox.$value().blur();
                jindo.$Fn(function() {
                    this._htInstance["watch_input"].setInputValue(sNewValue);
                    this._welEditingTextBox.$value().focus();
                    this._bChangeText = false;
                }, this).delay(0.001);
            }
        }
    },




    /*************************************************************************************************************************************
     * 컬럼 넓이 변경 기능 관련
     *************************************************************************************************************************************/

    _onMouseDownForResizing: function(weMouseDown) {
        var welTarget = jindo.$Element(weMouseDown.element);
        var sGridType = welTarget.attr("gridType");
        var nColumnIndex = welTarget.attr("columnIndex");
        var sColumnName = welTarget.attr("columnName");
        var nColumnWidth = parseInt(this._htColElementList["header_" + sGridType][nColumnIndex].style.width, 10); //$Element(aHeaderColumnList[nColumnIndex]).width();
        var welResizeHandleContainer = this._getElement("resize_handle_container_" + sGridType);
        var nMinimumWidth = this.option("nDefaultColumnWidth"),
            nAnotherWidth = 0;
        this._getElement("root").css("cursor", "col-resize");
        this._sDragType = "column_resizing";

        if (sColumnName == "_checkbox" || sColumnName == "_radiobox") {
            nMinimumWidth = 50;
        } else if (sColumnName == "_number") {
            nMinimumWidth = 60;
        }

        if (sGridType == "inflexible") {
            for (var i = 0; i < this._nColumnFixIndex; i++) {
                if (!this._aColumnModel[i]["bHidden"] && this._aColumnModel[i]["sColumnName"] != sColumnName) {
                    nAnotherWidth = nAnotherWidth + this._aColumnModel[i]["nAssignWidth"];
                }
            }
        }

        this._htColumnResizeData = {
            "container": welResizeHandleContainer,
            "resize_handle": welTarget,
            "grid_type": sGridType,
            "column_index": nColumnIndex,
            "column_width": nColumnWidth,
            "column_name": sColumnName,
            "initial_left": weMouseDown.pos().pageX,
            "initial_left2": welResizeHandleContainer.offset().left,
            "header_column": jindo.$Element(this._htColElementList["header_" + sGridType][nColumnIndex]),
            "data_column": jindo.$Element(this._htColElementList["body_" + sGridType][nColumnIndex]),
            "minimum_width": nMinimumWidth,
            "maximum_width": Math.floor(Math.max(this._htLayoutData["width"] * 0.8, this._htLayoutData["inflexible_width"])),
            "resized_width": nColumnWidth,
            "another_width": nAnotherWidth,
            "table_width": this._getElement("data_table_" + sGridType).width() - 3,
            "isChrome": jindo.$Agent().navigator().chrome
        };
    },

    _onMouseMoveForResizing: function(weMouseMove) {
        var nPageX = weMouseMove.pos().pageX;
        var nWidth = Math.min(Math.max(this._htColumnResizeData["column_width"] + nPageX - this._htColumnResizeData["initial_left"], this._htColumnResizeData["minimum_width"]), this._htColumnResizeData["maximum_width"]);

        if (this._htColumnResizeData["grid_type"] == "inflexible") {
            // TODO nColumnFixIndex 계산하여 사용하도록 수정(bHidden 관련)
            var nInflexibleGridWidth = Math.min(this._htColumnResizeData["another_width"] + nWidth + this._nColumnFixIndex, this._htColumnResizeData["maximum_width"]);
            if (nInflexibleGridWidth >= this._htColumnResizeData["maximum_width"]) {
                return false;
            } else {
                this._setInflexibleGridWidth(nInflexibleGridWidth);
            }
        } else {
            if (this._htColumnResizeData["isChrome"]) {
                this._refreshBodyTableScrollPosition();
            } else {
                this._refreshHeaderTableScrollPosition();
            }
        }

        this._htColumnResizeData["resize_handle"].css("left", Math.min(this._htColumnResizeData["table_width"], nPageX - this._htColumnResizeData["initial_left2"]) + "px");
        this._htColumnResizeData["header_column"].css("width", nWidth + "px");
        this._htColumnResizeData["data_column"].attr("style", "width:" + nWidth + "px;*width:" + (nWidth - this._nHorizontalPadding) + "px;");
        this._htColumnResizeData["resized_width"] = nWidth;

    },

    _onMouseUpForResizing: function(weMouseUp) {
        this._getElement("root").css("cursor", "default");
        var bInflexible = this._htColumnResizeData["grid_type"] == "inflexible";

        // 변경된 넓이 정보를 컬럼 모델에 설정한다.
        // TODO setColumnModelData 함수를 통해 값을 설정하도록 수정 (생성 필요)
        for (var i = 0, aColumnModel = this._aColumnModel; i < aColumnModel.length; i++) {
            if (aColumnModel[i]["sColumnName"] == this._htColumnResizeData["column_name"]) {
                aColumnModel[i]["nAssignWidth"] = this._htColumnResizeData["resized_width"];
                break;
            }
        }

        // 리사이징 완료 후에, 리사이징바의 위치를 조정한다.
        this._refreshColumnResizingBarPosition();

        // 설정 저장 기능을 사용하는 경우, 변경된 넓이 정보를 저장한다.
        if (this.option("htConfigurator") && this.option("htConfigurator")["bUse"]) {
            this._htInstance["configurator"].setColumnModel(aColumnModel);
        }
    },

    _refreshColumnResizingBarPosition: function() {
        jindo.$Fn(function() {
            var aInflexibleResizeHandleList = this._getElementList("resize_handle_list_inflexible", true);
            var aFlexibleResizeHandleList = this._getElementList("resize_handle_list_flexible", true);
            var aResizeHandleList = aInflexibleResizeHandleList.concat(aFlexibleResizeHandleList);
            var bUseColumnResizing = this.option("bUseColumnResizing");
            var nTotalWidth = 0;

            for (var i = 0, j = 0; i < this._aColumnModel.length; i++) {
                nTotalWidth = this._nColumnFixIndex == i ? 0 : nTotalWidth;
                if (!this._aColumnModel[i]["bHidden"]) {
                    nWidth = jindo.$Element(this._getElement("header_" + this._aColumnModel[i]["sGridType"]).query("th[columnName=" + this._aColumnModel[i]["sColumnName"] + "]")).width();
                    this._aColumnModel[i]["nRealWidth"] = nWidth;
                    if (bUseColumnResizing) {
                        nTotalWidth += nWidth + 1;
                        jindo.$Element(aResizeHandleList[j]).css("left", (nTotalWidth - 3) + "px");
                    }
                    j++;
                }
            }
        }, this).delay(0);
    },

    _resetColumnWidth: function() {
        this._calculateColumnWidth();
        this._calculateAreaWidth();
        this._refreshColumnWidth();
        this._setInflexibleGridWidth();
        this._refreshColumnResizingBarPosition();

        if (this.option("htConfigurator") && this.option("htConfigurator")["bUse"]) {
            this._htInstance["configurator"].setColumnModel(this._aOriginalColumnModel);
        }
    },

    _setInflexibleGridWidth: function(nWidth) {
        if (this._nColumnFixIndex) {
            var nBeforeInflexibleWidth = this._htLayoutData["inflexible_width"];
            if (nWidth) {
                this._htLayoutData["inflexible_width"] = nWidth;
                this._htLayoutData["flexible_width"] = this._htLayoutData["width"] - nWidth;
            }

            if (!nWidth || (nWidth && nBeforeInflexibleWidth != nWidth)) {
                this._getElement("area_inflexible").width(this._htLayoutData["inflexible_width"]);
                this._getElement("area_flexible").css("marginLeft", this._htLayoutData["inflexible_width"] + "px");
            }
        }
    },

    _refreshHeaderTableScrollPosition: function(elTarget) {
        this._getElement("header_flexible", true).scrollLeft = elTarget ? elTarget.scrollLeft : this._getElement("data_flexible", true).scrollLeft;
    },

    _refreshBodyTableScrollPosition: function() {
        this._getElement("data_flexible", true).scrollLeft = this._getElement("header_flexible", true).scrollLeft;
    },

    /*************************************************************************************************************************************
     * 그리드 행 복사 기능 관련
     *************************************************************************************************************************************/

    _onMouseDownForCopy: function(weMouseDown) {
        var nRowHeight = this.option("nRowHeight") + 1;
        var htPos = weMouseDown.pos();
        var elRow = this._getRowElement(weMouseDown.element).$value();
        this._sDragType = "row_selecting";
        this._htEventData["blur_clipboard"] = this._attachEventHandler(this._getElement("clipboard"), "blur", jindo.$Fn(this._onBlurClipboard, this).bind());
        this._htSelectionData = {};
        this._htSelectionData["start_step"] = this._nStep;
        this._htSelectionData["initial_index"] = this._nStep * this.option("nDisplayCount") + Math.floor(elRow.offsetTop / nRowHeight);
        this._htSelectionData["limit_top"] = this._getElement("data_flexible").offset().top;
        this._htSelectionData["limit_bottom"] = this._htSelectionData["limit_top"] + this._getElement("data_flexible").height() - this._htLayoutData["horizontal_scrollbar_height"];
        this._htSelectionData["pageX"] = htPos.pageX;
        this._htSelectionData["pageY"] = htPos.pageY;
        this._htSelectionData["max_index"] = this.getRowCount() - 1;
        var nTop = this._htSelectionData["initial_index"] * nRowHeight;
        if (this._nColumnFixIndex) {
            this._getElement("selection_layer_inflexible").width(this._htLayoutData["inflexible_width"] - 5);
        }
        this._getElement("selection_layer_flexible").width(this._getElement("data_table_flexible").width() - 4);

    },

    _onMouseMoveForCopy: function(weMouseMove) {
        var nLayerY = 0;
        var htPos = weMouseMove.pos();
        if (jindo.$Element(weMouseMove.element).hasClass("selection_layer")) {
            nLayerY = htPos.layerY + weMouseMove.element.offsetTop - (this._nStep * (this.option("nRowHeight") + 1) * this.option("nDisplayCount"));
            //console.log("a", nLayerY, weMouseMove.pos().layerY, weMouseMove.$value().layerY, weMouseMove.element.offsetTop, weMouseMove.element.style.height)
        } else {
            nLayerY = weMouseMove.element.offsetTop;
            //console.log("b", nLayerY)
        }
        this._nBeforePageY = htPos.pageY;
        this._nBeforeRowIndex = Math.min(this._htSelectionData["max_index"], Math.floor(nLayerY / (this.option("nRowHeight") + 1)));

        if (!this._htSelectionData["start_index"] && !this._htSelectionData["end_index"] && this._nSetIntervalId < 0 && (Math.abs(this._htSelectionData["pageY"] - htPos.pageY) > 5 || Math.abs(this._htSelectionData["pageX"] - htPos.pageX) > 5)) {
            this._setSelectionLayer();
            this._nSetIntervalId = setInterval(jindo.$Fn(this._setSelectionLayer, this).bind(), 50);
        }
    },

    _onMouseUpForCopy: function(weMouseUp) {
        clearInterval(this._nSetIntervalId);
        var aResult = [];
        var sKeyColumnName = this._getKeyColumnName();
        for (var i = this._htSelectionData["start_index"]; i <= this._htSelectionData["end_index"]; i++) {
            aResult.push(this._getTextRowData(this._aRowList[i][sKeyColumnName]));
        }
        this._getElement("clipboard", true).value = aResult.join("\r\n");
        this._getElement("clipboard", true).select();
        this._nSetIntervalId = -1;
        this._nBeforeRowIndex = -1;
        this._nBeforePageY = -1;
    },

    _onBlurClipboard: function() {
        this._detachEventHandler(this._htEventData["blur_clipboard"]);
        if (this._nColumnFixIndex) {
            this._getElement("selection_layer_inflexible").hide();
        }
        this._getElement("selection_layer_flexible").hide();
        this._getElement("clipboard", true).value = "";
    },

    _getTextRowData: function(sKey) {
        var aResult = [];
        var sColumnName = "";
        var htRow = this.getRow(sKey);
        for (var i = 0, aList = this._aColumnModel; i < aList.length; i++) {
            sColumnName = aList[i]["sColumnName"];
            if (!jindo.$A(["_checkbox", "_radiobox", "_index", "_className", "_rowState"]).has(sColumnName) && !aList[i]["bHidden"]) {
                sColumnValue = htRow[sColumnName] || "";
                if (aList[i]["fFormater"]) {
                    sColumnValue = jindo.$S(aList[i]["fFormater"](sColumnValue, htRow, nmp.utility.cloningObject(aList[i]))).stripTags().$value();
                    sColumnValue = sColumnValue == "DISABLED" ? "" : sColumnValue;
                }

                if (aList[i]["sEditType"] == "selectbox" || aList[i]["sEditType"] == "radiobox") {
                    for (var j = 0, aOptionList = aList[i]["htEditOption"]["aList"]; j < aOptionList.length; j++) {
                        if (aOptionList[j]["value"] == sColumnValue) {
                            sColumnValue = aOptionList[j]["text"];
                            break;
                        }
                    }
                } else if (aList[i]["sEditType"] == "checkbox") {
                    var waColumnValue = jindo.$A(sColumnValue.split(","));
                    var waResult = [];
                    for (var j = 0, aOptionList = aList[i]["htEditOption"]["aList"]; j < aOptionList.length; j++) {
                        if (waColumnValue.has(aOptionList[j]["value"])) {
                            waResult.push(aOptionList[j]["text"]);
                        }
                    }
                    sColumnValue = waResult.join(",");
                }
                aResult.push(sColumnValue);
            }
        }
        return aResult.join("	");
    },

    _setSelectionLayer: function() {
        if (this._nBeforeRowIndex >= 0 && this._nBeforePageY > 0) {
            var nDisplayCount = this.option("nDisplayCount");
            var nRowHeight = this.option("nRowHeight") + 1;
            var nStartIndex = this._htSelectionData["initial_index"];
            var nEndIndex = this._nBeforeRowIndex == nStartIndex ? nStartIndex : this._nStep * nDisplayCount + this._nBeforeRowIndex;

            var nScrollTop = this._getElement("data_flexible", true).scrollTop;
            if (this._nBeforePageY && this._nBeforePageY < this._htSelectionData["limit_top"]) {
                this._getElement("data_flexible", true).scrollTop = nScrollTop - nRowHeight;
                nStartIndex = Math.max(Math.floor((nScrollTop) / nRowHeight) - 1, 0);
                nEndIndex = this._htSelectionData["initial_index"];
            } else if (this._nBeforePageY > this._htSelectionData["limit_bottom"]) {
                this._getElement("data_flexible", true).scrollTop = nScrollTop + nRowHeight;
                nStartIndex = this._htSelectionData["initial_index"];
                nEndIndex = Math.min(Math.floor((nScrollTop + this._htLayoutData["data_height"]) / nRowHeight) + 1, this.getRowCount() - 1);
            } else if (nStartIndex > nEndIndex) {
                nStartIndex = nEndIndex;
                nEndIndex = this._htSelectionData["initial_index"];
            }

            var nTop = nStartIndex * nRowHeight;
            var nHeight = (nEndIndex - nStartIndex + 1) * nRowHeight + 1;
            this._htSelectionData["start_index"] = nStartIndex;
            this._htSelectionData["end_index"] = nEndIndex;
            this._getElement("selection_layer_inflexible").show().css("top", nTop + "px").height(nHeight);
            this._getElement("selection_layer_flexible").show().css("top", nTop + "px").height(nHeight);
        }
    },




    /*************************************************************************************************************************************
     * 그리드 크기 변경 관련
     *************************************************************************************************************************************/
    setGridWidth: function(nWidth, bImmediate) {
        clearTimeout(this._nSetTimeoutId);
        var wfCallback = jindo.$Fn(function() {
            if (nWidth) {
                this._htDefaultOption["nWidth"] = nWidth;
                nWidth = Math.max(nWidth, this._nMinimumWidth);
                this._getElement("root").css("width", nWidth + "px");
            } else {
                nWidth = this._getElement("root").width();
            }

            if (nWidth > 0) {
                this._htLayoutData["width"] = nWidth;
                this._calculateColumnWidth();
                this._calculateAreaWidth();
                this._refreshColumnWidth();
                this._setInflexibleGridWidth();
                this._refreshColumnResizingBarPosition();
            }
        }, this).bind();

        if (bImmediate) {
            wfCallback();
        } else {
            this._nSetTimeoutId = setTimeout(wfCallback, 100);
        }
    },

    setGridHeight: function(nHeight, bImmediate) {
        clearTimeout(this._nSetTimeoutId2);
        var wfCallback = jindo.$Fn(function() {
            if (nHeight) {
                this._htDefaultOption["nHeight"] = nHeight;
                nHeight = Math.max(nHeight - 1, this._nMinimumHeight);
                this._getElement("root").css("height", nHeight + "px");
            } else {
                nHeight = Math.max(this._getElement("root").height() - 1, this._nMinimumHeight);
            }

            this._htLayoutData["height"] = nHeight;
            this._htLayoutData["data_height"] = nHeight - this._htLayoutData["real_header_height"];
            if (this._nColumnFixIndex) {
                this._getElement("data_inflexible").height(this._htLayoutData["data_height"]);
            }
            this._getElement("data_flexible").height(this._htLayoutData["data_height"]);
            if (this._getElement("no_row_layer").visible()) {
                this._getElement("no_row_layer").height() == 0 ? this._htLayoutData["data_height"] - 52 : this._htLayoutData["data_height"]
            }
            if (this._getElement("loading_layer").visible()) {
                this._getElement("loading_layer").height(this._htLayoutData["data_height"]);
            }
            this._setVirtualScrollBar();
        }, this).bind();

        if (bImmediate) {
            wfCallback();
        } else {
            this._nSetTimeoutId2 = setTimeout(wfCallback, 100);
        }
    },




    /*************************************************************************************************************************************
     * 외부 인터페이스
     *************************************************************************************************************************************/

    setColumnFixIndex: function(nIndex) {
        nIndex = Number(nIndex);
        if (nIndex > -1) {
            if (this._nColumnFixIndex) {
                if (this.option("bUseAutoNumbering")) {
                    nIndex += 1;
                }
                if (this.option("sSelectType") == "checkbox" || this.option("sSelectType") == "radiobox") {
                    nIndex += 1;
                }
            }

            for (var i = 0; i < this._aColumnModel.length; i++) {
                if (this._aColumnModel[i]["bHidden"] && i < nIndex) {
                    nIndex += 1;
                }

                if (i < nIndex) {
                    this._aColumnModel[i]["sGridType"] = "inflexible";
                    this._aColumnModel[i]["bInflexible"] = true;
                } else {
                    this._aColumnModel[i]["sGridType"] = "flexible";
                    this._aColumnModel[i]["bInflexible"] = false;
                }
            }

            this._nColumnFixIndex = nIndex;
            this._setLayoutData();
            this._drawGridLayout();
            this._render();
        }
    },

    reDraw: function(aColumnModel, aRowList, bFlatten) {
        this._resetElement();
        this._setColumnModel(aColumnModel, true);
        this._aOriginalColumnModel = nmp.utility.cloningObject(aColumnModel);
        this._setLayoutData();
        this._drawGridLayout();
        this.setRowList(aRowList, bFlatten);
    },

    getSelectedRowKeyList: function(bJsonString) {
        return bJsonString ? jindo.$Json(this._aSelectedRowKey).toString() : this._aSelectedRowKey;
    },

    getSelectedRowList: function(bJsonString) {
        var aResult = [];
        for (var i = 0; i < this._aSelectedRowKey.length; i++) {
            aResult.push(this.getRow(this._aSelectedRowKey[i]));
        }
        return bJsonString ? jindo.$Json(aResult).toString() : aResult;
    },

    /**
     * 현재 그리드에 설정된 전체 데이터의 개수를 리턴한다.
     *
     * @returns {Number} 데이터 개수
     */
    getRowCount: function() {
        return this._aRowList.length || 0;
    },

    /**
     * 현재 그리드에 설정된 전체 데이터를 리턴한다.
     *
     * @param bJsonString {Boolean} 결과값을 JSON 문자열로 리턴할지 여부
     * @returns {Array||String} 전체 데이터 배열 및 전체 데이터 배열을 변환한 JSON 문자열
     */
    getRowList: function(bJsonString) {
        var aResult = [];
        var sKeyColumnName = this._getKeyColumnName();
        for (var i = 0, aList = this._aRowList; i < aList.length; i++) {
            aResult.push(this.getRow(aList[i][sKeyColumnName]));
        }
        return bJsonString ? jindo.$Json(aResult).toString() : aResult;
    },

    getColumnList: function(sColumnName, bJsonString) {
        var aResult = [];
        var sKeyColumnName = this._getKeyColumnName();
        for (var i = 0, aList = this._aRowList; i < aList.length; i++) {
            aResult.push(this.getColumn(aList[i][sKeyColumnName], sColumnName));
        }
        return bJsonString ? jindo.$Json(aResult).toString() : aResult;
    },

    setColumnList: function(sColumnName, vValue) {
        if (sColumnName) {
            for (var i = 0, aList = this._aRowList; i < aList.length; i++) {
                aList[i][sColumnName] = vValue;
            }
            this._render();
        }
    },

    getRowByIndex: function(nIndex, bJsonString) {
        if (nIndex > -1 && nIndex < this.getRowCount()) {
            var sKeyColumnName = this._getKeyColumnName();
            var sKey = this._aRowList[nIndex][sKeyColumnName] || "";
            return this.getRow(sKey, bJsonString);
        } else {
            return bJsonString ? "{}" : {};
        }
    },

    _setData: function(aRowList, bFlatten) {
        var sKeyColumnName = this._getKeyColumnName();
        var htRow = {},
            sKey = "";
        var sSelectType = this.option("sSelectType");
        for (var i = 0, nLen = aRowList.length; i < nLen; i++) {
            htRow = aRowList[i] = bFlatten ? nmp.utility.toFlatten(aRowList[i]) : aRowList[i];
            htRow["_index"] = String(i);
            htRow["_number"] = i + 1;
            sKey = String(htRow[sKeyColumnName]);
            htRow["rowKey"] = sKey;
            this._htRowList[sKey] = htRow;

            if (htRow["_rowState"] == "CHECKED") {
                this._aSelectedRowKey.push(sKey);
            } else if (htRow["_rowState"] == "DISABLED" || htRow["_rowState"] == "DISABLED_SELECT") {
                this._aDisabledRowKey.push(sKey);
            }
        }
        this._nLastIndex = i - 1;
        this._aRowList = aRowList;
    },

    setRowList: function(aRowList, bFlatten) {
        this._resetVariable();
        if (aRowList && aRowList.length) {
            this._setData(aRowList, bFlatten);
            this._render(true);
            this.refreshOriginalData();
            this.fireEvent("changeRowCount");
        } else {
            this.clear();
        }
    },

    replaceRowList: function(aRowList, bFlatten) {
        this._resetVariable();
        if (aRowList && aRowList.length) {
            this._setData(aRowList, bFlatten);
            this._render(true);
            this.fireEvent("changeRowCount");
        } else {
            this.clear();
        }
    },

    updateRowList: function(aRowList, bFlatten, bSetOriginalData, sColumnDataType) {
        if (aRowList && aRowList.length) {
            var sKeyColumnName = this._getKeyColumnName();
            var htRow = {},
                sKey = "",
                sColumnName;
            var aColumnModel = this._aColumnModel;

            for (var i = 0, nLen = aRowList.length; i < nLen; i++) {
                sKey = String(aRowList[i][sKeyColumnName]);
                if (this._htRowList[sKey]) {
                    htRow = bFlatten ? nmp.utility.toFlatten(aRowList[i]) : aRowList[i];

                    if (this._htRowList[sKey]["_rowState"] != htRow["_rowState"]) {
                        if (this._htRowList[sKey]["_rowState"] == "CHECKED") {
                            this._aSelectedRowKey = jindo.$A(this._aSelectedRowKey).refuse(sKey).$value();
                        } else if (this._htRowList[sKey]["_rowState"] == "DISABLED" || this._htRowList[sKey]["_rowState"] == "DISABLED_SELECT") {
                            this._aDisabledRowKey = jindo.$A(this._aDisabledRowKey).refuse(sKey).$value();
                        }

                        if (htRow["_rowState"] == "CHECKED") {
                            this._aSelectedRowKey.push(sKey);
                        } else if (htRow["_rowState"] == "DISABLED" || htRow["_rowState"] == "DISABLED_SELECT") {
                            this._aDisabledRowKey.push(sKey);
                        }
                    }

                    if (sColumnDataType == "column_model") {
                        for (var j = 0; j < aColumnModel.length; j++) {
                            sColumnName = aColumnModel[j]["sColumnName"];
                            this._htRowList[sKey][sColumnName] = htRow[sColumnName];
                            if (bSetOriginalData) {
                                this._htOriginalRowList[sKey][sColumnName] = htRow[sColumnName];
                            }
                        }
                    } else {
                        for (sColumnName in htRow) {
                            this._htRowList[sKey][sColumnName] = htRow[sColumnName];
                            if (bSetOriginalData) {
                                this._htOriginalRowList[sKey][sColumnName] = htRow[sColumnName];
                            }
                        }
                    }
                }
            }
            this._render(true);
        }
    },

    _checkRowState: function(sKey, aState) {
        if (sKey && this._htRowList[sKey] && aState) {
            for (var i = 0; i < aState.length; i++) {
                if (aState[i] == this._htRowList[sKey]["_rowState"]) {
                    return true;
                }
            }
        }
    },

    disableRow: function(sRowKey) {
        if (sRowKey && this._htRowList[sRowKey]) {
            this._htRowList[sRowKey]["_rowState"] = "DISABLED";
            this._aDisabledRowKey.push(sRowKey);
            this._getRowElementByKey(sRowKey).addClass("disabled");
            var aInputList = this._getRowElementByKey(sRowKey).queryAll("input[disabled=false], select[disabled=false]");
            if (this.option("nColumnFixIndex")) {
                this._getRowElementByKey(sRowKey, true).addClass("disabled");
                aInputList = aInputList.concat(this._getRowElementByKey(sRowKey, true).queryAll("input[disabled=false], select[disabled=false]"));
            }

            for (var i = 0; i < aInputList.length; i++) {
                jindo.$Element(aInputList[i]).attr("disabled", true).attr("disabledByAPI", true);
            }
        }
    },

    enableRow: function(sRowKey) {
        if (sRowKey && this._htRowList[sRowKey]) {
            this._htRowList[sRowKey]["_rowState"] = "";
            this._aDisabledRowKey = jindo.$A(this._aDisabledRowKey).refuse(sRowKey).$value();
            this._getRowElementByKey(sRowKey).removeClass("disabled");
            var aInputList = this._getRowElementByKey(sRowKey).queryAll("input, select");
            if (this.option("nColumnFixIndex")) {
                this._getRowElementByKey(sRowKey, true).removeClass("disabled");
                aInputList = aInputList.concat(this._getRowElementByKey(sRowKey, true).queryAll("input, select"));
            }

            for (var i = 0; i < aInputList.length; i++) {
                if (jindo.$Element(aInputList[i]).attr("disabledByAPI")) {
                    jindo.$Element(aInputList[i]).attr("disabled", false).attr("disabledByAPI", false);
                }
            }
        }
    },

    /*
    disableColumn : function(sRowKey, sColumnName){
    	if(sRowKey && sColumnName){
    		var welColumn = this.getColumnElement(sRowKey, sColumnName);

    		if(welColumn){
    			var htColumnModel = this._getColumnModelData(sColumnName);

    			if(htColumnModel && htColumnModel["sEditType"]){
    				$ElementList(welColumn.queryAll("select, input, button")).attr("disabled", true);
    			}
    			this._htDisabledColumn[sRowKey + "_" + sColumnName] = true;
    		}
    	}
    },

    enableColumn : function(sRowKey, sColumnName){
    	if(sRowKey && sColumnName){
    		var welColumn = this.getColumnElement(sRowKey, sColumnName);

    		if(welColumn){
    			var htColumnModel = this._getColumnModelData(sColumnName);

    			if(htColumnModel && htColumnModel["sEditType"]){
    				$ElementList(welColumn.queryAll("select, input, button")).attr("disabled", false);
    			}
    			delete this._htDisabledColumn[sRowKey + "_" + sColumnName];
    		}
    	}
    },
    */

    refreshOriginalData: function() {
        var sKeyColumnName = this._getKeyColumnName();
        var htRow = {};
        var aRowList = this._aRowList;
        var nCount = aRowList.length;
        this._aOriginalRowList = [];
        this._htOriginalRowList = {};
        for (i = 0; i < nCount; i++) {
            sKey = String(aRowList[i][sKeyColumnName]);
            htResult = {};
            for (var x in aRowList[i]) {
                if (x != "_index" && x != "_number" && x != "_className" && x != "_checkbox" && x != "_radiobox" && x != "_rowState") {
                    htResult[x] = aRowList[i][x];
                }
            }
            //htRow = this._cloneObject(aRowList[i]);
            this._htOriginalRowList[sKey] = htResult;
            this._aOriginalRowList.push(htResult);
        }
    },

    getRow: function(sKey, bJsonString) {
        var htResult = {},
            sColumnName = "";

        if (sKey && this.isRowExist(sKey)) {
            htResult["rowKey"] = String(sKey);
            for (var i = 0, aList = this._aColumnModel; i < aList.length; i++) {
                sColumnName = this._aColumnModel[i]["sColumnName"];
                if (!jindo.$A(["_checkbox", "_radiobox", "_number", "_index", "_className"]).has(sColumnName)) {
                    htResult[sColumnName] = this.getColumn(sKey, sColumnName);
                }
            }
        }

        return bJsonString ? jindo.$Json(htResult).toString() : htResult;
    },

    /**
     * sKey에 해당하는 행의 데이터를 htData로 교체하고 화면 상에 반영한다.
     *
     * @param sKey {String}
     * @param htData {HashTable}
     */
    setRow: function(sKey, htData) {
        if (sKey && htData) {
            var sColumnName = "";
            var sKeyColumnName = this._getKeyColumnName();

            // 데이터를 먼저 설정한다.
            for (var i = 0; i < this._aColumnModel.length; i++) {
                sColumnName = this._aColumnModel[i]["sColumnName"];
                if (!jindo.$A(["_checkbox", "_radiobox", "_number", "_index", "_className", sKeyColumnName]).has(sColumnName)) {
                    this._htRowList[sKey][sColumnName] = htData[sColumnName];
                }
            }

            // 데이터 설정 후, 화면에 표시하기 위한 작업을 수행한다.
            for (var i = 0; i < this._aColumnModel.length; i++) {
                sColumnName = this._aColumnModel[i]["sColumnName"];
                if (!jindo.$A(["_checkbox", "_radiobox", "_number", "_index", "_className", sKeyColumnName]).has(sColumnName)) {
                    this.setColumn(sKey, sColumnName, htData[sColumnName], this._aColumnModel[i]);
                }
            }
        }
    },

    getColumn: function(sKey, sColumnName, bParse) {
        if (sKey && sColumnName && this._htRowList[sKey]) {
            var htColumnModel = this._getColumnModelData(sColumnName);
            var htEditOption = htColumnModel["htEditOption"]

            if (bParse && htEditOption && htEditOption["bFixed"]) {
                var welRow = this._getRowElementByKey(sKey);

                if (welRow) {
                    var sInputName = sColumnName + "_" + this._sUniqueKey + "_" + sKey;

                    if (this._nColumnFixIndex) {
                        for (var i = 0; i < this._aColumnModel.length; i++) {
                            if (this._aColumnModel[i]["sColumnName"] == sColumnName && i < this._nColumnFixIndex) {
                                welRow = this._getAnotherRowElement(welRow);
                                break;
                            }
                        }
                    }

                    switch (htColumnModel["sEditType"]) {
                        case "textbox":
                            vResult = welRow.query("input[type=text][name=" + sInputName + "]").value;
                            break;
                        case "selectbox":
                            vResult = welRow.query("select[name=" + sInputName + "]").value;
                            break;
                        case "checkbox":
                            var aInputList = welRow.queryAll("input[type=checkbox][name=" + sInputName + "][checked=true]");
                            var aTmpResult = [];
                            for (var i = 0; i < aInputList.length; i++) {
                                aTmpResult.push(aInputList[i].value);
                            }
                            vResult = aTmpResult.join(",");
                            break;
                        case "radiobox":
                            vResult = welRow.query("input[type=radio][name=" + sInputName + "][checked=true]").value;
                            break;
                    }
                }
            } else {
                vResult = this._htRowList[sKey][sColumnName];
            }

            switch (htColumnModel["sReturnType"]) {
                case "string":
                    vResult = String(vResult || "");
                    vResult = htColumnModel["bReturnTrim"] ? jindo.$S(vResult).trim().$value() : vResult;
                    break;
                case "number":
                    vResult = Number(vResult || 0) || 0;
                    break;
                case "boolean":
                    vResult = !jindo.$A(["", "false", "0", "undefined", "null"]).has(String(vResult));
                    break;
            }

            return vResult;
        }
    },

    setColumn: function(sKey, sColumnName, vValue, htColumnModel) {
        if (sKey && sColumnName && this._htRowList[sKey]) {
            this._htRowList[sKey][sColumnName] = vValue;
            htColumnModel = htColumnModel || this._getColumnModelData(sColumnName);
            var welRow = this._getRowElementByKey(sKey);

            if (!htColumnModel["bHidden"] && welRow) {
                var sKeyColumnName = this._getKeyColumnName();
                var htRow = this.getRow(sKey);
                var htEditOption = htColumnModel["htEditOption"];

                if (this._nColumnFixIndex) {
                    for (var i = 0; i < this._aColumnModel.length; i++) {
                        if (this._aColumnModel[i]["sColumnName"] == sColumnName && i < this._nColumnFixIndex) {
                            welRow = this._getRowElementByKey(sKey, true);
                            break;
                        }
                    }
                }
                var welColumn = jindo.$Element(welRow.query("> td[columnName=" + sColumnName + "]"));
                var sEventHandlerKey = sColumnName + "_" + this._sUniqueKey + "_" + sKey;

                if (htEditOption && htEditOption["bFixed"] && this._htEventData[sEventHandlerKey]) {
                    if (htColumnModel["sEditType"] == "textbox") {
                        this._detachEventHandler(this._htEventData[sEventHandlerKey]);
                    } else if (htColumnModel["sEditType"] == "selectbox") {
                        this._detachEventHandler(this._htEventData[sEventHandlerKey]);
                    }
                }

                if (welColumn) {
                    // 크롬에서의 오류로 인해 컬럼에 값 설정 전에 빈값으로 초기화하고 설정한다.
                    welColumn.empty().html(this._makeColumnMarkup(htColumnModel, htRow, false));
                }

                if (htEditOption && htEditOption["bFixed"] && this._htEventData[sEventHandlerKey]) {
                    if (htColumnModel["sEditType"] == "textbox") {
                        this._htEventData[sEventHandlerKey] = this._attachEventHandler(welColumn.query("input[type=text]"), "focus", jindo.$Fn(this._onTextBoxFocus, this).bind());
                    } else if (htColumnModel["sEditType"] == "selectbox") {
                        this._htEventData[sEventHandlerKey] = this._attachEventHandler(welColumn.query("select"), "change", jindo.$Fn(this._onSelectBoxChange, this).bind());
                    }
                }
            }
        }
    },

    insertRow: function(htRowData, bPrepend, bApplyOriginalData) {
        if (htRowData) {
            htRowData["_index"] = ++this._nLastIndex;
            var sKey = String(htRowData[this._getKeyColumnName()]);
            this._aRowList[bPrepend ? "unshift" : "push"](htRowData);
            this._htRowList[sKey] = htRowData;
            this._refreshNumberList();
            this._render();

            if (bApplyOriginalData) {
                var htClonnedData = this._cloneObject(htRowData);
                this._aOriginalRowList[bPrepend ? "unshift" : "push"](htClonnedData);
                this._htOriginalRowList[sKey] = htClonnedData;
            }

            this.fireEvent("changeRowCount");
        }
    },

    deleteRow: function(sKey, bApplyOriginalData) {
        sKey = String(sKey);
        if (sKey && this.isRowExist(sKey)) { // && welRow){
            var sKeyColumnName = this._getKeyColumnName();
            delete this._htRowList[sKey];
            for (var i = 0; i < this._aRowList.length; i++) {
                if (this._aRowList[i][sKeyColumnName] == sKey) {
                    this._aRowList.splice(i, 1);
                    break;
                }
            }
            this._aSelectedRowKey = jindo.$A(this._aSelectedRowKey).refuse(sKey).$value();
            this._refreshNumberList();
            this._render();
            this._setAllCheckState();

            if (bApplyOriginalData && this._htOriginalRowList[sKey]) {
                delete this._htOriginalRowList[sKey];
                for (var i = 0; i < this._aOriginalRowList.length; i++) {
                    if (this._aOriginalRowList[i][sKeyColumnName] == sKey) {
                        this._aOriginalRowList.splice(i, 1);
                        break;
                    }
                }
            }

            this.fireEvent("changeRowCount");
        }
    },

    _resetVariable: function() {
        this._aRowList = [];
        this._htRowList = {};
        this._nLastIndex = 0;
        this._aSelectedRowKey = [];
        this._aDisabledRowKey = [];
        this._htRenderedRow = {};
        this._nBeforeStartOffset = -1;
        this._nBeforeEndOffset = -1;
        this._nStep = 0;
        this._setAllCheckState();
    },

    clear: function(bRender) {
        this._detachEventForInputElement();
        this._getElement("data_table_tbody_inflexible").empty();
        this._getElement("data_table_tbody_flexible").empty();
        this._getElement("no_row_layer").show().css("marginTop", this._htLayoutData["real_header_height"] + "px");
        // clear() 함수 호출 시, 그리드 영역이 감춰진 상태면, no_row_layer의 padding-top과 border-top, border-bottom 만큼인 52px를 빼서 높이를 설정한다.
        this._getElement("no_row_layer").height(this._getElement("no_row_layer").height() == 0 ? this._htLayoutData["data_height"] - 52 : this._htLayoutData["data_height"]);
        this._resetVariable();
        this.hideLoadingLayer();
        this.fireEvent("changeRowCount");
    },

    getModifiedRowList: function(bOnlyKey, bJsonString) {
        var aResult = [];
        var sKeyColumnName = this._getKeyColumnName();
        var sKey = "",
            bEdited = false;
        var htResult = {
            "inserted": [],
            "edited": [],
            "deleted": []
        };

        for (var x in this._htRowList) {
            if (this._htOriginalRowList[x]) {
                bEdited = false;
                for (var y in this._htRowList[x]) {
                    if (y == "_index" || y == "_checkbox" || y == "_radiobox" || y == "_number" || y == "_className" || y == "_rowState") {
                        continue;
                    }

                    if ((typeof(this._htOriginalRowList[x][y]) == "string" || typeof(this._htOriginalRowList[x][y]) == "number" || typeof(this._htOriginalRowList[x][y]) == "boolean")) {
                        if (this._htOriginalRowList[x][y] != this._htRowList[x][y]) {
                            bEdited = true;
                        }
                    } else if (!jindo.$Json(this._htOriginalRowList[x][y]).compare(this._htRowList[x][y])) {
                        bEdited = true;
                    }
                }
                if (bEdited) {
                    htResult["edited"].push(bOnlyKey ? x : this._htRowList[x]);
                }
                // 행이 새로 추가된 경우
            } else {
                htResult["inserted"].push(bOnlyKey ? x : this._htRowList[x]);
            }
        }

        for (x in this._htOriginalRowList) {
            // 행이 삭제된 경우
            if (!this._htRowList[x]) {
                htResult["deleted"].push(bOnlyKey ? x : this._htOriginalRowList[x]);
            }
        }

        return bJsonString ? jindo.$Json(htResult).toString() : htResult;
    },

    isRowExist: function(sKey) {
        return sKey && this._htRowList[sKey] ? true : false;
    },

    showConfigurator: function() {
        if (this.option("htConfigurator") && this.option("htConfigurator")["bUse"]) {
            this._htInstance["configurator"].showConfigurator();
        }
    },

    addClassNameToRow: function(sKey, sClassName) {
        if (sKey && this._htRowList[sKey] && sClassName) {
            if (!this._htRowList[sKey]["_className"]) {
                this._htRowList[sKey]["_className"] = {};
            }

            if (!this._htRowList[sKey]["_className"]["row"]) {
                this._htRowList[sKey]["_className"]["row"] = [];
            }
            this._htRowList[sKey]["_className"]["row"].push(sClassName);

            var welRow = this._getRowElementByKey(sKey);
            if (welRow) {
                welRow.addClass(sClassName);
                if (this._nColumnFixIndex) {
                    this._getRowElementByKey(sKey, true).addClass(sClassName);
                }
            }
        }
    },

    addClassNameToColumn: function(sKey, sColumnName, sClassName) {
        if (sKey && this._htRowList[sKey] && sColumnName && sClassName) {
            if (!this._htRowList[sKey]["_className"]) {
                this._htRowList[sKey]["_className"] = {};
            }

            if (!this._htRowList[sKey]["_className"]["column"]) {
                this._htRowList[sKey]["_className"]["column"] = {};
            }

            if (!this._htRowList[sKey]["_className"]["column"][sColumnName]) {
                this._htRowList[sKey]["_className"]["column"][sColumnName] = [];
            }
            this._htRowList[sKey]["_className"]["column"][sColumnName].push(sClassName);

            var welRow = this._getRowElementByKey(sKey);
            if (welRow) {
                var welColumn = jindo.$Element(welRow.query("td[columnName=" + sColumnName + "]"));
                if (welColumn) {
                    welColumn.addClass(sClassName);
                } else if (this._nColumnFixIndex) {
                    jindo.$Element(this._getRowElementByKey(sKey, true).query("td[columnName=" + sColumnName + "]")).addClass(sClassName);
                }
            }
        }
    },

    removeClassNameFromRow: function(sKey, sClassName) {
        if (sKey && this._htRowList[sKey] && sClassName && this._htRowList[sKey]["_className"] && this._htRowList[sKey]["_className"]["row"]) {
            this._htRowList[sKey]["_className"]["row"] = jindo.$A(this._htRowList[sKey]["_className"]["row"]).refuse(sClassName).$value();

            var welRow = this._getRowElementByKey(sKey);
            if (welRow) {
                welRow.removeClass(sClassName);
                if (this._nColumnFixIndex) {
                    this._getRowElementByKey(sKey, true).removeClass(sClassName);
                }
            }
        }
    },

    removeClassNameFromColumn: function(sKey, sColumnName, sClassName) {
        if (sKey && this._htRowList[sKey] && sColumnName && sClassName && this._htRowList[sKey]["_className"] && this._htRowList[sKey]["_className"]["column"] && this._htRowList[sKey]["_className"]["column"][sColumnName]) {
            this._htRowList[sKey]["_className"]["column"][sColumnName] = jindo.$A(this._htRowList[sKey]["_className"]["column"][sColumnName]).refuse(sClassName).$value();

            var welRow = this._getRowElementByKey(sKey);
            if (welRow) {
                var welColumn = jindo.$Element(welRow.query("td[columnName=" + sColumnName + "]"));
                if (welColumn) {
                    welColumn.removeClass(sClassName);
                } else if (this._nColumnFixIndex) {
                    jindo.$Element(this._getRowElementByKey(sKey, true).query("td[columnName=" + sColumnName + "]")).removeClass(sClassName);
                }
            }
        }
    },

    getOriginalRow: function(sKey) {
        if (sKey) {
            return this._htOriginalRowList[sKey] || {};
        } else {
            return {};
        }
    },

    getOriginalColumn: function(sKey, sColumnName) {
        if (sKey && sColumnName && this._htOriginalRowList[sKey]) {
            return this._htOriginalRowList[sKey][sColumnName];
        }
    },

    /**
     * 그리드 헤더의 특정 컬럼 내용을 변경한다.
     *
     * @param {String} sColumnName 타이틀을 변경할 컬럼의 이름
     * @param {String} sTitle 타이틀 내용 (HTML 태그도 가능)
     */
    setHeaderColumnTitle: function(sColumnName, sTitle) {
        if (sColumnName) {
            var sGridType = this._getColumnModelData(sColumnName, "sGridType");
            var welTarget = jindo.$Element(this._getElement("header_" + sGridType).query("th[columnName=" + sColumnName + "]"));
            if (welTarget) {
                welTarget.html(sTitle);
            }
        }
    },

    /**
     * 특정 로우를 선택된 상태로 변경한다.
     * @param sKey
     */
    selectRow: function(sKey) {
        if (sKey) {
            this._selectRow(this._getRowElementByKey(sKey));
        }
    },

    /**
     * 특정 로우의 선택을 해제된 상태로 변경한다.
     * 로우키가 없는 경우 모두 해제
     * @param sKey
     */
    unselectRow: function(sKey) {
        if (sKey) {
            this._unselectRow(this._getRowElementByKey(sKey));
        } else {
            this._unselectRow();
        }
    },

    refreshLayout: function() {
        this._initializeLayout();
        this._setLayoutData();
        this._drawGridLayout(true);
        this._setVirtualScrollBar();
        this._render();
        this._refreshColumnResizingBarPosition();
    },

    showLoadingLayer: function() {
        var nHeight = this.option("bNotUseScrollBar") || this.option("bNotUseScrollBarY") ? this._getElement("root").height() - this._htLayoutData["header_height"] + 1 : this._htLayoutData["data_height"] + 1;
        this._getElement("loading_layer").show().height(nHeight).css("marginTop", (this._htLayoutData["real_header_height"]) + "px");
    },

    hideLoadingLayer: function() {
        this._getElement("loading_layer").hide();
    },

    setGridSize: function(nWidth, nHeight, bImmediate) {
        this.setGridWidth(nWidth, bImmediate);
        this.setGridHeight(nHeight, bImmediate);
    },

    getScrollBarPosition: function() {
        return {
            "nTop": this._getElement("virtual_scrollbar", true).scrollTop,
            "nLeft": this._getElement("data_flexible", true).scrollLeft
        };
    },

    setScrollBarPosition: function(nTop, nLeft) {
        if (nTop > -1) {
            this._getElement("virtual_scrollbar", true).scrollTop = nTop;
        }

        if (nLeft > -1) {
            this._getElement("data_flexible", true).scrollLeft = nLeft;
        }

    },

    /**
     * 현재 그리드에 설정된 데이터의 변경 여부를 Boolean으로 리턴한다.
     * - getModifiedRowList() 함수의 결과값을 이용하여 입력/수정/삭제가 되었으면 true를 리턴하고 그렇지 않은 경우에는 false를 리턴한다.
     *
     * @return {Boolean} 데이터의 변경 여부
     */
    isDataChanged: function() {
        var htResult = this.getModifiedRowList(true);

        return !!(htResult["inserted"].length || htResult["edited"].length || htResult["deleted"].length);
    },

    /**
     * sRowKey와 sColumnName에 해당하는 컬럼 엘리먼트(TD)를 리턴한다.
     *
     * @param {String} sRowKey 데이터의 키
     * @param {String} sColumnName 컬럼 이름
     * @param {Boolean} [bOriginal] HTMLElement 리턴 여부
     * @return {$Element} (HTMLElement) 컬럼 엘리먼트
     */
    getColumnElement: function(sRowKey, sColumnName, bOriginal) {
        if (sRowKey && sColumnName) {
            var welRow = this._getRowElementByKey(sRowKey, this._getColumnModelData(sColumnName, "bInflexible"))
            if (welRow) {
                var elColumn = welRow.query("td[columnName=" + sColumnName + "]");
                //console.log(elColumn, sColumnName)
                return bOriginal ? elColumn : jindo.$Element(elColumn);
            }
        }
    },



    /*************************************************************************************************************************************
     * 기타 기능 함수
     *************************************************************************************************************************************/
    _getRowElement: function(elTarget) {
        var welTarget = jindo.$Element(elTarget);
        if (welTarget) {
            if (welTarget.tag.toLowerCase() == "tr" && welTarget.attr("key")) {
                return welTarget;
            } else {
                var aList = welTarget.parent(function(welParent) {
                    return welParent.tag == "tr" && welParent.attr("rowType");
                }, 3);
                return aList[0];
            }
        } else {
            return null;
        }
    },

    _getColumnElement: function(elTarget) {
        var welTarget = jindo.$Element(elTarget);
        if (welTarget) {
            if (welTarget.tag.toLowerCase() == "td" && welTarget.attr("columnName")) {
                return welTarget;
            } else {
                var aList = welTarget.parent(function(welParent) {
                    if (welParent.tag.toLowerCase() == "td" && welParent.attr("columnName")) {
                        return welParent;
                    }
                }, 2);
                return aList[0];
            }
        } else {
            return null;
        }
    },

    _getRowElementByKey: function(sKey, bInflexible) {
        if (this._htRenderedRow["flexible_" + sKey]) {
            return jindo.$Element(this._htRenderedRow[(bInflexible ? "inflexible_" : "flexible_") + sKey]);
        } else {
            // query fix
            return jindo.$Element(this._getElement("data_" + (bInflexible ? "inflexible" : "flexible")).query("table tr[key=" + sKey + "]"));
        }
    },

    _getAnotherRowElement: function(elTarget) {
        var welParent = this._getRowElement(elTarget);
        var sType = welParent.attr("rowType") == "inflexible" ? "flexible" : "inflexible";
        // query fix
        var elAnotherParent = this._getElement("data_" + sType).query("table > tbody > tr[key=" + welParent.attr("key") + "]");
        return jindo.$Element(elAnotherParent);
    },

    _getColumnModelData: function(sColumnName, sField) {
        for (var i = 0; i < this._aColumnModel.length; i++) {
            if (this._aColumnModel[i]["sColumnName"] == sColumnName) {
                if (sField) {
                    return this._aColumnModel[i][sField];
                } else {
                    return this._aColumnModel[i];
                }
                break;
            }
        }
    },

    _refreshNumberList: function() {
        if (this.option("bUseAutoNumbering")) {
            for (var i = 0; i < this._aRowList.length; i++) {
                this._aRowList[i]["_number"] = i + 1;
            }
        }
    },

    _getKeyColumnName: function() {
        return this.option("sKeyColumnName") || "_index";
    },

    _cloneObject: function(obj) {
        if (typeof obj !== "object" || obj == null) {
            return obj;
        }

        var c = obj instanceof Array ? [] : {};

        for (var i in obj) {
            var prop = obj[i];

            if (typeof prop == "object") {
                if (prop instanceof Array) {
                    c[i] = [];

                    for (var j = 0; j < prop.length; j++) {
                        if (typeof prop[j] != "object") {
                            c[i].push(prop[j]);
                        } else {
                            c[i].push(this._cloneObject(prop[j]));
                        }
                    }
                } else {
                    c[i] = this._cloneObject(prop);
                }
            } else {
                c[i] = prop;
            }
        }

        return c;
    },

    _setCursorToEnd: function(elTarget) {
        elTarget.focus();
        var nLength = elTarget.value.length;

        if (elTarget.setSelectionRange) {
            elTarget.setSelectionRange(nLength, nLength);
        } else if (elTarget.createTextRange) {
            var oRange = elTarget.createTextRange();
            oRange.collapse(true);
            oRange.moveEnd("character", nLength);
            oRange.moveStart("character", nLength);
            oRange.select();
        }
    },

    _destroy: function() {
        this.clear();
    }
}).extend(nmp.component.Base);
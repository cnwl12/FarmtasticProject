nmp.component.Grid.Configurator = jindo.$Class({
    _htElementSelector: {
        "grid_width": "._grid_width",
        "grid_height": "._grid_height",
        "column_fix_index": "._column_fix_index",
        "column_order": "._column_order",
        "column_name": "._column_name",
        "column_visible": "._column_visible",
        "column_invisible": "._column_invisible",
        "column_width": "._column_width",
        "column_align": "._column_align"
    },
    _htDefaultConfig: {},
    _htUserConfig: {},
    _htInstance: {},
    _elContainer: null,
    _nSelectedColumnIndex: 0,
    _bShowed: false,
    $init: function(htOption) {
        this.option(htOption);
        this._htDefaultConfig = {};
        this._htUserConfig = {};
        this._htInstance = {};
        this._setDefaultConfig(htOption.htDefaultConfig);
        this._attachEvent();
        this._setWatchInput();
        this._getConfig();

        //setTimeout($Fn(function(){this.showConfigurator();}, this).bind(), 500);
    },

    _attachEvent: function() {
        this._attachEventHandler(this._getElement("root"), "click", jindo.$Fn(this._onClick, this).bind());
        this._attachEventHandler(this._getElement("column_fix_index"), "change", jindo.$Fn(this._onChangeColumnFixIndex, this).bind());
        //this._attachEventHandler(this._getElement("column_order"), "change", jindo.$Fn(this._onChangeColumnOrder, this).bind());
        this._attachEventHandler(this._getElement("column_align"), "change", jindo.$Fn(this._onChangeColumnAlign, this).bind());
    },

    _setWatchInput: function() {
        nmp.checkClass(["jindo.Timer", "jindo.WatchInput"]);
        var htOption = {
            "nInterval": 10,
            "bUseTimerOnIE": true
        };
        var elTarget = this._getElement("grid_width", true);
        this._htInstance["grid_width_watch_input"] = new jindo.WatchInput(elTarget, htOption).attach({
            "change": jindo.$Fn(this._onChangeTextBox, this).bind(),
            "focus": jindo.$Fn(this._onFocusTextBox, this).bind(elTarget),
            "blur": jindo.$Fn(this._onBlurTextBox, this).bind(elTarget, "grid_width", 300, 2000)
        });

        elTarget = this._getElement("grid_height", true);
        this._htInstance["grid_height_watch_input"] = new jindo.WatchInput(elTarget, htOption).attach({
            "change": jindo.$Fn(this._onChangeTextBox, this).bind(),
            "focus": jindo.$Fn(this._onFocusTextBox, this).bind(elTarget),
            "blur": jindo.$Fn(this._onBlurTextBox, this).bind(elTarget, "grid_height", 300, 1000)
        });

        elTarget = this._getElement("column_width", true);
        this._htInstance["column_width_watch_input"] = new jindo.WatchInput(elTarget, htOption).attach({
            "change": jindo.$Fn(this._onChangeTextBox, this).bind(),
            "focus": jindo.$Fn(this._onFocusTextBox, this).bind(elTarget),
            "blur": jindo.$Fn(this._onBlurTextBox, this).bind(elTarget, "column_width", 50, 300)
        });
    },

    _onChangeTextBox: function(weChange) {
        var sOldValue = weChange.elInput.value;
        var aMatches = sOldValue.match(/[\d]+/g);
        var sNewValue = (aMatches) ? aMatches.join("") : "";

        if (sOldValue != sNewValue) {
            weChange.elInput.blur();
            jindo.$Fn(function() {
                weChange.elInput.value = sNewValue;
                weChange.elInput.focus();
            }, this).delay(0.001);
        }
    },

    _onFocusTextBox: function(elTarget) {
        jindo.$Element(elTarget).addClass("focus");
    },

    _onBlurTextBox: function(elTarget, sTarget, nMinimum, nMaximum) {
        jindo.$Element(elTarget).removeClass("focus");
        var nValue = Number(elTarget.value);
        if (nValue < nMinimum || nValue > nMaximum) {
            alert("지정할 수 있는 값의 범위를 확인해 주세요.\n\n" + nMinimum + "px ~ " + nMaximum + "px");
            setTimeout(function() {
                elTarget.select();
            }, 0);
        } else {
            switch (sTarget) {
                case "grid_width":
                    this._htUserConfig.nWidth = nValue;
                    break;
                case "grid_height":
                    this._htUserConfig.nHeight = nValue;
                    break;
                case "column_width":
                    this._htUserConfig.aColumnModel[this._nSelectedColumnIndex].nWidth = nValue;
                    break;
            }
        }
    },

    _setDefaultConfig: function(htOption) {
        var aColumnModel = [];
        for (var i = 0, aOriginalColumnModel = htOption["aColumnModel"]; i < aOriginalColumnModel.length; i++) {
            aColumnModel.push({
                "sColumnName": aOriginalColumnModel[i]["sColumnName"],
                "bHidden": aOriginalColumnModel[i]["bHidden"] || false,
                "sTitle": aOriginalColumnModel[i]["sTitle"] || "",
                "nWidth": aOriginalColumnModel[i]["nWidth"] || htOption.nDefaultColumnWidth,
                "sAlign": aOriginalColumnModel[i]["sAlign"] || "left"
            });
        }

        this._htDefaultConfig = {
            "nWidth": htOption["nWidth"],
            "nHeight": htOption["nHeight"],
            "nColumnFixIndex": htOption["nColumnFixIndex"],
            "aColumnModel": aColumnModel
        };
        this._htUserConfig = {
            "nWidth": htOption["nWidth"],
            "nHeight": htOption["nHeight"],
            "nColumnFixIndex": htOption["nColumnFixIndex"],
            "aColumnModel": nmp.utility.cloningObject(aColumnModel)
        }
        //console.log($Json(this._htDefaultConfig).toString())
    },

    _setUI: function() {
        this._welContainer = jindo.$Element(this.option("elConfigurator"));
        this._getElement("grid_width", true).value = this._htUserConfig.nWidth;
        this._getElement("grid_height", true).value = this._htUserConfig.nHeight;
        this._getElement("column_fix_index", true).value = this._htUserConfig.nColumnFixIndex;

        var aHTML = [],
            sClassName = "";
        for (var i = 0, aColumnModel = this._htUserConfig.aColumnModel; i < aColumnModel.length; i++) {
            sClassName = " class='_column_item" + (aColumnModel[i]["bHidden"] ? " disabled'" : "'");
            aHTML.push("<li columnIndex='" + i + "'" + sClassName + ">" + jindo.$S(aColumnModel[i]["sTitle"]).stripTags().$value() + "</li>");
        }
        this._getElement("column_order").html(aHTML.join(""));
        this._setColumnConfigUI(0);
        //		this._getElement("column_order").fireEvent("change", {
        //			"element" : this._getElement("column_order")
        //		});

    },

    _getConfig: function() {
        return nmp.requestAjax(this.option("sLoadAPI"), {
            "userId": this.option("sUserId"),
            "gridId": this.option("sGridId")
        }, {
            "onload": jindo.$Fn(this._onLoadConfig, this).bind(),
            "method": "get"
        });
    },

    _getColumnModel: function(sColumnName) {
        for (var i = 0; i < this._htUserConfig.aColumnModel.length; i++) {
            if (this._htUserConfig.aColumnModel[i]["sColumnName"] == sColumnName) {
                return this._htUserConfig.aColumnModel[i];
            }
        }
    },
    _nSetTimeoutId: 0,
    setColumnModel: function(aColumnModel) {
        clearTimeout(this._nSetTimeoutId);
        this._nSetTimeoutId = setTimeout(jindo.$Fn(function() {
            var htColumnModel = {};
            for (var i = 0; i < aColumnModel.length; i++) {
                htColumnModel = this._getColumnModel(aColumnModel[i]["sColumnName"]);
                if (htColumnModel) {
                    htColumnModel["bHidden"] = aColumnModel[i]["bHidden"] || false;
                    htColumnModel["sTitle"] = aColumnModel[i]["sTitle"] || "";
                    htColumnModel["nWidth"] = aColumnModel[i]["nWidth"] || 50;
                    htColumnModel["sAlign"] = aColumnModel[i]["sAlign"] || "left";
                }
            }
            this._saveConfig(true);
        }, this).bind(), 500);
    },

    _saveConfig: function(bSkipRedraw) {
        return nmp.requestAjax(this.option("sSaveAPI"), {
            "id.userId": this.option("sUserId"),
            "id.gridId": this.option("sGridId"),
            "jsonValue": jindo.$Json(this._htUserConfig).toString()
        }, {
            "onload": jindo.$Fn(this._onSaveConfig, this).bind(bSkipRedraw),
            "method": "put"
        });
    },

    _resetConfig: function() {
        if (confirm("그리드 설정을 초기화 하시겠습니까?")) {
            this._htUserConfig = nmp.utility.cloningObject(this._htDefaultConfig);
            this._saveConfig();
        }
    },

    _onLoadConfig: function(htResult) {
        if (htResult.bSuccess) {
            this._htUserConfig = jindo.$Json(htResult.htReturnValue.jsonValue).toObject() || this._htUserConfig;
            this.fireEvent("loadConfig", {
                "htUserConfig": this._htUserConfig
            });
        } else {
            alert("사용자 설정 데이터를 로드하지 못했습니다.");
        }
    },

    _onSaveConfig: function(bSkipRedraw, htResult) {
        if (htResult.bSuccess) {
            this.fireEvent("saveConfig", {
                "htUserConfig": this._htUserConfig,
                "bSkipRedraw": bSkipRedraw
            });
            if (this._bShowed) {
                this.hideConfigurator();
            }
        } else {
            alert("사용자 설정 데이터를 저장하지 못했습니다.");
        }
    },

    _changeColumnOrder: function(sType) {
        var nIndex = this._nSelectedColumnIndex;
        var welColumnOrder = this._getElement("column_order");
        var aChild = welColumnOrder.child();
        var welTarget = aChild[nIndex];
        var htModel = this._htUserConfig.aColumnModel[nIndex];
        var aTarget;
        if (((sType == "top" || sType == "up") && nIndex == 0) || ((sType == "bottom" || sType == "down") && nIndex == aChild.length - 1)) {
            return false;
        }

        switch (sType) {
            case "top":
                this._htUserConfig.aColumnModel.splice(nIndex, 1);
                this._htUserConfig.aColumnModel.splice(0, 0, htModel);
                welTarget.prependTo(welColumnOrder);
                this._nSelectedColumnIndex = 0;
                break;
            case "up":
                aTarget = this._htUserConfig.aColumnModel.slice(nIndex - 1, nIndex + 1).reverse();
                this._htUserConfig.aColumnModel.splice(nIndex - 1, 1, aTarget[0]);
                this._htUserConfig.aColumnModel.splice(nIndex, 1, aTarget[1]);
                nIndex = Math.max(0, nIndex - 1);
                aChild[nIndex].before(welTarget);
                this._nSelectedColumnIndex = nIndex;
                break;
            case "down":
                aTarget = this._htUserConfig.aColumnModel.slice(nIndex, nIndex + 2).reverse();
                this._htUserConfig.aColumnModel.splice(nIndex, 1, aTarget[0]);
                this._htUserConfig.aColumnModel.splice(nIndex + 1, 1, aTarget[1]);
                nIndex = Math.min(aChild.length - 1, nIndex + 1);
                welTarget.before(aChild[nIndex]);
                this._nSelectedColumnIndex = nIndex;
                break;
            case "bottom":
                this._htUserConfig.aColumnModel.splice(nIndex, 1);
                this._htUserConfig.aColumnModel.push(htModel);
                welTarget.appendTo(welColumnOrder);
                this._nSelectedColumnIndex = aChild.length - 1;
                break;
        }

        for (var i = 0; i < aChild.length; i++) {
            jindo.$Element(aChild[i]).attr("columnIndex", i);
        }
        welColumnOrder.$value().scrollTop = 17 * this._nSelectedColumnIndex;
    },

    _onClick: function(weClick) {
        var welTarget = jindo.$Element(weClick.element);

        if (welTarget.hasClass("_cancel_button")) {
            weClick.stop();
            this.hideConfigurator();
        } else if (welTarget.hasClass("_save_button")) {
            weClick.stop();
            this._saveConfig();
        } else if (welTarget.hasClass("_reset_button")) {
            weClick.stop();
            this._resetConfig();
        } else if (welTarget.hasClass("_column_visible") || welTarget.hasClass("_column_invisible")) {
            this._changeColumnVisibility(weClick.element);
        } else if (welTarget.hasClass("_top_button")) {
            this._changeColumnOrder("top");
        } else if (welTarget.hasClass("_up_button")) {
            this._changeColumnOrder("up");
        } else if (welTarget.hasClass("_down_button")) {
            this._changeColumnOrder("down");
        } else if (welTarget.hasClass("_bottom_button")) {
            this._changeColumnOrder("bottom");
        } else if (welTarget.hasClass("_column_item")) {
            this._setColumnConfigUI(Number(welTarget.attr("columnIndex")));
        }
    },
    _onChangeColumnFixIndex: function(weChange) {
        this._htUserConfig.nColumnFixIndex = Number(weChange.element.value);
    },

    _onChangeColumnAlign: function(weChange) {
        this._htUserConfig.aColumnModel[this._nSelectedColumnIndex].sAlign = weChange.element.value;
    },

    _changeColumnVisibility: function(elTarget) {
        for (var i = 0, nCount = 0, aColumnModel = this._htUserConfig.aColumnModel; i < aColumnModel.length; i++) {
            if (!aColumnModel[i]["bHidden"]) {
                nCount++;
            }
        }

        if (nCount > 5) {
            jindo.$Element(this._getElement("column_order", true).childNodes[this._nSelectedColumnIndex])[elTarget.value == "true" ? "removeClass" : "addClass"]("disabled");
            this._htUserConfig.aColumnModel[this._nSelectedColumnIndex]["bHidden"] = (elTarget.value == "true" ? false : true);
        } else {
            this._getElement("column_visible", true).checked = true;
            alert("5개 이하의 열은 출력 여부를 수정할 수 없습니다.");
        }
    },

    _setColumnConfigUI: function(nIndex) {
        var htColumnConfig = this._htUserConfig.aColumnModel[nIndex];
        var aList = this._getElement("column_order").queryAll("li");
        jindo.$Element(aList[this._nSelectedColumnIndex]).removeClass("on");
        jindo.$Element(aList[nIndex]).addClass("on");

        this._nSelectedColumnIndex = nIndex;
        this._getElement("column_name").html(jindo.$S(htColumnConfig.sTitle).stripTags().$value());
        this._getElement("column_width", true).value = htColumnConfig.nWidth;
        this._getElement("column_align", true).value = htColumnConfig.sAlign;
        this._getElement("column_" + (htColumnConfig.bHidden ? "invisible" : "visible"), true).checked = true;
    },

    showConfigurator: function() {
        var welParent = this._getElement("root").parent();
        this._bShowed = true;
        this._setUI();
        this._getElement("root").prev().show().height(welParent.height());
        this._getElement("root").show();

        var nTop = (welParent.height() - this._getElement("root").height()) / 2;
        var nLeft = (welParent.width() - this._getElement("root").width()) / 2;
        this._getElement("root").css({
            "top": nTop + "px",
            "left": nLeft + "px"
        });
    },

    hideConfigurator: function() {
        this._getElement("root").prev().hide();
        this._getElement("root").hide();
    },

    destroy: function() {

    }
}).extend(nmp.component.Base);
/**
 * @fileOverview nmp.component 베이스컴포넌트
 * @author 윤흥기
 */
nmp.component.Base = jindo.$Class( /** @lends nmp.component.Base.prototype */ {
    __htElementSelector: {},
    __htEventData: {},
    __aEventData: [],
    __htCachedElement: {},
    __htCachedTemplate: {},
    __bRootElementExist: false,
    __sModuleName: "",
    /**
     * @class nmp.component 베이스컴포넌트
     * @constructs
     * @param htOption
     */
    $init: function(htOption) {
        this.__htElementSelector = {};
        this.__aEventData = [];
        this.__htEventData = {};
        this.__htCachedElement = {};
        this.__htCachedTemplate = {};
        this.__bRootElementExist = false;

        if (this._htElementSelector) {
            this.__htElementSelector = nmp.utility.cloningObject(this._htElementSelector);
        }

        if (htOption) {
            if (htOption.elRoot) {
                this.__htCachedElement["root"] = htOption.elRoot;
            } else if (htOption.sRootElementSelector) {
                this.__htElementSelector["root"] = htOption.sRootElementSelector;
            } else if (htOption.htElementSelector) {
                this.__htElementSelector = htOption.htElementSelector;
            }
            this.__sModuleName = htOption.sModuleName;
        }

        if (!htOption || (htOption && !htOption.bNotUseSelector)) {
            this.__setRootElement();
        }

        if (typeof(this.destroy) == "function") {
            var sDestroyFunctionBody = this.destroy.toString().replace(/function[^{]*{/, "").replace(/}$/, "");
            sDestroyFunctionBody = sDestroyFunctionBody + ";this.__destroy();";
            this.destroy = new Function(sDestroyFunctionBody);
        }
    },

    _getElementSelector: function(sKey) {
        return this.__htElementSelector[sKey] || "";
    },

    __setRootElement: function() {
        if (this.__htCachedElement["root"]) {
            this.__bRootElementExist = true;
        } else if (this.__htElementSelector["root"]) {
            this.__htCachedElement["root"] = jindo.$$.getSingle(this.__htElementSelector["root"]);
            if (this.__htCachedElement["root"] == null) {
                nmp.alertMessage("MSG0007", [this.__sModuleName, this.__htElementSelector["root"]]);
            } else {
                this.__bRootElementExist = true;
            }
        } else if (this.__sModuleName) {
            nmp.alertMessage("MSG0017", [this.__sModuleName]);
        }
    },

    _getElement: function(sKey, bOriginal) {
        if (!this.__bRootElementExist) {
            nmp.alertMessage("MSG0010");
            return null;
        }

        if (sKey) {
            return this.__findElement(sKey, bOriginal, false);
        } else {
            return null;
        }
    },

    _getElementList: function(sKey, bOriginal) {
        if (!this.__bRootElementExist) {
            nmp.alertMessage("MSG0010");
            return null;
        }

        if (sKey) {
            return this.__findElement(sKey, bOriginal, true);
        } else {
            return null;
        }
    },

    _clearElement: function(sKey) {
        if (!this.__bRootElementExist) {
            nmp.alertMessage("MSG0010");
            return null;
        }

        if (sKey && sKey != "root") {
            delete this.__htCachedElement[sKey];
            delete this.__htCachedElement[this.__getCachedKey(sKey, true)];
        }
    },

    _resetElement: function() {
        for (var x in this.__htCachedElement) {
            if (x != "root") {
                delete this.__htCachedElement[x];
            }
        }
    },

    _getTemplate: function(sKey) {
        var oTemplate = this.__htCachedTemplate[sKey];
        if (!oTemplate) {
            oTemplate = jindo.$Template(this._getElement(sKey, true));
            this.__htCachedTemplate[sKey] = oTemplate;
        }

        return oTemplate;
    },

    __findElement: function(sKey, bOriginal, bMultiple) {
        var sCachedKey = this.__getCachedKey(sKey, bMultiple);

        if (!this.__htCachedElement[sCachedKey]) {
            var elBase = this.__htCachedElement["root"];
            var sSelector = this.__htElementSelector[sKey] || "._" + sKey;

            var vElement = bMultiple ? jindo.$$(sSelector, elBase) : jindo.$$.getSingle(sSelector, elBase);
            this.__htCachedElement[sCachedKey] = vElement;
        }
        var vResult = this.__htCachedElement[sCachedKey];

        if (vResult) {
            if (bMultiple) {
                if (bOriginal) {
                    return vResult;
                } else {
                    return jindo.$ElementList(vResult);
                }
            } else {
                return bOriginal ? vResult : jindo.$Element(vResult);
            }
        }
    },

    __getCachedKey: function(sKey, bMultiple) {
        return (bMultiple) ? "multi_" + sKey : sKey;
    },

    _attachEventHandler: function(elTarget, sEventType, fCallback) {
        if (elTarget && sEventType && fCallback) {
            var wfHandler = jindo.$Fn(fCallback, this).attach(elTarget, sEventType);
            var sKey = sEventType + "_" + parseInt(Math.random() * 10000000, 10);
            wfHandler.__sKey = sKey;
            this.__htEventData[sKey] = {
                "elTarget": elTarget,
                "sEventType": sEventType,
                "fHandler": wfHandler
            };
            //			this.__aEventData.push({
            //				"elTarget" : elTarget,
            //				"sEventType" : sEventType,
            //				"fHandler" : wfHandler
            //			});

            return wfHandler;
        }
    },

    _detachEventHandler: function(wfHandler) {
        var sKey = wfHandler ? wfHandler.__sKey : "";
        if (sKey && this.__htEventData[sKey]) {
            wfHandler.detach(this.__htEventData[sKey]["elTarget"], this.__htEventData[sKey]["sEventType"]);
        }
        //		for(var i=0; i<this.__aEventData.length; i++){
        //			if(wfHandler === this.__aEventData[i]["fHandler"]){
        //				wfHandler.detach(this.__aEventData[i]["elTarget"], this.__aEventData[i]["sEventType"]);
        //			}
        //		}
    },

    __detachEvent: function() {
        for (var sKey in this.__htEventData) {
            this.__htEventData[sKey]["fHandler"].detach(this.__htEventData[sKey]["elTarget"], this.__htEventData[sKey]["sEventType"]);
        }
        //		for(var i=0; i<this.__aEventData.length; i++){
        //			this.__aEventData[i]["fHandler"].detach(this.__aEventData[i]["elTarget"], this.__aEventData[i]["sEventType"]);
        //		}
    },

    __destroyInstance: function() {
        for (var x in this._htInstance) {
            if (this._htInstance[x] && typeof(this._htInstance[x].destroy) == "function") {
                this._htInstance[x].destroy();
            }
        }
    },

    __destroy: function() {
        this.__destroyInstance();
        this.__detachEvent();
        for (var x in this) {
            delete this[x];
        }
    },

    destroy: function() {
        /** dummy function **/
    }
}).extend(jindo.Component);
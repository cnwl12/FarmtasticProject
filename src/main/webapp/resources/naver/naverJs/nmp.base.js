/**
 * @namespace Base모듈
 */
nmp.base = {
    name: "",
    _htElementSelector: {},
    _htDefaultOption: {},
    __htCustomEventData: {
        "attach": [],
        "detach": [],
        "detachAll": []
    },
    __oBaseComponent: null,
    __bNotUseSelector: false,
    __bInitialized: false,

    initialize: function(htOption) {
        this.__oBaseComponent = new nmp.component.Base({
            "htElementSelector": this._htElementSelector,
            "sModuleName": this.name,
            "bNotUseSelector": this.__bNotUseSelector
        });
        this._bindMethod();
        this._bindCustomEventHandler();
        this._setOption(this._htDefaultOption);
        this._setOption(htOption);
        this.__initialize(htOption);
        this.__bInitialized = true;
    },

    _bindMethod: function() {
        this.attach = jindo.$Fn(this.__oBaseComponent.attach, this.__oBaseComponent).bind();
        this.detach = jindo.$Fn(this.__oBaseComponent.detach, this.__oBaseComponent).bind();
        this.detachAll = jindo.$Fn(this.__oBaseComponent.detachAll, this.__oBaseComponent).bind();
        this._fireEvent = jindo.$Fn(this.__oBaseComponent.fireEvent, this.__oBaseComponent).bind();
        this._getOption = jindo.$Fn(this.__oBaseComponent.option, this.__oBaseComponent).bind();
        this._setOption = jindo.$Fn(this.__oBaseComponent.option, this.__oBaseComponent).bind();
        this._getElementSelector = jindo.$Fn(this.__oBaseComponent._getElementSelector, this.__oBaseComponent).bind();
        this._getElement = jindo.$Fn(this.__oBaseComponent._getElement, this.__oBaseComponent).bind();
        this._getElementList = jindo.$Fn(this.__oBaseComponent._getElementList, this.__oBaseComponent).bind();
        this._clearElement = jindo.$Fn(this.__oBaseComponent._clearElement, this.__oBaseComponent).bind();
        this._resetElement = jindo.$Fn(this.__oBaseComponent._resetElement, this.__oBaseComponent).bind();
        this._option = jindo.$Fn(this.__oBaseComponent.option, this.__oBaseComponent).bind();
        this._attachEventHandler = jindo.$Fn(this.__oBaseComponent._attachEventHandler, this.__oBaseComponent).bind();
        this._detachEventHandler = jindo.$Fn(this.__oBaseComponent._detachEventHandler, this.__oBaseComponent).bind();
        this._getTemplate = jindo.$Fn(this.__oBaseComponent._getTemplate, this.__oBaseComponent).bind();
    },

    _bindCustomEventHandler: function() {
        var aList = ["attach", "detach", "detachAll"];
        for (var i = 0, nLen = aList.length, j = 0; i < nLen; i++) {
            for (j = 0, nLenInner = this.__htCustomEventData[aList[i]].length; j < nLenInner; j++) {
                this.__oBaseComponent[aList[i]].apply(this.__oBaseComponent, this.__htCustomEventData[aList[i]][j]);
            }
        }
    },

    __destroyInstance: function() {
        for (var x in this._htInstance) {
            // Script 오류로 객체 검증 추가
            if (this._htInstance[x] && typeof(this._htInstance[x].destroy) == "function") {
                this._htInstance[x].destroy();
                delete this._htInstance[x];
            }
        }
    },

    __destroyBaseComponent: function() {
        if (this.__oBaseComponent) {
            this.__oBaseComponent.destroy();
            delete this.__oBaseComponent;
        }
    },

    __destroyVariables: function() {
        for (var x in this) {
            delete this[x];
        }
    },

    destroy: function() {
        if (this.__bInitialized) {
            if (typeof(this.__destroy) == "function") {
                var bResult = this.__destroy() === false ? false : true;
            }

            this.__destroyInstance();
            this.__destroyBaseComponent();
            if (bResult) {
                this.__destroyVariables();
            }
        }
    }
};
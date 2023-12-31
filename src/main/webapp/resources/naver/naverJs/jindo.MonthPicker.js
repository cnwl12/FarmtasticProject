/**
 * jindo.MonthCalendar
 * jindo.MonthPicker
 */
jindo.MonthCalendar = jindo.$Class({
    _assignHTMLElements: function() {
        var sClassPrefix = this.option("sClassPrefix"),
            elLayer = this.getBaseElement();

        if ((this.elBtnPrevYear = jindo.$$.getSingle(("." + sClassPrefix + "btn-prev-year"), elLayer))) {
            this.wfPrevYear = jindo.$Fn(function(oEvent) {
                oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
                this.draw(-1, 0, true);
            }, this);
        }
        if ((this.elBtnPrevMonth = jindo.$$.getSingle(("." + sClassPrefix + "btn-prev-mon"), elLayer))) {
            this.wfPrevMonth = jindo.$Fn(function(oEvent) {
                oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
                this.draw(0, -1, true);
            }, this);
        }
        if ((this.elBtnNextMonth = jindo.$$.getSingle(("." + sClassPrefix + "btn-next-mon"), elLayer))) {
            this.wfNextMonth = jindo.$Fn(function(oEvent) {
                oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
                this.draw(0, 1, true);
            }, this);
        }
        if ((this.elBtnNextYear = jindo.$$.getSingle(("." + sClassPrefix + "btn-next-year"), elLayer))) {
            this.wfNextYear = jindo.$Fn(function(oEvent) {
                oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
                this.draw(1, 0, true);
            }, this);
        }

        this.elTitle = jindo.$$.getSingle(("." + sClassPrefix + "title"), elLayer);
        this.elTitleYear = jindo.$$.getSingle(("." + sClassPrefix + "title-year"), elLayer);
        this.elTitleMonth = jindo.$$.getSingle(("." + sClassPrefix + "title-month"), elLayer);
        this.waMonth = jindo.$A(jindo.$$("tbody td", elLayer));

    },

    getDateOfElement: function(el) {
        var htDate = this.getShownDate();
        return {
            nYear: htDate.nYear,
            nMonth: this.waMonth.indexOf(el) + 1,
            nDate: 1
        };
    },

    draw: function(nYear, nMonth, bRelative) {
        var sClassPrefix = this.option("sClassPrefix"),
            htDate = this.getDate(),
            oShownDate = this._getShownDate(),
            htToday = jindo.Calendar.getToday();

        if (oShownDate && typeof bRelative != "undefined" && bRelative) {
            var htRelativeDate = this.constructor.getRelativeDate(nYear, nMonth, 0, oShownDate);
            nYear = htRelativeDate.nYear;
            nMonth = htRelativeDate.nMonth;
        } else if (typeof nYear == "undefined" && typeof nMonth == "undefined" && typeof bRelative == "undefined") {
            nYear = htDate.nYear;
            nMonth = htDate.nMonth;
        } else {
            nYear = nYear || oShownDate.nYear;
            nMonth = nMonth || oShownDate.nMonth;
        }
        if (this.fireEvent("beforeDraw", {
                nYear: nYear
            })) {
            if (this.elTitle) {
                this._setCalendarTitle(nYear, nMonth);
            }
            if (this.elTitleYear) {
                this._setCalendarTitle(nYear, nMonth, "year");
            }
            if (this.elTitleMonth) {
                this._setCalendarTitle(nYear, nMonth, "month");
            }

            //this._clear(jindo.Calendar.getWeeks(nYear, nMonth));
            this._setShownDate(nYear, nMonth);

            for (var i = 0; i < 12; i++) {
                var elDateContainer = this.waMonth.$value()[i];
                jindo.$Element(elDateContainer).removeClass(sClassPrefix + "selected");

                if (htToday.nYear === nYear && htToday.nMonth === i + 1) {
                    jindo.$Element(elDateContainer).addClass(sClassPrefix + "today");
                }

                this.fireEvent("draw", {
                    elDateContainer: elDateContainer,
                    nYear: nYear,
                    nMonth: i + 1
                });
            }

            this.fireEvent("afterDraw", {
                nYear: nYear
            });
        }
    }
}).extend(jindo.Calendar);

jindo.MonthPicker = jindo.$Class({
    $init: function(elCalendarLayer, htOption) {
        var oDate = new Date();
        this.option({
            bUseLayerPosition: false, //LayerPosition을 사용해서 포지셔닝을 할지의 여부
            bDrawOnLoad: false,

            htSelectableDateFrom: {
                nYear: 1900,
                nMonth: 1,
                nDate: 1
            },
            htSelectableDateTo: {
                nYear: 2100,
                nMonth: 12,
                nDate: 31
            },

            Calendar: { //Calendar를 위한 옵션
                sClassPrefix: "calendar-", //Default Class Prefix
                nYear: oDate.getFullYear(),
                nMonth: oDate.getMonth() + 1,
                nDate: oDate.getDate(),
                sTitleFormat: "yyyy", //달력의 제목부분에 표시될 형식
                aMonthTitle: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"] //월 이름
            },

            LayerManager: { //LayerManager를 위한 옵션
                sCheckEvent: "click",
                nShowDelay: 0,
                nHideDelay: 0
            },

            LayerPosition: { //LayerPosition을 위한 옵션
                sPosition: "outside-bottom",
                sAlign: "left",
                nTop: 0,
                nLeft: 0,
                bAuto: false
            }
        });
        this.option(htOption);

        this._elCalendarLayer = elCalendarLayer;
        this._initMonthCalendar();
        this._initLayerManager();
        this._initLayerPosition();
        this._wfClickButton = jindo.$Fn(this._onClickButton, this);
        this._wfClickMonth = jindo.$Fn(this._onClickMonth, this);
        this._wfMouseOverOutMonth = jindo.$Fn(this._onMouseOverOutMonth, this);

        this.activate();
    },
    /**
     * 달력레이어를 가져온다.
     * @return {HTMLElement}
     */
    getCalendarLayer: function() {
        return this._elCalendarLayer;
    },
    _initMonthCalendar: function() {
        /**
         * 달력 오브젝트
         * @type Object jindo.Calendar 컴포넌트 
         * @see jindo.Calendar
         */
        var self = this;
        this._oCalendar = new jindo.MonthCalendar(this.getCalendarLayer(), this.option("Calendar")).attach({
            beforeDraw: function(oCustomEvent) {
                if (!self.fireEvent("beforeDraw", oCustomEvent)) {
                    oCustomEvent.stop();
                }
            },
            draw: function(oCustomEvent) {
                var sClassPrefix = this.option("sClassPrefix");
                var htDate = self.getValue();
                if (self.isSelectable(oCustomEvent)) {
                    jindo.$Element(oCustomEvent.elDateContainer).removeClass(this.option("sClassPrefix") + "unselectable");
                    oCustomEvent.bSelectable = true;
                    if (oCustomEvent.nYear == htDate.nYear && oCustomEvent.nMonth == htDate.nMonth) {
                        jindo.$Element(oCustomEvent.elDateContainer).addClass(sClassPrefix + "selected");
                    }
                } else {
                    oCustomEvent.bSelectable = false;
                    jindo.$Element(oCustomEvent.elDateContainer).addClass(this.option("sClassPrefix") + "unselectable");
                }

                if (!self.fireEvent("draw", oCustomEvent)) {
                    oCustomEvent.stop();
                }
            },
            afterDraw: function(oCustomEvent) {
                self._elSelected = null;
                self.fireEvent("afterDraw", oCustomEvent);
            }
        });
    },
    link: function(el) {
        var oLayerManager = this.getLayerManager();
        oLayerManager.link(el);
        this._wfClickButton.attach(el, "click");
        return this;
    },

    getCalendar: function() {
        return this._oCalendar;
    },
    _initLayerManager: function() {
        var self = this;
        var elCalendarLayer = this.getCalendarLayer();
        this._oLayerManager = new jindo.LayerManager(elCalendarLayer, this.option("LayerManager")).attach({
            hide: function(oCustomEvent) {
                self._htSelectedWeekPickerSet = null;
            }
        }).link(elCalendarLayer);
    },
    getLayerManager: function() {
        return this._oLayerManager;
    },
    _initLayerPosition: function() {
        if (this.option("bUseLayerPosition")) {
            this._oLayerPosition = new jindo.LayerPosition(null, this.getCalendarLayer(), this.option("LayerPosition"));
        }
    },
    getLayerPosition: function() {
        return this._oLayerPosition;
    },
    _onActivate: function() {
        var oLayerManager = this.getLayerManager();
        var aLink = oLayerManager.getLinks();
        for (var i = 0; i < aLink.length; i++) {
            if (aLink[i] != oLayerManager.getLayer()) {
                this._wfClickButton.attach(aLink[i], "click");
            }
        }
        oLayerManager.activate();
        this.getCalendar().activate();
        var elCalendarLayer = this.getCalendarLayer();
        this._wfClickMonth.attach(elCalendarLayer, "click");
        this._wfMouseOverOutMonth.attach(elCalendarLayer, "mouseover").attach(elCalendarLayer, "mouseout");
    },
    _onDeactivate: function() {
        var oLayerManager = this.getLayerManager();
        var aLink = oLayerManager.getLinks();
        for (var i = 0; i < aLink.length; i++) {
            if (aLink[i] != oLayerManager.getLayer()) {
                this._wfClickButton.detach(aLink[i], "click");
            }
        }
        oLayerManager.deactivate();
        this.getCalendar().deactivate();
        var elCalendarLayer = this.getCalendarLayer();
        this._wfClickMonth.detach(elCalendarLayer, "click");
        this._wfMouseOverOutMonth.detach(elCalendarLayer, "mouseover").detach(elCalendarLayer, "mouseout");
    },

    _onClickButton: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        if (this.fireEvent("click", {
                element: we.currentElement
            })) {
            var htDate = this.getValue();
            this.getCalendar().draw(htDate.nYear, htDate.nMonth);
            this.getLayerManager().show();
            if (this.option("bUseLayerPosition")) {
                this.getLayerPosition().setElement(this.option("elLayerPosition") || we.element).setPosition();
            }
        }
    },

    /**
     * 선택가능한 월인지 확인한다.
     * @param {HashTable} htDatePickerSet
     * @param {HashTable} htDate
     */
    isSelectable: function(htDate) {
        htDate = jindo.Calendar.getDateHashTable(htDate.nYear, htDate.nMonth, 1);

        var htOption = this.option(),
            htFrom = jindo.Calendar.getDateHashTable(htOption.htSelectableDateFrom.nYear, htOption.htSelectableDateFrom.nMonth, 1),
            htTo = jindo.Calendar.getDateHashTable(htOption.htSelectableDateTo.nYear, htOption.htSelectableDateTo.nMonth, 1);

        return jindo.Calendar.isBetween(htDate, htFrom, htTo);
    },

    _getTargetDateElement: function(el) {
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        var elContainer = this._getTargetDateContainerElement(el);
        return jindo.$$.getSingle("." + sClassPrefix + "month", elContainer) || elContainer;
    },

    _getTargetDateContainerElement: function(el) {
        var sClassPrefix = this.getCalendar().option("sClassPrefix");

        if (this.getCalendar().waMonth.indexOf(el) > -1) {
            return el;
        }

        if (jindo.$Element(el).hasClass(sClassPrefix + "month")) {
            return el.parentNode;
        }

        if ((el = jindo.$$.getSingle("! ." + sClassPrefix + "month", el))) {
            return el.parentNode;
        } else {
            return null;
        }
    },

    _setSelectedAgain: function() {
        if (this._elSelected) {
            var sClassPrefix = this.getCalendar().option("sClassPrefix");
            jindo.$Element(this._elSelected).addClass(sClassPrefix + "selected");
            this._elSelected = null;
        }
    },

    _setAsideSelected: function() {
        if (!this._elSelected) {
            var sClassPrefix = this.getCalendar().option("sClassPrefix");
            this._elSelected = jindo.$$.getSingle("." + sClassPrefix + "selected", this._elCalendarLayer);
            if (this._elSelected) {
                jindo.$Element(this._elSelected).removeClass(sClassPrefix + "selected");
            }
        }
    },

    _onMouseOverOutMonth: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        var el = we.element;
        var elDate = this._getTargetDateElement(el);
        if (elDate && (elDate = this._getTargetDateContainerElement(el))) {
            var htDate = this.getCalendar().getDateOfElement(elDate);
            if (this.isSelectable(htDate)) {
                if (we.type == "mouseover") {
                    this._setAsideSelected();
                    jindo.$Element(elDate).addClass(sClassPrefix + "over");
                    return;
                }
                if (we.type == "mouseout") {
                    this._setSelectedAgain();
                    jindo.$Element(elDate).removeClass(sClassPrefix + "over");
                }
            }
        }
    },
    _onClickMonth: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        var el = we.element;
        var elDate = this._getTargetDateContainerElement(el);
        if (elDate) {
            this.setValue(this.getCalendar().getDateOfElement(elDate));
        }
    },

    setValue: function(htDate) {
        if (this.isSelectable(htDate)) {
            this._htValue = {
                nYear: htDate.nYear,
                nMonth: htDate.nMonth
            };
            if (this.fireEvent("select", {
                    nYear: this._htValue.nYear,
                    nMonth: this._htValue.nMonth
                })) {
                this.getLayerManager().hide();
            }
            return true;
        }
        return false;
    },
    getValue: function() {
        if (!this._htValue) {
            var htOption = this.getCalendar().option();
            this._htValue = {
                nYear: htOption.nYear,
                nMonth: htOption.nMonth
            };
        }
        return this._htValue;
    }
}).extend(jindo.UIComponent);
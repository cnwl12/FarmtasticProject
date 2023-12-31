jindo.WeekPicker = jindo.$Class({

    $init: function(elCalendarLayer, htOption) {
        var oDate = new Date();
        this.htDefaultOption = {
            nWeekStartDate: 0,
            nWeekDateCount: 7,
            bFixedStartDate: true,
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
            bUseLayerPosition: true,
            Calendar: {
                sClassPrefix: "calendar-",
                nYear: oDate.getFullYear(),
                nMonth: oDate.getMonth() + 1,
                nDate: oDate.getDate(),
                sTitleFormat: "yyyy-mm",
                aMonthTitle: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
            },
            LayerManager: {
                sCheckEvent: "click",
                nShowDelay: 0,
                nHideDelay: 0
            },
            LayerPosition: {
                sPosition: "outside-bottom",
                sAlign: "left",
                nTop: 0,
                nLeft: 0,
                bAuto: false
            }
        };
        this.option(this.htDefaultOption);
        this.option(htOption || {});
        this._elCalendarLayer = jindo.$(elCalendarLayer);
        this._initCalendar();
        this._initLayerManager();
        this._initLayerPosition();
        this._wfClickButton = jindo.$Fn(this._onClickButton, this);
        this._wfClickDate = jindo.$Fn(this._onClickDate, this);
        this._wfMouseOverOutDate = jindo.$Fn(this._onMouseOverOutDate, this);
        this.activate();
    },

    link: function(el) {
        var oLayerManager = this.getLayerManager();
        oLayerManager.link(el);
        this._wfClickButton.attach(el, "click");
        return this;
    },

    getCalendarLayer: function() {
        return this._elCalendarLayer;
    },

    _initCalendar: function() {
        var self = this;
        var elCalendarLayer = this.getCalendarLayer();
        this._oCalendar = new jindo.Calendar(elCalendarLayer, this.option("Calendar")).attach({
            beforeDraw: function(oCustomEvent) {
                self._elSelected = null;
                self._htMetaData = null;
                if (!self.fireEvent("beforeDraw", oCustomEvent)) {
                    oCustomEvent.stop();
                }
            },
            draw: function(oCustomEvent) {
                if (jindo.Calendar.isBetween(oCustomEvent, self.option("htSelectableDateFrom"), self.option("htSelectableDateTo"))) {
                    oCustomEvent.bSelectable = true;
                    var aStartEndDate = self.getValue();
                    if (!self._elSelected) {
                        if (jindo.Calendar.isBetween(oCustomEvent, aStartEndDate[0], aStartEndDate[1])) {
                            self._elSelected = oCustomEvent.elDateContainer;
                        }
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
                var sClassPrefix = this.option("sClassPrefix");
                if (self._elSelected) {
                    jindo.$ElementList(self._getDatesOnSameWeek(self._elSelected)).addClass(sClassPrefix + "selected");
                }
                self.fireEvent("afterDraw", oCustomEvent);
            }
        });
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
        this._wfClickDate.attach(elCalendarLayer, "click");
        this._wfMouseOverOutDate.attach(elCalendarLayer, "mouseover").attach(elCalendarLayer, "mouseout");
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
        this._wfClickDate.detach(elCalendarLayer, "click");
        this._wfMouseOverOutDate.detach(elCalendarLayer, "mouseover").detach(elCalendarLayer, "mouseout");
    },

    _onClickButton: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        if (this.fireEvent("click", {
                element: we.currentElement
            })) {
            var htStartDate = this.getValue()[0];
            this.getCalendar().draw(htStartDate.nYear, htStartDate.nMonth);
            this.getLayerManager().show();
            if (this.option("bUseLayerPosition")) {
                this.getLayerPosition().setElement(this.option("elLayerPosition") || we.element).setPosition();
            }
        }
    },

    _getWeekElement: function(elDate) {
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        return jindo.$$.getSingle("! ." + sClassPrefix + "week", elDate);
    },

    _getDateElement: function(nWeek, nIndex) {
        return this.getCalendar()._aDateContainerElement[(nWeek * 7) + nIndex];
    },

    _getDatesOnSameWeek: function(elDate) {
        var nWeek = jindo.$A(this.getCalendar()._aWeekElement).indexOf(this._getWeekElement(elDate));
        var nDate = jindo.$A(this.getCalendar()._aDateContainerElement).indexOf(elDate);
        var aDate = [];
        var nWeekDateCount = this.option("nWeekDateCount");
        var nWeekStartDate = (this.option("bFixedStartDate")) ? this.option("nWeekStartDate") : (nDate % 7);
        var nCount = 0;
        var i;
        if (nWeekStartDate > 0) {
            if (nDate % 7 < nWeekStartDate) {
                nWeek--;
            }
            if (nWeek > -1) {
                for (i = nWeekStartDate; i < 7; i++) {
                    if (nCount < nWeekDateCount) {
                        aDate.push(this._getDateElement(nWeek, i));
                        nCount++;
                    }
                }
            }
            if (nWeek + 1 < this.getCalendar()._aWeekElement.length) {
                nCount = 7 - nWeekStartDate;
                for (i = 0; i < nWeekStartDate; i++) {
                    if (nCount < nWeekDateCount) {
                        aDate.push(this._getDateElement(nWeek + 1, i));
                        nCount++;
                    }
                }
            }
        } else {
            for (i = 0; i < nWeekDateCount; i++) {
                aDate.push(this._getDateElement(nWeek, i));
            }
        }
        var htSelectableDateFrom = this.option("htSelectableDateFrom");
        var htSelectableDateTo = this.option("htSelectableDateTo");
        var oCalendar = this.getCalendar();
        var aReturn = [];
        for (i = 0; i < aDate.length; i++) {
            if (jindo.Calendar.isBetween(oCalendar.getDateOfElement(aDate[i]), htSelectableDateFrom, htSelectableDateTo)) {
                aReturn.push(aDate[i]);
            }
        }
        return aReturn;
    },

    getValue: function() {
        if (!this._aStartEndDate) {
            var htOption = this.getCalendar().option();
            this._aStartEndDate = this._getStartEndDate(htOption);
        }
        return this._aStartEndDate;
    },

    isSelectable: function(htDate) {
        return jindo.Calendar.isBetween(htDate, this.option("htSelectableDateFrom"), this.option("htSelectableDateTo"));
    },

    setValue: function(htDate) {
        if (this.isSelectable(htDate)) {
            var aStartEndDate = this._getStartEndDate(htDate);
            this._aStartEndDate = aStartEndDate;
            if (this.fireEvent("select", {
                    htStartDate: aStartEndDate[0],
                    htEndDate: aStartEndDate[1]
                })) {
                this.getLayerManager().hide();
            }
            return true;
        }
        return false;
    },

    _convertDateToBeSelectable: function(htDate) {
        if (!this.isSelectable(htDate)) {
            if (jindo.Calendar.isPast(htDate, this.option("htSelectableDateFrom"))) {
                return this.option("htSelectableDateFrom");
            } else {
                return this.option("htSelectableDateTo");
            }
        }
        return htDate;
    },

    _getStartEndDate: function(htDate) {
        //        var nWeekStartDate = this.option("nWeekStartDate");
        var nWeekDateCount = this.option("nWeekDateCount");
        var oDate = jindo.Calendar.getDateObject(htDate);
        var nDateIndex = oDate.getDay();
        var nWeekStartDate = (this.option("bFixedStartDate")) ? this.option("nWeekStartDate") : nDateIndex;
        var oDateStart;
        var oDateEnd;
        if (nDateIndex >= nWeekStartDate) {
            oDateStart = jindo.Calendar.getDateObject(htDate.nYear, htDate.nMonth, htDate.nDate - ((nDateIndex) - nWeekStartDate));
            oDateEnd = jindo.Calendar.getDateObject(htDate.nYear, htDate.nMonth, htDate.nDate - ((nDateIndex) - nWeekStartDate) + nWeekDateCount - 1);
        } else {
            oDateStart = jindo.Calendar.getDateObject(htDate.nYear, htDate.nMonth, htDate.nDate - (7 - Math.abs(nWeekStartDate - (nDateIndex))));
            oDateEnd = jindo.Calendar.getDateObject(htDate.nYear, htDate.nMonth, htDate.nDate + nWeekStartDate - (nDateIndex) - 1);
        }
        var htStartDate = this._convertDateToBeSelectable(jindo.Calendar.getDateHashTable(oDateStart));
        var htEndDate = this._convertDateToBeSelectable(jindo.Calendar.getDateHashTable(oDateEnd));
        if (Math.abs(oDate.getTime() - jindo.Calendar.getTime(htEndDate) > nWeekDateCount * 1000 * 60 * 60 * 24) || Math.abs(oDate.getTime() - jindo.Calendar.getTime(htStartDate) > nWeekDateCount * 1000 * 60 * 60 * 24)) {
            return this._getStartEndDate(htStartDate);
        } else {
            return [htStartDate, htEndDate];
        }
    },

    _getTargetDateElement: function(el) {
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        var elDate = (jindo.$Element(el).hasClass(sClassPrefix + "date")) ? el : jindo.$$.getSingle("." + sClassPrefix + "date", el);
        if (elDate && (elDate == el || elDate.length == 1)) {
            return elDate;
        }
        return null;
    },

    _getTargetDateContainerElement: function(el) {
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        var elWeek = jindo.$$.getSingle("! ." + sClassPrefix + "week", el);
        if (elWeek) {
            if (el.parentNode == elWeek) {
                return el;
            }
            var elReturn = el;
            while (!jindo.$Element(elReturn.parentNode).hasClass(sClassPrefix + "week")) {
                elReturn = elReturn.parentNode;
            }
            return elReturn;
        } else {
            return null;
        }
    },

    _onMouseOverOutDate: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        var sClassPrefix = this.getCalendar().option("sClassPrefix");
        var el = we.element;
        var elDate = this._getTargetDateContainerElement(el);
        if (elDate) {
            var htDate = this.getCalendar().getDateOfElement(elDate);
            if (this.isSelectable(htDate)) {
                if (we.type == "mouseover") {
                    if (this._elSelected) {
                        jindo.$ElementList(this._getDatesOnSameWeek(this._elSelected)).removeClass(sClassPrefix + "selected");
                    }
                    jindo.$ElementList(this._getDatesOnSameWeek(elDate)).addClass(sClassPrefix + "over");
                    return;
                }
                if (we.type == "mouseout") {
                    jindo.$ElementList(this._getDatesOnSameWeek(elDate)).removeClass(sClassPrefix + "over");
                }
            }
        }
        if (this._elSelected) {
            jindo.$ElementList(this._getDatesOnSameWeek(this._elSelected)).addClass(sClassPrefix + "selected");
        }
    },

    _onClickDate: function(we) {
        we.stop(jindo.$Event.CANCEL_DEFAULT);
        var el = we.element;
        var elDate = this._getTargetDateElement(el);
        if (elDate) {
            this.setValue(this.getCalendar().getDateOfElement(this._getTargetDateContainerElement(elDate)));
        }
    }
}).extend(jindo.UIComponent);
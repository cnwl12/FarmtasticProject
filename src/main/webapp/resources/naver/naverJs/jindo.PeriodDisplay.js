jindo.PeriodDisplay = jindo.$Class({
    $init: function(el) {
        this._el = el;
        this._assignHTMLElement(el);
    },

    _assignHTMLElement: function(el) {
        this._aStrong = jindo.$$("strong", el);
        this._aSpan = jindo.$$("strong > span", el);
    },

    _display: function(nLen) {
        var aLeave = [],
            nAdd = 0,
            welLast = jindo.$Element(this._aStrong[this._aStrong.length - 1]),
            i;

        if (this._aStrong.length > nLen) {
            aLeave = this._aStrong.slice(nLen, this._aStrong.length);
            for (i = 0; i < aLeave.length; i++) {
                jindo.$Element(aLeave[i]).leave();
            }
        } else {
            nAdd = (nLen - this._aStrong.length);
            for (i = 0; i < nAdd; i++) {
                welLast.afterHTML('<strong class="num0"><span class="blind">0</span></strong>');
            }
        }

        this._aStrong = jindo.$$("strong", this._el);
        this._aSpan = jindo.$$("strong > span", this._el);
    },

    _parseDate: function(ht) {
        var sReturn = ht.nYear.toString() + "." + this._paddingZero(ht.nMonth, 2);
        if (ht.nDate) {
            sReturn += "." + this._paddingZero(ht.nDate, 2);
        }

        return sReturn;
    },

    set: function(htFrom, htTo) {
        var s;
        switch (arguments.length) {
            case 1:
                this._aValue = {
                    nYear: htFrom.nYear,
                    nMonth: htFrom.nMonth,
                    nDate: htFrom.nDate || null
                };

                s = this._parseDate(htFrom);
                break;
            case 2:
                this._aValue = [{
                    nYear: htFrom.nYear,
                    nMonth: htFrom.nMonth,
                    nDate: htFrom.nDate || null
                }, {
                    nYear: htTo.nYear,
                    nMonth: htTo.nMonth,
                    nDate: htTo.nDate || null
                }];
                s = this._parseDate(htFrom) + "-" + this._parseDate(htTo);
                break;
        }
        var nLen = s.length;
        this._display(nLen);
        this._sText = s;
        for (var i = 0; i < nLen; i++) {
            jindo.$Element(this._aStrong[i]).className(this._getClassName(s.charAt(i)));
            jindo.$Element(this._aSpan[i]).text(s.charAt(i));
        }
    },

    get: function() {
        return this._aValue;
    },

    getText: function() {
        return this._sText;
    },


    _getClassName: function(s) {
        if (s === ".") {
            return "num_dot";
        }
        if (s === "-") {
            return "num_line";
        }
        return "num" + s;
    },

    _paddingZero: function(nNumber, nLength) {
        var sResult = (nNumber * 1).toString();
        while (sResult.length < nLength) {
            sResult = ("0" + sResult);
        }
        return sResult;
    }
}).extend(jindo.Component);
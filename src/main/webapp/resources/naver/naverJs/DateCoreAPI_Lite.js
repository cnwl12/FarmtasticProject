	/**
	 * 날짜 계산 API
	 * 
	 * @name nhn.DateCoreAPI
	 * @namespace
	 * @author jkland
	 * @version 0.1
	 */
	var DateCoreAPI = {
	    /**
	     * 요일, 영어,한글 선택시 여기서 바꿈
	     * @type {Array}
	     */
	    _aDayName: ['일', '월', '화', '수', '목', '금', '토'],

	    /**
	     * API에서 사용하는 Date Type
	     * - 년, 월, 일, 양력음력Type으로 이루어져 있음
	     * @param {Number}	nYear	년
	     * @param {Number}	[nMonth]	월
	     * @param {Number}	[nDate]	일
	     * @param {Number}	[nMonthType]	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달)
	     * @param {Number}	[nHour]	시
	     * @param {Number}	[nMinute]	분
	     * @param {Number}	[nSecond]	초
	     * @example
	     * var a = nhn.DateCoreAPI.oCoreDate(nYear, nMonth, nDate, nMonthType, [nHour, nMinute, nSecond]);
	     */
	    oCoreDate: function(nYear, nMonth, nDate, nMonthType, nHour, nMinute, nSecond) {
	        var oDate = {
	            'nYear': 0,
	            'nMonth': 1,
	            'nDate': 1,
	            'nMonthType': 0,
	            'nHour': 0,
	            'nMinute': 0,
	            'nSecond': 0
	        };

	        var nCheck_Value = Number(nYear);
	        oDate.nYear = nCheck_Value;

	        var nCheck_Value1 = Number(nMonth);
	        if (nCheck_Value1 > 1) {
	            oDate.nMonth = nCheck_Value1;
	        }

	        var nCheck_Value2 = Number(nDate);
	        if (nCheck_Value2 > 1) {
	            oDate.nDate = nCheck_Value2;
	        }

	        var nCheck_Value3 = Number(nHour);
	        if (nCheck_Value3 > 0) {
	            oDate.nHour = nCheck_Value3;
	        }

	        var nCheck_Value4 = Number(nMinute);
	        if (nCheck_Value4 > 0) {
	            oDate.nMinute = nCheck_Value4;
	        }

	        var nCheck_Value5 = Number(nSecond);
	        if (nCheck_Value5 > 0) {
	            oDate.nSecond = nCheck_Value5;
	        }

	        var nCheck_Value6 = Number(nMonthType);
	        if (nCheck_Value6 == 1 || nCheck_Value6 == 2) {
	            oDate.nMonthType = nCheck_Value6;
	        }
	        return oDate;
	    },


	    /**
	     * Date Type이나 표준 Date Format을 API에서 사용하는 Date Format으로 변경하는 함수
	     * @param {Variant}	vDateFormat	('yyyy-mm-dd hh:nn:ss' or 'yyyy-mm-dd')형식의 변환하려는 날짜 or Date type
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달)
	     * @return {object} API에서 사용하는 날짜
	     */
	    getCoreDateFormat: function(vDateFormat, nMonthType) {
	        var oReturnDate = null;
	        nMonthType = 0;
	        if (vDateFormat.constructor == Date) {
	            oReturnDate = this.oCoreDate(vDateFormat.getFullYear(), vDateFormat.getMonth() + 1, vDateFormat.getDate(), 0, vDateFormat.getHours(), vDateFormat.getMinutes(), vDateFormat.getSeconds());
	        } else if (vDateFormat.constructor == String) {
	            var RegExp = /^([0-9]{4,})[-.]([01][0-9])[-.]([0-3][0-9]) ([0-2][0-9]):([0-5][0-9]):([0-5][0-9])/;
	            var aValue = vDateFormat.match(RegExp);
	            if (!aValue) {
	                RegExp = /^([0-9]{4,})[-.]([01][0-9])[-.]([0-3][0-9])/;
	                aValue = vDateFormat.match(RegExp);
	                if (aValue) {
	                    oReturnDate = this.oCoreDate(aValue[1], aValue[2], aValue[3], nMonthType);
	                } else {
	                    RegExp = /^([12][0-9][0-9][0-9])([01][0-9])([0-3][0-9])([0-2][0-9])([0-5][0-9])([0-5][0-9])/;
	                    aValue = vDateFormat.match(RegExp);
	                    if (aValue) {
	                        oReturnDate = this.oCoreDate(aValue[1], aValue[2], aValue[3], nMonthType, aValue[4], aValue[5], aValue[6]);
	                    } else {
	                        RegExp = /^([12][0-9][0-9][0-9])([01][0-9])([0-3][0-9])/;
	                        aValue = vDateFormat.match(RegExp);
	                        if (aValue) {
	                            oReturnDate = this.oCoreDate(aValue[1], aValue[2], aValue[3], nMonthType);
	                        }
	                    }
	                }
	            } else {
	                oReturnDate = this.oCoreDate(aValue[1], aValue[2], aValue[3], nMonthType, aValue[4], aValue[5], aValue[6]);
	            }
	        } else {
	            oReturnDate = this.oCoreDate(vDateFormat.nYear, vDateFormat.nMonth, vDateFormat.nDate, vDateFormat.nMonthType || 0, vDateFormat.nHour || 0, vDateFormat.nMinute || 0, vDateFormat.nSecond || 0);
	        }
	        return oReturnDate;
	    },

	    /**
	     * 표준 Date Format을 Javascript의 Date Type으로 변경하는 함수
	     * @param {Number}	vDateFormat	'yyyy-mm-dd hh:nn:ss' 형식의 변환하려는 날짜
	     * @return {object} Javascript의 Date Type
	     */
	    getJavascriptDateFormat: function(vDateFormat) {
	        var dReturnDate = null;
	        if (vDateFormat.constructor == String) {
	            var RegExp = /^([0-9]{4,})[-.]([01][0-9])[-.]([0-3][0-9]) ([0-2][0-9]):([0-5][0-9]):([0-5][0-9])/;
	            var aValue = vDateFormat.match(RegExp);
	            if (!aValue) {
	                RegExp = /^([0-9]{4,})[-.]([01][0-9])[-.]([0-3][0-9])/;
	                aValue = vDateFormat.match(RegExp);
	                if (aValue) {
	                    dReturnDate = new Date(aValue[1], Number(aValue[2]) - 1, aValue[3]);
	                } else {
	                    RegExp = /^([12][0-9][0-9][0-9])([01][0-9])([0-3][0-9])([0-2][0-9])([0-5][0-9])([0-5][0-9])/;
	                    aValue = vDateFormat.match(RegExp);
	                    if (aValue) {
	                        dReturnDate = new Date(aValue[1], Number(aValue[2]) - 1, aValue[3], aValue[4], aValue[5], aValue[6]);
	                    } else {
	                        RegExp = /^([12][0-9][0-9][0-9])([01][0-9])([0-3][0-9])/;
	                        aValue = vDateFormat.match(RegExp);
	                        if (aValue) {
	                            dReturnDate = new Date(aValue[1], Number(aValue[2]) - 1, aValue[3]);
	                        }
	                    }
	                }
	            } else {
	                dReturnDate = new Date(aValue[1], Number(aValue[2]) - 1, aValue[3], aValue[4], aValue[5], aValue[6]);
	            }
	        } else {
	            dReturnDate = new Date(vDateFormat.nYear, vDateFormat.nMonth - 1, vDateFormat.nDate, vDateFormat.nHour || 0, vDateFormat.nMinute || 0, vDateFormat.nSecond || 0);
	        }
	        return dReturnDate;
	    },

	    /**
	     * API에서 사용하는 Date Format을 표준 Date Format으로 변경하는 함수
	     * @param {Object}	oCoreDate API에서 사용하는 변환하려는 날짜
	     * @return {String} 'yyyy-mm-dd hh:nn:ss' 형식의 날짜
	     */
	    getDateFormat: function(oCoreDate) {
	        if (!oCoreDate) {
	            return oCoreDate;
	        }
	        var sYear = oCoreDate.nYear;
	        var sMonth = this.getTwoDigit(oCoreDate.nMonth);
	        var sDate = this.getTwoDigit(oCoreDate.nDate);
	        var sHour = this.getTwoDigit(oCoreDate.nHour);
	        var sMinute = this.getTwoDigit(oCoreDate.nMinute);
	        var sSecond = this.getTwoDigit(oCoreDate.nSecond);
	        return sYear + "-" + sMonth + "-" + sDate + " " + sHour + ":" + sMinute + ":" + sSecond;
	    },

	    /**
	     * API에서 사용하는 Date Format을 사용자가 원하는 Date Format으로 변경하는 함수
	     * @param {object}	oCoreDate	oCoreDate API에서 사용하는 변환하려는 날짜
	     * - 외부 노출용으로 사용한다.
	     * @param {String}	sFormat	사용자 정의 포멧
	     * - yyyy : 4자리 년도 ex)2009
	     * - yy : 2자리 년도 ex)09
	     * - mm : 2자리 월 ex)09,10
	     * - m : 1자리 월 ex)9, 10
	     * - dd : 2자리 일 ex)09, 10
	     * - d : 1자리 일 ex)9, 10
	     * - hh : 2자리 12시간 시 ex)오전 09, 오후 10
	     * - h : 1자리 12시간 시 ex)오전 9, 오후 10
	     * - HH : 2자리 24시간 시 ex) 09, 17
	     * - H : 1자리 24시간 시 ex) 9, 17
	     * - ii: 2자리 분 ex)09, 10
	     * - i : 1자리 분 ex)9, 10
	     * - ss: 2자리 초 ex)09, 10
	     * - s : 1자리 초 ex)9, 10
	     * - D: 요일 표시 ex) 월, 화		 		 
	     * @return {String} sFormat 형식의 날짜
	     */
	    getCustomDateFormat: function(oDate, sFormat) {
	        var sReplaceFormat = sFormat.replace(/(y{4})/g, oDate.nYear);
	        if (sReplaceFormat.indexOf('y') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(y{2})/g, String(oDate.nYear).substr(2, 2));
	        }
	        if (sReplaceFormat.indexOf('m') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(m{2})/g, this.getTwoDigit(oDate.nMonth));
	            sReplaceFormat = sReplaceFormat.replace(/(m)/g, oDate.nMonth);
	        }
	        if (sReplaceFormat.indexOf('d') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(d{2})/g, this.getTwoDigit(oDate.nDate));
	            sReplaceFormat = sReplaceFormat.replace(/(d)/g, oDate.nDate);
	        }
	        if (sReplaceFormat.indexOf('H') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(H{2})/g, this.getTwoDigit(oDate.nHour));
	            sReplaceFormat = sReplaceFormat.replace(/(H)/g, oDate.nHour);
	        }
	        if (sReplaceFormat.indexOf('i') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(i{2})/g, this.getTwoDigit(oDate.nMinute));
	            sReplaceFormat = sReplaceFormat.replace(/(i)/g, oDate.nMinute);
	        }
	        if (sReplaceFormat.indexOf('s') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(s{2})/g, this.getTwoDigit(oDate.nSecond));
	            sReplaceFormat = sReplaceFormat.replace(/(s)/g, oDate.nSecond);
	        }
	        if (sReplaceFormat.indexOf('D') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(D)/g, this._aDayName[this.getDay(oDate)]);
	        }
	        if (sReplaceFormat.indexOf('h') != -1) {
	            sReplaceFormat = sReplaceFormat.replace(/(h{2})/g, this.get12Hour(oDate.nHour, true));
	            sReplaceFormat = sReplaceFormat.replace(/(h)/g, this.get12Hour(oDate.nHour, false));
	        }
	        return sReplaceFormat;
	    },

	    /**
	     * 24시간 표현의 시간을 입력받아 12시간 표현으로 바꿔주는 함수
	     * - AM(PM) XX 형식으로 반환한다.
	     * - 입력값의 범위는 0~24이다.
	     * @param {Number}	nHour 변환하려는 24시간표현의 시간
	     * @param {Boolen}	bTwoDigit 2자리로 변환할때 true ex 09		 
	     * @return {String} '오전(오후) xx' 형식의 시간으로 반환. 값이 잘못되면 null을  반환한다.
	     */
	    get12Hour: function(nHour, bTwoDigit) {
	        nHour = Number(nHour);
	        if (nHour >= 0 && nHour <= 24) {
	            var sReturnValue = "";
	            var nTemp = 0;
	            if (nHour === 0 || nHour == 24) {
	                sReturnValue = "오전 ";
	                nTemp = 12;
	            } else if (nHour < 12) {
	                sReturnValue = "오전 ";
	                nTemp = nHour;
	            } else {
	                sReturnValue = "오후 ";
	                if (nHour == 12) {
	                    nTemp = nHour;
	                } else {
	                    nTemp = nHour - 12;
	                }
	            }

	            if (bTwoDigit) {
	                sReturnValue = sReturnValue + this.getTwoDigit(nTemp);
	            } else {
	                sReturnValue = sReturnValue + nTemp;
	            }
	            return sReturnValue;
	        } else {
	            return null;
	        }
	    },

	    /**
	     * 월, 일 등의 시간이 두자리로 표현해야 할 때 사용하는 함수
	     * - 원래 2자리 이상인 수는 그대로 반환한다.
	     * @param {Number}	nNum	두자리로 표현해야하는 양수.
	     * @return {String} 01~09,10,11~
	     */
	    getTwoDigit: function(nNum) {
	        var sReturnValue = null;
	        var nTmp = Number(nNum);
	        if (nTmp < 10) {
	            sReturnValue = "0" + nTmp;
	        } else {
	            sReturnValue = String(nTmp);
	        }
	        return sReturnValue;
	    },

	    /**
	     * 양력,음력 상관없이 특정월에 대한 시작 요일값을  반환하는 함수
	     * @param {Number}	nYear	년
	     * @param {Number}	nMonth	월
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달) 
	     * @return {Number} 0:일요일, 1:월요일, 2:화요일...
	     */
	    getStartDayOfMonth: function(nYear, nMonth, nMonthType) {
	        var nDate = 1;
	        var dDate = new Date(nYear, nMonth - 1, nDate);
	        return dDate.getDay();
	    },

	    /**
	     * 양력,음력 상관없이 특정 월의 마지막 날(==날짜수)을  반환하는 함수
	     * @param {Number}	nYear	년
	     * @param {Number}	nMonth	월
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달) 
	     * @return {Number} 마지막날(==날짜수)
	     */
	    getDateOfMonth: function(nYear, nMonth) {
	        if (nMonth > 12 || nMonth < 1) { //nMonth의 범위가 1~12를 벗어난 경우의 정확한 년,월을 반환하기 위한 처리
	            var dDate = new Date(nYear, nMonth - 1, 1);
	            nYear = dDate.getFullYear();
	            nMonth = dDate.getMonth() + 1;
	        }
	        var nReturnDate = 0;
	        switch (nMonth) {
	            case 1:
	            case 3:
	            case 5:
	            case 7:
	            case 8:
	            case 10:
	            case 12:
	                nReturnDate = 31;
	                break;
	            case 4:
	            case 6:
	            case 9:
	            case 11:
	                nReturnDate = 30;
	                break;
	            case 2:
	                if (nYear % 4 === 0 && nYear % 100 !== 0 || nYear % 400 === 0) {
	                    nReturnDate = 29;
	                } else {
	                    nReturnDate = 28;
	                }
	                break;
	        }
	        return nReturnDate;
	    },

	    /**
	     * 양력,음력 상관없이 기준일과 비교일 사이의 거리를 분까지 반환 하는 함수  
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {oCoreDate}	oCompareDate	비교일 object 
	     * @return {Number}	날짜간의 시간
	     */
	    getDistanceUseDateTime: function(oBasicDate, oCompareDate) {
	        var oSolarBasicDate = oBasicDate;
	        var oSloarCompareDate = oCompareDate;
	        return this._getSolarDistanceTime(oSolarBasicDate, oSloarCompareDate);
	    },

	    /**
	     * 양력,음력 상관없이  기준일과 비교일 사이의 거리를 반환 하는 함수 
	     * - 양 날짜가 같으면 0, 하루 차이나면 (+,-)1 반환
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {oCoreDate}	oCompareDate	비교일 object 
	     * @return {Number}	날짜간의 거리
	     */
	    getDistanceUseDate: function(oBasicDate, oCompareDate) {
	        var oSolarBasicDate = oBasicDate;
	        var oSloarCompareDate = oCompareDate;
	        return this._getSolarDistance(oSolarBasicDate, oSloarCompareDate);
	    },

	    /**
	     * 기준일에서 특정 거리에 있는 날을 양력,음력 중 선택해서 반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nDistance	떨어진 거리 : 오늘(0), 내일(1), 어제(-1)
	     * @param {Number}	nReturnType	반환할 날짜의 양력,음력 Type, 0:양력반환,1<:음력반환
	     * @return {Object} oCoreDate형태의 날짜
	     */
	    getDateUseDistance: function(oBasicDate, nDistance) {
	        var oSolarBasicDate = oBasicDate;
	        var oReturnDate = this._getSolarDateUseDistance(oSolarBasicDate, nDistance);
	        return oReturnDate;
	    },

	    /**
	     * 양력 두날짜 간의 기간 반환하는 함수
	     * - 양 날짜가 같으면 0, 하루 차이나면 (+,-)1
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {oCoreDate}	oCompareDate	비교일 object 
	     * @return {Number}	날짜간의 거리
	     */
	    _getSolarDistance: function(oBasicDate, oCompareDate) {
	        var dBDate = Date.UTC(oBasicDate.nYear, oBasicDate.nMonth - 1, oBasicDate.nDate);
	        var dCDate = Date.UTC(oCompareDate.nYear, oCompareDate.nMonth - 1, oCompareDate.nDate);
	        return Math.floor((dCDate - dBDate) / (1000 * 60 * 60 * 24));
	    },

	    /**
	     * 양력 두날짜 간의 기간을 분까지  반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {oCoreDate}	oCompareDate	비교일 object 
	     * @return {Number}	날짜간의 시간
	     */
	    _getSolarDistanceTime: function(oBasicDate, oCompareDate) {
	        var dBDate = Date.UTC(oBasicDate.nYear, oBasicDate.nMonth - 1, oBasicDate.nDate, oBasicDate.nHour, oBasicDate.nMinute, oBasicDate.nSecond);
	        var dCDate = Date.UTC(oCompareDate.nYear, oCompareDate.nMonth - 1, oCompareDate.nDate, oCompareDate.nHour, oCompareDate.nMinute, oCompareDate.nSecond);
	        return Math.floor((dCDate - dBDate) / (1000 * 60));
	    },

	    /**
	     * 입력받은 양력 날짜부터 입력받은 거리만큼 떨어진 날짜를 반환하는 함수
	     * - 양 날짜가 같으면 0, 하루 차이나면 (+,-)1
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nDistance	떨어진 거리 : 오늘(0), 미래(+), 과거(-)
	     * @return {Object} oCoreDate형태의 날짜 
	     */
	    _getSolarDateUseDistance: function(oBasicDate, nDistance) {
	        var dBDate = new Date(oBasicDate.nYear, oBasicDate.nMonth - 1, oBasicDate.nDate + nDistance, oBasicDate.nHour, oBasicDate.nMinute);
	        return this.getCoreDateFormat(dBDate);
	    },

	    /**
	     * 입력받은 양력 날짜부터 입력받은 분만큼 떨어진 날짜를 반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nDistance	떨어진 분 : 미래(+), 과거(-)
	     * @return {Object} oCoreDate형태의 날짜 
	     */
	    getSolarDateUseDistanceTime: function(oBasicDate, nDistance) {
	        var dBDate = new Date(oBasicDate.nYear, oBasicDate.nMonth - 1, oBasicDate.nDate, oBasicDate.nHour, oBasicDate.nMinute + nDistance);
	        return this.getCoreDateFormat(dBDate);
	    },

	    /**
	     * 입력받은 양력 날짜부터 입력받은 초만큼 떨어진 날짜를 반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nDistance	떨어진 분 : 미래(+), 과거(-)
	     * @return {Object} oCoreDate형태의 날짜 
	     */
	    getSolarDateUseDistanceTimeSecond: function(oBasicDate, nDistance) {
	        var dBDate = new Date(oBasicDate.nYear, oBasicDate.nMonth - 1, oBasicDate.nDate, oBasicDate.nHour, oBasicDate.nMinute, oBasicDate.nSecond + nDistance);
	        return this.getCoreDateFormat(dBDate);
	    },
	    /**
	     * 양력 oBasicDate부터 nLength 만큼 양력 날짜들을 반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nLength	반환해야 하는 날짜 수
	     * @return {Array} 날짜들 (oCoreDate의 배열)
	     */
	    getSolarDateList: function(oBasicDate, nLength) {
	        var aReturnDateList = [];
	        for (var i = 0; i < nLength; i++) {
	            aReturnDateList.push(this._getSolarDateUseDistance(oBasicDate, i));
	        }
	        return aReturnDateList;
	    },

	    /**
	     * 양력,음력 상관없이  oBasicDate부터 nLength 만큼 날짜들을 양력,음력 중 선택해서 반환하는 함수
	     * @param {oCoreDate}	oBasicDate	기준일 object
	     * @param {Number}	nLength	반환해야 하는 날짜 수
	     * @param {Number}	nReturnType	반환할 날짜의 양력,음력 Type, 0:양력반환,1<:음력반환
	     * @return {Array} 날짜들 (oCoreDate의 배열)
	     */
	    getDateList: function(oBasicDate, nLength) {
	        var aReturnDateList = this.getSolarDateList(oBasicDate, nLength);
	        return aReturnDateList;
	    },


	    /**
	     * 해당 날짜가 월의 몇번째 무슨 요일인지 반환하는 함수 (양력만 됨)
	     * @param {Object}	oDate	해당 날짜 객체
	     * @return {Object} 해당 날짜에 대한 정보
	     * - lunar : 음력 날짜 		 
	     * - order : 요일이  몇번째인지(1,2,3,4)
	     * - day : 무슨요일인지(0:일요일,1월요일..)
	     * - islastday : 마지막 요일인지(true/false)
	     * - islastdate : 마지막 날짜인지(treu/false)
	     */
	    getDateIndexInfo: function(oDate) { // 해당 날짜가 월의 몇번째 무슨  요일인지 반환
	        if (!oDate || oDate.nMonthType !== 0) {
	            return false;
	        }
	        var oDateInfo = {
	            'lunar': null,
	            'order': 0,
	            'day': 0,
	            'islastday': false,
	            'islastdate': false
	        };
	        var dDate = this.getJavascriptDateFormat(oDate);
	        var nLastDate = this.getDateOfMonth(oDate.nYear, oDate.nMonth);
	        oDateInfo.order = Math.floor((oDate.nDate - 1) / 7) + 1;
	        oDateInfo.day = dDate.getDay();
	        if (oDate.nDate + 7 > nLastDate) {
	            oDateInfo.islastday = true;
	        }
	        if (oDate.nDate == nLastDate) {
	            oDateInfo.islastdate = true;
	        }
	        return oDateInfo;
	    },

	    /**
	     * 월의 몇번째 무슨 요일이 몇일인지 반환하는 함수
	     * @param {Number}	nYear	년
	     * @param {Number}	nMonth	월
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달)
	     * @param {Object}	oIndexInfo	날짜 정보 {order:몇번째,day:요일(0:일요일)} 
	     * @return {Object} 해당 날짜
	     * 
	     */
	    getDateForIndexInfo: function(nYear, nMonth, nMonthType, oIndexInfo) {
	        var oFirstDate = this.oCoreDate(nYear, nMonth, 1, nMonthType);
	        var oFirstDateInfo = this.getDateIndexInfo(oFirstDate);
	        var nTmpOrder = oIndexInfo.order - 1;
	        var nDistance = 0;
	        if (oIndexInfo.day < oFirstDateInfo.day) {
	            nDistance = (7 + oIndexInfo.day) - oFirstDateInfo.day;
	        } else {
	            nDistance = oIndexInfo.day - oFirstDateInfo.day;
	        }
	        nDistance = (nTmpOrder * 7) + nDistance;
	        return this.getDateUseDistance(oFirstDate, nDistance);
	    },

	    /**
	     * 입력받은 월의 요일에 대해 마지막 날짜를 반환하는 함수. ex)양력 2010년 3월의 마지막 수요일에 해당하는 날짜를 반환
	     * @param {Number}	nYear	년
	     * @param {Number}	nMonth	월
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달)
	     * @param {Number}	nDayIndex	요일 Index 
	     * @return {Object} 해당 날짜
	     * 
	     */
	    getDateForLastDay: function(nYear, nMonth, nMonthType, nDayIndex) {
	        var nLastDate = this.getDateOfMonth(nYear, nMonth, nMonthType);
	        var oLastDate = this.oCoreDate(nYear, nMonth, nLastDate, nMonthType);
	        var oLastDateInfo = this.getDateIndexInfo(oLastDate);
	        var nDistance = 0;
	        if (nDayIndex <= oLastDateInfo.day) {
	            nDistance = oLastDateInfo.day - nDayIndex;
	        } else {
	            nDistance = (7 - nDayIndex) + oLastDateInfo.day;
	        }
	        return this.getDateUseDistance(oLastDate, -nDistance);
	    },
	    /**
	     * 해당 날짜가 무슨 요일인지 반환하는 함수
	     * 음력일 경우 양력으로 변환하여 요일을 알아내 반환한다.
	     * @param {Object}	oDate	날짜 (양력,음력)
	     * @return {Number} 요일을 반환<b> 
	     * - 0:일요일,1월요일..
	     */
	    getDay: function(oDate) {
	        var dDate = this.getJavascriptDateFormat(oDate);
	        var nReturnDay = dDate.getDay();
	        return nReturnDay;
	    },

	    /**
	     * 해당 요일의 이름을 반환하는 함수
	     * @param {Numbert}	nIndex	일요일부터 순서 0,1
	     * @return {String} this._aDayName에 정의되어 있는 요일을 반환 
	     * - 0:일,1:월..
	     */
	    getDayName: function(nIndex) {
	        return this._aDayName[nIndex];
	    },


	    /**
	     * 캘린더에서 입력받은 년,월의 시작 요일의 index를 반환하는 함수. 시작요일에 따라 같은 요일이더라도 값이 다르다.
	     * @param {Number}	nYear	년
	     * @param {Number}	nMonth	월
	     * @param {Number}	nMonthType	양력/음력 Type (0:양력, 1:음력(평달), 2:음력(윤달)
	     * @param {Number}	nStartDay	달력의 시작 요일 0:일요일, 1:월요일...
	     * @return {Number} 시작 요일의 index 
	     */
	    getStartDayIndexOfMonth: function(nYear, nMonth, nMonthType, nStartDay) {
	        var daysLen = 7;
	        var nReturnDay = this.getStartDayOfMonth(nYear, nMonth, nMonthType);
	        var tmpIndex = nStartDay;
	        if (tmpIndex >= daysLen) {
	            tmpIndex = 0;
	        }
	        nReturnDay = nReturnDay - tmpIndex;
	        if (nReturnDay < 0) {
	            nReturnDay = daysLen + nReturnDay;
	        }
	        var nNextMonthIndex = nReturnDay + this.getDateOfMonth(nYear, nMonth, nMonthType);
	        if (nReturnDay === 0 && nNextMonthIndex == 28) {
	            nReturnDay = 7;
	        }
	        return nReturnDay;
	    },

	    /**
	     * 기준날짜를 가지고 range(month기준)를 줘서 return 값을 받는다.
	     * @param htBaseDate 기준날짜
	     * @param nDirection 1이면 앞으로 -1이면 뒤로
	     * @param nRange month 수
	     * @return {Object} 해당날짜
	     */
	    getDateAnotherMonth: function(htBaseDate, nDirection, nRange) {
	        var nMoveDate = this.getDateOfMonth(htBaseDate.nYear, htBaseDate.nMonth + (nDirection * nRange));
	        if (nMoveDate > htBaseDate.nDate) {
	            nMoveDate = htBaseDate.nDate;
	        }
	        var dTmpDate = new Date(htBaseDate.nYear, (htBaseDate.nMonth + (nDirection * nRange)) - 1, nMoveDate);
	        var htReturnDate = this.getCoreDateFormat(dTmpDate);
	        return htReturnDate;
	    }
	};
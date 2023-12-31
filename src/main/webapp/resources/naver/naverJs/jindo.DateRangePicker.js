/*
 * 2개의 날짜(시작, 종료일)을 보여주고 이동하게 하는 컴포넌트 
 */
jindo.DateRangePicker = jindo.$Class({
    _QUICK_TODAY_CLASS: "_quick_today",
    _QUICK_DAY_CLASS: "_quick_day",
    _QUICK_INDAY_CLASS: "_quick_inday",
    _QUICK_WEEK_CLASS: "_quick_week",
    _QUICK_INWEEK_CLASS: "_quick_inweek",
    _QUICK_MONTH_CLASS: "_quick_month",
    _QUICK_INMONTH_CLASS: "_quick_inmonth",
    _QUICK_YEAR_CLASS: "_quick_year",
    _QUICK_INYEAR_CLASS: "_quick_inyear",
    _DAY_CALENDAR_TEMPLATE: '<div class="_day_calendar_template uio_calendar" style="display:none;">' +
        '<div class="top">' +
        '<a href="#" class="calendar-btn-prev-year"><span class="blind">맨처음</span></a>' +
        '<a href="#" class="calendar-btn-prev-mon"><span class="blind">이전</span></a>' +
        '<strong class="calendar-title"></strong>' +
        '<a href="#" class="calendar-btn-next-mon"><span class="blind">다음</span></a>' +
        '<a href="#" class="calendar-btn-next-year"><span class="blind">이전</span></a>' +
        '</div>' +
        '<div class="middle">' +
        '<table cellspacing="0" border="1">' +
        '<caption>달력</caption>' +
        '<col width="14%"><col width="14%"><col width="14%"><col width="14%"><col width="14%"><col width="14%"><col>' +
        '<thead><tr><th scope="col">일</th><th scope="col">월</th><th scope="col">화</th><th scope="col">수</th><th scope="col">목</th><th scope="col">금</th><th scope="col">토</th></tr></thead>' +
        '<tbody><tr class="calendar-week">' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '<td><a href="#" class="calendar-date"></a></td>' +
        '</tr></tbody>' +
        '</table>' +
        '<div class="_textarea btm"></div>' +
        '</div>' +
        '<!-- [D] IE 6에서 셀렉트박스가 레이어를 뚫고 올라오는 문제를 해결하기 위해 추가 --><!--[if lte IE 6.0]><iframe title="레이어 백그라운드" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" class="ifr_layer"></iframe><![endif]-->' +
        '</div>',
    _DAY_CALENDAR_TEMPLATE_TEXTAREA: '<span>일간 : 최근 3개월이내</span>',
    _htElement: null,
    _htEventHandler: null,
    _htEventData: null,
    _htStartSet: null,
    _htEndSet: null,
    _htQuickClass: null,
    _htHighlightList: null,
    _htUnselectList: null,
    _htSelectedQuickButton: null,
    _htDisableDate: null,
    _oDatePicker: null,
    _oPeriodDisplay: null,
    _bSetBaseDate: null,
    _bForce: null,
    _bQuickButtonEvent: null,
    _bQuickButtonDisable: null,
    /** 
     * @param {HashTable}	htOption	옵션값
     * "vToday":null,					// (선택) 오늘날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 없으면 클라이언트 값으로 세팅됨
     * "vStartDate":null,				// (필수) 처음 적용될 시작날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
     * "vEndDate":null,					// (선택) 처음 적용될 종료날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
     * "vtSelectableDateFrom" : null,	// (선택) 달력 앞쪽 제한 날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
     * "vtSelectableDateTo" : null,		// (선택) 달력 뒤쪽 제한 날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
     * "elQuick" : null,				// (선택) Quick 버튼 입력을 위한 버튼을 감싼 ul element. 하위 버튼들은 li element에 규칙이 있는 css class를 가지고 있어야 한다.
     * 											"_quick_today", "_quick_day", "_quick_week", "_quick_month", "_quick_year", "_quick_inweek", "_quick_inmonth", "_quick_inyear" 를 가질 수 있다.
     * 											"_quick_month_3" 처럼 "_숫자"를 붙일 수 있다. 숫자가 붙으면 배수만금 계산된다. "_quick_month_3"은 3개월이 된다.
     * 											"_quick_inweek" 처럼 "in"이 붙으면 해당 날짜가 포함된 주(1주,2주...), 월(1개월,2개월...), 년(1년,2년...) 기간이 된다.
     * "elStartDate" : null,			// (선택) 시작날짜 관련 element(날짜 inputbox, 달력 버튼, 시간 selectbox)를 감싼 element, input 없이 button만 사용할 경우에는 "elStartDateBtn" 옵션에 button element를 적어주면 된다.
     *											날짜 inputbox :  "elStartDate" 옵션 element안에 있는 첫번째 input element
     *											달력 버튼 : "elStartDate" 옵션 element안에 있는 "_btn" css class를 가지는 첫번째 element
     *											시간 selectbox : "elStartDate" 옵션 element안에 있는 첫번째 select element
     * "elEndDate" : null,				// (선택) 종료날짜 관련 element(날짜 inputbox, 달력 버튼, 시간 selectbox)를 감싼 element, input 없이 button만 사용할 경우에는 "elEndDateBtn" 옵션에 button element를 적어주면 된다.
     *											날짜 inputbox :  "elEndDate" 옵션 element안에 있는 첫번째 input element
     *											달력 버튼 : "elEndDate" 옵션 element안에 있는 "_btn" css class를 가지는 첫번째 element
     *											시간 selectbox : "elStartDate" 옵션 element안에 있는 첫번째 select element
     * "elStartDateBtn" : null,			// (선택) 시작날짜 달력을 띄우는 element. "elStartDate" 옵션과 함께 사용할 경우에도 달력을 띄우는 버튼은 "elStartDateBtn"가 적용된다.
     * "elEndDateBtn" : null,			// (선택) 종료날짜 달력을 띄우는 element. "elEndDate" 옵션과 함께 사용할 경우에도 달력을 띄우는 버튼은 "elEndDateBtn"가 적용된다.
     * "elImgFont" : null,				// (선택) 날짜를 image font로 보여주는 경우 해당 영역을 감싸는 element. start,end 구분 없이 1개이며 안에 달력을 띄우는 버튼이 있으면 자동으로 선택된다.
     * 											달력 버튼 : "elImgFont" 옵션 element안에 있는 "_btn" css class를 가지는 element 2개중 첫번째가 start, 두번째가 end가 된다.
     * 											이전, 이후 이동 버튼이 안에 있으면 자동으로 찾는다.
     * 											이전 이동 : "elImgFont" 옵션 element안에 있는 "_prev" css class를 가지는 element
     * 											이후 이동 : "elImgFont" 옵션 element안에 있는 "_next" css class를 가지는 element
     * "elPrev" : null,					// (선택) 이전 이동 element : "elImgFont" 옵션 element안에 있는 "_prev"가 있어도 "elPrev"가 우선이다.
     * "elNext" : null,					// (선택) 이후 이동 element : "elImgFont" 옵션 element안에 있는 "_next"가 있어도 "elNext"가 우선이다. 
     * "sDateFormat" : "yyyy.mm.dd",	// (선택) 날짜 inputbox에 들어가는 날짜 형식. 없으면 디폴드로 "yyyy.mm.dd"가 적용된다. "elImgFont" 사용시에는 무조건 "yyyy.mm.dd" 형식이 된다. 
     * "vQuickBaseDate"			// (선택) quick 버튼이 동작할 기준이 되는 날짜. 이 날짜가 포함된 일, 주, 월로 이동한다. 없으면 현재 보여지는 날짜를 기준으로 동작한다. sQuickTypeMode값이 Past면 퀵버튼 클릭시 종료일에 반영된다.
     * "sQuickTypeMode"			// (선택) quick 버튼이 동작할 범위. "Past":퀵버튼 이동 기준이 종료일 기준으로 시작일이 퀵버튼의 기간만큼 변경(과거 범위), "Past"가 아닌 다른 문자는 시작일을 기준으로 종료일이 기간만큼 변경된다(미래 범위), 없으면 "Past"가 적용된다.
     * "sDefaultQuickType" : null, 		// (선택) 처음 로딩시 적용될 Quick버튼의 css class명. "vStartDate","vEndDate"가 있어도 적용된다.
     * "bUseTime" : false				// (선택) 시간까지 사용하는 경우 true로 세팅. 없으면 false가 적용된다. true인 경우 시간 selectbox가 있어야 한다.
     * "bUseHighlight" : false			// (선택) 달력에 Highlight 표시를 사용여부. 사용할 경우 true 
     * "aHighlightDateList" : null		// (선택) highlight 될 날짜들의 배열 [{htDateList},{htDateList},...]
     * 											htDateList ={
     * 														vStartDate:블럭 시작 날짜
     * 														vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * 														nLength : 시작일 포함 블럭 길이
     * 											}
     * "bUseUnselectDate" : false			// (선택) 달력에 선택 안됨 표시를 사용여부. 사용할 경우 true 
     * "aUnselectBlockList" : null		// (선택) unselectable 될 날짜들의 배열 [{htDateList},{htDateList},...]
     * 											htDateList ={
     * 														vStartDate:블럭 시작 날짜
     * 														vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * 														nLength : 시작일 포함 블럭 길이
     * 											} 
     * "sCalendarText" :  //(선택) 달력에 나오는 Text, text를 아예 노출하지 않아야 하면 ""로 값을 세팅
     * "bActivateOnload" : true		// (선택) 컴포넌트 처음 생성시 Activate 유무
     * "bUseMinusSecond" : true		// (선택) 결과값 반환시 EndDate값을 -1초한 것으로 반환할지 여부   ture:-1초 사용
     * "bHideDate"	: false			// (선택) 처음 로딩시 input안의 값을 보일지 여부. Start,End가 동시에 적용된다.
     * "bKeepQuickButton" : false	// (선택) 퀵버튼 사용시 버튼 클릭됨을 항상유지. ex) 1주일을 클릭하고 시작,종료일의 간경이 1주일이 아니더라도 버튼 클릭됨을 유지 및 1주일 단위로 블럭이동
     * "bKeepDateForInit" : false		// (선택) bKeepQuickButton 옵션 사용시 로딩시 sDefaultQuickType를 통해 값 세팅을 하지 않아야 하는 경우에 true로 사용하는 변수
     * "sDisableDate" : ""			// (선택) 로딩시 시작날짜, 종료날짜 element들을 disable 처리하는 옵션 "start","end","all",
     * "sQuickActiveClass" :"on"	// (선택) 퀵버튼 활성화 class name 디폴트로 "on"
     * 	"htLayerPosition" :  // (선택) LayerPosition을 위한 옵션 jindo의 LayerPosition 옵션과 같음. 아래의 옵션중 필요한 부분만 적으면 됨. 다 적을 필요 없음 ex) top값만 바꾸려면 htLayerPosition:{nTop: 5}
     * 			sPosition : "outside-bottom",		// (선택) 레이어가 정상적으로 뜰때 날짜 inputbox를 기준으로 떠야 하는 위치 지정
     * 			sAlign : "left",							// (선택) 가로 위치
     * 			sValign : "",						 		// (선택) 세로 위치
     * 			nTop : 0,									// (선택) 상하로 좀더 움직일 픽셀 (+ :하단 방향, - 상단 방향)
     * 			nLeft : 0,									// (선택) 좌우로 좀더 움직일 픽셀 (+ :우측 방향, - 좌측 방향)
     * 			bAuto: true								// (선택) 브라우져에 걸려서 제 위치에 노출이 불가능할 경우 자동으로 날짜 inputbox의 반대 방향에 노출
     * 		}
     * 	"sCalendarSelectColor" : ""	//(선택) 활성화되는 색상 없으면 css에 정의된 default 색상이 반영됨
     */
    $init: function(htOption) {
        this._htElement = {};
        this._htEventHandler = {};
        this._htEventData = {};
        this._htStartSet = null;
        this._htEndSet = null;
        this._htQuickClass = {};
        this._htHighlightList = {};
        this._htUnselectList = {};
        this._htSelectedQuickButton = null;
        this._oDatePicker = null;
        this._oPeriodDisplay = null;
        this._htDisableDate = {
            'start': false,
            'end': false
        };
        this._bSetBaseDate = false;
        this._bForce = false;
        this._bQuickButtonEvent = false;
        this._bQuickButtonDisable = false;
        this.option({
            "htToday": null, // (선택) 오늘날짜. 입력은 vToday로  5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 없으면 클라이언트 값으로 세팅됨
            "htStartDate": null, // (필수) 시작날짜. 입력은 vStartDate 로 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 
            "htEndDate": null, // (필수) 종료날짜. 입력은 vEndDate 로 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
            "htSelectableDateFrom": null, // (선택) 입력은 vSelectableDateFrom 로 받음
            "htSelectableDateTo": null, // (선택) 입력은 vSelectableDateTo 로 받음
            "htQuickBaseDate": null, // (선택) 입력은 vQuickBaseDate 로 받음
            "elQuick": null, // Quick 버튼 입력을 위한 버튼을 감싼 ul element, 없으면 
            "elStartDate": null, // 시작날짜 관련 element(input, button등)를 감싼 element
            "elEndDate": null, // 종료날짜 관련 element(input, button등)를 감싼 element
            "elStartDateBtn": null, // 시작날짜 관련 element(input, button등)를 감싼 element
            "elEndDateBtn": null,
            "elImgFont": null,
            "elPrev": null,
            "elNext": null,
            "sDateFormat": "yyyy.mm.dd",
            "sQuickTypeMode": "Past",
            "sDefaultQuickType": null, // css class명 
            "bUseTime": false,
            "bUseHighlight": false, // (선택) highlight 기능 유무
            "aHighlightDateList": null, // (선택) highlight 될 날짜들의 배열
            "bUseUnselectDate": false, // (선택) unselectable 기능 유무
            "aUnselectDateList": null, // (선택) unselectable 될 날짜들의 배열			
            "sCalendarText": this._DAY_CALENDAR_TEMPLATE_TEXTAREA, //(선택) 캘린더에 노출되는 추가 Text. 없으면 default로 세팅 
            "bActivateOnload": true, // (선택) 컴포넌트 처음 생성시 Activate 유무
            "bUseMinusSecond": true, // (선택) 결과값 반환시 EndDate값을 -1초한 것으로 반환할지 여부
            "bHideDate": false,
            "bKeepQuickButton": false,
            "bKeepDateForInit": false,
            "sDisableDate": "",
            "sQuickActiveClass": "on", // (선택)퀵버튼 활성화 class
            "htLayerPosition": { // (선택) LayerPosition을 위한 옵션
                sPosition: "outside-bottom",
                sAlign: "left",
                sValign: "",
                nTop: 0,
                nLeft: 0,
                bAuto: true
            },
            "sCalendarSelectColor": "" //(선택) 활성화되는 색상 없으면 css에 정의된 default 색상이 반영됨
        });
        this.option(this._setPreOption(htOption, true));
        this._setUseTime(this.option("bUseTime"));
        if (this.option("elQuick")) {
            this._setQuickElementAndAttach();
        }
        this._setDateElementAndAttach();
        if (this.option("sDefaultQuickType")) {
            this._setQuickType(this.option("sDefaultQuickType"), true);
        } else {
            this._changeDate();
        }
        if (this.option("bUseHighlight") && this.option("aHighlightDateList")) {
            this.setHighlight(this.option("aHighlightDateList"));
        }
        if (this.option("bUseUnselectDate") && this.option("aUnselectDateList")) {
            this.setUnselectDate(this.option("aUnselectDateList"));
        }
        if (this.option("bHideDate")) {
            this.hideDate();
        }
        if (this.option("sDisableDate")) {
            this.disableDate(this.option("sDisableDate"));
        }
        if (this.option("bActivateOnload")) {
            this.activate(); //컴포넌트를 활성화한다.
        }
    },

    _setPreOption: function(htOption, bInit) {
        if (htOption.vToday) {
            htOption.htToday = DateCoreAPI.getCoreDateFormat(htOption.vToday);
        } else if (bInit) {
            htOption.htToday = DateCoreAPI.getCoreDateFormat(new Date());
        }

        if (htOption.vStartDate) {
            htOption.htStartDate = DateCoreAPI.getCoreDateFormat(htOption.vStartDate);
        }
        if (htOption.vEndDate) {
            htOption.htEndDate = DateCoreAPI.getCoreDateFormat(htOption.vEndDate);
        } else if (htOption.vStartDate) { // htOption.vStartDate 미 할당시 스크립트 오류가 발생함으로 추가함 - 박종욱
            htOption.htEndDate = DateCoreAPI.getCoreDateFormat(htOption.vStartDate);
        }

        if (htOption.vSelectableDateFrom) {
            htOption.htSelectableDateFrom = DateCoreAPI.getCoreDateFormat(htOption.vSelectableDateFrom);
        } else {
            htOption.htSelectableDateFrom = null;
        }
        if (htOption.vSelectableDateTo) {
            htOption.htSelectableDateTo = DateCoreAPI.getCoreDateFormat(htOption.vSelectableDateTo);
        } else {
            htOption.htSelectableDateTo = null;
        }
        if (htOption.vQuickBaseDate) {
            htOption.htQuickBaseDate = DateCoreAPI.getCoreDateFormat(htOption.vQuickBaseDate);
        }
        if (htOption.elImgFont) {
            htOption.bUseTime = false;
            htOption.sDateFormat = "yyyy.mm.dd";
        }

        if (typeof htOption.sCalendarText != "undefined") {
            htOption.sCalendarText = this._makeTemplateText(htOption.sCalendarText);
        } else if (bInit) {
            htOption.sCalendarText = this._DAY_CALENDAR_TEMPLATE_TEXTAREA;
        }
        return htOption;
    },

    _makeTemplateText: function(sText) {
        var sReturnValue = null;
        if (sText == "") {
            sReturnValue = sText;
        } else {
            sReturnValue = '<span>' + sText + '</span>';
        }
        return sReturnValue;
    },

    _setUseTime: function(bUse) {
        if (bUse) {
            if (this.option("htEndDate")) {
                this.option("htEndDate", this._changeEndDate(this.option("htEndDate")));
            }
            if (this.option("htSelectableDateTo")) {
                this.option("htSelectableDateTo", this._changeEndDate(this.option("htSelectableDateTo")));
            }
        } else {
            if (this.option("htSelectableDateFrom")) {
                var htSelectableDateFrom = this.option("htSelectableDateFrom");
                htSelectableDateFrom.nHour = 0;
                htSelectableDateFrom.nMinute = 0;
                htSelectableDateFrom.nSecond = 0;
                this.option("htSelectableDateFrom", htSelectableDateFrom);
            }
            if (this.option("htSelectableDateTo")) {
                var htSelectableDateTo = this.option("htSelectableDateTo");
                htSelectableDateTo.nHour = 23;
                htSelectableDateTo.nMinute = 59;
                htSelectableDateTo.nSecond = 59;
                this.option("htSelectableDateTo", htSelectableDateTo);
            }
        }
    },

    /**
     * x:59:59의 시간을 x+1:00:00로 변경해주는 함수
     * @param	{Object}	oDate		Object Type의 날짜
     * @return	{Object}	변경된 Object Type의 날짜
     */
    _changeEndDate: function(htDate) {
        if (htDate.nSecond == 59) {
            var htTmpDate = DateCoreAPI.getSolarDateUseDistanceTimeSecond(htDate, 1);
            return htTmpDate;
        } else {
            return htDate;
        }
    },

    _setQuickElementAndAttach: function() {
        this._htElement["elQuick"] = jindo.$Element(this.option("elQuick"));
        var aQuick = jindo.cssquery("li", this._htElement["elQuick"].$value());
        var sQuickType = null;
        for (var i = 0, nLen = aQuick.length; i < nLen; i++) {
            var welQuick = jindo.$Element(aQuick[i]);
            var htRangeInfo = this._findRangeInfo(welQuick.className().split(" "));
            if (htRangeInfo) {
                sQuickType = htRangeInfo.sQuickType + htRangeInfo.nRange;
                this._htElement["quick_" + sQuickType] = welQuick;
                this._htElement["quick_" + sQuickType + "_a"] = welQuick.query("a");
                this._attachQuickEvent("quick_" + sQuickType + "_a", htRangeInfo);
                this._htQuickClass[sQuickType] = {
                    'sQuickType': htRangeInfo.sQuickType,
                    'nRange': htRangeInfo.nRange
                };
            }
        }
    },

    _setQuickType: function(sQuickType, bInit) {
        var htRangeInfo = this._findRangeInfo([sQuickType]);
        if (bInit) {
            this._htSelectedQuickButton = {
                "sQuickType": htRangeInfo.sQuickType,
                "nRange": htRangeInfo.nRange
            };
            if (this.option("bKeepQuickButton") && this.option("bKeepDateForInit")) {
                this._changeDate();
                return false;
            }
        }
        this["_set" + htRangeInfo.sQuickType](htRangeInfo.nRange);
    },

    _findRangeInfo: function(aClassName) {
        var htReturnValue = null;
        var sQuickType = null;
        var sRange = null;
        for (var i = 0; i < aClassName.length; i++) {
            if (aClassName[i].indexOf(this._QUICK_TODAY_CLASS) === 0) {
                sQuickType = "Today";
                sRange = aClassName[i].substr(this._QUICK_TODAY_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_DAY_CLASS) === 0) {
                sQuickType = "Day";
                sRange = aClassName[i].substr(this._QUICK_DAY_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_WEEK_CLASS) === 0) {
                sQuickType = "Week";
                sRange = aClassName[i].substr(this._QUICK_WEEK_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_MONTH_CLASS) === 0) {
                sQuickType = "Month";
                sRange = aClassName[i].substr(this._QUICK_MONTH_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_YEAR_CLASS) === 0) {
                sQuickType = "Year";
                sRange = aClassName[i].substr(this._QUICK_YEAR_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_INDAY_CLASS) === 0) {
                sQuickType = "InDay";
                sRange = aClassName[i].substr(this._QUICK_INDAY_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_INWEEK_CLASS) === 0) {
                sQuickType = "InWeek";
                sRange = aClassName[i].substr(this._QUICK_INWEEK_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_INMONTH_CLASS) === 0) {
                sQuickType = "InMonth";
                sRange = aClassName[i].substr(this._QUICK_INMONTH_CLASS.length + 1, 3);
                break;
            } else if (aClassName[i].indexOf(this._QUICK_INYEAR_CLASS) === 0) {
                sQuickType = "InYear";
                sRange = aClassName[i].substr(this._QUICK_INYEAR_CLASS.length + 1, 3);
                break;
            }
        }

        if (sQuickType) {
            htReturnValue = {
                "sQuickType": sQuickType,
                "nRange": (sRange) ? parseInt(sRange, 10) : 1
            };
        }
        return htReturnValue;
    },

    _findQuickButton: function(htBaseDate, htTargetDate, nDirection) {
        var htReturnValue = null;
        var htQuickTargetDate = null;
        var sFindClass = "";
        var dQuickTargetDate = null;
        var bToday = (DateCoreAPI.getDistanceUseDate(this.option("htToday"), htBaseDate) === 0) ? true : false;
        var bValidatedBaseDate = null;

        for (var x in this._htQuickClass) {
            bValidatedBaseDate = true;
            htQuickTargetDate = null;
            switch (this._htQuickClass[x].sQuickType) {
                case "Today":
                    htQuickTargetDate = DateCoreAPI.getCoreDateFormat(htBaseDate);
                    break;
                case "Day":
                case "InDay":
                    htQuickTargetDate = this._getTargetDateForDay(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    break;
                case "Week":
                    htQuickTargetDate = this._getTargetDateForWeek(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    break;
                case "Month":
                    htQuickTargetDate = this._moveMonth(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    break;
                case "Year":
                    htQuickTargetDate = this._moveYear(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    break;
                case "InWeek":
                    var htInWeekValue = this._getDateForInWeek(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    bValidatedBaseDate = (DateCoreAPI.getDistanceUseDate(htBaseDate, htInWeekValue.htBaseDate) === 0) ? true : false;
                    htQuickTargetDate = htInWeekValue.htTargetDate;
                    break;
                case "InMonth":
                    var htinMonthValue = this._getDateForInMonth(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    bValidatedBaseDate = (DateCoreAPI.getDistanceUseDate(htBaseDate, htinMonthValue.htBaseDate) === 0) ? true : false;
                    htQuickTargetDate = htinMonthValue.htTargetDate;
                    break;
                case "InYear":
                    var htInYearValue = this._getDateForInYear(htBaseDate, nDirection, this._htQuickClass[x].nRange);
                    bValidatedBaseDate = (DateCoreAPI.getDistanceUseDate(htBaseDate, htInYearValue.htBaseDate) === 0) ? true : false;
                    htQuickTargetDate = htInYearValue.htTargetDate;
                    break;
            }
            if (bValidatedBaseDate && DateCoreAPI.getDistanceUseDate(htQuickTargetDate, htTargetDate) === 0) {
                sFindClass = x;
                break;
            }
        }
        if (sFindClass && (this._htQuickClass[sFindClass].sQuickType != "Today" || bToday)) {
            htReturnValue = {
                'sQuickType': this._htQuickClass[sFindClass].sQuickType,
                'nRange': this._htQuickClass[sFindClass].nRange
            };
        }
        return htReturnValue;
    },

    _attachQuickEvent: function(sName, htRangeInfo) {
        var fSetRange = jindo.$Fn(this["_set" + htRangeInfo.sQuickType], this);
        this._htEventHandler[sName] = jindo.$Fn(fSetRange.bind(htRangeInfo.nRange), this).attach(this._htElement[sName], "click");
        this._htEventData[sName] = {
            "element": this._htElement[sName],
            "event": "click"
        };
    },

    _setDateElementAndAttach: function() {
        this._setCalendarSelectColor(this.option("sCalendarSelectColor"));
        this._setDateElement();
        this._attachDateElement();

        if (this.option("elImgFont")) {
            this._oPeriodDisplay = new jindo.PeriodDisplay(jindo.$Element(this.option("elImgFont")).$value());
            if (this.option("htStartDate") && this.option("htEndDate")) {
                this._oPeriodDisplay.set(this.option("htStartDate"), this.option("htEndDate"));
            }
        }
        this._createDatePicker();
    },

    _setDateElement: function() {
        this._htElement["day_calendar"] = jindo.cssquery.getSingle("._day_calendar_template");
        if (!this._htElement["day_calendar"]) {
            this._htElement["day_calendar"] = jindo.$Element(jindo.$Template(this._DAY_CALENDAR_TEMPLATE).process()).$value();
            document.body.appendChild(this._htElement["day_calendar"]);
        } else {
            var aElDayTd = jindo.cssquery("td", this._htElement["day_calendar"]);
            for (var i = 0, nDayLen = aElDayTd.length; i < nDayLen; i++) {
                aElDayTd[i].className = "";
            }
        }
        this._htElement["day_calendar_textarea"] = jindo.$Element(jindo.cssquery.getSingle("._textarea", this._htElement["day_calendar"]));

        if (this.option("elImgFont")) {
            var aButtonElement = jindo.cssquery("._btn", jindo.$Element(this.option("elImgFont")).$value());
            if (this.option("elStartDateBtn")) {
                this._htElement["elStartDate_button"] = jindo.$Element(this.option("elStartDateBtn")).$value();
            } else {
                this._htElement["elStartDate_button"] = aButtonElement[0];
            }
            if (this.option("elEndDateBtn")) {
                this._htElement["elEndDate_button"] = jindo.$Element(this.option("elEndDateBtn")).$value();
            } else {
                this._htElement["elEndDate_button"] = aButtonElement[1];
            }
        } else {
            var welStartDate = jindo.$Element(this.option("elStartDate"));
            if (welStartDate) {
                this._htElement["elStartDate_input"] = welStartDate.query("input");
            }
            if (this.option("elStartDateBtn")) {
                this._htElement["elStartDate_button"] = jindo.$Element(this.option("elStartDateBtn")).$value();
            } else if (welStartDate) {
                this._htElement["elStartDate_button"] = welStartDate.query("._btn");
            }
            if (this.option("bUseTime")) {
                var aStartSelectList = welStartDate.queryAll("select");
                this._htElement["elStartDate_hour"] = aStartSelectList[0];
                if (aStartSelectList.length > 1) {
                    this._htElement["elStartDate_minute"] = aStartSelectList[1];
                }
            }

            var welEndDate = jindo.$Element(this.option("elEndDate"));
            if (welEndDate) {
                this._htElement["elEndDate_input"] = welEndDate.query("input");
            }
            if (this.option("elEndDateBtn")) {
                this._htElement["elEndDate_button"] = jindo.$Element(this.option("elEndDateBtn")).$value();
            } else if (welEndDate) {
                this._htElement["elEndDate_button"] = welEndDate.query("._btn");
            }
            if (welEndDate && this.option("bUseTime")) {
                var aEndSelectList = welEndDate.queryAll("select");
                this._htElement["elEndDate_hour"] = aEndSelectList[0];
                if (aEndSelectList.length > 1) {
                    this._htElement["elEndDate_minute"] = aEndSelectList[1];
                }
            }
        }

        var welImgFont = jindo.$Element(this.option("elImgFont"));
        if (this.option("elPrev")) {
            this._htElement["elPrev"] = jindo.$Element(this.option("elPrev")).$value();
        } else if (welImgFont) {
            this._htElement["elPrev"] = welImgFont.query("._prev");
        }

        if (this.option("elNext")) {
            this._htElement["elNext"] = jindo.$Element(this.option("elNext")).$value();
        } else if (welImgFont) {
            this._htElement["elNext"] = welImgFont.query("._next");
        }
    },

    _setCalendarSelectColor: function(sCalendarSelectColor) {
        if (sCalendarSelectColor && !jindo.cssquery.getSingle("._calendar_change_select_style")) {
            var sCss = ".uio_calendar .middle td.calendar-selected a,.uio_calendar .middle td.calendar-over a{background-color:" + sCalendarSelectColor + ";text-decoration:none}";
            var elStyle = jindo.$("<style>");
            jindo.$Element(jindo.$$.getSingle("head")).append(elStyle);
            if (elStyle.styleSheet) {
                elStyle.styleSheet.cssText = sCss; // IE method
            } else {
                jindo.$Element(elStyle).text(sCss); // others
            }
            jindo.$Element(elStyle).attr("class", "_calendar_change_select_style");
        }
    },

    _attachDateElement: function() {
        if (this._htElement["elStartDate_input"]) {
            this._htEventHandler["elStartDate_input"] = jindo.$Fn(this._onClickDate, this).attach(this._htElement["elStartDate_input"], "click");
            this._htEventData["elStartDate_input"] = {
                "element": this._htElement["elStartDate_input"],
                "event": "click"
            };
        }
        if (this._htElement["elStartDate_button"]) {
            this._htEventHandler["elStartDate_button"] = jindo.$Fn(this._onClickDate, this).attach(this._htElement["elStartDate_button"], "click");
            this._htEventData["elStartDate_button"] = {
                "element": this._htElement["elStartDate_button"],
                "event": "click"
            };
        }

        if (this._htElement["elEndDate_input"]) {
            this._htEventHandler["elEndDate_input"] = jindo.$Fn(this._onClickDate, this).attach(this._htElement["elEndDate_input"], "click");
            this._htEventData["elEndDate_input"] = {
                "element": this._htElement["elEndDate_input"],
                "event": "click"
            };
        }
        if (this._htElement["elEndDate_button"]) {
            this._htEventHandler["elEndDate_button"] = jindo.$Fn(this._onClickDate, this).attach(this._htElement["elEndDate_button"], "click");
            this._htEventData["elEndDate_button"] = {
                "element": this._htElement["elEndDate_button"],
                "event": "click"
            };
        }

        if (this._htElement["elStartDate_hour"]) {
            this._htEventHandler["elStartDate_hour"] = jindo.$Fn(this._changeDate, this).attach(this._htElement["elStartDate_hour"], "change");
            this._htEventData["elStartDate_hour"] = {
                "element": this._htElement["elStartDate_hour"],
                "event": "change"
            };
        }
        if (this._htElement["elEndDate_hour"]) {
            this._htEventHandler["elEndDate_hour"] = jindo.$Fn(this._changeDate, this).attach(this._htElement["elEndDate_hour"], "change");
            this._htEventData["elEndDate_hour"] = {
                "element": this._htElement["elEndDate_hour"],
                "event": "change"
            };
        }

        if (this._htElement["elStartDate_minute"]) {
            this._htEventHandler["elStartDate_minute"] = jindo.$Fn(this._changeDate, this).attach(this._htElement["elStartDate_minute"], "change");
            this._htEventData["elStartDate_minute"] = {
                "element": this._htElement["elStartDate_minute"],
                "event": "change"
            };
        }
        if (this._htElement["elEndDate_minute"]) {
            this._htEventHandler["elEndDate_minute"] = jindo.$Fn(this._changeDate, this).attach(this._htElement["elEndDate_minute"], "change");
            this._htEventData["elEndDate_minute"] = {
                "element": this._htElement["elEndDate_minute"],
                "event": "change"
            };
        }

        if (this._htElement["elPrev"]) {
            this._htEventHandler["elPrev"] = jindo.$Fn(jindo.$Fn(this._moveBlock, this).bind(-1)).attach(this._htElement["elPrev"], "click");
            this._htEventData["elPrev"] = {
                "element": this._htElement["elPrev"],
                "event": "click"
            };
        }

        if (this._htElement["elNext"]) {
            this._htEventHandler["elNext"] = jindo.$Fn(jindo.$Fn(this._moveBlock, this).bind(1)).attach(this._htElement["elNext"], "click");
            this._htEventData["elNext"] = {
                "element": this._htElement["elNext"],
                "event": "click"
            };
        }
    },
    /**
     * 레이어에서  사용하는 이벤트를 Detach 하는 함수
     */
    _detachEvent: function() {
        for (var x in this._htEventHandler) {
            this._htEventHandler[x].detach(this._htEventData[x]["element"], this._htEventData[x]["event"]);
        }
    },

    _createDatePicker: function() {
        jindo.Calendar.setToday(this.option("htToday").nYear, this.option("htToday").nMonth, this.option("htToday").nDate);
        var htParam = {
            'bUseLayerPosition': true,
            'Calendar': {
                'bDrawOnload': false,
                'sTitleFormat': "yyyy.mm"
            },
            'LayerManager': {
                'sCheckEvent': "click",
                'nShowDelay': 0,
                'nHideDelay': 0
            },
            'LayerPosition': {
                sPosition: "outside-bottom",
                sAlign: "left",
                nTop: 0,
                nLeft: 0,
                bAuto: true
            },
            'htCustomEventHandler': {
                'click': jindo.$Fn(this._checkDatePickerClick, this).bind(),
                'beforeDraw': jindo.$Fn(this._checkBeforeDraw, this).bind(),
                'afterDraw': jindo.$Fn(this._setCalendarAfterDraw, this).bind(),
                'select': jindo.$Fn(this._changeDate, this).bind()
            }
        };

        var htLayerPositionParam = this.option("htLayerPosition");
        for (x in htLayerPositionParam) {
            htParam["LayerPosition"][x] = htLayerPositionParam[x];
        }
        this._oDatePicker = new jindo.DatePicker(this._htElement["day_calendar"], htParam);

        this._addDatePicker();
        this._oDatePicker.getLayerManager().attach({
            'hide': jindo.$Fn(this._onHideCalendar, this).bind()
        });
        this._deactiveDatePicker();
    },

    _setDatePicker: function() {
        jindo.Calendar.setToday(this.option("htToday").nYear, this.option("htToday").nMonth, this.option("htToday").nDate);
        this._oDatePicker.removeDatePickerSet(this._htStartSet);
        this._oDatePicker.removeDatePickerSet(this._htEndSet);
        this._addDatePicker();
        this._deactiveDatePicker();
    },

    _makeDayPickerSet: function(sDateType) {
        var htDatePickerSet = {
            'htOption': {
                'bReadOnly': true,
                'bDefaultSet': false,
                'sDateFormat': this.option("sDateFormat")
            }
        };
        if (this._htElement["el" + sDateType + "_input"]) {
            htDatePickerSet['elInput'] = this._htElement["el" + sDateType + "_input"];
        }
        if (this._htElement["el" + sDateType + "_button"]) {
            htDatePickerSet['elButton'] = this._htElement["el" + sDateType + "_button"];
            if (!this._htElement["el" + sDateType + "_input"]) {
                htDatePickerSet['elLayerPosition'] = this._htElement["el" + sDateType + "_button"];
            }
        }

        if (this.option("htSelectableDateFrom")) {
            htDatePickerSet['htOption']['htSelectableDateFrom'] = this.option("htSelectableDateFrom");
        }
        if (this.option("htSelectableDateTo")) {
            htDatePickerSet['htOption']['htSelectableDateTo'] = this.option("htSelectableDateTo");
        }
        if (this.option("ht" + sDateType)) {
            htDatePickerSet['htOption']['bDefaultSet'] = true;
            htDatePickerSet['htOption']['nYear'] = this.option("ht" + sDateType).nYear;
            htDatePickerSet['htOption']['nMonth'] = this.option("ht" + sDateType).nMonth;
            htDatePickerSet['htOption']['nDate'] = this.option("ht" + sDateType).nDate;
            if (this._htElement["el" + sDateType + "_hour"]) {
                this._htElement["el" + sDateType + "_hour"].value = this.option("ht" + sDateType).nHour;
            }
            if (this._htElement["el" + sDateType + "_minute"]) {
                this._htElement["el" + sDateType + "_minute"].value = this.option("ht" + sDateType).nMinute;
            }
        }
        return htDatePickerSet;
    },

    _addDatePicker: function() {
        var htStartSet = this._makeDayPickerSet("StartDate");
        var htEndSet = this._makeDayPickerSet("EndDate");
        this._htStartSet = htStartSet;
        this._htEndSet = htEndSet;
        this._oDatePicker.addDatePickerSet(htStartSet);
        this._oDatePicker.addDatePickerSet(htEndSet);
    },

    _deactiveDatePicker: function() {
        this._oDatePicker.deactivate();
        var aDatePickerSet = this._oDatePicker.getDatePickerSet();
        for (var i = 0, len = aDatePickerSet.length; i < len; i++) {
            if (aDatePickerSet[i].elInput) {
                this._oDatePicker._wfClickLinkedElement.detach(aDatePickerSet[i].elInput, "click");
            }
            if (aDatePickerSet[i].elButton) {
                this._oDatePicker._wfClickLinkedElement.detach(aDatePickerSet[i].elButton, "click");
            }
        }
    },

    _setQuickEvnet: function(weEvent, sQuickType, nRange) {
        if (weEvent) {
            weEvent.stop();
            if (!this._bIsActivating || this._bQuickButtonDisable) {
                return false;
            }
            this._bQuickButtonEvent = true;
            this._htSelectedQuickButton = {
                "sQuickType": sQuickType,
                "nRange": nRange
            };
        }
        return true;
    },

    _setToday: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "Today", nRange)) {
            return false;
        }
        this._bSetBaseDate = true;
        this._oDatePicker.setDate(this._htStartSet, this.option("htToday"));
        this._bSetBaseDate = false;
        this._oDatePicker.setDate(this._htEndSet, this.option("htToday"));
    },

    _setPickerDate: function(htChangeQuickInfo, htBaseDate, htTargetDate) {
        var htBaseCheckDate = this._checkMaxMinDate(htBaseDate);
        var htTargetCheckDate = this._checkMaxMinDate(htTargetDate);
        htBaseDate = (htBaseCheckDate) ? htBaseCheckDate : htBaseDate;
        htTargetDate = (htTargetCheckDate) ? htTargetCheckDate : htTargetDate;
        if (htChangeQuickInfo.htBaseDatePickerSet) {
            this._bSetBaseDate = true;
            this._oDatePicker.setDate(htChangeQuickInfo.htBaseDatePickerSet, htBaseDate);
            this._bSetBaseDate = false;
        } else {
            var elBaseInput = null;
            if (htChangeQuickInfo.nDirection > 0) {
                elBaseInput = this._htElement["elStartDate_input"];
            } else {
                elBaseInput = this._htElement["elEndDate_input"];
            }
            if (elBaseInput.value == "") {
                elBaseInput.value = DateCoreAPI.getCustomDateFormat(htBaseDate, this.option("sDateFormat"));
            }
        }

        this._oDatePicker.setDate(htChangeQuickInfo.htChangeDatePickerSet, htTargetDate);
    },

    _setInDay: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "InDay", nRange)) {
            return false;
        }
        this._setSubForDay(nRange);
    },

    _setDay: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "Day", nRange)) {
            return false;
        }
        this._setSubForDay(nRange);
    },

    _setSubForDay: function(nRange) {
        var htChangeQuickInfo = this._getChangeQuickInfo();
        var htTargetDate = this._getTargetDateForDay(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htChangeQuickInfo.htBaseDate, htTargetDate);
    },

    _getTargetDateForDay: function(htBaseDate, nDirection, nRange) {
        var dTargetDate = DateCoreAPI.getJavascriptDateFormat(htBaseDate);
        dTargetDate.setDate(htBaseDate.nDate + (nRange - 1) * nDirection); //-1은 시작일을 포함한 기간을 가져아 하므로.. 
        return DateCoreAPI.getCoreDateFormat(dTargetDate);
    },

    _setWeek: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "Week", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo();
        var htTargetDate = this._getTargetDateForWeek(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htChangeQuickInfo.htBaseDate, htTargetDate);
    },

    _getTargetDateForWeek: function(htBaseDate, nDirection, nRange) {
        var dTargetDate = DateCoreAPI.getJavascriptDateFormat(htBaseDate);
        dTargetDate.setDate(htBaseDate.nDate + (((nRange * 7) - 1) * nDirection)); //-1은 시작일을 포함한 기간을 가져야 하므로...
        return DateCoreAPI.getCoreDateFormat(dTargetDate);
    },

    _setMonth: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "Month", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo();
        var htTargetDate = this._moveMonth(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htChangeQuickInfo.htBaseDate, htTargetDate);
    },

    _setYear: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "Year", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo();
        var htTargetDate = this._moveYear(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htChangeQuickInfo.htBaseDate, htTargetDate);
    },

    _setInWeek: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "InWeek", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo(true);
        var htDateValue = this._getDateForInWeek(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htDateValue.htBaseDate, htDateValue.htTargetDate);
    },

    _getDateForInWeek: function(htOriginBaseDate, nDirection, nRange) {
        var nBaseDay = DateCoreAPI.getDay(htOriginBaseDate);
        if (nBaseDay === 0) {
            nBaseDay = 7;
        }
        var htBaseDate = null;
        if (nDirection > 0) { // base가 시작일
            htBaseDate = DateCoreAPI.getDateUseDistance(htOriginBaseDate, 1 - nBaseDay);
        } else {
            htBaseDate = DateCoreAPI.getDateUseDistance(htOriginBaseDate, 7 - nBaseDay);
        }
        var dTargetDate = DateCoreAPI.getJavascriptDateFormat(htBaseDate);
        dTargetDate.setDate(htBaseDate.nDate + (((nRange * 7) - 1) * nDirection));
        var htTargetDate = DateCoreAPI.getCoreDateFormat(dTargetDate);
        return {
            'htBaseDate': htBaseDate,
            'htTargetDate': htTargetDate
        };
    },

    _setInMonth: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "InMonth", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo(true);
        var htDateValue = this._getDateForInMonth(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htDateValue.htBaseDate, htDateValue.htTargetDate);
    },

    _getDateForInMonth: function(htOriginBaseDate, nDirection, nRange) {
        var htBaseDate = null;
        var htTargetDate = null;
        var dTmpDate = null;
        if (nDirection > 0) { // base가 시작일
            htBaseDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear, htOriginBaseDate.nMonth, 1);
            dTmpDate = new Date(htBaseDate.nYear, (htBaseDate.nMonth + (nDirection * (nRange - 1))) - 1, 1);
            htTargetDate = DateCoreAPI.getCoreDateFormat(dTmpDate);
            htTargetDate.nDate = DateCoreAPI.getDateOfMonth(htTargetDate.nYear, htTargetDate.nMonth);
        } else {
            var nDate = DateCoreAPI.getDateOfMonth(htOriginBaseDate.nYear, htOriginBaseDate.nMonth);
            htBaseDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear, htOriginBaseDate.nMonth, nDate);
            dTmpDate = new Date(htBaseDate.nYear, (htBaseDate.nMonth + (nDirection * (nRange - 1))) - 1, 1);
            htTargetDate = DateCoreAPI.getCoreDateFormat(dTmpDate);
        }
        return {
            'htBaseDate': htBaseDate,
            'htTargetDate': htTargetDate
        };
    },

    _setInYear: function(nRange, weEvent) {
        if (!this._setQuickEvnet(weEvent, "InYear", nRange)) {
            return false;
        }
        var htChangeQuickInfo = this._getChangeQuickInfo(true);
        var htDateValue = this._getDateForInYear(htChangeQuickInfo.htBaseDate, htChangeQuickInfo.nDirection, nRange);
        this._setPickerDate(htChangeQuickInfo, htDateValue.htBaseDate, htDateValue.htTargetDate);
    },

    _getDateForInYear: function(htOriginBaseDate, nDirection, nRange) {
        var htBaseDate = null;
        var htTargetDate = null;
        var dTmpDate = null;
        if (nDirection > 0) { // base가 시작일
            htBaseDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear, 1, 1);
            htTargetDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear + (nRange - 1), 12, 31);
        } else {
            htBaseDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear, 12, 31);
            htTargetDate = DateCoreAPI.oCoreDate(htOriginBaseDate.nYear - (nRange - 1), 1, 1);
        }
        return {
            'htBaseDate': htBaseDate,
            'htTargetDate': htTargetDate
        };
    },

    _changeSelectedQuickButton: function(htQuickInfo) {
        this.removeSelectedQuickButton();
        if (htQuickInfo && this._htElement["quick_" + htQuickInfo.sQuickType + htQuickInfo.nRange]) {
            this._htElement["quick_" + htQuickInfo.sQuickType + htQuickInfo.nRange].addClass(this.option("sQuickActiveClass"));
        }
    },

    removeSelectedQuickButton: function() {
        var elOn = this._htElement["elQuick"].query("li." + this.option("sQuickActiveClass"));
        if (elOn) {
            jindo.$Element(elOn).removeClass(this.option("sQuickActiveClass"));
        }
    },

    _getChangeQuickInfo: function(bReturnBase) {
        var htBaseDatePickerSet = null;
        var htChangeDatePickerSet = null;
        var nDirection = null;

        if (this.option("sQuickTypeMode") == "Past") {
            htBaseDatePickerSet = this._htEndSet;
            htChangeDatePickerSet = this._htStartSet;
            nDirection = -1;
        } else {
            htBaseDatePickerSet = this._htStartSet;
            htChangeDatePickerSet = this._htEndSet;
            nDirection = 1;
        }
        var htBaseDate = (this.option("htQuickBaseDate")) ? this.option("htQuickBaseDate") : DateCoreAPI.getCoreDateFormat(this._oDatePicker.getDate(htBaseDatePickerSet));
        var htReturnValue = {
            'htBaseDate': htBaseDate,
            'htBaseDatePickerSet': (this.option("htQuickBaseDate") || bReturnBase) ? htBaseDatePickerSet : null,
            'htChangeDatePickerSet': htChangeDatePickerSet,
            'nDirection': nDirection
        };
        return htReturnValue;
    },

    _isCanCalendarMove: function(htDate) {
        var bReturnValue = true;
        var nDate = DateCoreAPI.getDateOfMonth(htDate.nYear, htDate.nMonth);
        var htStartDate = DateCoreAPI.oCoreDate(htDate.nYear, htDate.nMonth, 1);
        var htEndDate = DateCoreAPI.oCoreDate(htDate.nYear, htDate.nMonth, nDate);

        if ((this.option("htSelectableDateFrom") && DateCoreAPI.getDistanceUseDate(this.option("htSelectableDateFrom"), htEndDate) < 0) || (this.option("htSelectableDateTo") && DateCoreAPI.getDistanceUseDate(htStartDate, this.option("htSelectableDateTo")) < 0)) {
            bReturnValue = false;
        }
        return bReturnValue;
    },

    _moveBlock: function(nDirection, weEvent) {
        if (weEvent) {
            weEvent.stop();
            if (!this._bIsActivating) {
                return false;
            }
        }
        var htStartPickerDate = DateCoreAPI.getCoreDateFormat(this._oDatePicker.getDate(this._htStartSet));
        var htEndPickerDate = DateCoreAPI.getCoreDateFormat(this._oDatePicker.getDate(this._htEndSet));

        if (this.option("bKeepQuickButton") && this._htSelectedQuickButton && this._htSelectedQuickButton.sQuickType.indexOf("In") === 0) {
            this._moveInCase(htStartPickerDate, htEndPickerDate, nDirection);
        } else {
            this._moveDefaultCase(htStartPickerDate, htEndPickerDate, nDirection);
        }
    },

    _moveInCase: function(htStartPickerDate, htEndPickerDate, nDirection) {
        var htBaseSet = null;
        var htBaseDate = null;
        var htTargetDate = null;
        var htNewBaseDate = null;
        if (this.option("sQuickTypeMode") == "Past") {

            htBaseSet = this._htEndSet;
            htBaseDate = htEndPickerDate;
            htTargetDate = htStartPickerDate;
        } else {
            htBaseSet = this._htStartSet;
            htBaseDate = htStartPickerDate;
            htTargetDate = htEndPickerDate;
        }
        switch (this._htSelectedQuickButton.sQuickType) {
            case "InDay":
                htNewBaseDate = DateCoreAPI.getDateUseDistance(htBaseDate, nDirection * this._htSelectedQuickButton.nRange);
                break;
            case "InWeek":
                htNewBaseDate = DateCoreAPI.getDateUseDistance(this._getTargetDateForWeek(htBaseDate, nDirection, this._htSelectedQuickButton.nRange), nDirection);
                break;
            case "InMonth":
                htNewBaseDate = this._moveMonth(htBaseDate, nDirection, this._htSelectedQuickButton.nRange);
                break;
            case "InYear":
                htNewBaseDate = DateCoreAPI.getDateUseDistance(this._moveYear(htBaseDate, nDirection, this._htSelectedQuickButton.nRange), 0);
                break;
        }

        var htLimitedDate = this._checkMaxMinDate(htNewBaseDate);

        if (htLimitedDate) {
            htNewBaseDate = htLimitedDate;
        }
        if (htLimitedDate && DateCoreAPI.getDistanceUseDate(htTargetDate, htNewBaseDate) === 0 || DateCoreAPI.getDistanceUseDate(htBaseDate, htNewBaseDate) === 0) {
            return false;
        }
        this._bSetBaseDate = true;

        this._oDatePicker.setDate(htBaseSet, htNewBaseDate);
        this._bSetBaseDate = false;
        var sQuickType = "_quick_" + this._htSelectedQuickButton.sQuickType.toLowerCase() + "_" + this._htSelectedQuickButton.nRange;
        this._setQuickType(sQuickType);
    },

    _moveDefaultCase: function(htStartPickerDate, htEndPickerDate, nDirection) {
        var nMoveLength = DateCoreAPI.getDistanceUseDate(htStartPickerDate, htEndPickerDate) + 1;
        var htMoveDate = null;
        if (nDirection > 0) {
            htMoveDate = DateCoreAPI.getDateUseDistance(htEndPickerDate, nDirection * nMoveLength);
        } else {
            htMoveDate = DateCoreAPI.getDateUseDistance(htStartPickerDate, nDirection * nMoveLength);
        }
        if (this._checkMaxMinDate(htMoveDate)) {
            return false;
        } else {
            var htStartDate = DateCoreAPI.getDateUseDistance(htStartPickerDate, nDirection * nMoveLength);
            var htEndDate = DateCoreAPI.getDateUseDistance(htEndPickerDate, nDirection * nMoveLength);
            this._bSetBaseDate = true;
            this._oDatePicker.setDate(this._htStartSet, htStartDate);
            this._bSetBaseDate = false;
            this._oDatePicker.setDate(this._htEndSet, htEndDate);
        }
    },

    _moveYear: function(htBaseDate, nDirection, nRange) {
        var nMoveDate = DateCoreAPI.getDateOfMonth(htBaseDate.nYear + (nDirection * nRange), htBaseDate.nMonth);
        if (nMoveDate > htBaseDate.nDate) {
            nMoveDate = htBaseDate.nDate;
        }
        var dTmpDate = new Date(htBaseDate.nYear + (nDirection * nRange), htBaseDate.nMonth - 1, nMoveDate);
        var htReturnDate = DateCoreAPI.getCoreDateFormat(dTmpDate);
        return htReturnDate;
    },

    _moveMonth: function(htBaseDate, nDirection, nRange) {
        var nMoveDate = DateCoreAPI.getDateOfMonth(htBaseDate.nYear, htBaseDate.nMonth + (nDirection * nRange));
        if (nMoveDate > htBaseDate.nDate) {
            nMoveDate = htBaseDate.nDate;
        }
        var dTmpDate = new Date(htBaseDate.nYear, (htBaseDate.nMonth + (nDirection * nRange)) - 1, nMoveDate);
        var htReturnDate = DateCoreAPI.getCoreDateFormat(dTmpDate);
        return htReturnDate;
    },

    _setCalendarMoveClass: function(bDisable, el) {
        var wel = jindo.$Element(el);
        wel.removeClass("off");
        if (!bDisable) {
            wel.addClass("off");
        }
    },

    /**
     * 컴포넌트를 활성화한다.
     */
    _onActivate: function() {
        if (!this._htDisableDate["start"]) {
            this._disableDateElement("StartDate", false);
        }

        if (!this._htDisableDate["end"]) {
            this._disableDateElement("EndDate", false);
        }
    },

    /**
     * 컴포넌트를 비활성화한다.
     */
    _onDeactivate: function() {
        this._disableDateElement("StartDate", true);
        this._disableDateElement("EndDate", true);
    },

    _onClickDate: function(weEvent) {
        weEvent.stop(jindo.$Event.CANCEL_DEFAULT);
        if (!this._bIsActivating) {
            return false;
        }
        var htValue = this.getValue();
        var elCurrnet = weEvent.currentElement;
        if (elCurrnet == this._htElement["elStartDate_input"] || elCurrnet == this._htElement["elStartDate_button"]) {
            htValue.sDateType = "start";
        } else if (elCurrnet == this._htElement["elEndDate_input"] || elCurrnet == this._htElement["elEndDate_button"]) {
            htValue.sDateType = "end";
        }
        if (this._htDisableDate[htValue.sDateType]) {
            return false;
        }
        htValue.weEvent = weEvent;
        if (this._bForce || this.fireEvent("click", htValue)) {
            this._bForce = false;
            this._oDatePicker.activate();
            this._oDatePicker._onClickLinkedElement(weEvent);
        }
    },

    _onHideCalendar: function(oCustomEvent) {
        this._oDatePicker.deactivate();
    },

    _checkDatePickerClick: function(oCustomEvent) {
        var htDatePickerSet = this._oDatePicker.getDatePickerSet(oCustomEvent.element);
        var htDate = this._oDatePicker.getDate(htDatePickerSet);
        if (!this._isCanCalendarMove(htDate)) {
            oCustomEvent.stop();
        }
    },

    _checkBeforeDraw: function(oCustomEvent) {
        var htDate = DateCoreAPI.getCoreDateFormat(oCustomEvent);
        if (!this._isCanCalendarMove(htDate)) {
            oCustomEvent.stop();
        }
        if (this.option("sCalendarText") == "") {
            this._htElement["day_calendar_textarea"].hide();
        } else {
            this._htElement["day_calendar_textarea"].html(this.option("sCalendarText")).show();
        }
    },

    _setCalendarAfterDraw: function(oCustomEvent) {
        var htDate = DateCoreAPI.getCoreDateFormat(oCustomEvent);
        var oCalendar = this._oDatePicker.getCalendar();
        this._setCalendarMoveClass(this._isCanCalendarMove(this._moveYear(htDate, -1, 1)), oCalendar.elBtnPrevYear);
        this._setCalendarMoveClass(this._isCanCalendarMove(this._moveMonth(htDate, -1, 1)), oCalendar.elBtnPrevMonth);
        this._setCalendarMoveClass(this._isCanCalendarMove(this._moveMonth(htDate, 1, 1)), oCalendar.elBtnNextMonth);
        this._setCalendarMoveClass(this._isCanCalendarMove(this._moveYear(htDate, 1, 1)), oCalendar.elBtnNextYear);

        if (this.option("bUseHighlight") || this.option("bUseUnselectDate")) {
            var htCalendarStartDate = DateCoreAPI.getDateUseDistance(htDate, -DateCoreAPI.getStartDayIndexOfMonth(htDate.nYear, htDate.nMonth, 0, 0));
            var nCalendarDateLength = jindo.Calendar.getWeeks(htDate.nYear, htDate.nMonth) * 7;
            var aDateList = DateCoreAPI.getDateList(htCalendarStartDate, nCalendarDateLength);
            var aDateElement = jindo.cssquery("td", oCalendar.elWeekAppendTarget);
            var sDate = null;
            for (var i = 0, nLen = aDateList.length; i < nLen; i++) {
                sDate = DateCoreAPI.getCustomDateFormat(aDateList[i], "yyyy-mm-dd");
                if (this._htUnselectList[sDate]) {
                    jindo.$Element(aDateElement[i]).addClass(oCalendar.option("sClassPrefix") + "unselectable");
                }
                if (this._htHighlightList[sDate]) {
                    jindo.$Element(aDateElement[i]).addClass(oCalendar.option("sClassPrefix") + "highlight");
                }
            }
        }
    },

    _changeDate: function(oCustonEvent) {
        var htStartPickerDate = this._oDatePicker.getDate(this._htStartSet);
        var htEndPickerDate = this._oDatePicker.getDate(this._htEndSet);
        if (!htStartPickerDate || !htEndPickerDate) {
            return false;
        }
        var nStartHour = (this._htElement["elStartDate_hour"]) ? parseInt(this._htElement["elStartDate_hour"].value, 10) : 0;
        var nEndHour = (this._htElement["elEndDate_hour"]) ? parseInt(this._htElement["elEndDate_hour"].value, 10) : 0;
        var nStartMinute = (this._htElement["elStartDate_minute"]) ? parseInt(this._htElement["elStartDate_minute"].value, 10) : 0;
        var nEndMinute = (this._htElement["elEndDate_minute"]) ? parseInt(this._htElement["elEndDate_minute"].value, 10) : 0;

        var htStartDate = DateCoreAPI.oCoreDate(htStartPickerDate.nYear, htStartPickerDate.nMonth, htStartPickerDate.nDate, 0, nStartHour, nStartMinute);
        var htEndDate = DateCoreAPI.oCoreDate(htEndPickerDate.nYear, htEndPickerDate.nMonth, htEndPickerDate.nDate, 0, nEndHour, nEndMinute);

        var htCheckStartDate = this._checkMaxMinDate(htStartDate);
        if (htCheckStartDate) {
            if (this._htElement["elStartDate_hour"]) {
                if (this._htElement["elStartDate_minute"]) {
                    var nStartMinute = htCheckStartDate.nMinute;
                    if (nStartMinute > 10) {
                        var sStartMinute = String(htCheckStartDate.nMinute);
                        var nStartTempMinute = parseInt(sStartMinute.charAt(1), 10);
                        if (nStartTempMinute > 0) {
                            htCheckStartDate = DateCoreAPI.getSolarDateUseDistanceTime(htCheckStartDate, 10 - nStartTempMinute);
                        }
                    } else if (nStartMinute > 0) {
                        htCheckStartDate.nMinute = 10;
                    }
                    this._htElement["elStartDate_minute"].value = htCheckStartDate.nMinute;
                } else {
                    if (htCheckStartDate.nMinute) {
                        htCheckStartDate = DateCoreAPI.getSolarDateUseDistanceTime(htCheckStartDate, 60);
                        htCheckStartDate.nMinute = 0;
                    }
                }
                htCheckStartDate.nSecond = 0;
                this._htElement["elStartDate_hour"].value = htCheckStartDate.nHour;
            }
            this._oDatePicker.setDate(this._htStartSet, htCheckStartDate); //DatePicker에 값을 세팅하면 다시 changeDate가 발생한다.
            return false;
        }
        var htCheckEndDate = this._checkMaxMinDate(htEndDate);
        if (htCheckEndDate) {
            if (this._htElement["elEndDate_hour"]) {
                if (this._htElement["elEndDate_minute"]) {
                    var nEndMinute = htCheckEndDate.nMinute;
                    if (nEndMinute >= 10) {
                        var sEndMinute = String(htCheckEndDate.nMinute);
                        var nEndTempMinute = parseInt(sEndMinute.charAt(1), 10);
                        if (nEndTempMinute > 0) {
                            htCheckEndDate = DateCoreAPI.getSolarDateUseDistanceTime(htCheckEndDate, (-nEndTempMinute));
                        }
                    } else {
                        htCheckEndDate.nMinute = 0;
                    }
                    this._htElement["elEndDate_minute"].value = htCheckEndDate.nMinute;
                }
                this._htElement["elEndDate_hour"].value = htCheckEndDate.nHour;
            }
            this._oDatePicker.setDate(this._htEndSet, htCheckEndDate); //DatePicker에 값을 세팅하면 다시 changeDate가 발생한다.
            return false;
        }

        if (!this._bSetBaseDate) {
            var nCompare = DateCoreAPI.getDistanceUseDate(htStartDate, htEndDate);
            if (nCompare === 0) {
                if (this.option("bUseTime")) {
                    this._changeTime();
                }
            } else if (nCompare < 0) {
                this._oDatePicker.setDate(this._htEndSet, htStartDate); //DatePicker에 값을 세팅하면 다시 changeDate가 발생한다.
                return false;
            }
            if (this.option("elImgFont")) {
                this._oPeriodDisplay.set(htStartDate, htEndDate);
            }

            var htDateValue = this.getValue();
            var htQuickInfo = this._getQuickInfo(htStartDate, htEndDate);

            if (htQuickInfo) {
                if (this.option("bKeepQuickButton") && this._htSelectedQuickButton) {
                    htQuickInfo.sQuickType = this._htSelectedQuickButton.sQuickType;
                    htQuickInfo.nRange = this._htSelectedQuickButton.nRange;
                }
                this._changeSelectedQuickButton(htQuickInfo);

                if (htQuickInfo.sQuickType) {
                    htQuickInfo.sQuickType = htQuickInfo.sQuickType.toLowerCase();
                }
            }
            var htResult = {
                'htStartDate': htDateValue.htStartDate,
                'htEndDate': htDateValue.htEndDate,
                'htQuickInfo': htQuickInfo,
                'oCustonEvent': oCustonEvent
            };
            this.fireEvent("change", htResult);
            this._bQuickButtonEvent = false;
        }
    },

    _getQuickInfo: function(htStartDate, htEndDate) {
        var htReturnValue = null;
        if (this._htElement["elQuick"]) {
            htReturnValue = {
                'bQuickButtonEvent': this._bQuickButtonEvent
            };
            var htTempInfo = (this.option("sQuickTypeMode") == "Past") ? this._findQuickButton(htEndDate, htStartDate, -1) : this._findQuickButton(htStartDate, htEndDate, 1);

            if (htTempInfo) {
                htReturnValue.sQuickType = htTempInfo.sQuickType;
                htReturnValue.nRange = htTempInfo.nRange;
            }
        }
        return htReturnValue;
    },

    _checkMaxMinDate: function(htBaseDate) {
        var htChangeDate = null;
        if (this.option("htSelectableDateFrom") && DateCoreAPI.getDistanceUseDateTime(this.option("htSelectableDateFrom"), htBaseDate) < 0) {
            htChangeDate = DateCoreAPI.getCoreDateFormat(this.option("htSelectableDateFrom"));
        } else if (this.option("htSelectableDateTo") && DateCoreAPI.getDistanceUseDateTime(htBaseDate, this.option("htSelectableDateTo")) < 0) {
            htChangeDate = DateCoreAPI.getCoreDateFormat(this.option("htSelectableDateTo"));
        }
        return htChangeDate;
    },

    /**
     * 같은 날짜의 시작시간과 끝 시간을 비교하는 함수
     */
    _changeTime: function() {
        var nStartHour = parseInt(((this._htElement["elStartDate_hour"]) ? this._htElement["elStartDate_hour"].value : 0), 10);
        var nEndHour = parseInt(((this._htElement["elEndDate_hour"]) ? this._htElement["elEndDate_hour"].value : 23), 10);
        if (nStartHour < nEndHour) {
            return false;
        }
        if (nStartHour > nEndHour) {
            this._htElement["elEndDate_hour"].value = nStartHour;
        }
        var nStartMinute = parseInt(((this._htElement["elStartDate_minute"]) ? this._htElement["elStartDate_minute"].value : 0), 10);
        var nEndMinute = parseInt(((this._htElement["elEndDate_minute"]) ? this._htElement["elEndDate_minute"].value : 59), 10);
        if (nStartMinute > nEndMinute) {
            this._htElement["elEndDate_minute"].value = nStartMinute;
        }
    },

    /** 
	 * @param {HashTable}	htOption	옵션값
	 * "vToday"					// (선택) 오늘날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 없으면 클라이언트 값으로 세팅됨 
	 * "vStartDate"				// (선택) 적용될 시작날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음,
	 * "vEndDate"				// (선택) 적용될 종료날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 
	 * "vSelectableDateFrom"	// (선택) 달력 앞쪽 제한 날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
	 * "vSelectableDateTo"		// (선택) 달력 뒤쪽 제한 날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음
	 * "sDateFormat"			// (선택) 날짜 inputbox에 들어가는 날짜 형식. 없으면 디폴드로 "yyyy.mm.dd"가 적용된다. "elImgFont" 사용시에는 무조건 "yyyy.mm.dd"가 된다.
	 * "vQuickBaseDate"			// (선택) quick 버튼이 동작할 기준이 되는 날짜. 이 날짜가 포함된 일, 주, 월로 이동한다. 없으면 현재 보여지는 날짜를 기준으로 동작한다. sQuickTypeMode값이 Past면 퀵버튼 클릭시 종료일에 반영된다.
	 * "sQuickTypeMode"			// (선택) quick 버튼이 동작할 범위. "Past":퀵버튼 이동 기준이 종료일 기준으로 시작일이 퀵버튼의 기간만큼 변경(과거 범위), "Past"가 아닌 다른 문자는 시작일을 기준으로 종료일이 기간만큼 변경된다(미래 범위), 없으면 "Past"가 적용된다.    
	 * "bUseHighlight"			// (선택) 달력에 Highlight 표시를 사용여부. 사용할 경우 true
  
	 * "aHighlightDateList"		// (선택) highlight 될 날짜들의 배열 [{htDateList},{htDateList},...]
	 *					htDateList ={
	 *						vStartDate:블럭 시작 날짜
	 *						vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
	 *						nLength : 시작일 포함 블럭 길이
	 *					}
	 * "sCalendarText"			//(선택) 달력에 나오는 Text, text를 아예 노출하지 않아야 하면 ""로 값을 세팅
	 */
    setOption: function(htOption) {
        var htDateValue = this.getValue(true);
        if (typeof htOption.vStartDate == "undefined") {
            htOption.vStartDate = htDateValue.htStartDate;
        }
        if (typeof htOption.vEndDate == "undefined") {
            htOption.vEndDate = htDateValue.htEndDate;
        }

        if (typeof htOption.vSelectableDateFrom == "undefined") {
            htOption.vSelectableDateFrom = this.option("htSelectableDateFrom");
        }

        if (typeof htOption.vSelectableDateTo == "undefined") {
            htOption.vSelectableDateTo = this.option("htSelectableDateTo");
        }

        this.option(this._setPreOption(htOption, false));
        this._setUseTime(this.option("bUseTime"));
        if (this.option("bUseHighlight") && this.option("aHighlightDateList")) {
            this.setHighlight(this.option("aHighlightDateList"));
        }
        if (this.option("bUseUnselectDate") && this.option("aUnselectDateList")) {
            this.setUnselectDate(this.option("aUnselectDateList"));
        }
        this._setDatePicker();
        this._changeDate();
    },

    /** 
     * 시작, 종료일 값을 세팅하는 함수
     * @param {Variant}	vStartDate	적용될 시작날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음,
     * @param {Variant}	vEndDate	적용될 종료날짜. 입력은 5가지 형식(javascript Date,{nYear:2010,nMonth:1,nDate:13,nHour:14,nMinute:13,nSecond:0},"2010-01-13 14:13:00","2010.01.13 14:13:00","20100113141300")으로 받을 수 있음, 
     */
    setValue: function(vStartDate, vEndDate) {
        var htStartDate = DateCoreAPI.getCoreDateFormat(vStartDate);
        var htEndDate = DateCoreAPI.getCoreDateFormat(vEndDate);
        if (this._htElement["elStartDate_hour"]) {
            this._htElement["elStartDate_hour"].value = htStartDate.nHour;
        }
        if (this._htElement["elStartDate_minute"]) {
            this._htElement["elStartDate_minute"].value = htStartDate.nMinute;
        }

        this._bSetBaseDate = true;
        this._oDatePicker.setDate(this._htStartSet, htStartDate);
        this._bSetBaseDate = false;

        if (this._htElement["elEndDate_hour"]) {
            this._htElement["elEndDate_hour"].value = htEndDate.nHour;
        }
        if (this._htElement["elEndDate_minute"]) {
            this._htElement["elEndDate_minute"].value = htEndDate.nMinute;
        }

        this._oDatePicker.setDate(this._htEndSet, htEndDate);
        return this;
    },

    /** 
     * 시작, 종료일 값을 반환하는 함수
     * @return {HashTable}	{htStartDate :시작 날짜 값,htEndDate:종료 날짜 값} 화면의 값을 반환한다.
     * htStartDate :{nYear,nMonth,nDate,nHour,nMinute,nSecond}형식
     * htEndDate :{nYear,nMonth,nDate,nHour,nMinute,nSecond}형식
     *            시간옵션을 사용하지 않으면 종료날짜의 23:59:59로 세팅된다.
     *            시간옵션을 사용하면 1초를 뺀 값이 반환된다. 화면에서 01:00:00라면 반환되는 값은 00:59:59가 된다.
     */
    getValue: function(bSetOption) {
        var htStartPickerDate = this._oDatePicker.getDate(this._htStartSet);
        var htEndPickerDate = this._oDatePicker.getDate(this._htEndSet);
        if (!htStartPickerDate || !htEndPickerDate) {
            return false;
        }

        var nStartHour = (this._htElement["elStartDate_hour"]) ? parseInt(this._htElement["elStartDate_hour"].value, 10) : 0;
        var nStartMinute = (this._htElement["elStartDate_minute"]) ? parseInt(this._htElement["elStartDate_minute"].value, 10) : 0;
        var htStartDate = DateCoreAPI.oCoreDate(htStartPickerDate.nYear, htStartPickerDate.nMonth, htStartPickerDate.nDate, 0, nStartHour, nStartMinute);

        var nEndHour = 23;
        var nEndMinute = 59;
        var nEndSecond = 59;
        var htEndDate = DateCoreAPI.oCoreDate(htEndPickerDate.nYear, htEndPickerDate.nMonth, htEndPickerDate.nDate, 0, nEndHour, nEndMinute, nEndSecond);
        if (this._htElement["elEndDate_hour"]) {
            nEndHour = parseInt(this._htElement["elEndDate_hour"].value, 10);
            nEndMinute = (this._htElement["elEndDate_minute"]) ? parseInt(this._htElement["elEndDate_minute"].value, 10) : 0;
            nEndSecond = 0;
            htEndDate = DateCoreAPI.oCoreDate(htEndPickerDate.nYear, htEndPickerDate.nMonth, htEndPickerDate.nDate, 0, nEndHour, nEndMinute, nEndSecond);
            if (DateCoreAPI.getDistanceUseDateTime(htStartDate, htEndDate) > 0) {
                htEndDate = DateCoreAPI.getSolarDateUseDistanceTimeSecond(htEndDate, -1);
            }
        }
        if (!bSetOption && !this.option("bUseMinusSecond")) {
            htEndDate = DateCoreAPI.getSolarDateUseDistanceTimeSecond(htEndDate, 1);
        }

        var htReturnValue = {
            'htStartDate': htStartDate,
            'htEndDate': htEndDate
        };
        return htReturnValue;
    },

    /**
     * 시작 종료일을 원하는 String 포멧으로 반환하는 함수
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
     * @return {HashTable}	{sStartDate :시작 날짜 값,sEndDate:종료 날짜 값} 화면의 값을 반환한다.
     *         시간옵션을 사용하지 않으면 종료날짜의 23:59:59로 세팅된다.
     *         시간옵션을 사용하면 종료날짜는 1초를 뺀 값이 들어간다. 화면에서 01:00라면 반환되는 값은 00:59가 된다. 
     */
    getText: function(sFormat) {
        var htValue = this.getValue();
        var htReturnValue = {
            "sStartDate": DateCoreAPI.getCustomDateFormat(htValue.htStartDate, sFormat),
            "sEndDate": DateCoreAPI.getCustomDateFormat(htValue.htEndDate, sFormat)
        };
        return htReturnValue;
    },

    /**
     * Highlight를 설정할 날짜들을 세팅한다. 이미 설정된 날짜들이 있으면 모두 지우고 새로 세팅한다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * }
     */
    setHighlight: function(aDateList) {
        this._htHighlightList = this._makeDateList(aDateList);
    },

    /**
     * Highlight를 설정할 날짜들을 추가한다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * } 
     */
    addHighlight: function(aDateList) {
        var htList = this._makeDateList(aDateList);
        for (var x in htList) {
            if (!this._htHighlightList[x]) {
                this._htHighlightList[x] = true;
            }
        }
    },
    /**
     * Highlight가 설정된 날짜들 중 파라미터로 넘어온 날짜의 설정을 지운다. 파라미터를 넘기지 않으면 모두 지운다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * }  
     */
    removeHighlight: function(aDateList) {
        if (aDateList) {
            var htList = this._makeDateList(aDateList);
            for (var x in htList) {
                if (this._htHighlightList[x]) {
                    delete this._htHighlightList[x];
                }
            }
        } else {
            this._htHighlightList = {};
        }
    },
    /**
     * Highlight가 설정된 날짜를 반환한다.
     * @return {HashTable}	{'2011-04-30':true,....'날짜':true 형식} 
     */
    getHighlight: function() {
        return this._htHighlightList;
    },

    /**
     * Disable를 설정할 날짜들을 세팅한다. 이미 설정된 날짜들이 있으면 모두 지우고 새로 세팅한다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * }
     */
    setUnselectDate: function(aDateList) {
        this._htUnselectList = this._makeDateList(aDateList);
    },

    /**
     * Disable를 설정할 날짜들을 추가한다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * } 
     */
    addUnselectDate: function(aDateList) {
        var htList = this._makeDateList(aDateList);
        for (var x in htList) {
            if (!this._htUnselectList[x]) {
                this._htUnselectList[x] = true;
            }
        }
    },

    /**
     * Disable이 설정된 날짜들 중 파라미터로 넘어온 날짜의 설정을 지운다. 파라미터를 넘기지 않으면 모두 지운다.
     * @param {Array}	aDateList	htDateList 형식의 배열 
     * htDateList ={
     * vStartDate:블럭 시작 날짜
     * vEndDate : 블럭 종료 날짜 (nLength과 둘중 하나만 사용, 둘다 사용시 vEndDate우선)
     * nLength : 시작일 포함 블럭 길이
     * }  
     */
    removeUnselectDate: function(aDateList) {
        if (aDateList) {
            var htList = this._makeDateList(aDateList);
            for (var x in htList) {
                if (this._htUnselectList[x]) {
                    delete this._htUnselectList[x];
                }
            }
        } else {
            this._htUnselectList = {};
        }
    },

    /**
     * Disable이 설정된 날짜를 반환한다.
     * @return {HashTable}	{'2011-04-30':true,....'날짜':true 형식} 
     */
    getUnselectDate: function() {
        return this._htUnselectList;
    },

    _findDateList: function(htDateList) {
        var nLength = 1;
        var htStartDate = DateCoreAPI.getCoreDateFormat(htDateList.vStartDate);
        if (htDateList.vEndDate) {
            var htEndDate = DateCoreAPI.getCoreDateFormat(htDateList.vEndDate);
            nLength = DateCoreAPI.getDistanceUseDate(htStartDate, htEndDate) + 1;
        } else if (htDateList.nLength) {
            nLength = htDateList.nLength;
        }
        var aDateList = DateCoreAPI.getDateList(htStartDate, nLength);
        return aDateList;
    },

    _makeDateList: function(aDateList) {
        var htDateList = {};
        var aPreDateList = null;
        var sDate = null;
        for (var i = 0, nLen = aDateList.length; i < nLen; i++) {
            aPreDateList = this._findDateList(aDateList[i]);
            for (var j = 0, nLen2 = aPreDateList.length; j < nLen2; j++) {
                sDate = DateCoreAPI.getCustomDateFormat(aPreDateList[j], "yyyy-mm-dd");
                if (!htDateList[sDate]) {
                    htDateList[sDate] = aPreDateList[j];
                }
            }
        }
        return htDateList;
    },

    /**
     * 캘린더를 노출시키는 함수
     * @param {String}	sDateType "start","end" 둘중 1개를 받아야 한다.   
     */
    showCalendar: function(sDateType) {
        var elBase = null;
        if (sDateType == "start") {
            elBase = (this._htElement["elStartDate_input"]) ? this._htElement["elStartDate_input"] : this._htElement["elStartDate_button"];
        } else if (sDateType == "end") {
            elBase = (this._htElement["elEndDate_input"]) ? this._htElement["elEndDate_input"] : this._htElement["elEndDate_button"];
        }
        if (elBase) {
            this._bForce = true;
            setTimeout(jindo.$Fn(function() {
                jindo.$Element(elBase).fireEvent("click");
            }, this).bind(), 0);
        }
    },

    /**
     * input box의 날짜를 안보이게 하는 함수
     * @param {String}	sDateType "start","end", 없으면 둘다 지운다.   
     */
    hideDate: function(sDateType) {
        var aHideElement = [];
        if (sDateType != "start" && this._htElement["elEndDate_input"]) {
            aHideElement.push(this._htElement["elEndDate_input"]);
        }
        if (sDateType != "end" && this._htElement["elStartDate_input"]) {
            aHideElement.push(this._htElement["elStartDate_input"]);
        }
        for (var i = 0; i < aHideElement.length; i++) {
            aHideElement[i].value = "";
        }
    },

    /**
     * 시작날짜, 종료날짜관련 element들을 disable 처리하는 옵션 
     * @param {String}	sDateType "start","end","all"   
     */
    disableDate: function(sDateType) {
        if (sDateType != "start" || sDateType == "all") {
            this._htDisableDate["end"] = true;
            this._disableDateElement("EndDate", true);
        }
        if (sDateType != "end" || sDateType == "all") {
            this._htDisableDate["start"] = true;
            this._disableDateElement("StartDate", true);
        }
    },

    /**
     * 시작날짜, 종료날짜관련 disable된 element들을 enable 처리하는 옵션 
     * @param {String}	sDateType "start","end","all"   
     */
    enableDate: function(sDateType) {
        if (!this._bIsActivating) {
            return false;
        }
        if (sDateType != "start" || sDateType == "all") {
            this._htDisableDate["end"] = false;
            this._disableDateElement("EndDate", false);
        }
        if (sDateType != "end" || sDateType == "all") {
            this._htDisableDate["start"] = false;
            this._disableDateElement("StartDate", false);
        }
    },

    _disableDateElement: function(sDateType, bDisable) {
        if (this._htElement["el" + sDateType + "_input"]) {
            this._htElement["el" + sDateType + "_input"].disabled = bDisable;
        }
        if (this._htElement["el" + sDateType + "_button"]) {
            this._htElement["el" + sDateType + "_button"].disabled = bDisable;
        }
        if (this._htElement["el" + sDateType + "_hour"]) {
            this._htElement["el" + sDateType + "_hour"].disabled = bDisable;
        }
        if (this._htElement["el" + sDateType + "_minute"]) {
            this._htElement["el" + sDateType + "_minute"].disabled = bDisable;
        }
    },
    disableQuickButton: function() {
        this._bQuickButtonDisable = true;
    },
    enableQuickButton: function() {
        this._bQuickButtonDisable = false;
    }
}).extend(jindo.UIComponent);
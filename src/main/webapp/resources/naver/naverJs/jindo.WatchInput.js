/**
 * @fileOverview input[type=text] 또는 textarea와 같은 입력 컨트롤에 입력여부를 감지하는 컴포넌트
 * @author senxation
 * @version 1.0.2
 */
jindo.WatchInput = jindo.$Class({
    /** @lends jindo.WatchInput.prototype */

    _bTimerRunning: false,
    _bFocused: false,
    _sPrevValue: "",

    /**
	 * WatchInput 컴포넌트를 생성한다.
	 * IE에서는 "keyup" 이벤트를 감지하고, 그외의 브라우저에서는 focus되었을때 이전값에서의 변화를 비교하는 타이머가 시작되고 blur되었을때 타이머가 종료된다. 
	 * @constructs
	 * @class input[type=text] 또는 textarea와 같은 입력 컨트롤에 입력여부를 감지하는 컴포넌트
	 * @param {String | HTMLElement} sInputId 적용할 입력 컨트롤의 id혹은 엘리먼트 자체
	 * @param {HashTable} htOption 옵션 객체
	 * @extends jindo.UIComponent
	 * @requires jindo.Timer
	 * @example
var oWatchInput = new jindo.WatchInput("input", {
	nInterval : 100, //Check할 간격 (IE제외)
	bUseTimerOnIE : false, //IE에서 키보드 이벤트를 사용해서 감지할 경우 false로 지정. 다른 브라우저처럼 타이머로 체크하고자하는 경우 true로 설정
	sKeyEvent : "keyup", //attach할 키보드 이벤트 (IE만 해당)
	bPermanent : false, //입력창의 focus/blur에 상관없이 항상 타이머가 동작할지 여부. 중단을 위해서 반드시 stop()이나 deactivate()메소드 호출 필요.(IE제외) 
	bActivateOnload : true //로드시 activate() 수행여부
}).attach({
	start : function(oCustomEvent) {
		//감지를 시작했을 때 발생
	},
	stop : function(oCustomEvent) {
		//감지를 중단했을 때 발생
	},
	focus : function(oCustomEvent) {
		//입력 컨트롤에 focus되었을 때 발생
	},
	blur : function(oCustomEvent) {
		//입력 컨트롤에 blur(포커스 해제)되었을 때 발생
	},
	timerStart : function(oCustomEvent) {
		//IE를 제외한 브라우저에서는 한글입력시 KeyEvent이벤트가 발생하지 않으므로 timer를 이용해 감지한다
		//timer가 시작됬을 때 발생
	},
	change : function(oCustomEvent) {
		//입력 컨트롤 값이 변경 되었을 경우 발생
		//전달되는 이벤트 객체 oCustomEvent = {
		//	elInput : (HTMLElement) 입력 컨트롤
		//	sText : (String) 변화된 input의 값
		//}
	},
	timerStop : function(oCustomEvent) {
		//IE를 제외한 브라우저에서는 한글입력시 KeyEvent이벤트가 발생하지 않으므로 timer를 이용해 감지한다
		//timer가 중지됬을 때 발생
	}
});
	 */
    $init: function(sInputId, htOption) {
        var htDefaultOption = {
            nInterval: 100, //Check할 간격 (IE제외)
            bUseTimerOnIE: false, //IE에서 키보드 이벤트를 사용해서 감지할 경우 false로 지정. 다른 브라우저처럼 타이머로 체크하고자하는 경우 true로 설정
            sKeyEvent: "keyup", //attach할 키보드 이벤트 (IE만 해당)
            bPermanent: false, //입력창의 focus/blur에 상관없이 항상 타이머가 동작할지 여부. 중단을 위해서 반드시 stop()이나 deactivate()메소드 호출 필요.(IE제외) 
            bActivateOnload: true //로드시 activate() 수행여부
        };

        this.option(htDefaultOption);
        this.option(htOption || {});

        this._elInput = jindo.$(sInputId);
        this._oTimer = new jindo.Timer();

        this._bIE = jindo.$Agent().navigator().ie;
        this._wfFocus = jindo.$Fn(this._onFocus, this);
        this._wfBlur = jindo.$Fn(this._onBlur, this);
        this._wfKeyEvent = jindo.$Fn(this._onKeyEvent, this);
        this._wfStartTimer = jindo.$Fn(this._startTimer, this);
        this._wfStopTimer = jindo.$Fn(this._stopTimer, this);

        if (this.option("bActivateOnload")) {
            this.activate(true);
        }
    },

    /**
     * WatchInput이 적용된 Input 엘리먼트를 가져온다.
     * @return {HTMLElement}
     */
    getInput: function() {
        return this._elInput;
    },

    /**
	 * WatchInput이 적용된 Input 엘리먼트의 value를 설정한다.
	 * @remark WatchInput이 적용된 Input 엘리먼트의 값을 키입력 외에 임의로 변경할 때에는 이 메소드를 사용하는 것을 권장한다.
	 * @return {this}
	 * @see setCompareValue
	 * @example
//input값을 변경할 경우
oWatchInput.setInputValue("테스트");
//또는 아래와 같이 사용한다.
oWatchInput.getInput().value = "테스트";
oWatchInput.setCompareValue("테스트"); //input의 value와 같은 값으로 설정한다.
	 */
    setInputValue: function(s) {
        this.getInput().value = s;
        this.setCompareValue(s);
        return this;
    },

    /**
     * 현재의 input value와 비교될 이전 Input의 value를 구한다.
     * @return {String} 
     */
    getCompareValue: function() {
        return this._sPrevValue;
    },

    /**
	 * 현재의 input value와 비교할 값을 설정한다.
	 * @remark IE의 keydown이 발생하지 않거나 FF의 timer가 동작하지 않는 상황에서 input의 value를 변경하면 예기치 않은 change이벤트가 발생하기 때문에 변경된 값과 동일하게 비교할 값을 설정하여 예외처리한다.
	 * @param {String} s
	 * @return {this}
	 * @example
oWatchInput.getInput().value = "테스트";
oWatchInput.setCompareValue("테스트"); //input의 value와 같은 값으로 설정한다. 
	 */
    setCompareValue: function(s) {
        this._sPrevValue = s;
        return this;
    },

    /**
     * 이전 값과의 비교없이 강제로 change 이벤트를 발생시킨다.
     * @return {this}
     */
    fireChangeEvent: function() {
        var elInput = this.getInput(),
            sValue = elInput.value;
        this.setCompareValue(sValue);
        this.fireEvent("change", {
            elInput: elInput,
            sText: sValue
        });
        return this;
    },

    /**
     * 감지를 시작한다.
     * 감지의 중단은 인터벌 시간 이후에 일어난다.
     * IE에서는 KeyEvent 이벤트를 감지한다.
     * 그외의 브라우저에서는 input에 focus되면 Timer를 사용해 주기적인 비교가 시작되고 blur시 중단된다.
     * @param {Boolean} bCompareOnce
     * @deprecated activate
     */
    start: function(bCompareOnce) {
        return this.activate(bCompareOnce || false);
    },

    /**
     * 감지를 중단한다.
     * @deprecated deactivate
     */
    stop: function() {
        return this.deactivate();
    },

    /**
     * 컴포넌트를 활성화한다.
     * @param {Boolean} bCompareOnce 초기화이후 IE의 키보드 이벤트와 그외 브라우저의 Focus이후 Timer동작과 상관없이 최초 1회 비교할지 여부
     * @return {this}
     */
    _onActivate: function(bCompareOnce) {
        this.setCompareValue("");
        var elInput = this.getInput();

        this._wfFocus.attach(elInput, "focus");
        if (this._bIE && !this.option("bUseTimerOnIE")) {
            this.fireEvent("start");
            this._wfKeyEvent.attach(elInput, this.option("sKeyEvent"));
        } else {
            if (this._isTimerRunning()) {
                return;
            }

            this.fireEvent("start");
            if (this.option("bPermanent")) {
                this._startTimer();
            } else {
                this._wfStartTimer.attach(elInput, "focus");
                this._wfStopTimer.attach(elInput, "blur");
            }
        }

        this._wfBlur.attach(elInput, "blur");

        if (bCompareOnce || false) {
            this.compare();
        }
    },

    _onDeactivate: function() {
        var elInput = this.getInput();
        this._wfFocus.detach(elInput, "focus");
        this._wfKeyEvent.detach(elInput, this.option("sKeyEvent"));
        this._stopTimer();
        this._wfStartTimer.detach(elInput, "focus");
        this._wfStopTimer.detach(elInput, "blur");
        this._wfBlur.detach(elInput, "blur");
        this.fireEvent("stop");
    },

    /**
     * 값을 비교할 시간 간격을 가져온다.
     * @return {Number} ms 단위의 시간 
     */
    getInterval: function() {
        return this.option("nInterval");
    },

    /**
     * 값을 비교할 시간 간격을 설정한다.
     * @remark IE제외
     * @param {Number} n
     * @return {this}
     */
    setInterval: function(n) {
        this.option("nInterval", n);
        return this;
    },

    _isTimerRunning: function() {
        return this._bTimerRunning;
    },

    _startTimer: function() {
        if (this._isTimerRunning()) {
            return;
        }

        this._bTimerRunning = true;
        this.fireEvent("timerStart");
        this.compare();

        var self = this;
        this._oTimer.start(function() {
            self.compare();
            return true;
        }, this.getInterval());
    },

    _stopTimer: function() {
        if (this._isTimerRunning()) {
            this._oTimer.abort();
            this._bTimerRunning = false;
            this.compare(); //타이머를 중지하고 비교 1회수행
            this.fireEvent("timerStop");
        }
    },

    _onKeyEvent: function() {
        this.compare();
    },

    _onFocus: function() {
        this._bFocused = true;
        this.fireEvent("focus");
    },

    _onBlur: function() {
        this._bFocused = false;
        this.fireEvent("blur");
    },

    /**
     * 이전의 비교값과 현재 설정된 값을 강제 비교한다.
     * @remark IE에서의 key이벤트나, 기타 브라우저의 timer 동작과 관계없이 즉시 비교를 수행한다. (즉, Text Input에 focus될 필요가 없다.) 수행후 값이 바뀐경우 change 커스텀이벤트를 발생한다.
     * @return {this}
     */
    compare: function() {
        if (this.getInput().value != this.getCompareValue()) {
            this.fireChangeEvent();
        }
        return this;
    }
}).extend(jindo.UIComponent);
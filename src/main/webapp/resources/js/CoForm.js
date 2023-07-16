//���콺 ������ ��ư ����
    //document.oncontextmenu = new Function('return false');
    
	function IsEmpty(obj) {
		if (obj.value == null || obj.value.replace(/ /gi,"") == "") {
			return true;
		}
		return false;
	}
	function IsEmptyMsg(obj, msg) {
		if (obj.value == null || obj.value.replace(/ /gi,"") == "") {
			obj.value = "";
			AlertFocus(obj, msg);
			return true;
		}
		return false;
		
	}
	function Alert(message){
		var iLen = message.length;
			if (iLen >= 1) {
				alert(message);
			}
	}
	function AlertFocus(obj, msg ) {
		if ( msg != '') Alert( msg );
		obj.focus();
		if (obj.type == 'text' && obj.value.length >=1 ) obj.select();
		return ;
	}
	/**
	 * ��Ű ����(name�̸��� value ���� ��Ű�����Ⱓ�� expiredays�� ��Ű�� ���Ѵ�)
	 * @param name
	 * @param value
	 * @param expiredays
	 * @return
	 */
	function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	/**
	 * varname�� ��Ű���� �ִ��� Ȯ��
	 * @param varname
	 * @param expiredays
	 * @return
	 */
	function getCookie(varname) {
		varname += "=";
		startpos = document.cookie.indexOf(varname);
		if (startpos >= 0) {
			startpos += varname.length;
			endpos = document.cookie.indexOf(";", startpos);
			if (endpos == -1) endpos = document.cookie.length;
			return unescape(document.cookie.substring(startpos, endpos));
		}
	}
	/**
     * �Է� �ʵ��� ���� ũ�⸦ ��´�.. (�ѱ۱��� ����Ͽ� ����)
     * @param String   ���ڿ�
     * @return int ���ڿ��� ����
    */
	function GetLenByByte(value) {
		var byteLength = 0;
		for(var inx = 0; inx < value.length; inx++){
			var oneChar = escape(value.charAt(inx));
			if(oneChar.length == 1 ){
				byteLength ++;
			}else if(oneChar.indexOf("%u") != -1){
				byteLength += 2;
			}else if(oneChar.indexOf("%") != -1){
				byteLength += oneChar.length/3;
			}
		}
		return byteLength;
	}
	function isFnStr(val){
		var checkStr = /[^a-zA-Z0-9]/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	function isEngUpperStr(val){	
		var checkStr = /[A-Z]/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	function isEngLowerStr(val){	
		var checkStr = /[a-z]/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	function isEngStr(val){	
		var checkStr = /[a-zA-Z]/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	function isNumStr(val){	
		var checkStr = /^[0-9]*$/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	function IsEmailAddr(str){
		var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
		if(IsValidFormat(str, format) && isEngStr(str)){
			return true; 
		}else{
			return false;
		}
	}

	function IsValidFormat(str, format){
		if(format.test(str)){
			return true;
		}else{
			return false;
		}
	}
	
	var diffDate = function(type, diff){
		var dt = new Date();
		if(type == 'Month'){
			dt.setMonth(dt.getMonth() - diff);
		}else if(type == 'Day'){
			dt.setDate(dt.getDate() - diff);
		}else if(type == 'Year'){
			dt.setFullYear(dt.getFullYear() - diff);
		}
		var month = dt.getMonth()+1;
		var day = dt.getDate();
		var year = dt.getFullYear();
		if(month < 10) month = "0" + month;
		if(day < 10) day = "0" + day;
		
		var diffDay = "" + year + month + day;
		
		return diffDay;
	};
	
	
	/**
	 * �����ȣ�� ������, ��������, ���̰� �´��� üũ�ϴ� �޼ҵ�
	 */
	function isRightZipCode(zipcode, cknum, objfocus, msgalert) {
		
			if(IsEmpty(zipcode) == true) {
				window.alert(msgalert);
				objfocus.focus();
				return false;
			} else {
				if(!IsNumbers(zipcode)) {
					window.alert(msgalert);
					objfocus.focus();
					return false;
				} else if (!ChkLen(zipcode, cknum)) {
					window.alert(msgalert);
					objfocus.focus();
					return false;
				}
			}
			return true;
	}
	
	/**
     * �Էµ� ���ڿ��� ���� ���� �����ϰ� �ִ��� ���� ����
     * @param obj   Object
     * @return true - ���ڸ��� �����ϰ� �ִ� ���
    */
	function IsNumbers(obj) {
		var chars = /^[0-9]*$/;
		if(chars.test(obj.value)){
			return true;
		}else{
			return false;
		}
	};
   
	function encodeAll(s){
		return encodeURIComponent(s).replace(/[!'()*]/g, escape); 
		//escape��ų ���ڸ� �߰�����
	}
	/**
	 * �Է� ���� ���±�(Object)�� ���ڿ��� ���̰� Ư�� ����(Int)�� ������ ���� üũ
	 * @param obj   ��� ���±�(Object)
	 * @param len   ���� ����
	 * @return  true : ���̰� ����, false : ���̰� �ٸ�
	 */
	function ChkLen(obj, len) {
		if(obj.value.length == len) return true;
		return false;
	}
	

	function isCjmall(reURL) {
		var apphome1 = "";
		apphome = getAppHome(reURL);
		var findidx1 = apphome.indexOf("cjmall");
		if (findidx1 > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	function getAppHome(appname) {
		var uri = appname.split("/");
		return uri[0]+"//" + uri[2];
	}
	
	//��ȭ��ȣ �ڵ� ��Ŀ��
	var nextTab = function(val , obj){
		if(val.length == 4){
			obj.focus();
		}
	};
	
	function isFnStr2(val){
		var checkStr = /[^a-zA-Z0-9@.]/;
		if(checkStr.test(val)){
			return true; 
		}else{
			return false;
		}
	}
	
	
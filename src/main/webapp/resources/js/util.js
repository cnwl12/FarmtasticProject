
	/* String에 모든 공백 제거 */
	var removeSpace = function(str) {
		return str.replace( /(\s*)/g, '' );
	};

	/* input 숫자만 */
	var isNumber = function(obj){
		$(obj).keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		}); 
	};
	
	/* 특수문자 여부 체크 */
	var isSpecial = function(str) {
		var special_pattern = /['~!@#$%^&*|\\\'\";:/\?]/gi;
		
		if(special_pattern.test(str) == true) {
			return true;
		} else {
			return false;
		}
	}

	/* 특수문자 여부 체크 */
	var web_deploy_test = function(str) {
		alert("web_deploy_test");
	}

	/* 특수문자 숫자 여부 체크 */
	var isSpecialNumber = function(str) {
		var special_pattern = /['~!@#$%^&*|\\\'\";:/\?]/gi;
		var number_pattern = /[0-9]/g;

		if(special_pattern.test(str) == true || number_pattern.test(str) == true) {
			return true;
		} else {
			return false;
		}
	}
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function enterCheck(event) {
    if (event.keyCode === 13) {
        event.preventDefault(); // 기본 이벤트(폼의 제출)를 중단합니다.
        validateAndSubmitPersonal(); // 원하는 로그인 함수를 실행합니다.
    }
}
function enterCheck2(event) {
    if (event.keyCode === 13) {
        event.preventDefault(); // 기본 이벤트(폼의 제출)를 중단합니다.
        validateAndSubmitBusiness(); // 원하는 로그인 함수를 실행합니다.
    }
}
</script>
 <meta name="description" content="Ogani Template">
 <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Farmtastic_login</title>

<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/login_img/favicon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/login_img/favicon.png">
 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sso.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<body>  
<jsp:include page="../top.jsp"></jsp:include>



<script>
    let error = '<%=request.getParameter("error")%>';
    if (error !== 'null' && error !== null && error !== undefined) {
        alert(error);
    }
</script>


<div id="ui-wrap"> 	 
			<!-- ui-container -->
			<div id="ui-container">
				<div id="ui-content" class="join2 PC box-content btn-fixed-bottom-on">
					<!-- ### 컨텐츠 시작 ###  -->
					<div id="ui-content-body" class="join2 type btn-fixed-bottom-on">
						<ul class="tab-ty2">  
							<li id="personal-login-section" class="on"><a href="#" class="toggle-login" data-target="personal">개인 로그인</a></li>
							<li id="business-login-section"><a href="#" class="toggle-login" data-target="business">사업자 로그인</a></li>
						</ul>
						<div id="personal-login-wrap" class="login-wrap PC tab-phone">
							<!-- <p class="login-top-txt">휴대폰  로그인은 마이 홈플러스 회원만 이용 가능합니다.</p> -->
							<form class="validation-form" novalidate action="${pageContext.request.contextPath }/loginPro" id="login" name="login" method="post">
							<div class="join-info1">
								<fieldset>
									<legend>로그인 정보 입력</legend>
									<ul class="list-field">
										<!-- 이름 -->
										<li class="full">
											<div class="col">
												<label for="f-id"></label>
												<input type="text" name="member_id" id="loginId1" maxlength="20" placeholder="아이디" value="" style="ime-mode:inactive" onkeypress="enterCheck(event)">
												<div id="invalid_id0" class="invalid-feedback">
                								아이디를 입력해주세요.
              									</div>
												
											</div>
										</li>
										<!--비밀번호 -->
										<li class="full">
											<div class="col c-1">
												<label for="f-pw"></label> <!-- maxlength : 길이제한!   -->
												<input type="password" maxlength="20" placeholder="비밀번호 (대/소문자 구분)" name="member_pass" id="pwd1" value="" onkeypress="enterCheck(event)">
												<div id="invalid_pass0" class="invalid-feedback">
                								비밀번호를 입력해주세요.
              									</div>
												
											</div>
										</li>
									</ul>
								</fieldset>
							</div>
							</form>

							<fieldset> 
								<legend>체크 옵션</legend>
								<div class="join-guide type"> <!-- type 추가 -->
									<ul class="links PC">
										<li><a href="#" class="fs-13" onclick="openSearchIdPopup()">아이디찾기</a></li>
										<li><a href="#" class="fs-13" onclick="openSearchPwdPopup()">비밀번호찾기</a></li>
									</ul>
								</div>
							</fieldset>
							
																			<!-- 로그인 넘어가는 페이지 설정  -->
							<div class="btn-login"><button type="button" onclick="validateAndSubmitPersonal()">로그인</button></div>
							<!-- 간편로그인 -->
							<div class="join-guide">
								<ul class="log-in">     	
								<li><a href="naverlogin" onclick="naverlogin;" class="btn"><i class="icon_naver"></i><span>네이버 로그인</span></a></li>
							    <li><a id="custom-login-btn" href="kakaologin" onclick="kakaologin";  class="btn"><i class="icon_kakao"></i><span>카카오 로그인</span></a></li>
												
								</ul>
							</div>
 
							<div class="join-guide ">
								<div class="link-btn">
									<a href="join" class="btn">회원가입</a>
								</div>
							</div>
						</div>
						<!-- //login-wrap -->
						
						
						<!-- login2-wrap -->
						<div id="business-login-wrap" class="login-wrap PC tab-phone" style="display: none;">
							<form class="validation-form" novalidate action="${pageContext.request.contextPath }/sellerloginPro" id="login2" name="login2" method="GET">
							<div class="join-info2">
								<fieldset>
									<legend>로그인 정보 입력</legend>
									<ul class="list-field">
										<!-- 이름 -->
										<li class="full">
											<div class="col">
												<label for="f-id"></label>
												<input type="text" name="seller_id" id="loginId2" maxlength="20" placeholder="아이디" value="" style="ime-mode:inactive" onkeypress="enterCheck2(event)">
												<div id="invalid_id1" class="invalid-feedback">
                								아이디를 입력해주세요.
              									</div>
												
											</div>
										</li>
										<!--비밀번호 -->
										<li class="full">
											<div class="col c-1">
												<label for="f-pw"></label> <!-- maxlength : 길이제한!   -->
												<input type="password" maxlength="20" placeholder="비밀번호 (대/소문자 구분)" name="seller_pass" id="pwd2" value="" onkeypress="enterCheck2(event)">
												<div id="invalid_pass1" class="invalid-feedback">
                								비밀번호를 입력해주세요.
              									</div>
												
											</div>
										</li>
									</ul>
								</fieldset>
							</div>
							</form>

							<fieldset> 
								<legend>체크 옵션</legend>
								<div class="join-guide type"> <!-- type 추가 -->
									<ul class="links PC">
										<li><a href="javascript:fn_searchId();" class="fs-13">아이디찾기</a></li>
										<li><a href="javascript:fn_searchPwd();" class="fs-13">비밀번호찾기</a></li>
									</ul>
								</div>
							</fieldset>
																			<!-- 로그인 넘어가는 페이지 설정  -->
							<div class="btn-login"><button type="button" onclick="validateAndSubmitBusiness()">로그인</button></div>
							<!-- 간편로그인 -->
							<div class="join-guide">
								<ul class="log-in">     	
								<li><a href="#" onclick="openNaverLoginPopup()" class="btn"><i class="icon_naver"></i><span>네이버 로그인</span></a></li>
								<li><a id="custom-login-btn" href="kakaologin" onclick="kakaologin";  class="btn"><i class="icon_kakao"></i><span>카카오 로그인</span></a></li>
								</ul>
								<script>
								    function openNaverLoginPopup() {
								        window.open('naverlogin', 'naver-login-popup', 'width=600, height=500');
								    }
								    
								    function openSearchIdPopup() {
								        window.open('searchId', 'search-id-popup', 'width=600, height=500');
								    }
								    
								    function openSearchPwdPopup() {
								        window.open('searchPwd', 'search-Pwd-popup', 'width=600, height=500');
								    }
								</script>
							</div>
 
							<div class="join-guide ">
								<div class="link-btn">
									<a href="join2" class="btn">사업자 회원가입</a> 
								</div>
							</div>
						</div>
						<!-- //login2-wrap -->
						   
					</div>
					<!-- ### 컨텐츠 끝 ###  -->

				</div>
			</div>
		</div>
		
		<!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>

    <!-- Js Plugins -->
  	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		
<script>
$(document).ready(function() {
  // 로그인 전환 함수
  function toggleLogin(target) {
    if (target === "personal") {
      $("#business-login-wrap").hide();
      $("#business-login-section").removeClass("on");
      $("#personal-login-wrap").show();
      $("#personal-login-section").addClass("on");
    } else if (target === "business") {
      $("#personal-login-wrap").hide();
      $("#personal-login-section").removeClass("on");
      $("#business-login-wrap").show();
      $("#business-login-section").addClass("on");
    }
  }

  // 메뉴 클릭 이벤트 핸들러
  $(".toggle-login").on("click", function(e) {
    e.preventDefault();
    let target = $(this).data("target");
    toggleLogin(target);
  });

  // 유효성 검증 변수
  var validId = false;
  var validPwd = false;
  var validId2 = false;
  var validPwd2 = false;
  // 정규식
  var regId1 = /^[a-zA-Z0-9]{2,10}$/;
  var regId2 = /^[a-zA-Z0-9]{2,10}$/;
  var regPw1 = /^[a-zA-Z0-9]{2,10}$/;
  var regPw2 = /^[a-zA-Z0-9]{2,10}$/;

  // 아이디 입력란에 keyup 이벤트 적용
  $("#loginId1").on("keyup", function() {
    var uid1 = $(this).val();

    if (uid1 == "" || !regId1.test(uid1)) {
      validId = false;
      $("#invalid_id0").show();
    } else {
      validId = true;
      $("#invalid_id0").hide();
    }

    validateForm();
  });

//아이디 입력란에 keyup 이벤트 적용
  $("#loginId2").on("keyup", function() {
    var uid2 = $(this).val();

    if (uid2 == "" || !regId2.test(uid2)) {
      validId2 = false;
      $("#invalid_id1").show();
    } else {
      validId2 = true;
      $("#invalid_id1").hide();
    }

    validateForm2();
  });
  
  // 비밀번호 입력란에 keyup 이벤트 적용
  $("#pwd1").on("keyup", function() {
    var pw1 = $(this).val();

    if (pw1 == "" || !regPw1.test(pw1)) {
      validPwd = false;
      $("#invalid_pass0").show();
    } else {
      validPwd = true;
      $("#invalid_pass0").hide();
    }

    validateForm();
  });
  
  // 비밀번호 입력란에 keyup 이벤트 적용
  $("#pwd2").on("keyup", function() {
    var pw2 = $(this).val();

    if (pw2 == "" || !regPw2.test(pw2)) {
        validPwd2 = false;
        $("#invalid_pass1").show();
    } else {
        validPwd2 = true;
        $("#invalid_pass1").hide();
    }

    validateForm2();
});

  function validateForm() {
    if (validId && validPwd) {
      $('button[type="button"]').prop('disabled', false);
    } else {
      $('button[type="button"]').prop('disabled', true);
    }
  }

  function validateForm2() {
	    if (validId2 && validPwd2) {
	        $('button[type="button"]').prop('disabled', false);
	    } else {
	        $('button[type="button"]').prop('disabled', true);
	    }
	}
  
//폼 유효성 검사 및 폼 제출
  window.validateAndSubmitPersonal = function() {
    validateForm();

    if (validId && validPwd) {
      document.login.submit(); 
    } else {
      alert("올바른 정보를 입력해주세요");
    }
  }

  window.validateAndSubmitBusiness = function() {
    validateForm2();

    if (validId2 && validPwd2) {
      document.login2.submit(); 
    } else {
      alert("올바른 정보를 입력해주세요");
    }
  }
});
</script>

</body>
</html>
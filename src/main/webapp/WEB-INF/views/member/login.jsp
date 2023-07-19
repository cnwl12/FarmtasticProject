<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

</head>
<body>  
<jsp:include page="../top.jsp"></jsp:include>

<div id="ui-wrap"> 	 
			<!-- ui-container -->
			<div id="ui-container">
				<div id="ui-content" class="join2 PC box-content btn-fixed-bottom-on">
					<!-- ### 컨텐츠 시작 ###  -->
					<div id="ui-content-body" class="join2 type btn-fixed-bottom-on">
						<ul class="tab-ty2">
							<li><a href="#">휴대폰 로그인</a></li>
							<li class="on"><a href="#">아이디 로그인</a></li>
						</ul>
						<div class="login-wrap PC tab-phone">
							<!-- <p class="login-top-txt">휴대폰  로그인은 마이 홈플러스 회원만 이용 가능합니다.</p> -->
							<div class="join-info1">
								<fieldset>
									<legend>로그인 정보 입력</legend>
									<ul class="list-field">
										<!-- 이름 -->
										<li class="full">
											<div class="col">
												<label for="f-id"></label>
												<input type="text" name="loginId" id="loginId" maxlength="20" placeholder="아이디" value="" style="ime-mode:inactive">
											</div>
										</li>
										<!--비밀번호 -->
										<li class="full">
											<div class="col c-1">
												<label for="f-pw"></label> <!-- maxlength : 길이제한!   -->
												<input type="password" maxlength="20" placeholder="비밀번호 (대/소문자 구분)" name="pwd" id="pwd" value="">
											</div>
										</li>
									</ul>
								</fieldset>
							</div>


							<!-- 20230125 아이디 저장, 자동 로그인 퍼블 요청 -->
							<fieldset>
								<legend>체크 옵션</legend>
								<div class="join-guide type"> <!-- type 추가 -->
									<ul class="links PC">
										<li class="fL">
											<span class="checkbox-5 auto-login-check on" id="rememIdSpan">
												<input type="checkbox" name="rememId" id="rememId">
											</span>
											<label for="ui-chk-auto-login">아이디 저장</label>
										</li>
										<li><a href="javascript:fn_searchId();" class="fs-13">아이디찾기</a></li>
										<li><a href="javascript:fn_searchPwd();" class="fs-13">비밀번호찾기</a></li>
									</ul>
									<span class="id-s active">
										<span>개인정보 보호를 위해 <em>개인용 PC에서만 사용해 주세요.</em></span>
									</span>
								</div>
							</fieldset>
							<!-- // 20230125 아이디 저장, 자동 로그인 퍼블 요청 -->
							
																			<!-- 로그인 넘어가는 페이지 설정  -->
							<div class="btn-login"><button type="button" onclick="location.href='loginPro'" >로그인</button></div>
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
					</div>
					<!-- ### 컨텐츠 끝 ###  -->

					<div id="ui-pop-join-guide-register" class="join2 type btn-fixed-bottom-on" style="display:none;">
						<div class="join-finish ty2">
							<div class="top-msg">
								<p class="txt1">
									<em id="registerName">김홈플</em> 고객님!<br>
									온라인 간편회원 이시네요.<br>
									<span>통합회원으로 전환하고</span><br>멤버십 혜택 받으세요!
								</p>
								<p class="txt2">
									온라인 등급제가<br>
									“홈플one 통합 등급제”로 개편되어,<br>
									통합회원 전환 후<br>
									더 많은 혜택을 받으실 수 있습니다.
								</p>
							</div>
						</div>
						<div class="btn-fixed-bottom n-2">
							<div class="btns">
								<a href="javascript:void(0);" onclick="javascript:setRegisterLayer(1);" class="ty2">7일간 안보기</a>
								<a href="javascript:void(0);" onclick="javascript:fn_pageOpen(9);">통합회원 전환하기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //ui-content -->
			</div>
			<!-- //ui-container -->
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
		

</body>
</html>
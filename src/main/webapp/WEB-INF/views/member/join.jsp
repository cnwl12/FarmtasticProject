<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Join</title>  

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join.css" type="text/css"> 

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/joinPost.js"></script>
	
	  
<style>
input#post {
    padding: 0px 10px 19px 113px;
    margin: -5px 0px 0px 137px;
    width: 329px;
}

.invalid-feedback {
    display: none;
    width: 100%;
    margin-top: 0.25rem;
    font-size: 80%;
    color: #dc3545;
    margin-left: 3px;
}
</style>
 
</head>


<body>

<jsp:include page="../top.jsp"></jsp:include>

<div id="container"> 
	<div class="join_wrap">
		<div id="join_container" role="main">
<!-- 			join_header -->
			<div class="join_header">
				<h2>회원가입</h2>
			</div>
<!-- 			// join_header -->
			<div class="join_content">  
				<div class="form">
					<form class="validation-form" novalidate action="${pageContext.request.contextPath}/insertPro" id="join" name="join" method="post">
						<fieldset>
							<legend>팜타스틱 회원가입 정보입력</legend>
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
							
							<ul class="form_list">
							
								<li>
									<input type="hidden" name="join_date" id="join_date">
									<input type="text" placeholder="ID를 작성해주세요" name="member_id" id="member_id" maxlength="10" >
									<div id = "idcheckdiv"></div>
									<div id="invalid_id" class="invalid-feedback">
              						</div>
              						<div id="invalid_id2" class="invalid-feedback">
              						최소 2자 이상 최대 10자 / 영문 대소문자, 숫자만 입력하세요. 
              						</div>
								</li>   
								
								<li>
									<input type="password" placeholder="비밀번호를 작성해주세요" name="member_pass" id="member_pass" maxlength="15">
									<div id= "invalid_pass" class="invalid-feedback">
              						</div>
              						<div id="invalid_pass2" class="invalid-feedback">
              						최소 2자 이상 최대 15자 / 영문 대소문자, 숫자만 입력하세요. 
              						</div>
              						<div id="invalid_pass3" class="invalid-feedback">
              						아이디와 일치한 비밀번호는 사용이 불가능합니다. 
              						</div>
								</li>  
								
								<li>  
									<input type="password"  placeholder="위와 동일한 비밀번호를 작성해주세요" name="member_pass2" id="member_pass2" maxlength="15">
									<div id= "invalid_pass4" class="invalid-feedback">
                					비밀번호가 일치하지 않습니다.
              						</div>
								</li>
								
								<li>   
									<input type="text"  placeholder="이름" name="member_name" id="member_name" maxlength="10">
									<div id= "invalid_name" class="invalid-feedback">
              						</div>
              						<div id= "invalid_name2" class="invalid-feedback">
                					최소 2글자 이상, 한글과 영어만 입력하세요.
              						</div>
								</li>
							  	
							  	<li>
									<input type="text"  placeholder="연락처(휴대폰)번호 작성" name="member_phone" id="member_phone" maxlength="11" oninput="removeHyphen(event); validatePhone()"">
									<div id= "invalid_phone" class="invalid-feedback">
              						</div>
              						<div id= "invalid_phone2" class="invalid-feedback">
                					연락처를 올바르게 입력해주세요.
              						</div>
								</li>
								
								<li>
									<input type="email" placeholder="이메일" name="member_email" id="member_email" >
									<div id= "invalid_email" class="invalid-feedback">
              						</div>
              						<div id= "invalid_email2" class="invalid-feedback">
                					이메일을 올바른 형식으로 입력해주세요.
              						</div>
								</li>
							
								<li>
									<input type="text" name="member_post" id="sample4_postcode" placeholder="우편번호" style="color: gray; width: 55px;">
									<input type="button" id="member_post" onclick="sample4_execDaumPostcode()" value="[우편번호 찾기]" required style="margin: 0px 0px 0px 3px; height: 22px; width: 100px;">
									<div id="invalid_post" class="invalid-feedback">
              						주소를 입력해주세요.
           							</div>
								</li>
								
								<li>
									<input type="text" name="member_addMain" id="sample4_roadAddress" placeholder="도로명주소">
								</li>
								
								<li>
									<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
									<span id="guide" style="color:#999;display:none"></span>
								</li>
								<li>
									<input type="text" name="member_addSub" id="sample4_detailAddress" placeholder="상세주소">
								</li>
								<li>
									<input type="text" id="sample4_extraAddress" placeholder="참고항목">
								</li>
								
							</ul>
							
								
							
							<div class="btn_zone" style="margin-left: 100px;">
							<button type="button" id="goMain" class="site-btn">처음으로</button>
							<button type="button" id="submitBtn" class="site-btn">확인</button>
							</div>
 							
							
						</fieldset>  
					</form> 
				</div>
			</div>
		</div> 
	</div>
</div>

<!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	
<!-- Js Plugins -->
  	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>

</html> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Join</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	
	<!-- 지마켓  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join.css" type="text/css">
 
</head>
<body>

<jsp:include page="../top.jsp"></jsp:include>

<div id="container"> 
	<div class="join_wrap">
		<div id="join_container" role="main">
			<!-- join_header -->
			<div class="join_header">
				<h2>회원가입</h2>
			</div> 
			<!-- // join_header -->
			<div class="join_content">  
				<div class="form">
					<form id="form1" method="post" action="">
						<fieldset>
							<legend>팜타스틱 회원가입 정보입력</legend>
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
							
							<!-- 구현하는 사람이 NAME, ID 맞추기  -->
							<ul class="form_list">
								<li>
								<input type="text" placeholder="ID를 만들어주세요" name="" id="" maxlength="10">
								</li>   
								<li>
								<input type="password" placeholder="비밀번호 입력" name="" id="" maxlength="15">
								</li>  
								<li> 
								<input type="password" placeholder="위의 비밀번호를 다시 입력해주세요" name="" id="" maxlength="15">
								</li>
								<li>   
								<input type="text" placeholder="이름" name="" id="" maxlength="10">
								</li>
							  	<li>
								<input type="text" placeholder="연락처" name="" id="" maxlength="10">
								</li>
								<li>
								<input type="email" placeholder="이메일" name="" id="" >
								</li>
							</ul>
							
							<div class="btn_zone">
								<a href="#" id="" class="bg_area btn_bg l2"><span>처음으로</span></a>
								<a href="#" id="next" class="bg_area btn_bg l1 md"df><span>확인</span></a>
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
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>
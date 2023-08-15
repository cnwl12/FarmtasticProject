<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Farmtastic_searchId</title>
    
    <!-- jQuery -->
    <script type="text/javascript"
      		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
        <!-- iamport.payment.js -->
    <script
      type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
    

    <!-- Google Font --> 
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css"></head>

<body>
<jsp:include page="../top.jsp"></jsp:include>

	    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>searchId</h2> 
                        <div class="breadcrumb__option">
                            <a href="main">Home</a>
                            <span>searchId</span> 
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	  <h1>아이디 찾기</h1>
	<form id="searchIdForm" action="searchId" method="POST">
		<div class="input-group">
			<label for="inputEmail">이메일 주소</label>
			<input type="email" name="email" id="inputEmail" required>
			<button type="button" id="sendCode">인증 코드 전송</button>
		</div>
		<div class="input-group">
			<label for="inputCode">인증 코드</label>
			<input type="text" name="code" id="inputCode" required>
		</div>
<button type="submit">아이디 찾기</button>
	</form>

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
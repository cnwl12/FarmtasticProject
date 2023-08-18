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
    <form action="/farmtastic/SendEmailServlet" method="post">
    	<input type="text" name="email" placeholder="이메일 주소 입력" />
        <input type="submit" value="이메일 전송" id="sendEmailBtn"><br>
		<input type="text" name="verification_code" placeholder="인증번호 입력" />
		<input type="button" id=check_verification_code value="인증번호 확인"/>
    </form>
    
<script>
$(document).ready(function() {
	$('form').on('submit', function(event) {
		event.preventDefault(); // 폼의 기본 제출 동작을 막음
		
		var email = $('input[name="email"]').val(); // 이메일 값 가져오기
		
        // 버튼 비활성화
        $('#sendEmailBtn').attr('disabled', 'disabled');
		
		// Ajax 호출
		$.ajax({
		    type: 'POST',
		    url: '/farmtastic/SendEmailServlet',
		    data: { email: email },
		    success: function(data) {
		    	// 결과를 처리합니다.
		    	// 예: 성공 메시지 표시
		    	alert('이메일이 성공적으로 전송되었습니다.');
		    },
		    error: function(xhr, status, error) {
		    	// 오류를 처리합니다.
		    	// 예: 오류 메시지 표시
		    	alert('이메일 전송 중 오류가 발생했습니다.');
		    
                // 버튼 다시 활성화
                $('#sendEmailBtn').removeAttr('disabled');
			},
		});
	});
});

//인증번호 확인 Ajax 호출
$("#check_verification_code").on("click", function () {
    var userEmail = $('input[name="email"]').val(); // 이메일 값 가져오기
    var userVerificationCode = $('input[name="verification_code"]').val();
    
    $.ajax({
        type: "GET",
        url: "/farmtastic/CheckVerificationCodeServlet",
        data: { code: userVerificationCode, email: userEmail }, // 이메일 값 추가
        success: function (data) {
            alert(data); // 성공 메시지 또는 오류 메시지 표시
        },
        error: function (xhr, status, error) {
            alert("인증번호 확인 중 오류가 발생했습니다.");
        },
    });
});

</script>

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
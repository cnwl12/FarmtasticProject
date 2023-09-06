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
    <title>Farmtastic_paySuccess</title>
    
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
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

<style>
    .shoping-cart {
        padding: 50px 0;
    }
    
    .shoping__cart__table {
        width: 100%;
        border-collapse: collapse;
    }
    
    .shoping__product {
        text-align: center;
        padding: 20px 0;
        font-size: 24px;
        font-weight: bold;
        background-color: #f5f5f5;
    }
    
    .shoping__product p {
        margin: 10px 0;
    }
    
    .shoping__product p:last-child {
        margin-bottom: 0;
    }
    
    input[type="button"] {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #7fad39;
        color: white;
        font-weight: bold;
        border: none;
        cursor: pointer;
    }
</style>


<body>
<jsp:include page="../top.jsp"></jsp:include>


 <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Order Completed!</h2> 
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </section>

	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table item_wrap">
						<table>
							<thead>
								<tr>
									<th class="shoping__product" style="text-align: center;">주문이 완료되었습니다!</th>
								</tr>
							</thead>
							<tbody>
								<td>
									<p>주문번호 : ${orderPay.order_num}</p>
									<p>주문일시 : ${orderPay.order_day}</p>
									<p>수령인 : ${orderPay.order_name}</p>
									<p>결제 금액 : ${orderPay.order_pay}</p>
									<p>우편 번호 : ${orderPay.order_post}
									<p>
									<p>주소 : ${orderPay.order_addMain}</p>
									<p>상세 주소 : ${orderPay.order_addSub}</p>
									<p>요청 메시지 : ${orderPay.order_msg}</p>
								</td>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div>
		<input type="button" onclick="location.href='main'" value="메인으로">
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
    <script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    
</body>
</html>
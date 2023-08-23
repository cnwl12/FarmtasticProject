<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Farmtastic_Check</title>
    
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

	<script type="text/javascript">
		sessionStorage.setItem('pageContext', '${pageContext.request.contextPath}');
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/IamPort.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/post.js"></script>
<body>
<jsp:include page="../top.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="main">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 장바구니 담긴 내용 / 수량 수정 불가 -->
								<c:forEach var="item" items="${itemList}">
								 <c:set var="totalSum" value="${totalSum + item.item_price * item.cart_cnt}" />
								  <tr>
								    <td class="shoping__cart__item" id="item_num">
								      <img src="${item.item_mainImg}" alt="" style="width: 300px; height: 200px">
								      <h5 id="item_name">${item.item_name}</h5>
								    </td> 
								    <td class="shoping__cart__price">
								      ${item.item_price}
								    </td>
								    <!-- 수량 부분 수정 -->
								    <td class="shoping__cart__quantity">
								      <div class="quantity">
								          <div>${item.cart_cnt}</div>
								      </div>
								    </td>
								    <td class="shoping__cart__total">
								      ${item.item_price * item.cart_cnt}
								    </td>
								  </tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
		</div>
	</section>	
	


    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <!-- 주문내역 정보 확인 -->
            <div class="checkout__form">
                <h4>주문정보</h4>
                <form action="insertOrders">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p>주문자정보<span>*</span></p>
                                <input type="text" id="member_name" class="checkout__input__add" value="${memberDTO.member_name}" readonly="readonly">
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 200px; margin-left: 10px; padding-left: 0px;"></p>
                                <input type="text" placeholder="우편번호" id="sample6_postcode_member_post" class="checkout__input__add" value="${memberDTO.member_post}">
                                <input type="text" placeholder="메인주소" id="sample6_address_member_addMain" class="checkout__input__add" value="${memberDTO.member_addMain}">
                                <input type="text" placeholder="상세주소" id="sample6_detailAddress_member_addSub" value="${memberDTO.member_addSub}">
                                <input type="hidden" placeholder="참고항목" id="sample6_extraAddress">
                            </div>
                            <div class="checkout__input">
                                <p>요청 메시지<span>*</span></p>
                                <input type="text" id="order_msg">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>연락처<span>*</span></p>
                                        <input type="text" id="member_phone" value="${memberDTO.member_phone}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="${memberDTO.member_email}">
                                    </div>
                                </div>  
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__total" id="total_sum">Total <span id="total_sum_value">${totalSum}원</span></div>
                                <div class="checkout__input__checkbox">
                                   <!--  <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label> -->
                                </div>
                                <div class="checkout__input__checkbox">
                                </div>
                                <div id="member_email" style="hidden;" value="${memberDTO.member_email}"></div>
							</form>
                            <button id="example-button" type="button" class="site-btn" onclick="requestPay()">결제하기</button> 
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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

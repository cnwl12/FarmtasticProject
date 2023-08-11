<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>
    
<!DOCTYPE html>
<html>

<head>
   
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Farmtastic_Cart</title>

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
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
 	
	<!-- 주문상세 테이블에 추가함수  -->
	<!-- <script type="text/javascript">
	function insertOrderDetail(){
		location.href="insertOrderDetail";  
	}
	</script>
	 -->
	<script type="text/javascript">
	function history(){
		confirm("계속 쇼핑하시겠습니까?");
		location.href="farmStore";
	}
	
	function deleteCart(item_num){
		
		if(confirm("삭제하시겠습니까?")){
			location.href="deleteCart?item_num="+item_num;
		}
	}
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(window).on('load', function () {
	    $('input[type=text]').change(function () {
	        console.log($(this));
	    });

	    $('.pro-qty').click(function () {
	        var cart_cnt = $(this).find('.cart_cnt').val();
	        var item_num = $(this).closest('tr').data('item_num');
	        var item_price = $(this).closest('tr').find('.item_price').text();
            var cart_cnt_int = parseInt(cart_cnt);
            var total = item_price * cart_cnt_int;
            $(this).closest('tr').find('.item_total').text(total.toFixed()) 
            
	        console.log(cart_cnt);
	        console.log(item_num);

	        $.ajax({
	            url: 'cartInUpdate?item_num=' + item_num,
	            data: { 'cart_cnt': cart_cnt },
	            success: function (response) {
                console.log('장바구니 수량 업데이트 성공:', response);
               
           //     console.log(item_price); // 올바른 가격 값이 출력되어야 함
           //     console.log(cart_cnt_int); // 올바른 수량 값이 출력되어야 함
           //     console.log(total);  // 올바른 총 가격 값이 출력되어야 함
           
                },
                error: function (error) {
                console.error('장바구니 수량 업데이트 실패:', error);
	            }
	        });
	    });
	});


	</script>

</head>

<body>
<jsp:include page="../top.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin --> 
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="index">Home</a>
                            <span>Shopping Cart</span>
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
    <div class="shoping__cart__table item_wrap" data-item_num="${item.item_num}">
        <table>
            <thead>
                <tr>
                    <th class="shoping__product">Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <!-- 장바구니에 상품 있을 때 -->
               <c:choose>
                    <c:when test="${not empty itemList}"> 
                        <c:forEach var="item" items="${itemList}">
                            <c:set var="totalSum" value="${totalSum + item.item_price * item.cart_cnt}" />
                             <tr data-item_num="${item.item_num}">
                                <td class="shoping__cart__item">
                                    <a href="farmStoreDetail?item_num=${item.item_num}">
                                        <img src="${item.item_mainImg}" alt="" style="width: 300px; height: 200px">
                                        <h5>${item.item_name}</h5>
                                    </a>
                                </td>
                               <td class="shoping__cart__price item_price">${item.item_price} </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">							<!-- name="item_num=${item.item_num},cart_cnt"  -->
                                            <input type="text" value="${item.cart_cnt}" class="cart_cnt" >
                                        </div>
                                    </div>
                                </td>
                               <td class="shoping__cart__total item_total">
                                    ${item.item_price * item.cart_cnt}
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="icon_close" onclick="deleteCart(${item.item_num})"></span>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when> 
                     <c:otherwise>
                        <tr>
                            <td colspan="5">
                                <div class="empty-cart-message" id="emptyCartMessage">
                                    <i class="fa fa-shopping-bag"></i>
                                    <p>장바구니가 비어있습니다</p> 
                                </div>
                            </td>
                        </tr>
                    </c:otherwise> 
                </c:choose> 
            </tbody>
        </table>
    </div>
		</div>
            </div>
    
<div class="row">
    <c:choose>
        <c:when test="${empty itemList}">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <input type="button" class="primary-btn cart-btn" onclick="history()" value="CONTINUE SHOPPING">
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span>${totalSum}원</span></li>
                        </ul>
                </div>
                     <input type="button" class="primary-btn cart-btn" onclick="history()" value="CONTINUE SHOPPING">
                    <a href="checkout" class="primary-btn">주문하기</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>




    <!-- Shoping Cart Section End -->
    
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
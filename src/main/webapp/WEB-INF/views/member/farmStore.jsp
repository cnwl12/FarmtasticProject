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
    <title>Farmtastic_farmStore</title>

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
   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autoComplete.css" type="text/css"> --%>
	
	
	
	

</head>

<body>

	<jsp:include page="../top.jsp"></jsp:include>



    <!-- Breadcrumb Section Begin -->
  <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>팜팜마켓</h2>
                        <div class="breadcrumb__option">
                            <a href="index">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
               <div class="col-lg-9 col-md-7">
                    
                    
                    
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 여기부터 ul 반복 -->
                    <div class="row">
	              <c:forEach var="item" items="${itemList}">
				    <div class="col-lg-4 col-md-6 col-sm-6">
				        <div class="product__item">
				            <div class="product__item__pic set-bg">
				                <a href="farmStoreDetail?item_num=${item.item_num}">
				                    <div class="image-container">
				                        <div class="product-image"
				                             style="background-image: url('${item.item_mainImg}');"></div>
				                        <c:choose>
				                            <c:when test="${item.item_left < 3}">
				                                <div class="overlay sold-out">마감 임박</div>
				                            </c:when>
				                        </c:choose>
				                    </div>
				                </a> 
                                    <ul class="product__item__pic__hover">
	                                    	<li>
				                             <a href="#" class="wishlist-btn" data-member-num="${sessionScope.member_num}" data-item-num="${item.item_num}">
											  <i class="${item.isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
											</a>
											</li>
                                        <li><a href="insertCart?item_num=${item.item_num}&&cart_cnt=${1}"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                   <div class="product__item__text">
                                    <h6><a href="farmStoreDetail?item_num=${item.item_num}">${item.item_name}</a></h6>
                                    <h5> ${item.item_price}</h5>
                                </div>
                            </div> 
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
  
  	<!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>

<!--  서영 - 찜기능때문에 heart가 위이고 jquery 아래임 index에선 반대 -->
    <!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
   	<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script> --%>
    

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
 
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Farmtastic_Main</title>

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
 	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autoComplete.css">
 	    
 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</head>

<body>
 <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                </div> 
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3"> 
                    <div class="header__logo">
                        <a href="main"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6"> 
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="main">팜타스틱</a></li>
                            <li><a href="farmStore">팜팜마켓</a></li>
                            <li><a href="blog">제철팜</a></li>
                            <li><a href="contact">공지사항</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="mypage"><i class="fa fa-user"></i></a></li>
                           <li><a href="shoppingCart"><i class="fa fa-shopping-bag"></i>
										<c:if test="${not empty sessionScope.member_num && sessionScope.item_count > 0}">
											<span>${sessionScope.item_count}</span>
										</c:if>
									 </a></li>
                        </ul>
                     <div class="header__top__right__auth">
  						<c:choose>
      					<c:when test="${empty sessionScope.member_num}">
         				 <a href="login">Login</a>
      					</c:when>
      					<c:otherwise>
         				<a href="farm/logout"><i class="fa fa-sign-out"></i>Logout</a>
     					</c:otherwise>
  						</c:choose>
					</div>
                    </div>
  	               </div>
            </div>  
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div> 
    </header>
    <!-- Header Section End -->
 
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>모든 카테고리</span>
                        </div>
                        <ul style="display: block;"> 
                        <c:forEach var="type" items="${typeList}">  
                            <li><a href="${pageContext.request.contextPath}/search?query=${type.type_name}">${type.type_name}</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                          <form action="search" method="get" id="search-form">
                               <section class="search">	
                                <input type="text" name="query" id="searchQuery" autocomplete="off">
                                  <div class="autocomplete"></div>
                                </section>
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                    </div> 
                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br>100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="farmStore" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
              <c:forEach var="item" items="${itemList}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg">
                                  <a href="farmStoreDetail?item_num=${item.item_num}">
                              <div class="image-container">
				                        <div class="product-image"
				                             style="background-image: url('${item.item_mainImg}');"></div>
				                       <c:choose>
				                         <c:when test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
				                            <div class="overlay sold-out">판매 종료</div>
				                        </c:when>
				                        <c:when test="${item.item_left < 3}">
				                            <div class="overlay sold-out">마감 임박</div>
				                        </c:when>
				                        </c:choose>
				                    </div>
				                  </a>
                            <ul class="featured__item__pic__hover">
                               <li>
	                             <a href="#" class="wishlist-btn" data-member-num="${sessionScope.member_num}" data-item-num="${item.item_num}">
								  <i class="${item.isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
								</a>
								</li>
								<c:choose>
						    <c:when test="${item.item_left > 0 && item.item_salesStatus != 'N'}">
											<li><a href="#" onclick="insertCart(${item.item_num});">
													<i class="fa fa-shopping-cart"></i>
											</a></li>
										</c:when>
						</c:choose>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="farmStoreDetail?item_num=${item.item_num}">${item.item_name}</a></h6>
                            <h5>${item.item_price}</h5>
                        </div>
                    </div>
                </div>
               </c:forEach>
            </div>
        </div>
    </section>

	<!-- bottom.jsp로 분리  -->
	<jsp:include page="bottom.jsp"></jsp:include>

	<!--  서영 - 찜기능때문에 hquery가 위이고 heart 아래임 farmStore에선 반대 -->
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script>
    window.addEventListener("DOMContentLoaded", () => {
    	  initialize_favorite_items();
    	});

    </script>
    
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<%--     <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script> --%>


</body>

</html>





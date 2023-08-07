<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>팜타스틱 - ${title }</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autoComplete.css">
    
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script> 
    <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script>
        <!-- Js Plugins -->
    <%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
</head>
<body>
    <!-- Preloader Begin -->
<!--     <div class="preloader">
        <div class="loader"></div>
    </div> -->
    <!-- Preloader End -->

    <%-- Header Section Begin --%>
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="index"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="index">팜타스틱</a></li>
                            <li><a href="farmStore">팜팜마켓</a></li>
                            <li><a href="#">기획전</a> </li>
                            <li><a href="blog">제철팜</a></li>
                            <%-- <li><a href="mypage">마이페이지</a></li> --%>
                            <li class="active"><a href="contact">고객센터</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="like_farm"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><a href="shoppingCart">
								 <c:choose>
										<c:when test="${empty sessionScope.item_count}">
											<!-- 장바구니가 비었을 경우 -->
											<i class="fa fa-shopping-bag"></i>
										</c:when>
										<c:otherwise>
											<!-- 장바구니에 있을 경우 -->
											<i class="fa fa-shopping-bag"></i>
											<span>${sessionScope.item_count}</span>
										</c:otherwise>
									</c:choose>
							</a></li>
						</ul>
                        
                    <!--  7.29성하 로그인시 마이페이지 로그아웃버튼생성 -->
                    <div class="header__top__right__auth">
                        <c:choose>
                            <%-- 비로그인 상태인 경우 --%>
                            <c:when test="${empty sessionScope.member_num }">
                                <a href="login"><i class="fa fa-user"></i>Login</a>
                            </c:when>
                            <%-- 로그인 상태인 경우 --%>
                            <c:otherwise>
                                <a href="mypage"><i class="fa fa-user"></i>Mypage</a>
                                <a href="farm/logout"><i class="fa fa-sign-out"></i>Logout</a>
                                 
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                            <!--  <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul> -->
                          </div>      
                    </div>
           
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>모든 카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">바나나</a></li>
                            <li><a href="#">배</a></li>
                            <li><a href="#">블루베리</a></li>
                            <li><a href="#">사과</a></li>
                            <li><a href="#">당근</a></li>
                            <li><a href="#">감자</a></li>
                            <li><a href="#">고구마</a></li>
                            <li><a href="#">옥수수</a></li>
                            <li><a href="#">버섯</a></li>
                            <li><a href="#">호박</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="search" method="get" id="search-form">
                                <div class="hero__search__categories">
                                    모든 카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <section class="search">											<!-- autocomplete="off" -->
                                  <input type="text" name="query" id="searchQuery" placeholder="지민이네 당근은 어떠세요?" autocomplete="off">
                                  <div class="autocomplete"></div>
                                </section>
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
<%-- 
    <c:if test="${not empty itemList}">
    Search Result Section Begin
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <div class="section-title">
                            <h4>검색 결과</h4>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8">
                        <div class="row">
                            <!--                        <div class="col-lg-4 text-right">
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle full-width-btn" type="button" id="sort_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                인기 순
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="sort_dropdown">
                                                                <a class="dropdown-item" href="#">최신 순</a>
                                                                <a class="dropdown-item" href="#">낮은 가격 순</a>
                                                                <a class="dropdown-item" href="#">높은 가격 순</a>
                                                            </div>
                                                        </div>
                                                    </div> -->
                            <div class="col-lg-4 text-right">
                                <div class="dropdown">
                                    검색 조건 드롭다운
                                    <button class="btn btn-secondary dropdown-toggle full-width-btn" type="button" id="filter_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        검색 조건
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="filter_dropdown">
                                        제품명 검색
                                        <form class="form-inline my-2 my-lg-0" action="./search" method="get">
                                            <input class="form-control mr-sm-2" name="query" type="text" placeholder="제품명 검색" aria-label="Search" value="${query}">
                                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                                        </form>
										<c:if test="${param.category ne ''}">
											<form class="form-inline my-2 my-lg-0" action="./search" method="get">
												<input type="hidden" name="query" value="${query}" />
												<input type="hidden" name="category" value="" />
												<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">전체 카테고리</button>
											</form>
										</c:if>
                                        카테고리 검색
                                        <form class="form-inline my-2 my-lg-0" action="./search" method="get">
                                            <input class="form-control mr-sm-2" name="query" type="hidden" value="${query}">
                                            <div class="form-group">
                                                <select class="form-control" name="category">
                                                    전체 카테고리
                                                    <option value="">
                                                        모든 카테고리
                                                    </option>
                                                    DB에서 조회한 카테고리 목록
                                                    <c:forEach items="${categories}" var="category">
                                                        <option value="${category}">${category}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--                        <div class="col-lg-4 text-right">
                                                        <div class="dropdown">
                                                            <button class="btn btn-secondary dropdown-toggle full-width-btn" type="button" id="filter_dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                카테고리
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="filter_dropdown">
                                                                <a class="dropdown-item" href="#">최신 순</a>
                                                                <a class="dropdown-item" href="#">낮은 가격 순</a>
                                                                <a class="dropdown-item" href="#">높은 가격 순</a>
                                                            </div>
                                                        </div>
                                                    </div> -->
                        </div>
                    </div>
                </div>
                <div class="row property__gallery">
                    DB에서 조회한 상품 목록 출력
                    <c:forEach items="${itemList}" var="item">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="product__item">
                                <div class="product__item__pic set-bg"
                                     style="background-image: url('${pageContext.request.contextPath}${item.item_main_img}')">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${pageContext.request.contextPath}/shop-details?item_num=${item.item_num}"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${pageContext.request.contextPath}/shop-details?item_num=${item.item_num}"><i class="fa fa-shopping-bag"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${pageContext.request.contextPath}/shop-details?item_num=${item.item_num}">${item.item_name }</a></h6>
                                    <div class="rating">
                                        별점
                                        50점당 별 1개
                                        예) 4.7 => ★★★★★★☆☆☆
                                        <c:set var="rating" value="${item.review_avg_score div 10 }" />
                                        <c:forEach begin="1" end="5" var="i">
                                            <c:if test="${i le rating }">
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                            <c:if test="${i gt rating }">
                                                <i class="fa fa-star-o"></i>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    가격
                                    <div class="product__price">${item.item_price }원</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    Search Result Section End
    </c:if> --%>
    

    
   <%-- 
    <script>
    function goToSearchdPage() {
        location.href = "${pageContext.request.contextPath}/member/searchd";
    }
    
    $(document).ready(function() {
        자동완성을 위한 ajax 요청
        $("#searchQuery").keyup(function() {
            현재 입력된 검색어
            var query = $(this).val();
            ajax 요청
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/autocomplete",
                data: {query: query},
                success: function(data) {
                    $(".autocomplete").html(data);
                },
                error: function(xhr, status, error) {
                    console.error(xhr);
                }
            });
        });
    });
    </script>
  --%>   
</body>
</html>

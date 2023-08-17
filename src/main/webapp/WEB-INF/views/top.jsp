<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
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
                        <a href="main"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="main">팜타스틱</a></li>
                            <li><a href="farmStore">팜팜마켓</a></li>
                          <!--   <li><a href="#">기획전</a> </li> -->
                            <li><a href="blog">제철팜</a></li>
                            <%-- <li><a href="mypage">마이페이지</a></li> --%>
                            <li class="active"><a href="contact">고객센터</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="mypage"><i class="fa fa-user"></i> </a></li>
							<li><a href="shoppingCart"><i class="fa fa-shopping-bag"></i>
								 <c:choose>
						            <c:when test="${not empty sessionScope.item_count && not empty sessionScope.member_num}">
						                <!-- 장바구니가 비어있지 않고, 로그인한 회원인 경우 -->
						                <span>${sessionScope.item_count}</span>
						            </c:when>
						            <c:otherwise>
						                <!-- 다른 경우 (장바구니가 비어있거나 로그인하지 않은 경우) -->
						            </c:otherwise>
						        </c:choose>
							</a></li>
						</ul>
                        
                    <!--  7.29성하 로그인시 마이페이지 로그아웃버튼생성 -->
                    <div class="header__top__right__auth">
    					<c:choose>
       					 <%-- 비로그인 상태인 경우 --%>
        				<c:when test="${empty sessionScope.member_num }">
           			 <a href="login"></i>Login</a>
        				</c:when>
        				<%-- 로그인 상태인 경우 --%>
        				<c:otherwise>
            			<!-- 카카오 로그인 상태인 경우 -->
            			<c:if test="${not empty sessionScope.accessToken}">
                			<a href="kakaoLogout"><i class="fa fa-sign-out"></i>Logout</a>
            			</c:if>
            			<!-- 일반 로그인 상태인 경우 -->
            			<c:if test="${empty sessionScope.accessToken}">
               		 <a href="farm/logout"><i class="fa fa-sign-out"></i>Logout</a>
            			</c:if>
        				</c:otherwise>
    					</c:choose>
					</div>
                </div>
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
                            <li><a href="${pageContext.request.contextPath}/search?query=바나나">바나나</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=배">배</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=블루베리">블루베리</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=사과">사과</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=당근">당근</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=감자">감자</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=고구마">고구마</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=옥수수">옥수수</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=버섯">버섯</a></li>
                            <li><a href="${pageContext.request.contextPath}/search?query=호박">호박</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="search" method="get" id="search-form">
                                <section class="search">											<!-- autocomplete="off" -->
                                  <input type="text" name="query" id="searchQuery" autocomplete="off">
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
    
    <script>
    function goToSearchdPage() {
        location.href = "${pageContext.request.contextPath}/member/searchd";
    }
    
    $(document).ready(function() {
        //자동완성을 위한 ajax 요청
        $("#searchQuery").keyup(function() {
            // 현재 입력된 검색어
            var query = $(this).val();
            // ajax 요청
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
     
</body>
</html>

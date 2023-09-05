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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recentlyViewed.css">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>    
	<script src="${pageContext.request.contextPath}/resources/js/recentlyViewed.js"></script> 
   	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
   	<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    
</head>
<body>
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
                            <li><a href="blog">제철팜</a></li>
                            <li><a href="contact">공지사항</a></li>
                           	<li style="display: inline-block; vertical-align: middle;">
    						<a href="javascript:void(0);" onclick="openChatPopup()"><img src="${pageContext.request.contextPath}/resources/img/chat.JPG" alt="" width="20" height="20">실시간채팅</a>
     	                </ul> 
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                    <input type="hidden" id="member_num" value="${sessionScope.member_num}">
                        <ul>
                            <li><a href="mypage"><i class="fa fa-user"></i> </a></li>
							<li><a href="shoppingCart"><i class="fa fa-shopping-bag"></i>
										<c:if test="${not empty sessionScope.member_num && sessionScope.item_count > 0}">
											<span>${sessionScope.item_count}</span>
										</c:if>
									 </a></li>
							<c:if test="${not empty sessionScope.member_num}">
								<li>
									<a id="viewed-items-icon">
									  <i class="fa fa-history"></i>
									</a>
									<div id="recently-viewed-container">
									    <div id="recently-viewed-icon"> 최근 본 상품
									        <button id="close-button" style="float: right;">
									            <i class="fa fa-close"></i>
									        </button>
									    </div>
									    <div id="recently-viewed-list"></div>
									</div>						

   
    
								</li>
							</c:if>
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
                        <c:forEach var="type_name" items="${sessionScope.type_names}">
                            <li><a href="${pageContext.request.contextPath}/search?query=${type_name}">${type_name}</a></li>
                        </c:forEach>
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
    
    function openChatPopup() {
        // 팝업 창 옵션 설정
        var popupWidth = 400; // 팝업 창 가로 크기
        var popupHeight = 500; // 팝업 창 세로 크기

        // 브라우저 창의 가운데 좌표 계산
        var leftPosition = (window.screen.width - popupWidth) / 2;
        var topPosition = (window.screen.height - popupHeight) / 2;

        // 실제 팝업 창 열기
        window.open(contextPath + "/realtimechatBot", "chatPopup", "width=" + popupWidth + ", height=" + popupHeight +
                    ", left=" + leftPosition + ", top=" + topPosition +
                    ", resizable=no, scrollbars=no, status=no");
    }

    // 서버 사이드 변수인 contextPath을 JavaScript 변수에 할당합니다.
	var contextPath = "//c2d2303t2.itwillbs.com/FarmProject";
    </script>

</body>
</html>

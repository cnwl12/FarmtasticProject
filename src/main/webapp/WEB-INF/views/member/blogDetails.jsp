<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Farmtastic_seasonFarmDetails</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatBot.css" type="text/css">
</head>

<body>
  <!-- 상단 nav top으로 분리  -->
 <jsp:include page="../top.jsp"></jsp:include>


    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${bContent.admin_blog_mainTitle}</h2>
                        <ul> 
                            <li>By ${bContent.admin_id}</li>
                            <li>${bContent.admin_blog_day}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>  
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <%-- <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="#">All</a></li>
                                <li><a href="#">Beauty (20)</a></li>
                                <li><a href="#">Food (5)</a></li>
                                <li><a href="#">Life Style (9)</a></li>
                                <li><a href="#">Travel (10)</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Recent News</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Apple</a>
                                <a href="#">Beauty</a>
                                <a href="#">Vegetables</a>
                                <a href="#">Fruit</a>
                                <a href="#">Healthy Food</a>
                                <a href="#">Lifestyle</a>
                            </div>
                        </div>
                    </div> --%>
                </div>
                
                <input type="hidden" name="admin_blog_num" value="${admin_blog_num}">
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                    <h4>${bContent.admin_blog_subTitle}</h4><br>
                        <%-- <img src="${pageContext.request.contextPath}/resources/img/blog/details/details-pic.jpg" alt=""> --%>
						<c:choose>
  								<c:when test="${bContent.admin_blog_file != null && bContent.admin_blog_file != ''}">
      									<img src="${bContent.admin_blog_file}"><br>
  								</c:when>
						</c:choose>
                        <p>${bContent.admin_blog_content}</p>
                    </div>
                    
<!--                     <div class="blog__details__content"> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="blog__details__author"> -->
<!--                                     <div class="blog__details__author__pic"> -->
<%--                                         <img src="${pageContext.request.contextPath}/resources/img/blog/details/details-author.jpg" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div class="blog__details__author__text"> -->
<!--                                         <h6>Michael Scofield</h6> -->
<!--                                         <span>Admin</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                            
<!--                             <div class="col-lg-6"> -->
<!--                                 <div class="blog__details__widget"> -->
<!--                                     <ul> -->
<!--                                         <li><span>Categories:</span> Food</li> -->
<!--                                         <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li> -->
<!--                                     </ul> -->
<!--                                     <div class="blog__details__social"> -->
<!--                                         <a href="#"><i class="fa fa-facebook"></i></a> -->
<!--                                         <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                                         <a href="#"><i class="fa fa-google-plus"></i></a> -->
<!--                                         <a href="#"><i class="fa fa-linkedin"></i></a> -->
<!--                                         <a href="#"><i class="fa fa-envelope"></i></a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
                
                
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->


	<!-- Related Blog Section Begin -->
	<section class="related-blog spad">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="section-title related-blog-title">
	                    <h2>이런 레시피는 어떠세요?</h2>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <c:forEach items="${nextThreePosts}" var="nextPost">
	                <div class="col-lg-4 col-md-4 col-sm-6">
	                    <div class="blog__item">
	                        <div class="blog__item__pic">
		                        <c:choose>
	                                <c:when test="${nextPost.admin_blog_file != null && nextPost.admin_blog_file != ''}">
	                                <a href="${pageContext.request.contextPath}/blogDetails?admin_blog_num=${nextPost.admin_blog_num}">
	                                    <img src="${nextPost.admin_blog_file}" style="width: 300px; height: 300px;"><br>
	                                </a>
	                                </c:when>
	                                <c:otherwise>
	                                    	<img src="${pageContext.request.contextPath}/resources/img/blog/blog-1.jpg" alt="">
	                                </c:otherwise>
	                            </c:choose>
	                        </div>
	                        <div class="blog__item__text">
	                            <ul>
	                                <li>${nextPost.admin_blog_day}</li>
	                            </ul>
	                             <h5><a href="${pageContext.request.contextPath}/blogDetails?admin_blog_num=${nextPost.admin_blog_num}">${nextPost.admin_blog_mainTitle}</a></h5>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </div>
	</section>
	
	<button id="chat-toggle" style="display: none;">
    <img src="${pageContext.request.contextPath}/resources/img/gamza.png" alt="" class="gamza">
    </button>
	<div id="chat-panel" style="display: none;">
	<input type="hidden" name="member_num" value="${sessionScope.member_num}">
	    <button id="close-chat">닫기</button>
	    <div id="chat-container">
		    <div class="message bot-message">
		    <img src="${pageContext.request.contextPath}/resources/img/gamza.png" alt="" class="gamza">안녕하세요! 어떻게 도와드릴까요?
		    </div>
	    </div>
	</div>
	<!-- Related Blog Section End -->

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
    <script src="${pageContext.request.contextPath}/resources/js/chatBot.js"></script>

</body>
</html>
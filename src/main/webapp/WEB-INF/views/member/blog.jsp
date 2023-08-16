<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Farmtastic_seasonFarm</title>

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
</head>

<body>
  <!-- 상단 nav top으로 분리  -->
 <jsp:include page="../top.jsp"></jsp:include>
    
    <!-- ////////////////////////상이///////////////////// -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>제철팜</h2> 
                        <div class="breadcrumb__option">
                            <!-- <a href="./main.html">Home</a>
                            <span>제철팜</span> 
                            <a href="main">Home</a>
                            <span>Blog</span>  -->
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
         <div class="container">
            <div class="row"> 
                 <div class="col-lg-4 col-md-5">
                 <!-- 글 검색 바 일단 주석  -->
                  <!-- <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>   
                    </div> -->
                </div>
                
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                    
                        <c:forEach items="${bContent}" var="blist">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <%-- <img src="${pageContext.request.contextPath}/resources/img/blog/blog-2.jpg" alt=""> --%>
                                      <c:choose>
        								<c:when test="${blist.admin_blog_file != null && blist.admin_blog_file != ''}">
        									<a href="${pageContext.request.contextPath}/blogDetails?admin_blog_num=${blist.admin_blog_num}">
            									<img src="${blist.admin_blog_file}" style="width: 300px; height: 300px;"><br>
            								</a>
        								</c:when>
    								</c:choose>
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li>${blist.admin_blog_day}</li>
                                    </ul>
                                    <%-- <h5><a href="blogDetails">${blist.admin_blog_sub}</a></h5> --%>
                                    <h5><a href="${pageContext.request.contextPath}/blogDetails?admin_blog_num=${blist.admin_blog_num}">${blist.admin_blog_mainTitle}</a></h5>
                                    <%-- <td><a href="${pageContext.request.contextPath}/contactContent?admin_cs_num=${list.admin_cs_num}">${list.admin_csnotice_sub}</a></td> --%>
                                    <p>${blist.admin_blog_subTitle}</p>
                                    <a href="${pageContext.request.contextPath}/blogDetails?admin_blog_num=${blist.admin_blog_num}" class="blog__btn">자세히보기 <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>


                        
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
<!--                                 <a href="#">1</a> -->
<!--                                 <a href="#">2</a> -->
<!--                                 <a href="#">3</a> -->
<!--                                 <a href="#"><i class="fa fa-long-arrow-right"></i></a> -->
                                
								<c:if test="${bMap['startPage'] > bMap['pageBlock']}">
        							<a href="${pageContext.request.contextPath}/blog?pageNum=${bMap['startPage'] - bMap['pageBlock']}">이전</a>
								</c:if>
								
								<c:forEach var="i" begin="${bMap['startPage']}" end="${bMap['endPage']}" step="1">
									<a href="${pageContext.request.contextPath}/blog?pageNum=${i}">${i}</a>
								</c:forEach>
								
								<c:if test="${bMap['endPage'] < bMap['pageCount']}">
								    <a href="${pageContext.request.contextPath}/blog?pageNum=${bMap['startPage'] + bMap['pageBlock']}">다음</a>
								</c:if>
                            </div>
                        </div>
                        
                     </div>
                </div>
             </div>
        </div> 
    </section>
    <!-- Blog Section End -->

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
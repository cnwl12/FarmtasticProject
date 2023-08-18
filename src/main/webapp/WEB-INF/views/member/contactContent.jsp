<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Farmtastic_contact</title>  

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

	<!-- 지마켓  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myg.css" type="text/css">

</head>

<body>
<jsp:include page="../top.jsp"></jsp:include>

<section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Notice</h2>
                        <div class="breadcrumb__option">
                            <a href="main">Home</a>
                            <span>Farmtastic</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

      <section class="blog spad" style="padding-top: 10px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                            <ul>  
                                <li><a href="contact">공지사항</a></li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="oneboard">1:1 문의</a></li>
                            </ul>
                        </div>
                     </div>
                </div>
                <div>
    				<h4>공지사항</h4>
    					   <!--글쓰기  -->
                        <div class="card-header py-3">
                           <div class="row">
                            <input type="hidden" name="admin_id" value=" ${admin.admin_id}"/>
                            <input type="hidden" name="admin_cs_num" value="${admin_cs_num}">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                          </div>
                             <label>작성자: </label><input type="text" name="admin_id" value="${content.admin_id}" style="width: 20%; border: none; background-color: white;" readonly="readonly"/><br>    
           					 <label>제목: </label><input type="text" name="admin_csnotice_sub" value="${content.admin_csnotice_sub}" style="width: 40%; border: none; background-color: white;" readonly="readonly"/><br>
           					 <label>첨부파일: </label><input type="text" name="file" value="${content.admin_cs_file}" style="width: 60%; border: none; background-color: white;" readonly="readonly"/>
                        </div>   
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         			<tr>
                         				
                         				<td>
    										<c:choose>
        										<c:when test="${content.admin_cs_file != null && content.admin_cs_file != ''}">
            									<img src="${content.admin_cs_file}" style="width: 500px; height: 500px;"><br>
        										</c:when>
    										</c:choose>
    											<input type="text" name="admin_cs_view" value="${content.admin_cs_view}" style="width: 70%; border: none; background-color: white;" readonly="readonly"/>
										</td>
                         			</tr>
                         		</table>
                            </div>
                          </div>
				</div>
            </div>
       </div>
     </section>
    
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
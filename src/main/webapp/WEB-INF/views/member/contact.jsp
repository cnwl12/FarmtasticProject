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
                        <h2>Contact</h2>
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
                <!-- <div class="col-lg-4 col-md-5"> -->
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
                <!-- </div> -->
				<div style="padding-top: 50px; padding-left: 195px;">
					<h4>공지사항</h4>
					<table class="table table-bordered" id="noticeTable" width="100%"cellspacing="0" style="width: 190%;">
						<thead>
							<tr>
								<th>작성번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${notice}" var="list">
								<tr>
									<td>${list.admin_cs_num}</td>
									<td>${list.admin_id}</td>
									<td><a
										href="${pageContext.request.contextPath}/contactContent?admin_cs_num=${list.admin_cs_num}">${list.admin_csnotice_sub}</a></td>
									<td>${list.admin_cs_day}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
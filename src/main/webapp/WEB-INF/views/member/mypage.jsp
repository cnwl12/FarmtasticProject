<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Mypage</title>

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
	
	<div id="contentswrap"> 
		<div id="contents">
			<div id="main_menu">
				<span class="bg_menu_else"></span>
				<ul class="menu_list">
					<li id="menu1"><a href="#" class="mn1">나의정보</a></li>
					<li id="menu2"><a href="#" class="mn2">주문내역</a></li>
					<li id="menu3"><a href="#" class="mn3">적립금/확인</a></li>
					<li id="menu4"><a href="#" class="mn4">어쩌고...</a></li>
				</ul>
			 </div>
		</div>		
	</div>  			
			<div id="main_cont">
				<form>
					<div class="myoption">
						<h4>나의 설정</h4>					
					<table class="myg_tab">
						<caption>나의설정 메뉴 탭</caption>
						<tbody>
						<tr>
							<td class="on" style="width:50%;">
							<a class="first short" href="MemberInfo"><span>회원정보 설정</span></a>
							</td>			
			
						</tr>
						</tbody>
					</table>
					<h5 class="list1">회원정보 설정</h5>
					
					
					</div>
				</form>
			</div>
	
	
	
	
	
	

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
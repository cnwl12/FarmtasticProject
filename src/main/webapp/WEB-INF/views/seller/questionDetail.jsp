<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>    
    
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
</head>
<body>

	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">문의상세정보</h6>
	</div>
	
	<div class="card-body">
		<div>
			<input type="hidden" name="one_board_num" value="${one_board_num}" />
			<table class="table table-bordered" id="dataTable" >
				<tbody>
					<tr>
					<th>접수일</th>
					<td>${questionDetail.one_board_day}</td>
					</tr>
					
					<tr>
					<th>문의유형</th>
					<td>${questionDetail.one_board_type}</td>
					</tr>
					
					<tr>
					<th>제목</th>
					<td>${questionDetail.one_board_title}</td>
					</tr>
					
					<tr>
					<th>상품명</th>
					<td>${questionDetail.item_name}</td>
					</tr>
					
					<tr>
					<th>질문자</th>
					<td>${questionDetail.member_name}</td>
					</tr>
					
					<tr>
					<th>문의내용</th>
					<td>${questionDetail.one_board_content}</td>
					</tr>
					
					<tr>
					<th>이미지</th>
					<td><img src="${questionDetail.one_board_file}" alt="이미지 없음" style="width:200px; height:200px; display: none;"></td>
					</tr>
					
					<tr>
					<th>답변</th>
					<td>${questionDetail.one_board_reply}</td>
					</tr>
					
					<tr>
					<th>처리상태</th>
					<td>${questionDetail.one_board_repYn}</td>
					</tr>     
					                                   
					<tr>
					<th>처리일시</th>
					<td>${questionDetail.one_board_repDay}</td>
					</tr>    
				</tbody>
			</table>
			<!-- 답변 없으면 -->
			<div style="text-align:center;"> 
				<c:if test="${empty questionDetail.one_board_reply}">
					<button class="btn btn-primary btn-sm mx-2" onclick="opener.redirectToQuestionMngFromPopup(); window.close();">답변 등록하기</button>
				</c:if>
			</div>
		</div>
	</div>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>
  
</body>
</html>
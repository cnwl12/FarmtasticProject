<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>seller/memberMng</title>


<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css">

<!-- 사이드바 줄어든거 되돌리기 -->
<style type="text/css">
html {
	font-size: 1rem !important;
}

body {
	font-size: 1rem !important;
}



</style>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="./inc/sidemenu.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 컨텐츠 시작 -->
			<div id="content">
				<jsp:include page="./inc/top.jsp"></jsp:include>

				<!-- 페이지 컨텐츠 시작 -->
				<div class="container-fluid">

					<!-- 페이지 상단 시작 -->
					<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
					<p class="mb-4">
						<a>날짜는 필수로 입력해야 검색이됩니다(날짜검색후 하단의 Search에서 다른정보검색)</a>.
					</p>
					<!-- 페이지 상단 끝 -->

					<!-- 검색바 시작 -->
					<div class="panel panel-seller"
						ng-include="'shared/products/relation-list/include/search-condition-area.html.inc'">
						<form id="searchForm" name="vm.searchForm" method="get"
							action="${pageContext.request.contextPath}/memberMngPro">
							<div class="panel-body">
								<div class="seller-search-section">
									<ul class="seller-list-border">
										<li><label class="control-label">날짜 검색</label>
											<div class="input-content">
												<div class="form-inline narrow-area">
													<label for="start-date">시작일: </label> <input type="date"
														id="start-date" name="startDate" class="form-control mx-2">
													<label for="end-date">종료일: </label> <input type="date"
														id="end-date" name="endDate" class="form-control mx-2">
													<!-- 1주, 1개월, 3개월, 6개월, 1년 버튼 추가 -->
													<button type="button" class="btn btn-primary btn-sm mx-2"
														onclick="setDateRange(7)">1주</button>
													<button type="button" class="btn btn-primary btn-sm mx-2"
														onclick="setDateRange(30)">1개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2"
														onclick="setDateRange(90)">3개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2"
														onclick="setDateRange(180)">6개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2"
														onclick="setDateRange(365)">1년</button>
													<button type="reset" class="btn btn-default">날짜초기화</button>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="panel-footer">
								<div class="seller-btn-area btn-group-lg">
									<button id="searchButton" type="submit" class="btn btn-primary" onclick="return validateForm()">검색</button>
									<!-- 초기화 버튼 추가 -->
									 <button type="reset" class="btn btn-default"  onclick= "resetSearch()">검색초기화</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색바 끝 -->

					<!-- 주문회원 목록 시작 -->
					
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>회원이름</th>
								<th>연락처</th>
								<th>받는사람이름</th>
								<th>받는사람연락처</th>
								<th>배송정보</th>
								<th>상품명</th>
								<th>주문수량</th>
								<th>주문일</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${MemberMngjoin}">
								<tr>
									<td><c:out value="${data.member_id}" /></td>
									<td><c:out value="${data.member_name}" /></td>
									<td><c:out value="${data.member_phone}" /></td>
									<td><c:out value="${data.order_name}" /></td>
									<td><c:out value="${data.order_phone}" /></td>
									<td><c:out value="${data.order_addMain}" /></td>
									<td><c:out value="${data.item_name}" /></td>
									<td><c:out value="${data.item_cnt}" /></td>
									<td><c:out value="${data.order_day}" /></td>
									<td><c:out value="${data.order_pay.intValue()}" /></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 주문회원 목록 끝 -->
				</div>
				<!-- 페이지 컨텐츠 끝 -->
			</div>
			<!-- 메인 컨텐츠 끝 -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="text-center my-auto">
						<span> </span>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>

	<!-- setDateRange 함수 추가 -->
	<script> 
    function setDateRange(days) { 
        const now = new Date(); 
        const startDateInput = document.getElementById('start-date'); 
        const endDateInput = document.getElementById('end-date'); 
        const startDate = new Date(now - days * 24 * 60 * 60 * 1000); 
        startDateInput.valueAsDate = startDate; 
        endDateInput.valueAsDate = now; 
    } 
    // 초기화 버튼 클릭시 검색 조건 초기화 
    const resetButton = document.querySelector('button[type="reset"]'); 
    resetButton.addEventListener('click', (event) => { 
        event.preventDefault(); 
        document.getElementById('start-date').value = ''; 
        document.getElementById('end-date').value = ''; 
    }); 
    
    
    function validateForm() {
        var startDate = document.getElementById('start-date').value;
        var endDate = document.getElementById('end-date').value;

        if (startDate === '' || endDate === '') {
            alert("날짜를 입력하여 주세요.");
            return false;
        }
    }
    var message = "${message}";
    if (message !== "") {
        alert(message);
        window.location.href = "${pageContext.request.contextPath}/memberMng";
    }
    
   

    

 function resetSearch() {
      // 테이블 데이터 리셋
      var tableBody = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
      
      while (tableBody.firstChild) {
          tableBody.removeChild(tableBody.firstChild);
      }
      
       // 원본 데이터 복원
       for (var i = 0; i < originalTableData.length; i++) {
           var newRow = document.createElement("tr");
           newRow.innerHTML = originalTableData[i];
           tableBody.appendChild(newRow);
       }
 }
 

 window.addEventListener('DOMContentLoaded', function() {
     adjustTableWidth();
 });

 function adjustTableWidth() {
     var table = document.getElementById('dataTable');
     var tableCells = table.getElementsByTagName('th');

     for (var i = 0; i < tableCells.length; i++) {
         var cellText = tableCells[i].innerText;
         var cellWidth = getTextWidth(cellText);
         tableCells[i].style.width = cellWidth + 'px';
     }
 }

 function getTextWidth(text) {
     var element = document.createElement('span');
     element.style.visibility = 'hidden';
     element.style.whiteSpace = 'nowrap';
     element.innerHTML = text;
     
     document.body.appendChild(element);
     
     var width = element.offsetWidth;
     
     document.body.removeChild(element);
     
     return width;
 }

 
    </script>
</body>
</html>

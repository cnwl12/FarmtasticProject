<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <jsp:include page="../inc/sidemenu.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                 <jsp:include page="../inc/top.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">업체관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" id="sellerAdmin">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">미승인된 업체 목록</h6>
                        </div>
                        <form action="${pageContext.request.contextPath}/changeSellerStatus" method="post" id="changeSellerStatus">
                        <input type="hidden" id="actionType" name="actionType" /> 
                        <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="recoSeller" type="submit">업체 승인</button>
                        <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="rejectSeller" type="submit">업체 거절</button>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" class="reject-check-all"/></th>
                                            <th>번호</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>사업장 번호</th>
                                            <th>상태</th>
                                            <th>가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    								<c:set var="total" value="${fn:length(sellers)}" /> <!-- 전체 업체 수를 계산 -->
    								<c:set var="count" value="0" /> <!-- 순차 카운터 변수 초기화 -->
    								<c:forEach items="${sellers}" var="seller" varStatus="status">
        							<c:if test="${seller.seller_recoYn != 'Y'}">
            						<c:set var="reversedCount" value="${total - status.index}" /> <!-- 역방향 카운트 계산 -->
            						<c:set var="count" value="${count + 1}" /> <!-- 순차 카운터 변수 증가 -->
            						<tr>
                						<td><input type="checkbox" class="sellerRejectbox" name="result" value="${seller.seller_num}" /></td>
                						<td>${count}</td> <!-- 순차 카운터 표시 -->
                						<td>${seller.seller_storeName}</td>
                						<td>${seller.seller_name}</td>
                						<td>${seller.seller_licenseNum}</td>
                						<td>${seller.seller_recoYn}</td>
                						<td>${seller.seller_joinDay}</td>
            						</tr>
        							</c:if>
    								</c:forEach>
									</tbody>
                                </table>
                            </div>
                        </div>
                       </form>
                       
                       <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">승인된 업체 목록</h6>
                        </div>
                       <form action="${pageContext.request.contextPath}/changeSellerStatus" method="post" id="changeSellerStatus">
                        <input type="hidden" id="actionType" name="actionType" /> 
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" class="reco-check-all"/></th>
                                            <th>코드</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>사업장 번호</th>
                                            <th>가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sellers}" var="seller">
   								 		<c:if test="${seller.seller_recoYn == 'Y'}">
        								<tr>
            							<td><input type="checkbox" class="sellerRecobox" name="result" value="${seller.seller_num}" /></td>
            							<td>${seller.seller_num}</td>
            							<td>${seller.seller_storeName}</td>
            							<td>${seller.seller_name}</td>
            							<td>${seller.seller_licenseNum}</td>
            							<td>${seller.seller_joinDay}</td>
        								</tr>
    									</c:if>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       </form>
                       </div>   
                       
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
		</div>
       <!-- End of Content Wrapper -->
        </div>
    <!-- End of Page Wrapper -->
    
    
    
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

  

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
	
	<!-- changeSellerStatus -->
	<script>
	// Change Seller Status
    document.getElementById('recoSeller').addEventListener('click', function () {
        document.getElementById('actionType').value = 'approve';
        document.getElementById('changeSellerStatus').submit();
    });
    document.getElementById('rejectSeller').addEventListener('click', function () {
        document.getElementById('actionType').value = 'reject';
        document.getElementById('changeSellerStatus').submit();
    });

    // Check All checkboxes
    function toggleRejectCheckAll() {
  const rejectCheckAll = sellerAdmin.querySelectorAll(".reject-check-all");
  const sellerRejectboxes = sellerAdmin.querySelectorAll(".sellerRejectbox");

  rejectCheckAll.forEach((element) => {
    element.addEventListener("click", (event) => {
      sellerRejectboxes.forEach((checkbox) => {
        checkbox.checked = event.target.checked;
      });
    });
  });
}

function toggleRecoCheckAll() {
  const recoCheckAll = sellerAdmin.querySelectorAll(".reco-check-all");
  const sellerRecoboxes = sellerAdmin.querySelectorAll(".sellerRecobox");

  recoCheckAll.forEach((element) => {
    element.addEventListener("click", (event) => {
      sellerRecoboxes.forEach((checkbox) => {
        checkbox.checked = event.target.checked;
      });
    });
  });
}

toggleRejectCheckAll();
toggleRecoCheckAll();
</script>
	
</body>

</html>
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

    <title>Admin2</title>

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
                    <h3 class="m-0 font-weight-bold text-primary">업체관리 승인.탈퇴한업체</h3>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" id="sellerAdmin">
                      <div>
                    	
                       <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">승인거절된 업체 목록</h6>
                        </div>
                         <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>사업자 등록번호</th>
                                            <th>상태</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
    								<c:set var="total" value="${fn:length(sellers)}" /> <!-- 전체 업체 수를 계산 -->
    								<c:set var="count" value="0" /> <!-- 순차 카운터 변수 초기화 -->
    								<c:forEach items="${sellers}" var="seller" varStatus="status">
        							<c:if test="${seller.seller_recoYn == 'N'}">
            						<c:set var="reversedCount" value="${total - status.index}" /> <!-- 역방향 카운트 계산 -->
            						<c:set var="count" value="${count + 1}" /> <!-- 순차 카운터 변수 증가 -->
            						<tr data-status="unapproved">
                						<td>${count}</td> <!-- 순차 카운터 표시 -->
                						<td><a href="javascript:void(0);" onclick="showDetail('${seller.seller_num}')">${seller.seller_storeName}</a></td>
                						<td>${seller.seller_name}</td>
                						<td>${seller.seller_licenseNum}</td>
                						<td>${seller.seller_recoYn}</td>
                						
            						</tr>
        							</c:if>
    								</c:forEach>
									</tbody>
                                </table>
                            </div>
                        </div>
                      
                       
                       
                        <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">탈퇴한 업체 목록</h6>
                        </div>
                      
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable4" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>사업자 등록번호</th>
                                            <th>상태</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
    								<c:set var="total" value="${fn:length(sellers)}" /> <!-- 전체 업체 수를 계산 -->
    								<c:set var="count" value="0" /> <!-- 순차 카운터 변수 초기화 -->
    								<c:forEach items="${sellers}" var="seller" varStatus="status">
        							<c:if test="${seller.seller_recoYn == 'D'}">
            						<c:set var="reversedCount" value="${total - status.index}" /> <!-- 역방향 카운트 계산 -->
            						<c:set var="count" value="${count + 1}" /> <!-- 순차 카운터 변수 증가 -->
            						<tr data-status="unapproved">
                						<td>${count}</td> <!-- 순차 카운터 표시 -->
                						<td><a href="javascript:void(0);" onclick="showDetail('${seller.seller_num}')">${seller.seller_storeName}</a></td>
                						<td>${seller.seller_name}</td>
                						<td>${seller.seller_licenseNum}</td>
                						<td>${seller.seller_recoYn}</td>
                						
            						</tr>
        							</c:if>
    								</c:forEach>
									</tbody>
                                </table>
                            </div>
                        </div>
                                          
                       
                       </div>
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
function showDetail(sellerNum) {
    // 회원 정보 조회 API URL
	  const url = '${pageContext.request.contextPath}/sellerDetail?seller_num=' + sellerNum;
    // 팝업 창 열기
    window.open(url, 'sellerInfoPopup', 'width=800,height=600');

    // 팝업 창에서 메인 창으로 포커스 이동
    opener.focus();
}
</script>
</body>

</html>
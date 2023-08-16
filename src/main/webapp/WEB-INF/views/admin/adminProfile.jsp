
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

 
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>

    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="./inc/sidemenu.jsp"></jsp:include>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <jsp:include page="./inc/top.jsp"></jsp:include>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Content Row -->
                    <div class="row">
	<!-- 판매자 정보 시작 -->
						<div class="panel panel-seller" id="chargePersonInfoPanelInSellerInfoPage">

							<div class="panel-heading">
								<div class="pull-left">
									<h3 class="panel-title">관리자 정보</h3>
								</div>
							</div>

							<div class="panel-body">
								<ul class="seller-list-border">
									<li>
									<label class="control-label">로그인ID</label>
										<div class="input-content">
											<input type="text" class="form-control" value="${admin.admin_id}" readonly="readonly" >
										</div>
									</li>
									<li>
									<label class="control-label">이름</label>
										<div class="input-content">
											<input type="text" class="form-control" value="${admin.admin_name}" readonly="readonly">
										</div>
									</li>

									<li>
									<label class="control-label">닉네임</label>
										<div class="input-content">
											<div class="form-inline mobile-inline"> <!-- 이 클래스는 텍스트박스 길이 줄여줌. 없으면 늘어남 -->
												<input type="text" class="form-control" value="${admin.admin_nickname}">
											</div>
										</div>
									</li>
								
									
									<li>
									<label class="control-label">생년월일</label>
										<div class="input-content">
    										<div class="form-inline mobile-inline">
        									<input type="date" id="birth_date" class="form-control" value="${admin.admin_birth}">
    										</div>
    										</div>
									</li>
									<li>
									<label class="control-label">입사일</label>
										<div class="input-content">
    										<div class="form-inline mobile-inline">
        									<input type="date" id="birth_date" class="form-control" value="${admin.admin_hiredate}" readonly="readonly">
    										</div>
    										</div>
									</li>
								</ul>
								   <div class="btn_center">
                        <button type="submit" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">수정하기</button>
                     </div>
							</div>

						</div>
						<!-- 판매자 정보 끝 -->



                    </div>

                  </div>
              </div>

         

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="adminLogin">Logout</a>
                </div>
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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>
		<script>
$(document).ready(function () {
    // DatePicker settings
    $("#birth_date").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0"
    });
});
</script>
</body>

</html>
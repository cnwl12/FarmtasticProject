<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>seller/sellerMng</title>

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css"
	rel="stylesheet"> 

<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

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
				<form action="${pageContext.request.contextPath}/sellerUpdatePro" method="post">
					<input type="hidden" name="seller_num" value="${seller.seller_num}">
					<!-- 페이지 상단 시작 -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">판매자정보</h1>
					</div>
					<!-- 페이지 상단 끝 -->

					<!-- 로그인정보 / 기본정보 시작 -->
					<div class="panel panel-seller" id="chargePersonInfoPanelInSellerInfoPage">
						<div class="panel-heading">
							<div class="pull-left">
<%-- 								<a href="${pageContext.request.contextPath}/sellerUpdatePro">판매자정보수정</a><br> --%>
								
								<h3 class="panel-title">판매자 정보</h3>
							</div>
						</div>
						
						<div class="panel-body">
							<ul class="seller-list-border">
								<li>
								<label class="control-label">이름</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_name}</div>
								</div>
								</li>
								
								<li>
								<label class="control-label">로그인ID</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_id}</div>
								</div>
								</li>
								
								<li>
								<label class="control-label">이메일 주소</label>
								<div class="input-content">
<%-- 									<div class="form-control-static">${seller.seller_email} --%>
									<input type="text" class="form-control" name="seller_email" value="${seller.seller_email}"></div>
								</li>
								
								<li>							<!-- 이 class 뭐지?  -->
								<label class="control-label">휴대폰<br class="visible-xs">번호</label>
								<div class="input-content">
<%-- 									<div class="form-control-static">${seller.seller_mobile} --%>
									<input type="text" class="form-control" name="seller_mobile" value="${seller.seller_mobile}"></div>
								</li>
							</ul>
						</div>
					</div>
					<!-- 로그인정보 / 기본정보 끝 -->
 

					<!-- 정산정보 시작 -->
					<div class="panel panel-seller">
						<div class="panel-heading">
							<h3 class="panel-title">정산정보</h3>
						</div>
						<div class="panel-body">
							<ul class="seller-list-border">
								<li ng-if="vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL' || vm.accountInfo.represent.representType === 'DOMESTIC_BUSINESS'">
								<label class="control-label long-label">정산대금<br class="visible-xs">입금계좌
								</label>
								<div class="input-content">
										<div class="form-inline mobile-inline">
											<div class="form-group form-control-static">
												<input type="text" class="form-control" name="seller_accountHolder" value="(예금주: ${seller.seller_accountHolder})">
												<input type="text" class="form-control" name="seller_bank" value="(은행: ${seller.seller_bank})">
												<input type="text" class="form-control" name="seller_accountNum" value="${seller.seller_accountNum}">
												 <span class="text-sub"></span>
											</div>
											<div class="form-group">
											</div>
										</div>
										<!---->
										
									</div></li>
								<!---->
								<!---->
							</ul>
						</div>
					</div>
					<!-- 정산정보 끝 -->

					<!-- 배송정보 시작 -->
					<div class="panel panel-seller">
						<div class="panel-heading">
							<h3 class="panel-title">배송정보</h3>
						</div>
						<div class="panel-body">
							<div class="panel-body-info">
							설명
							</div>
							<ul class="seller-list-border">
								<li><label class="control-label" for="delivery-addr">출고지 주소</label>
								<div class="input-content">
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" value="상품출고지"
													id="delivery-addr" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" name="seller_post" value="(우:${seller.seller_post})">
											<input type="text" class="form-control" name="seller_addMain" value="${seller.seller_addMain}">
											<input type="text" class="form-control" name="seller_addSub" value="${seller.seller_addSub}">
										</div>
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" name="seller_mobile" value="${seller.seller_mobile}" title="출고지 전화번호1">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" name="seller_phone" value="${seller.seller_phone}" title="출고지 전화번호2">
											</div>
										</div>
									</div></li>
								<li><label class="control-label long-label"
									for="return-addr">반품/<br class="visible-xs">교환지 주소
								</label>
								<div class="input-content">
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" value="반품교환지"
													id="return-addr" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" name="seller_addMain" value="(우:${seller.seller_post}) ${seller.seller_addMain} (${seller.seller_addSub}) "
												title="반품/교환지 주소">
										</div>
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" name="seller_mobile" value="${seller.seller_mobile}" title="반품/교환지 전화번호1"> </div>
											<div class="form-group">
												<input type="text" class="form-control" name="seller_phone" value="${seller.seller_phone}" title="반품/교환지 전화번호2">
											</div>
										</div>
									</div></li>
								<!---->
								<!---->
								<!---->
							</ul>
						</div>
						<input type="submit" value="정보수정">							
					</div>
				</form>
					<!-- 배송정보 끝 -->

					<!-- 관리자권한 시작 -->
					<!-- 관리자 권한이 뭐지? 일단 보류 -->
					<!-- 관리자권한 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->

			</div>
			<!-- 메인 컨텐츠 끝 -->

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>
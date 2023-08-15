<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>seller/itemRegister</title>

<!-- Custom fonts for this template -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this page -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css">

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

	<div id="wrapper">
		<jsp:include page="./inc/sidemenu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 컨텐츠 시작 -->
			<div id="content">

				<jsp:include page="./inc/top.jsp"></jsp:include>

				<!-- 페이지 컨텐츠 시작 -->
				<div class="container-fluid">

					<!-- 페이지 상단 시작 -->
					<h1 class="h3 mb-2 text-gray-800">상품등록</h1>
					<!-- 페이지 상단 끝 -->

					<form action="itemInsertPro" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
						<!-- 카테고리 선택 시작-->
						<div class="form-section">
							<div class="title-line">
								<label class="col-lg-2 col-sm-3 col-xs-5 control-label">카테고리
									<i class="icon-must" aria-label="필수항목"></i>
								</label>
								<div class="col-lg-10 col-sm-9 col-xs-7 input-content"></div>
							</div>

							<div class="inner-content input-content">
								<div class="form-section-sub">
									<div class="form-sub-wrap">
										<div class="input-content">
											<!-- 셀렉트박스로 바꿀 예정 -->
											<select name="seller_type" id="seller_type">
												<option value="">카테고리를 선택해주세요</option>
												<option value="FR">사과</option>
												<option value="PE">배</option>
												<option value="TA">감귤</option>
												<option value="BA">바나나</option>
												<option value="GR">포도</option>
												<option value="PO">감자</option>
												<option value="SW">고구마</option>
												<option value="ON">양파</option>
												<option value="CA">당근</option>
												<option value="MU">버섯</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 카테고리 선택 끝 -->

						<!-- 상품명 등록 시작 -->
						<div class="form-section">
							<div class="title-line">
								<label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품명
									<i class="icon-must" aria-label="필수항목"></i>
								</label>
								<div class="col-lg-10 col-sm-9 col-xs-6 input-content"></div>
							</div>
							<div class="inner-content input-content">
								<div class="form-section-sub">
									<div class="form-sub-wrap">
										<div class="input-content">
											<div class="form-group">
												<div class="input-group">
													<div class="seller-input-wrap">
														<input name="item_name" type="text" class="form-control" title="상품명 입력" value="">
													</div>
												</div>
											</div>
											<!---->
											<p class="sub-text text-primary">판매 상품과 직접 관련이 없는 다른 상품명,
												스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.</p>
											<p class="sub-text text-primary">유명 상품 유사문구를 무단으로 도용하여
												~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품명 등록 끝 -->


						<!-- 판매가 설정 시작 -->
						<div class="form-section" id="price-benefit">
							<div class="title-line">
								<label class="col-lg-1 col-sm-2 col-xs-4 control-label">판매가
									<i class="icon-must" aria-label="필수항목"></i>
								</label>
								<div class="col-lg-11 col-sm-10 col-xs-8 input-content"></div>
							</div>
							<div class="inner-content input-content">
								<div class="form-section-sub">
									<div class="form-sub-wrap">
										<label class="control-label" for="prd_price2">판매가<i
											class="icon-must" aria-label="필수항목"></i></label>
										<div class="input-content">
											<div class="form-inline" id="error_salePrice">
												<div class="form-group">
													<div class="input-group">
														<div class="seller-input-wrap">
															<input
																type="text"
																class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
																id="prd_price2" max="999999990" max-err-type="max.won"
																name="item_price"
																value="">
														</div>
														<span class="input-group-addon">원</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 판매가 설정 끝 -->

						<!-- 재고 수량 설정 시작 -->
						<div class="form-section">
							<div class="title-line">
								<label class="col-lg-1 col-sm-2 col-xs-4 control-label"
									for="stock">재고수량<i class="icon-must" aria-label="필수항목"></i></label>
								<div class="col-lg-11 col-sm-10 col-xs-8 input-content"></div>
							</div>
							<!---->
							<div class="inner-content input-content">
								<div class="form-section-sub">
									<div class="form-sub-wrap">
										<div class="input-content">
											<div class="form-inline" id="error_stockQuantity">
												<div class="form-group">
													<div class="input-group">
														<div class="seller-input-wrap">
															<input name="item_left" value=""
																type="number"
																class="form-control"
																id="stock" placeholder="숫자만 입력" title="재고수량 입력">
														</div>
														<span class="input-group-addon">개</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!---->
						</div>
						<!-- 재고 수량 설정 끝 -->


						<!-- 상품 이미지 등록 시작 -->
						<div class="form-section">
							<div class="title-line">
								<label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품이미지<i
									class="icon-must" aria-label="필수항목"></i></label>
								<div class="col-lg-10 col-sm-9 col-xs-6 input-content"></div>
							</div>
							<div class="input-content inner-content" ng-if="vm.isMenuOpen">
								<div class="form-section-sub">
									<div ng-form="_REPRESENTATIVE_IMAGE"
										class="ng-pristine ng-invalid ng-invalid-required">
										<div class="form-sub-wrap">
											<label class="control-label">대표이미지<i
												class="icon-must" aria-label="필수항목"></i> <!----> <!----></label>
											<div class="input-content">
												<ncp-product-temp-photo-infra-image-upload id="representImage">
												<div class="seller-product-img add-img">
													<div class="wrap-img">
														<ul class="img-list">
															<li ng-if="!(vm.isReadonly() || vm.isMaxUploaded())">
																<!----> <!---->
																<div class="register-img">
																	<a role="button" href="" class="btn-add-img"> <i
																		class="seller-icon icon-plus" aria-hidden="true"></i>
																		<input type="file" name="file" value="">
																		<span class="sr-only">이미지 등록</span></a>
																</div> 
															</li>
														</ul>
													</div>
												</div>
											</div>
											</ncp-product-temp-photo-infra-image-upload>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!---->

						</ui-view>
						<!-- 상품 이미지 등록 끝 -->

						<!-- 상품 상세설명 등록 시작 -->
						<div class="form-section">
							<div class="title-line">
								<label class="col-lg-2 col-sm-3 col-xs-6 control-label">상세설명
									<i class="icon-must" aria-label="필수항목"></i> 
								</label>
								<div class="col-lg-10 col-sm-9 col-xs-6 input-content"></div>
							</div>
							<div class="input-content inner-content">
								<div class="form-section-sub">
									<div class="form-sub-wrap"></div>
									<textarea name="item_detail" value=""></textarea>
								</div>
							</div>
						</div>
						<input type="submit" value="등록">
					</form>
				</div>
			</div>

		</div>
	</div>
			<!-- 상품 상세설명 등록 끝 -->
	<!-- 페이지 컨텐츠 끝 -->
		
		<!-- 메인 컨텐츠 끝 -->
		
		<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
		
		<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2020</span>
				</div>
			</div>
		</footer>
		<!-- End of Footer -->

	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

	

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

</body>

</html>
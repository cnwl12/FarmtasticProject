<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<title>seller/itemRegister</title>

		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script	src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script	src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>


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

<script src="${pageContext.request.contextPath}/resources/js/inputValidate.js"></script>

<!-- 사이드바 줄어든거 되돌리기 -->
<style type="text/css">
html {
	font-size: 1rem !important;
}

body {
	font-size: 1rem !important;
}
</style>

<script>
    window.onload = function() {
        // 이전에 선택된 값을 가져오기
        var previousSellerType = "${item.seller_type}";
        var previoussalesStatus = "${item.item_salesStatus}";
        // select 요소 가져오기
        var selectElement = document.getElementById("seller_type");
        var selectElementS = document.getElementById("item_salesStatus");
        
        // 셀러타입(셀렉트박스)
        for (var i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value === previousSellerType) {
                selectElement.options[i].selected = true;
                break;
            }
        }
        // 판매상태(셀렉트박스)
        for (var i = 0; i < selectElementS.options.length; i++) {
            if (selectElementS.options[i].value === previoussalesStatus) {
            	selectElementS.options[i].selected = true;
                break;
            }
        }
    };
</script>


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
					<h1 class="h3 mb-2 text-gray-800">상품등록 수정</h1>
					<!-- 페이지 상단 끝 -->

					<form action="itemUpdatePro" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
					<input type="hidden" id="item_num"name="item_num" value="${item.item_num}">
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
												<option value="ETC">기타</option>
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
														<input name="item_name" type="text" class="form-control" title="상품명 입력" value="${item.item_name}">
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
										<div class="input-content">
											<div class="form-inline" id="error_salePrice">
												<div class="form-group">
													<div class="input-group">
														<div class="seller-input-wrap">
															<input
																type="text"
																class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
																id="item_price" max="999999990" min="0"
																oninput="validateNumberInput(this, 0, 999999990)"
																style="width: 285px;"
																name="item_price" value="${item.item_price}">
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
									for="stock">재고수량<i class="icon-must"></i></label>
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
															<input name="item_left" value="${item.item_left}"
																type="number"  min="0" max="100"
																class="form-control"
																style="width: 285px;"
																id="item_left_input" placeholder="최소1부터 최대100까지" title="재고수량 입력">
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
							<div class="input-content inner-content">
								<div class="form-section-sub">
										<div class="form-sub-wrap">
											<label class="control-label">대표이미지<i class="icon-must" aria-label="필수항목"></i></label>
											<div class="input-content">
												<div class="seller-product-img add-img">
													<div class="wrap-img">
														<ul class="img-list">
															<li>
																<div class="register-img">
																	<img src="${item.item_mainImg}" style="width:300px; height : 100px;">
																	<input type="hidden" name="item_mainImg" value="${item.item_mainImg}">
																</div> 
															</li>
															<li>
																<div class="register-img">
																<img src="${pageContext.request.contextPath}/resources/img/camera.png">
																		<input type="file" name="file"><!-- 새로 받을 파일  -->
																		<span class="sr-only">이미지 등록</span>
																</div> 
															</li>
														</ul>
													</div>
												</div>
											</div>
											
										</div>
								</div>
							</div>
						</div>
						<!---->

						</ui-view>
						<!-- 상품 이미지 등록 끝 -->
						
						<!-- 판매 상태 변경 -->
					<div class="form-section">
						<div class="title-line">
							<label class="col-lg-2 col-sm-3 col-xs-6 control-label">판매상태
								<i class="icon-must" aria-label="필수항목"></i>
							</label>
							<div class="col-lg-10 col-sm-9 col-xs-6 input-content"></div>
						</div>
						<div class="inner-content input-content">
							<div class="form-section-sub">
								<div class="form-sub-wrap">
									<div class="input-content">
										<select name="item_salesStatus" id="item_salesStatus">
											<option value="">판매상태</option>
											<option value="Y">판매</option>
											<option value="N">판매종료</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
							

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
									<textarea name="item_detail" style=" width: 100%;  height: 150px; resize: vertical;">${item.item_detail}</textarea>
								</div>
							</div>
						</div>
						<input type="submit" value="수정">
					</form>
				</div>
			</div>

		</div>
	</div>
			
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
</body>

</html>
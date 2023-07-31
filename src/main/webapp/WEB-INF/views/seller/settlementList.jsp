<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/settlementList</title>

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
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
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
                    <h1 class="h3 mb-2 text-gray-800">정산관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 정산 조회 / 정산내역 및 목록 시작 -->
					<meta http-equiv="Content-Script-Type" content="text/javascript">
					<meta http-equiv="Content-Style-Type" content="text/css">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<link rel="shortcut icon"
						href="https://img.pay.naver.net/static/images/mall/favicon.ico">
					<script type="text/javascript"
						src="${pageContext.request.contextPath}/resources/naver/naverJs/xlsx-populate.min.js?230712-184334"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath}/resources/naver/naverJs/base64.min.js?230712-184334"></script>
					<link type="text/css" rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/naver/naverCss/style.css?230712-184334">
					<link type="text/css" rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/naver/naverCss/vendor.css?230712-184334">
					<link type="text/css" rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/naver/naverCss/common.css?230712-184334">
					<link type="text/css" rel="stylesheet"
						href="${pageContext.request.contextPath}/resources/naver/naverCss/settlemgt.css?230712-184334">
					<style>
					body {
						margin: 0;
						padding: 0;
						font-family: '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum,
							Helvetica, sans-serif;
						font-size: 12px;
						background-color: #edf0f5;
					}
					</style>
					<script type="text/javascript"
						src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.17.1/gfp-sdk.js"
						async="" charset="utf-8"></script>
					<style type="text/css" id="tui-grid-theme-style">
					.tui-grid-border-line-top {
						background-color: #efefef
					}
					
					.tui-grid-no-scroll-x .tui-grid-border-line-bottom {
						background-color: #efefef
					}
					
					.tui-grid-frozen-border {
						background-color: #ddd
					}
					
					.tui-grid-container ::-webkit-scrollbar {
						background-color: #fff
					}
					
					.tui-grid-container ::-webkit-scrollbar-thumb {
						background-color: #ddd
					}
					
					.tui-grid-container ::-webkit-scrollbar-thumb:hover {
						background-color: #ddd
					}
					
					.tui-grid-container {
						scrollbar-3dlight-color: #fff;
						scrollbar-darkshadow-color: #fff;
						scrollbar-track-color: #fff;
						scrollbar-shadow-color: #fff;
						scrollbar-face-color: #ddd;
						scrollbar-highlight-color: #ddd;
						scrollbar-arrow-color: #ddd
					}
					
					.tui-grid-border-line-bottom {
						background-color: #eee
					}
					
					.tui-grid-content-area {
						border-color: #eee
					}
					
					.tui-grid-scrollbar-y-inner-border {
						background-color: #eee
					}
					
					.tui-grid-scrollbar-y-outer-border {
						background-color: #eee
					}
					
					.tui-grid-scrollbar-right-top {
						background-color: #f9f9f9;
						border-color: #eee
					}
					
					.tui-grid-scrollbar-right-bottom {
						background-color: #f9f9f9;
						border-color: #eee
					}
					
					.tui-grid-scrollbar-left-bottom {
						background-color: #f9f9f9;
						border-color: #eee
					}
					
					.tui-grid-scrollbar-frozen-border {
						background-color: #f9f9f9;
						border-color: #eee
					}
					
					.tui-grid-height-resize-handle {
						background-color: #fff;
						border-color: #fff
					}
					
					.tui-grid-pagination {
						background-color: transparent;
						border-color: transparent
					}
					
					.tui-grid-layer-selection {
						background-color: #00A9ff;
						border-color: #00a9ff
					}
					
					.tui-grid-head-area {
						background-color: #f9f9f9;
						border-color: #efefef
					}
					
					.tui-grid-body-area {
						background-color: #fff
					}
					
					.tui-grid-summary-area {
						background-color: #fff;
						border-color: #fff
					}
					
					.tui-grid-has-summary-top .tui-grid-body-area {
						border-color: #fff
					}
					
					.tui-grid-cell {
						background-color: white;
						border-color: #efefef;
						border-left-width: 1px;
						border-right-width: 1px;
						border-top-width: 1px;
						border-bottom-width: 1px;
						color: #555555
					}
					
					.tui-grid-cell-dummy {
						background-color: #fff
					}
					
					.tui-grid-cell-editable {
						background-color: #fff
					}
					
					.tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-head-area .tui-grid-table
						{
						border-right-style: solid
					}
					
					.tui-grid-cell-head {
						background-color: #f9f9f9;
						border-color: #eee;
						border-left-width: 1px;
						border-right-width: 1px;
						border-top-width: 1px;
						border-bottom-width: 1px;
						color: #555555
					}
					
					.tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-body-area .tui-grid-table
						{
						border-right-style: hidden
					}
					
					.tui-grid-cell-row-head {
						background-color: #fff;
						border-color: #eee;
						border-left-width: 0;
						border-right-width: 0;
						border-top-width: 1px;
						border-bottom-width: 1px;
						color: #333
					}
					
					.tui-grid-show-lside-area .tui-grid-lside-area .tui-grid-summary-area .tui-grid-table
						{
						border-right-style: hidden
					}
					
					.tui-grid-cell-summary {
						background-color: #fff;
						border-color: #eee;
						border-left-width: 0;
						border-right-width: 0;
						color: #333
					}
					
					.tui-grid-cell-required {
						background-color: #fffdeb
					}
					
					.tui-grid-cell-disabled {
						background-color: #f9f9f9;
						color: #c1c1c1
					}
					
					.tui-grid-cell-invalid {
						background-color: #ffe5e5
					}
					
					.tui-grid-cell-head.tui-grid-cell-selected {
						background-color: transparent
					}
					
					.tui-grid-cell-row-head.tui-grid-cell-selected {
						background-color: transparent
					}
					
					.tui-grid-layer-focus-border {
						background-color: #00a9ff
					}
					
					.tui-grid-layer-editing {
						border-color: #00a9ff
					}
					
					.tui-grid-layer-focus-deactive .tui-grid-layer-focus-border {
						background-color: #aaa
					}
					</style>
					<script type="text/javascript"
						src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.17.1/gfp-ext-nda.js"
						async="" charset="utf-8"></script>
					<script type="text/javascript"
						src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.17.1/gfp-ext-nda.js"
						async="" charset="utf-8"></script>
					<script type="text/javascript"
						src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.17.1/gfp-ext-nda.js"
						async="" charset="utf-8"></script>
					</head>
					<body>
						<div id="wrap2">
							<div id="app">
								<div id="__app_root__">
									<div class="_1wLSjglfdo">
										<script async=""
											src="https://ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js"></script>			
										<div class="_1FTfE6gIKn">
											<div class="_2Slua6hKSx">
												<div class="_MTTpEfT64i _2pDX4NrI9f">
													<h3 class="_3_b7phALyY">
														조회하기
														<div class="_bbDqXY6I5b _1RHctT4n_N">
															<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																class="_1heWiz4gj3">도움말</span>
														</div>
													</h3>
												</div>
												<div class="_1lQe0z7_do">
													<div class="_37KhMwSLGs _bMpDSVwi2u">
														<div class="_3Cki8HuX1Z">
															<div style="width: 164px" class="_2vBZF-fW6P">
																정산 예정일
																<div class="_bbDqXY6I5b _1RHctT4n_N">
																	<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																		class="_1heWiz4gj3">도움말</span>
																</div>
															</div>
															<div class="_2a6VCEzr86">
																<div class="_igZVMegQfJ">
																	<div class="_1S9AFBNVup">
																		<label class="_2eNot1JMDv">검색기간 시작날짜 입력 및 선택</label><input
																			type="text" title="날짜선택" value="2023.07.20" readonly=""
																			class="_vPU3io1OlM _3nQyzAMCad">
																		<button type="button" class="_10hLzVjuaU">
																			<span class="_2eNot1JMDv">캘린더보기</span>
																		</button>
																	</div>
																	<div class="_1S9AFBNVup">
																		<label class="_2eNot1JMDv">검색기간 마지막날짜 입력 및 선택</label><input
																			type="text" title="날짜선택" value="2023.07.20" readonly=""
																			class="_vPU3io1OlM _3nQyzAMCad">
																		<button type="button" class="_10hLzVjuaU">
																			<span class="_2eNot1JMDv">캘린더보기</span>
																		</button>
																	</div>
																</div>
																<span class="_1cU1u3fQQW _17EK97A0eY">최대 1개월 이내에서 조회하실
																	수 있습니다.</span>
															</div>
														</div>
													</div>
													<div style="text-align: center; margin: 20px 0">
														<button type="button"
															class="size_large type_green _2b43OrUK4R _3HzsPRS1r6 _tgQes2jii-"
															style="width: 110px">
															<span class="">검색</span>
														</button>
														<button type="button"
															class="size_large type_basic _2b43OrUK4R _3HzsPRS1r6 _3tBIfJyJos"
															style="width: 110px; margin-left: 13px">
															<span class="">초기화</span>
														</button>
													</div>
												</div>
											</div>
											<div class="_2Slua6hKSx">
												<div class="_1lQe0z7_do">
													<div class="_2Slua6hKSx"
														style="margin-top: 0; margin-bottom: -20px; border: none">
														<div class="_MTTpEfT64i _2pDX4NrI9f">
															<h3 class="_3_b7phALyY">
																정산내역 및 목록
																<div class="_bbDqXY6I5b _1RHctT4n_N">
																	<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																		class="_1heWiz4gj3">도움말</span>
																</div>
															</h3>
															<div class="_2g2txk5w3i">
																<button type="button"
																	class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																	<span class="">공문서 출력</span>
																</button>
																<button type="button"
																	class="size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																	<span class="_3Go37iwyeo _39T0IqVWgc">엑셀다운</span>
																</button>
															</div>
														</div>
														<div class="_MTTpEfT64i _1lQe0z7_do">
															<div class="_1FOBS-z2Fa">
																<ul class="_3yp2uYT3xj">
																	<li class="_2DkoES9O_b"><span class="_3-OEe2T2SZ">정산예정일</span><span
																		class="_3M0-0SqxWW"><b class="_13fmvUrLy5"> </b></span></li>
																	<li class="_2DkoES9O_b"><span class="_3-OEe2T2SZ">정산기준일</span><span
																		class="_3M0-0SqxWW"><b class="_13fmvUrLy5"> </b></span></li>
																	<li class="_2DkoES9O_b"><span class="_3-OEe2T2SZ">정산금액</span><span
																		class="_3M0-0SqxWW"><b class="_13fmvUrLy5">원<!-- -->
																		</b></span></li>
																</ul>
															</div>
														</div>
													</div>
													<div class="npay_grid_area">
														<div class="grid"
															style="position: relative; margin: 10px 0 20px 0; width: 100%; height: 325px">
															<div class="_pIBDYwfMDh"
																style="display: none; top: 80px; height: 207px;">
																<div class="_F2b8fvqw1S">데이터 로딩 중입니다.</div>
																<div class="_2b5C-GcOZo"></div>
															</div>
															<div class="tui-grid-container" data-grid-id="1">
																<div class="tui-grid-content-area">
																	<div class="tui-grid-lside-area"
																		style="display: block; width: 0px;">
																		<div class="tui-grid-head-area" style="height: 79px;">
																			<table class="tui-grid-table">
																				<colgroup></colgroup>
																				<tbody></tbody>
																			</table>
																			<div class="tui-grid-column-resize-container"
																				style="display: block; margin-top: -80px; height: 80px;"></div>
																		</div>
																		<div class="tui-grid-body-area" style="height: 277px;">
																			<div class="tui-grid-body-container" style="height: 0px;">
																				<div class="tui-grid-table-container"
																					style="top: 0px; overflow: visible;">
																					<table class="tui-grid-table">
																						<colgroup></colgroup>
																						<tbody></tbody>
																					</table>
																				</div>
																				<div class="tui-grid-layer-selection"
																					style="display: none;"></div>
																				<div class="tui-grid-layer-focus" style="display: none;">
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																				</div>
																			</div>
																		</div>
																		<div class="tui-grid-scrollbar-left-bottom"></div>
																	</div>
																	<div class="tui-grid-rside-area"
																		style="display: block; width: 961px; margin-left: 0px;">
																		<div class="tui-grid-head-area" style="height: 79px;">
																			<table class="tui-grid-table">
																				<colgroup>
																					<col data-column-name="settleExpectYmd"
																						style="width: 151px">
																					<col data-column-name="settleCompleteYmd"
																						style="width: 151px">
																					<col data-column-name="settleAmount"
																						style="width: 151px">
																					<col data-column-name="normalSettleAmount"
																						style="width: 151px">
																					<col data-column-name="quickSettleAmount"
																						style="width: 151px">
																					<col data-column-name="paySettleAmount"
																						style="width: 151px">
																					<col data-column-name="commissionSettleAmount"
																						style="width: 151px">
																					<col data-column-name="benefitSettleAmount"
																						style="width: 151px">
																					<col data-column-name="deductionRestoreSettleAmount"
																						style="width: 151px">
																					<col data-column-name="payHoldbackSettleAmount"
																						style="width: 151px">
																					<col
																						data-column-name="minusChargeAmountBalanceAmountDeductionSettleAmount"
																						style="width: 151px">
																					<col data-column-name="returnCareSettleAmount"
																						style="width: 151px">
																					<col data-column-name="preferentialCommissionAmount"
																						style="width: 151px">
																					<col data-column-name="settleMethodType"
																						style="width: 151px">
																					<col data-column-name="settleBankAccountNumber"
																						style="width: 151px">
																				</colgroup>
																				<tbody>
																					<tr>
																						<th data-column-name="settleExpectYmd"
																							class="tui-grid-cell tui-grid-cell-head" height="78"
																							colspan="1" rowspan="2">정산예정일</th>
																						<th data-column-name="settleCompleteYmd"
																							class="tui-grid-cell tui-grid-cell-head" height="78"
																							colspan="1" rowspan="2">정산완료일</th>
																						<th data-column-name="settleAmountHeader"
																							class="tui-grid-cell tui-grid-cell-head" height="38"
																							colspan="3" rowspan="1">정산금액 <i
																							class="npay_link_help size_small" data-type="help"></i></th>
																						<th data-column-name="parent2"
																							class="tui-grid-cell tui-grid-cell-head" height="38"
																							colspan="6" rowspan="1">정산 금액 상세내역</th>
																						<th data-column-name="parent3"
																							class="tui-grid-cell tui-grid-cell-head" height="38"
																							colspan="2" rowspan="1">기타</th>
																						<th data-column-name="settleMethodType"
																							class="tui-grid-cell tui-grid-cell-head" height="78"
																							colspan="1" rowspan="2">정산 방식</th>
																						<th data-column-name="settleBankAccountNumber"
																							class="tui-grid-cell tui-grid-cell-head" height="78"
																							colspan="1" rowspan="2">정산계좌</th>
																					</tr>
																					<tr>
																						<th data-column-name="settleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">합계</th>
																						<th data-column-name="normalSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">일반정산금액</th>
																						<th data-column-name="quickSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">빠른정산금액</th>
																						<th data-column-name="paySettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">결제금액</th>
																						<th data-column-name="commissionSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">수수료합계</th>
																						<th data-column-name="benefitSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">혜택정산</th>
																						<th data-column-name="deductionRestoreSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">일별 공제/환급</th>
																						<th data-column-name="payHoldbackSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">지급보류</th>
																						<th
																							data-column-name="minusChargeAmountBalanceAmountDeductionSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">마이너스<br>비즈 월렛 상계
																						</th>
																						<th data-column-name="returnCareSettleAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">반품안심케어비용</th>
																						<th data-column-name="preferentialCommissionAmount"
																							class="tui-grid-cell tui-grid-cell-head" height="39"
																							colspan="1" rowspan="1">우대수수료 환급 <i
																							class="npay_link_help size_small" data-type="help"></i></th>
																					</tr>
																				</tbody>
																			</table>
																			<div class="tui-grid-column-resize-container"
																				style="display: block; margin-top: -80px; height: 80px;">
																				<div data-column-index="0"
																					data-column-name="settleExpectYmd"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 148px;"></div>
																				<div data-column-index="1"
																					data-column-name="settleCompleteYmd"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 299px;"></div>
																				<div data-column-index="2"
																					data-column-name="settleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 450px;"></div>
																				<div data-column-index="3"
																					data-column-name="normalSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 601px;"></div>
																				<div data-column-index="4"
																					data-column-name="quickSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 752px;"></div>
																				<div data-column-index="5"
																					data-column-name="paySettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 903px;"></div>
																				<div data-column-index="6"
																					data-column-name="commissionSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 1054px;"></div>
																				<div data-column-index="7"
																					data-column-name="benefitSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 1205px;"></div>
																				<div data-column-index="8"
																					data-column-name="deductionRestoreSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 1356px;"></div>
																				<div data-column-index="9"
																					data-column-name="payHoldbackSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 1507px;"></div>
																				<div data-column-index="10"
																					data-column-name="minusChargeAmountBalanceAmountDeductionSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 1658px;"></div>
																				<div data-column-index="11"
																					data-column-name="returnCareSettleAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 38px; display: block; left: 1809px;"></div>
																				<div data-column-index="12"
																					data-column-name="preferentialCommissionAmount"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 1960px;"></div>
																				<div data-column-index="13"
																					data-column-name="settleMethodType"
																					class="tui-grid-column-resize-handle " title=""
																					style="width: 7px; height: 76px; display: block; left: 2111px;"></div>
																				<div data-column-index="14"
																					data-column-name="settleBankAccountNumber"
																					class="tui-grid-column-resize-handle tui-grid-column-resize-handle-last"
																					title=""
																					style="width: 7px; height: 76px; display: block; left: 2262px;"></div>
																			</div>
																		</div>
																		<div class="tui-grid-body-area" style="height: 277px;">
																			<div class="tui-grid-body-container" style="height: 0px;">
																				<div class="tui-grid-table-container"
																					style="top: 0px; overflow: visible;">
																					<table class="tui-grid-table">
																						<colgroup>
																							<col data-column-name="settleExpectYmd"
																								style="width: 151px">
																							<col data-column-name="settleCompleteYmd"
																								style="width: 151px">
																							<col data-column-name="settleAmount"
																								style="width: 151px">
																							<col data-column-name="normalSettleAmount"
																								style="width: 151px">
																							<col data-column-name="quickSettleAmount"
																								style="width: 151px">
																							<col data-column-name="paySettleAmount"
																								style="width: 151px">
																							<col data-column-name="commissionSettleAmount"
																								style="width: 151px">
																							<col data-column-name="benefitSettleAmount"
																								style="width: 151px">
																							<col data-column-name="deductionRestoreSettleAmount"
																								style="width: 151px">
																							<col data-column-name="payHoldbackSettleAmount"
																								style="width: 151px">
																							<col
																								data-column-name="minusChargeAmountBalanceAmountDeductionSettleAmount"
																								style="width: 151px">
																							<col data-column-name="returnCareSettleAmount"
																								style="width: 151px">
																							<col data-column-name="preferentialCommissionAmount"
																								style="width: 151px">
																							<col data-column-name="settleMethodType"
																								style="width: 151px">
																							<col data-column-name="settleBankAccountNumber"
																								style="width: 151px">
																						</colgroup>
																						<tbody></tbody>
																					</table>
																				</div>
																				<div class="tui-grid-layer-selection"
																					style="display: none;"></div>
																				<div class="tui-grid-layer-focus" style="display: none;">
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																					<div class="tui-grid-layer-focus-border"></div>
																				</div>
																			</div>
																		</div>
																		<div class="tui-grid-scrollbar-y-inner-border"
																			style="top: 80px; height: 260px;"></div>
																		<div class="tui-grid-scrollbar-y-outer-border"></div>
																		<div class="tui-grid-scrollbar-right-top"
																			style="height: 78px;"></div>
																		<div class="tui-grid-scrollbar-right-bottom"
																			style="height: 17px;"></div>
																		<div class="tui-grid-scrollbar-frozen-border"
																			style="height: 17px;"></div>
																	</div>
																	<div class="tui-grid-border-line tui-grid-border-line-top"></div>
																	<div class="tui-grid-border-line tui-grid-border-line-left"></div>
																	<div class="tui-grid-border-line tui-grid-border-line-right"></div>
																	<div
																		class="tui-grid-border-line tui-grid-border-line-bottom"
																		style="bottom: 17px;"></div>
																</div>
																<div class="tui-grid-layer-state"
																	style="top: 80px; height: 259px; left: 0px; right: 17px;">
																	<div class="tui-grid-layer-state-content">
																		<p>데이터가 존재하지 않습니다.</p>
																	</div>
																</div>
																<div class="tui-grid-layer-editing tui-grid-cell-content"></div>
																<div class="tui-grid-layer-datepicker" style="display: none;"></div>
																<div contenteditable="true" class="tui-grid-clipboard"></div>
															</div>
														</div>
														<div class="_UIw7T7_MwQ" style="padding-top: 36px">
															<strong>1</strong>
														</div>
														<script>
					  function __openBiztalk(url) {
					    var httpRequest = new XMLHttpRequest();
					                          
					    httpRequest.open('GET', url, true);
					    httpRequest.send();
					    httpRequest.addEventListener('load', function () {
					      if (httpRequest.readyState === XMLHttpRequest.DONE) {
					        if (httpRequest.status === 200) {
					          var result = JSON.parse(httpRequest.responseText);
					          if (result.bSuccess) {
					            if(!result.htReturnValue.isAvaliableBizTalkChat) {
					              alert(result.htReturnValue["alertMessage"]);
					            } else{
					              var myframe = window.parent.document.getElementById("__delegate").contentWindow;
					          
					              myframe && myframe.parent.postMessage({
					                type : "ncp.seller.start_talk_send",
					                channelNo : result.htReturnValue["channelNo"],
					                productOrderNo: result.htReturnValue["productOrderNo"],
					                naverIdNo : result.htReturnValue["memberIdNo"]
					              }, window.location.origin);
					            }
					          } else {
					            alert(result.htReturnValue.sMessage);
					          }
					        } else {
					          alert('서버에러 입니다.');
					        }
					      }
					    })
					
					    return false;
					  }
					
					  function __openV2Popup(url, category, popupOption) {
					    var isProductNo = category === 'productNo' || category === 'productOrderNo';
					    var option = isProductNo 
					      ? 'location=no,width=580,height=700,status=no,resizable=yes,scrollbars=1'
					      : 'location=no,width=600,height=500,status=no,resizable=yes,scrollbars=1'
					    
					    if (popupOption) {
					      option = popupOption;
					    }
					
					    window.open(url, '__v2Popup_' + category, option);
					
					    return false;
					  }
					
					  function __openV2PopupByFormSubmit(url, category, option) {
					    var target = '__v2Popup_' + category;
					    var form = document.createElement('form');
					    var input = document.createElement('input');
					    input.type = 'hidden';
					    input.name = 'onlyValidation';
					    input.value = true;
					    form.appendChild(input);
					  
					    document.body.appendChild(form);
					    __openV2Popup(url, category, option);
					  
					    form.method = 'POST';
					    form.action = url;
					    form.target = target;
					    form.submit();
					    document.body.removeChild(form);
					
					    return false;
					  };
					</script>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script src="${pageContext.request.contextPath}/resources/naver/naverJs/lcslog_v0.11.0.js?230712-184334"></script>
						<script>
					            
					            // lcs
					            lcs_do();
					
					            // nclicks
					            var g_ssc = "smartstore.calculate";
					            var ccsrv = "cc.naver.com";
					            window.nsc = g_ssc;
					            </script>
						<script>window.__ENV__={"RELEASE_MODE":"real","GLAD_SDK_URL":"ssl.pstatic.net/tveta/libs/glad/prod/gfp-core.js","CENTER_URL":"https://sell.smartstore.naver.com","CENTER_URL_LOCAL":"http://local.sell.smartstore.naver.com","EXCEL_BATCH_DISPATCH_URL":"https://sell.smartstore.naver.com/o/sale/delivery/batchDispatchPop","BIZ_SEARCH_OAUTH_BASE_URL":"https://manage.searchad.naver.com","BIZ_SEARCH_OAUTH_CLIENT_ID":"YAawumTXoqqp3sB9MFLq","BIZ_SEARCH_OAUTH_REDIRECT_URL":"https://sell.smartstore.naver.com/b/v3/naverPoint/bizmoney","BIZ_SEARCH_URL":"https://searchad.naver.com","QUICK_SETTLE_NOTICE":"/#/center-notice/detail/100007935","FEE_NOTICE":"https://help.sell.smartstore.naver.com/seller/help/map/npay.setl.ddlysetl/commission","HELP_URL":"https://help.sell.smartstore.naver.com","API_URL_SETTLE_TAX_DOWN_LOAD":"https://ntax.navercorp.com","SELLER_IFNO_URL":"https://sell.smartstore.naver.com/#/seller/info","COMMISSION_HELP_URL":"https://help.sell.smartstore.naver.com/seller/help/map/npay.setl.ddlysetl/commission","SETTLE_PARENT_BASE_URL":"https://sell.smartstore.naver.com/#/naverpay/settlemgt","SETTLE_PARENT_BASE_URL_OLD":"https://sell.smartstore.naver.com/#/naverpay/settlemgt","BENEFIT_PARENT_BASE_URL":"https://sell.smartstore.naver.com/#/naverpay","SETTLE_SETTLE_CASE_BY_CASE_URL":"https://sell.smartstore.naver.com/#/naverpay/settlemgt/settlecasebycase","SETTLE_HOLD_BACK_URL":"https://sell.smartstore.naver.com/#/naverpay/settlemgt/nmpsellercompletecasebycase","SETTLE_QUICK_SETTLE_BY_CASE_URL":"https://sell.smartstore.naver.com/#/naverpay/quicksettle/quicksettlebycase","RETURN_CARE_API_URL":"http://return-care-api.pay.naver.com","RETURN_CARE_BASE_URL":"https://sell.smartstore.naver.com/#/naverpay/return-care","NAVER_FINANCIAL_ADDRESS":"경기도 성남시 분당구 정자일로 95, NAVER 1784 (13561)","NPAY_OAUTH_CLIENT_ID":"_QxTD0SGShnTQcYE2c1D","NPAY_OAUTH_NORMAL_CHAIN_ID":"cXZYekVPakY1SVV","NPAY_OAUTH_RECURRENT_CHAIN_ID":"M1BVZ0RrL3QvVnJ","NPAY_APPLY_PAYMENT":"naverpay/payments/v2.2/apply/payment","NPAY_SDK":"nsp.pay.naver.com/sdk/js/naverpay.min.js","SHOPPING_BILLING_URL":"http://api.shop-bill-real.svc.aep2.io.navercorp.com","VIRTUAL_ACCOUNT_CHARGE_ISSUE":"v1/virtual-account/charge/issue","NPAY_MODE":"production","RECURRENT_RETURN_URL":"sell.smartstore.naver.com/b/v3/charge/user/chargeAmount/recurrent/rurl","NORMAL_RETURN_URL":"sell.smartstore.naver.com/b/v3/charge/user/chargeAmount/normal/rurl","BIZ_WALLET_COMMERCE_URL":"https://sell.smartstore.naver.com/#/commerce-solution/transaction-list","SENTRY_DSN":"https://cdd7e11c14d746488db643eec604e0fd@sentry-plasma-fe.naver.com/4","SENTRY_RELEASE":"230712-184334"};</script>
						<script>window.__APOLLO_STATE__={"$ROOT_QUERY.findSellerInfoUsingGET({\"merchantNo\":\"511949161\"})":{"applyPayCommissionPolicyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","businessGrade":"SCALE4","businessGradeSalesRangeText":"","changeYmd":null,"exceptionCommissionYn":false,"merchantId":"ncp_1oowu9_01","merchantNo":"511949161","settleCycleType":"DAILY","settleDate":null,"settleDateString":"+1","settleExpectYmd":"20230721","settleMethodType":"ACCOUNT","settleServiceType":"C2","suspendAmount":null,"suspendYn":false,"zeroCommissionYn":false,"quickSettleStatusReasonType":"NOT_IN_LIST_JOIN","quickSettleStatusType":"FAILED","__typename":"SettleInfoDto"},"ROOT_QUERY":{"findSellerInfoUsingGET({\"merchantNo\":\"511949161\"})":{"type":"id","generated":true,"id":"$ROOT_QUERY.findSellerInfoUsingGET({\"merchantNo\":\"511949161\"})","typename":"SettleInfoDto"},"findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"})":{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"})","typename":"SettleInfoSummaryDto"}},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.0":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_NCASH","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.1":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_VACCT","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.2":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_CCARD","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.3":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_BANK","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.4":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_PAYLATER","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.5":{"applyEndYmd":"2099-12-31","applyStartYmd":"2022-01-31","approvalYmd":"2022-01-26","commissionBasisDateTime":"1689844061865","commissionPolicyValue":3.63,"commissionUpperLimitValue":null,"fixedAmountFixedRateType":"COMMISSION_TYPE_FIXED_RATE1","groupCode":null,"payCommissionPolicyLargeCategoryType":"SERVICE","payMeansType":"PAYMEANS_TYPE_MOBIL","policyMiddleCategoryType":"BUSINESS_GRADE_SCALE4","policyNo":"20220125162115ce1000223","policyTypeValue":"CMA4SHOPN","__typename":"CommissionDetailDto"},"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"})":{"commissionDetails":[{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.0","typename":"CommissionDetailDto"},{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.1","typename":"CommissionDetailDto"},{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.2","typename":"CommissionDetailDto"},{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.3","typename":"CommissionDetailDto"},{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.4","typename":"CommissionDetailDto"},{"type":"id","generated":true,"id":"$ROOT_QUERY.findSettlementInfoSummaryUsingGET({\"merchantNo\":\"511949161\"}).commissionDetails.5","typename":"CommissionDetailDto"}],"merchantNo":"511949161","payCommissionPolicyLargeCategoryType":"SERVICE","settleCommissionType":"PAY_COMMISSION","__typename":"SettleInfoSummaryDto"}};</script>
						<script>window.__INIT_STATE__=JSON.parse(Base64.decode('eyJ0aW1lU3RhbXBNcyI6MTY4OTg0NDA2MTgyMCwiYm9keSI6e30sImlzRWFzeUJvb2siOmZhbHNlLCJpc0l0Q2FydCI6dHJ1ZSwibWVyY2hhbnRObyI6IjUxMTk0OTE2MSIsIm1lcmNoYW50VHlwZUNvZGUiOiIiLCJyZXByZXNlbnRUeXBlIjoiRFBTTiIsInJvbGVHcm91cFR5cGUiOiJSRVBSRVNFTlQiLCJ1c2VSZXR1cm5EZWxpdmVyeVNsb3RZbiI6ZmFsc2UsImFjY291bnRTdGF0dXNUeXBlIjoiTk9STUFMIiwic3dpdGNoQ29uZmlnIjp7ImV4Y2VsRG93bmxvYWRUeXBlIjoiZW5jcnlwdF9jbGllbnQiLCJzaG93UHVyY2hhc2VyTmFtZUF0TnBheSI6dHJ1ZSwic2hvd1B1cmNoYXNlck5hbWVBdE5wYXlfTlBHIjpmYWxzZSwic2hvd1B1cmNoYXNlck5hbWVBdFNTIjp0cnVlLCJzc3JTdGF0dXNDb2RlIjoyMDAsInVzZVYyRGVsaXZlcnlDb250cmFjdFBvcHVwIjpmYWxzZSwidXNlVjNMaW5rIjp0cnVlLCJ1c2VWM1BheVNldHRsZSI6dHJ1ZSwidXNlVjNTZXR0bGUiOnRydWUsInRpbWVTdGFtcCI6IjIwMjMwNzIwIn0sInVzZXJBZ2VudCI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMTQuMC4wLjAgU2FmYXJpLzUzNy4zNiIsIm1lbWJlclR5cGUiOiJOQVZFUiIsImxvZ2luSWQiOiJ3bHdsXzEyMzQiLCJidWlsZE51bWJlciI6IjIzMDcxMi0xODQzMzQiLCJmb3JTUyI6eyJyZXByZXNlbnRObyI6MTAxODkxMDM4LCJyb2xlTm8iOjEwNjQzMjQ0NywiYWNjb3VudElkIjoibmNwXzFvb3d1OV8wMSIsImRhc2hib2FyZENvb2tpZXMiOiIifSwic3VtbWFyeUluZm9UeXBlIjoiIiwic2VhcmNoUGFyYW1zIjp7fSwiZXNjTWVzc2FnZXMiOnsicGFnZUhlYWRlciI6eyJwYWdlTmFtZSI6IuygleyCsOuCtOyXrSIsImluZm9UaXRsZSI6IuydvOuzhC/qsbTrs4Qg7KCV7IKw64K07JetIOuwjyDsoJXsgrDsl5DshJwg67Cc7IOd7ZWcIOuEpOydtOuyhO2OmOydtCDso7zrrLjqtIDrpqwg7IiY7IiY66OMIOygleuztOulvCDtmZXsnbjtlZjsi6Qg7IiYIOyeiOyKteuLiOuLpC4iLCJpbmZvIjoiXG4gICAgICAgIOygleyCsOq4iOyVoeydtCDrp4jsnbTrhIjsiqQg6riI7JWh7J2066m0LCDrp4jsnbTrhIjsiqQg67mE7KaIIOyblOugm+ycvOuhnCDsoITtmZjrkJjrqbAg64uk7J2MIOuyiCDsoJXsgrDsl5DshJwg7J6Q64+Z7Jy866GcIOyDgeqzhOuQqeuLiOuLpC5AXl5AXG4gICAgICAgIOqzhOyijOydtOyytOqwgCDsi6TtjKjtlaAg6rK97JqwIOu5hOymiCDsm5TroJvsnLzroZwg7J6Q64+ZIOy2qeyghOuQqeuLiOuLpC4ifX19'))</script>
						<script src="${pageContext.request.contextPath}/resources/naver/naverJs/nclk_v0.7.1.js?230712-184334"
							defer=""></script>
						<script src="${pageContext.request.contextPath}/resources/naver/naverJs/vendor.bundle.js?230712-184334"
							defer=""></script>
						<script src="${pageContext.request.contextPath}/resources/naver/naverJs/common.bundle.js?230712-184334"
							defer=""></script>
						<script
							src="${pageContext.request.contextPath}/resources/naver/naverJs/settlemgt.bundle.js?230712-184334"
							defer=""></script>
						<script>
					  (function(){
					    if (typeof naverPayCenterUrl === 'undefined' || naverPayCenterUrl === '') {
					      naverPayCenterUrl = 'https://sell.smartstore.naver.com';
					    }
					    var NaverPayCenter = NaverPayCenter || {};
					    NaverPayCenter.notice = {
					      logout: function () {
					        var npayLogout = document.querySelector('.log');
					        return npayLogout === null || npayLogout === undefined;
					      },
					      closed: function (cookieName) {
					        var npayLayerCookie = document.cookie.match('(^|;) ?' + cookieName + '=([^;]*)(;|$)');
					        return !(npayLayerCookie === null || npayLayerCookie === undefined);
					      },
					      npayTalk: {
					        cookieName: 'HIDE_NOTICE_TALK',
					        open: function () {
					          var that = NaverPayCenter.notice;
					          if (that.logout() || that.closed(this.cookieName)) {
					            return;
					          }
					
					          var httpRequest = new XMLHttpRequest();
					                          
					          httpRequest.open('POST', '/o/v3/oa/notice/npayTalk', true);
					          httpRequest.send();
					          httpRequest.addEventListener('load', function () {
					            if (httpRequest.readyState === XMLHttpRequest.DONE) {
					              if (httpRequest.status === 200) {
					                if(httpRequest.hasOwnProperty('responseText') && httpRequest.responseText){
					                  const res = JSON.parse(httpRequest.responseText);
					                  if (undefined !== res && res.htReturnValue) {
					                      window.open(naverPayCenterUrl + '/notice/npayTalk', 'payTalkPopup', 'resizable=yes,width=600px,height=670px');
					                  }
					                }
					              } else {
					                alert('서버에러 입니다.');
					              }
					            }
					          })
					        }
					      },
					      cdd: {
					        isCddPage: document.location.href.indexOf('/cdd/') !== -1,
					        registration: {
					          cookieName: 'HIDE_NOTICE_CDD_REGISTRATION',
					          status: 'registration',
					          features: 'resizable=yes,width=600px,height=710px'
					        },
					        screening: {
					          cookieName: 'HIDE_NOTICE_CDD_SCREENING',
					          status: 'screening',
					          features: 'resizable=yes,width=600px,height=340px'
					        },
					        hold: {
					          cookieName: 'HIDE_NOTICE_CDD_HOLD',
					          status: 'hold',
					          features: 'resizable=yes,width=600px,height=340px'
					        },
					        open: function () {
					          var that = NaverPayCenter.notice;
					          var cdd = that.cdd;
					          
					          if (that.logout() || cdd.isCddPage) {
					            return;
					          }
					
					          var httpRequest = new XMLHttpRequest();
					                          
					          httpRequest.open('POST', '/o/v3/oa/notice/cdd', true);
					          httpRequest.send();
					          httpRequest.addEventListener('load', function () {
					            if (httpRequest.readyState === XMLHttpRequest.DONE) {
					              if (httpRequest.status === 200) {
					                if(httpRequest.hasOwnProperty('responseText') && httpRequest.responseText){
					                  const res = JSON.parse(httpRequest.responseText);
					                  if (undefined !== res && res.bSuccess) {
					                    var status = res.htReturnValue;
					                    if (status === cdd.registration.status) {
					                      if (that.closed(cdd.registration.cookieName)) {
					                        return;
					                      }
					                      window.open(naverPayCenterUrl + '/cdd/notice/registration', 'cddNoticePopup', cdd.registration.features);
					                    } else if (status === cdd.screening.status) {
					                      if (that.closed(cdd.screening.cookieName)) {
					                        return;
					                      }
					                      window.open(naverPayCenterUrl + '/cdd/notice/screening', 'cddNoticePopup', cdd.screening.features);
					                    } else if (status === cdd.hold.status) {
					                      if (that.closed(cdd.hold.cookieName)) {
					                        return;
					                      }
					                      window.open(naverPayCenterUrl + '/cdd/notice/hold', 'cddNoticePopup', cdd.hold.features);
					                    }
					                  }
					                }
					              } else {
					                alert('서버에러 입니다.');
					              }
					            }
					          })
					        }
					      }
					    };
					    NaverPayCenter.notice.npayTalk.open();
					    NaverPayCenter.notice.cdd.open();
					  })()
					</script>
					</body>
					<!-- 정산 조회 / 정산내역 및 목록 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
			</div>
			<!-- 메인 컨텐츠 끝 -->

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
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>
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

    <title>seller/itemDelMng</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-2 text-gray-800">배송관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net"> official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 배송조회 검색 시작 -->
					<div id="wrap2">
						<div id="app">
							<div id="__app_root__">
								<div class="npay_content" style="overflow: visible">
								
									<div class="napy_sub_content">
										<div class="npay_section _1FOxZIjaH6">
											<div class="_2J8OLpPIlY">
												<div class="_28lFRNpMNy">
													<strong class="_GSgIM7N3kv">배송중, 배송완료 주문건을<br>확인해주세요.
													</strong>
													<ul class="_1iFx0u3ecO">
														<li class="_3In6Nn0ucW"><div class="_2wI2L8ej2J">
																<a href="#" class="ico_purc_renew _47sX76YFox _3bVTFBFN3N"><span
																	class="_2TMx1DeutT">배송중 목록보기</span></a>배송중
																<div class="_bbDqXY6I5b _1RHctT4n_N">
																	<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																		class="_1heWiz4gj3">도움말</span>
																</div>
																<a href="#" class="_3a4NLUdd2p"><b>0</b><span>건</span></a>
															</div></li>
														<li class="_3In6Nn0ucW"><div class="_2wI2L8ej2J">
																<a href="#" class="ico_delivery_finish _47sX76YFox _2tDFAjeRf_"><span
																	class="_2TMx1DeutT">배송중 목록보기</span></a>배송완료
																<div class="_bbDqXY6I5b _1RHctT4n_N">
																	<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																		class="_1heWiz4gj3">도움말</span>
																</div>
																<a href="#" class="_3a4NLUdd2p"><b>0</b><span>건</span></a>
															</div></li>
														<li class="_3In6Nn0ucW"><div class="_2wI2L8ej2J">
																<a href="#" class="ico_purc_request _47sX76YFox _2QZhZl0rcO"><span
																	class="_2TMx1DeutT">배송중 목록보기</span></a>구매확정요청
																<div class="_bbDqXY6I5b _1RHctT4n_N">
																	<i class="_3X_sdNq6-c _341mNgaIJm _3wYrf841wa"></i><span
																		class="_1heWiz4gj3">도움말</span>
																</div>
																<a href="#" class="_3a4NLUdd2p"><b>0</b><span>건</span></a>
															</div></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="npay_section _1FOxZIjaH6">
											<div class="npay_board_area">
												<table class="npay_board_table">
													<colgroup>
														<col class="label_width">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">조회기간</th>
															<td colspan="1"><div class="_e1ESc1_0ic">
																	<div class="_2Mo9ts_S9f _3E4SWFsjel _29On-g1Mid">
																		<div class="_KqV0-1BSnB">
																			<label class="_MN8nIh0X4y">결제일</label><select
																				class="_4LshyCrDpi" title="리스트 보기"><option
																					selected="" value="PAY_COMPLETED">결제일</option>
																				<option value="DELIVERY_OPERATED">발송처리일</option>
																				<option value="DELIVERY_COMPLETED">배송완료일</option></select>
																		</div>
																	</div>
																	<div class="_2Mo9ts_S9f _29On-g1Mid">
																		<div class="_8GMnQSQIgl _3zx-c_IhVp">
																			<ul
																				class="_2c50HRGAPR _3ztc1iB8Tu _j-O4Qeo0yN _9yuYVWjAOe _2qPT9uwdkd">
																				<li class="_hl_0TieCQs"><button type="button"
																						class="_2y4tT1b1bo size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																						<span class="">오늘</span>
																					</button></li>
																				<li class="_hl_0TieCQs"><button type="button"
																						class="_2y4tT1b1bo _2lWlVXWb7v size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																						<span class="">1주일</span>
																					</button></li>
																				<li class="_hl_0TieCQs"><button type="button"
																						class="_2y4tT1b1bo size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																						<span class="">1개월</span>
																					</button></li>
																				<li class="_hl_0TieCQs"><button type="button"
																						class="_2y4tT1b1bo size_medium type_basic _2b43OrUK4R _2TfRbAqhV3 _3tBIfJyJos">
																						<span class="">3개월</span>
																					</button></li>
																			</ul>
																			<div class="_3PRfTg7hKN _3ztc1iB8Tu">
																				<div class="_1S9AFBNVup">
																					<label class="_2eNot1JMDv">검색기간 시작날짜 입력 및 선택</label><input
																						type="text" title="날짜선택" value="2023.07.14" readonly=""
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
																		</div>
																	</div>
																</div>
																<div class="_36NfNFNlTR">
																	<p class="_1cU1u3fQQW _17EK97A0eY _1JHEn8wccf">최근 1년 이내에서
																		조회하실 수 있습니다.(3개월 단위 조회 가능)</p>
																</div></td>
															<th scope="row">상세조건</th>
															<td colspan="1"><div class="_1Vof48UxmD _oVRNwPvxck">
																	<div class="_KqV0-1BSnB">
																		<label class="_MN8nIh0X4y">전체</label><select
																			class="_4LshyCrDpi" title="리스트 보기"><option
																				selected="" value="">전체</option>
																			<option value="COLLECTOR_NAME">수취인명</option>
																			<option value="PURCHASER_NAME">구매자명</option>
																			<option value="PURCHASER_TEL_NO">구매자연락처</option>
																			<option value="PURCHASER_ID">구매자ID</option>
																			<option value="ORDER_NO">주문번호</option>
																			<option value="PRODUCT_ORDER_NO">상품주문번호</option>
																			<option value="PRODUCT_NO">상품번호</option>
																			<option value="INVOICE_NO">송장번호</option></select>
																	</div>
																	<div>
																		<input type="text" class="_3y2h2mGnkI" value="" maxlength="50"
																			disabled="">
																	</div>
																</div></td>
														</tr>
														<tr>
															<th scope="row">주문상태</th>
															<td colspan="1"><div class="_KqV0-1BSnB">
																	<label class="_MN8nIh0X4y">전체</label><select class="_4LshyCrDpi"
																		title="리스트 보기"><option value="ALL">전체</option>
																		<option value="DELIVERING">배송중</option>
																		<option value="DELIVERED">배송완료</option></select>
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="button_area" style="position: relative">
												<button type="button"
													class="size_large type_basic _2b43OrUK4R _3HzsPRS1r6 _3tBIfJyJos"
													style="position: absolute; top: 16px; right: 34px">
													<span class="_3Go37iwyeo _L62WtGhDXS">상세검색 접기</span>
												</button>
												<button type="button"
													class="size_large type_green _2b43OrUK4R _3HzsPRS1r6 _tgQes2jii-"
													style="width: 110px">
													<span class="">검색</span>
												</button>
											</div>
										</div>
									</div>
								
								</div>
							</div>
						</div>
					</div>
					<!-- 배송조회 검색 끝 -->


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
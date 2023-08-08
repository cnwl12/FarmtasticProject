<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/salesMng</title>

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
                    <h1 class="h3 mb-2 text-gray-800">매출관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net"> official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    

					
					<!-- 월별 판매량 테이블 시작 -->
					<!-- 월별 판매량 테이블 끝 -->
					
					<!-- 매출통계그래프 시작 -->
					<div class="panel panel-dashboard panel-stats">
						<div class="panel-body">
							<div class="text-center">
								<div data-toggle="buttons" class="btn-group btn-group-customize">
									<label class="btn btn-default" ng-class="{active: vm.currentChartIndex === 0}" ng-click="vm.showChart(0)" data-nclicks-code="sales.numofpay">
										<input type="radio">이번달 일자별 매출
									</label>
									<label class="btn btn-default" ng-class="{active: vm.currentChartIndex === 1}" ng-click="vm.showChart(1)" data-nclicks-code="sales.payer">
										<input type="radio">최근 12개월 매출
									</label> 
									<label class="btn btn-default active" ng-class="{active: vm.currentChartIndex === 2}" ng-click="vm.showChart(2)" data-nclicks-code="sales.price">
										<input type="radio">미정
									</label>
								</div>
							</div>
						</div>
					</div>	
					
				    <!-- 선진) 차트를 그리기 위한 스크립트 추가 -->
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
					
					<!-- 선진) 매출 그래프를 표시할 캔버스 요소 -->					
					<div>
					  <canvas id="getDailySalesChart" width="1000" height="200"></canvas>
					</div>
					
					<div>
					  <canvas id="getMonthlySalesChart" width="1000" height="200"></canvas>
					</div>
					
					<!-- 선진) 해당 월의 일자별 매출 차트 -->
					<div>
					<script>
					  // 차트를 그리기 위한 함수
					  function drawDailySalesChart(data) {
					    const labels = data.map(item => item.order_mmdd);
					    const sales = data.map(item => item.order_mmdd_totalSales);
					
					    const ctx = document.getElementById('getDailySalesChart').getContext('2d');
					    const myChart = new Chart(ctx, {
					      type: 'line',
					      data: {
					        labels: labels,
					        datasets: [{
					          label: '매출',
					          data: sales,
					          borderColor: 'rgba(75, 192, 192, 1)',
					          backgroundColor: 'rgba(75, 192, 192, 0.2)',
					          borderWidth: 1
					        }]
					      },
					      options: {
					        scales: {
					          x: {
					            title: {
					              display: true,
					              text: '날짜'
					            }
					          },
					          y: { beginAtZero: true, title: { display: true, text: '매출' },
					            gridLines:{
									color: 'rgba(166, 201, 226, 1)',
									lineWidth:3
								}
					          }
					        }
					      }
					    });
					  }
					
					  // 페이지 로딩 시 매출 데이터 가져와서 차트 그리기
					  $(document).ready(function() { 
					    ajaxDailySales();
					  });
					
					  // 매출 데이터를 가져오는 함수
					  function ajaxDailySales() {
					    $.ajax({
					      url: '${pageContext.request.contextPath}/chartDailySales',
					      type: 'get',
					      dataType: 'json',
					      success: function(result) {
					        console.log(result);
					        drawDailySalesChart(result);
					      },
					      error: function() {
					        alert('매출 데이터를 가져오는데 실패했습니다.');
					      }
					    });
					  }
					</script>
					</div>
					<!-- 선진) 최근 12개월의 월별 매출 차트 -->
					<div>
					<script>
					  // 차트를 그리기 위한 함수
					  function drawMonthlySalesChart(data) {
					    const labels = data.map(item => item.order_mm);
					    const sales = data.map(item => item.order_mm_totalSales);
					
					    const ctx = document.getElementById('getMonthlySalesChart').getContext('2d');
					    const myChart = new Chart(ctx, {
					      type: 'line',
					      data: {
					        labels: labels,
					        datasets: [{
					          label: '매출',
					          data: sales,
					          borderColor: 'rgba(75, 192, 192, 1)',
					          backgroundColor: 'rgba(75, 192, 192, 0.2)',
					          borderWidth: 1
					        }]
					      },
					      options: {
					        scales: {
					          x: {
					            title: {
					              display: true,
					              text: '날짜'
					            }
					          },
					          y: { beginAtZero: true, title: { display: true, text: '매출' },
					            gridLines:{
									color: 'rgba(166, 201, 226, 1)',
									lineWidth:3
								}
					          }
					        }
					      }
					    });
					  }
					
					  // 페이지 로딩 시 매출 데이터 가져와서 차트 그리기
					  $(document).ready(function() { 
					    ajaxMonthlySales();
					  });
					
					  // 매출 데이터를 가져오는 함수
					  function ajaxDailySales() {
					    $.ajax({
					      url: '${pageContext.request.contextPath}/chartMonthlySales',
					      type: 'get',
					      dataType: 'json',
					      success: function(result) {
					        console.log(result);
					        drawMonthlySalesChart(result);
					      },
					      error: function() {
					        alert('매출 데이터를 가져오는데 실패했습니다.');
					      }
					    });
					  }
					</script>
					</div>			
					<!-- 매출통계그래프 끝 -->
					
					
					
					<!-- 검색바 -->
					<div class="panel panel-seller" ng-include="'shared/products/relation-list/include/search-condition-area.html.inc'">
						<form name="vm.searchForm" novalidate="" ng-submit="vm.func.search()" class="ng-pristine ng-valid ng-valid-pattern ng-valid-max-size-by-split ng-valid-maxlength ng-valid-required ng-valid-date-time-input">
							
							<div class="panel-body">
								<div class="seller-search-section">
									<ul class="seller-list-border">
										<li>
										<label class="control-label">매출 발생 기간</label>
										<div class="input-content">
											<div class="form-inline narrow-area" ng-class="{'has-error-msg': (vm.searchForm.fromDate.$invalid || vm.searchForm.toDate.$invalid)}">
												<ncp-datetime-range-picker2 start-date-model="vm.searchFormData.fromDate" start-date-name="fromDate" end-date-model="vm.searchFormData.toDate" end-date-name="toDate" date-max="'TODAY'"
													datetime-picker-format-name="DATE" date-required="true" date-range-usable="true" date-range-option="vm.config.SearchDateRangePickerPeriodOptions" date-markup-option="{onlyDate:true, disabledDateDimmed:true}">
													<div class="form-group" ng-if="vm.dateRangeUsable">
														<div class="btn-toolbar">
															<div class="btn-group" ng-class="::{'fix-width-col-4' : vm.dateMarkupOption.buttonFixWidth}" ng-attr-data-nclicks-code="{{::vm.nclicksCodeRangeButton}}">
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">오늘</button>
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">1주일</button>
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">1개월</button>
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">3개월</button>
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">6개월</button>
																<button type="button" class="btn btn-primary2 active" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">1년</button>
																<button type="button" class="btn btn-primary2" ng-repeat="option in vm.dateRangeOption.periods" ng-click="vm.onClickRangeButton($index)" ng-disabled="vm.dateDisabled" ng-class="{ active: option.active }">전체</button>
															</div>
														</div>
													</div>
													<div class="form-group only-date disabled-date-dimmed" ng-class="::{'only-date' : vm.dateMarkupOption.onlyDate, 'disabled-date-dimmed' : vm.dateMarkupOption.disabledDateDimmed }">
														<div class="seller-calendar">
															<div class="input-daterange date form-inline">
															
																<div class="form-group _startDate_dropdown seller-datetime-picker _error_start_date_3978005840 dropdown" ng-class="{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div class="input-group dropdown-toggle dropdown_1693764282" data-toggle="dropdown" ng-click="vm.isStartDateShow = !vm.dateDisabled &amp;&amp; true" ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																		<input type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input" name="fromDate" title="날짜 입력"
																			ng-readonly="::vm.dateInputReadonly" ng-required="vm.dateRequired &amp;&amp; !vm.ignoreStartDateRequired" ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType" ncp-disabled="!vm.dateDisabledByPeriodType"
																			ng-model="vm.startDateModel" model-type="YYYY-MM-DDTHH:mm:ss.SSSZ" date-time-input="YYYY.MM.DD." data-date-formats="::vm.inputModelFormats" ncp-message-container="._error_start_date_3978005840"
																			ng-required-err-type="required.daterangepicker.startDate" ncp-validate-change-trigger="" required="required" readonly="readOnly">
																		<span class="input-group-addon" ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.startDatetimePickerDisabled">
																			<a role="button" href="">
																				<i class="fn fn-calendar1" aria-hidden="true"></i>
																				<span class="sr-only">달력보기</span>
																			</a>
																		</span>
																	</div>
																</div>
																
																<div class="form-group dash">
																	<div class="input-group">
																		<span class="input-group-addon">~</span>
																	</div>
																</div>
																
																<div class="form-group _endDate_dropdown seller-datetime-picker _error_end_date_6583036381 dropdown" ng-class="::{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div class="input-group dropdown-toggle dropdown_8625679209" data-toggle="dropdown" ng-click="vm.isEndDateShow = !vm.dateDisabled &amp;&amp; true" ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																		<input type="text" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input" name="toDate" title="날짜 입력"
																			ng-readonly="::vm.dateInputReadonly" ng-required="vm.dateRequired &amp;&amp; !vm.ignoreEndDateRequired" ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType" ncp-disabled="!vm.dateDisabledByPeriodType"
																			ng-model="vm.endDateModel" model-type="YYYY-MM-DDTHH:mm:ss.SSSZ" date-time-input="YYYY.MM.DD." data-date-formats="::vm.inputModelFormats" ncp-message-container="._error_end_date_6583036381"
																			ng-required-err-type="required.daterangepicker.endDate" ncp-validate-change-trigger="" required="required" readonly="readOnly">
																		<span class="input-group-addon" ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.endDatetimePickerDisabled">
																			<a role="button" href="">
																				<i class="fn fn-calendar1" aria-hidden="true"></i>
																				<span class="sr-only">달력보기</span>
																			</a>
																		</span>
																	</div>
																</div>
																
															</div>
														</div>
													</div>
												</ncp-datetime-range-picker2>
											</div>
										</div>
										</li>
									</ul>
								</div>
							</div>
							
							<div class="panel-footer">
								<div class="seller-btn-area btn-group-lg">
									<button type="submit" class="btn btn-primary">검색</button>
									<button type="button" class="btn btn-default" ng-click="vm.func.reset()">초기화</button>
								</div>
							</div>
							
						</form>
					</div>
					<!-- 검색바 끝 -->
					
					<!-- 일별 매출 목록 시작 -->
					<div class="table-responsive">
					
						<table class="table table-bordered" id="dataTable2">
							<thead>
								<tr style="background-color: #edf1f5;" >
									<th>주문번호</th>
									<th>상품번호</th>
									<th>상품타입</th>
									<th>상품명</th>
									<th>주문수량</th>
									<th>상품가격</th>
									<th>매출액</th>
									<th>수수료</th>
									<th>정산액</th>
									<th>주문일자</th>
								</tr>
							</thead>
							<tbody id="getDailySalesList">
								<c:forEach items="${DailySalesList}" var="list">
								<input type="hidden" name="seller_num" value="${seller_num}">
										<tr>
										<td>${list.order_num}</td>
										<td>${list.item_num}</td>
										<td>${list.seller_type}</td>
										<td>${list.item_name}</td>
										<td>${list.item_cnt}</td>
										<td>${list.item_price}</td>
										<td><fmt:formatNumber value="${list.dailySales}" pattern="0"/></td>
										<td><fmt:formatNumber value="${list.dailyFee}" pattern="0"/></td>
										<td><fmt:formatNumber value="${list.dailySettlement}" pattern="0"/></td>
										<td>${list.order_day}</td>
										</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 일별 매출 목록 끝 -->

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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
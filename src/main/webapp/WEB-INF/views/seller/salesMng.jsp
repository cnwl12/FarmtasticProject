<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	<!-- 선진) 차트를 그리기 위한 스크립트 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
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
                    <p class="mb-4"><a target="_blank" href=#></a></p>
                    <!-- 페이지 상단 끝 -->
					
					<!-- 매출통계그래프 시작 -->
					<div class="panel panel-dashboard panel-stats">
						<div class="panel-body">
							<div class="text-center">
								<div data-toggle="buttons" class="btn-group btn-group-customize chartList">
									<label id="chart1" class="on">
										<button type="button" class="btn btn-primary btn-sm mx-2 toggle-chart" data-target="dailyChart">이번달 일자별 매출</button>
									</label>
									<label id="chart1" class="on">
										<button type="button" class="btn btn-primary btn-sm mx-2 toggle-chart" data-target="monthlyChart">최근 12개월 매출</button>
									</label> 
								</div>
							</div>
						</div>
					<!-- </div>	첫번째 class 닫는 태그, 일단 밑으로 내려봄 -->
					
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
					  function ajaxMonthlySales() {
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
					</div>			
					<!-- 매출통계그래프 끝 -->
					
					<!-- 검색바 시작 -->
					<div class="panel panel-seller" ng-include="'shared/products/relation-list/include/search-condition-area.html.inc'">
						<form id="searchForm" name="vm.searchForm" method="get" action="${pageContext.request.contextPath}/salesMngPro">
							<div class="panel-body">
								<div class="seller-search-section">
									<ul class="seller-list-border">
										<li>
											<label class="control-label">날짜 검색</label>
											<div class="input-content">
												<div class="form-inline narrow-area">
													<label for="start-date">시작일: </label> 
													<input type="date" id="start-date" name="startDate" class="form-control mx-2">
													<label for="end-date">종료일: </label> 
													<input type="date" id="end-date" name="endDate" class="form-control mx-2">
													<!-- 1주, 1개월, 3개월, 6개월, 1년 버튼 추가 -->
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(7)">1주</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(30)">1개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(90)">3개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(180)">6개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(365)">1년</button>
													<button type="reset" class="btn btn-default">초기화</button>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="panel-footer">
								<div class="seller-btn-area btn-group-lg">
									<button id="searchButton" type="submit" class="btn btn-primary">검색</button>
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
										<td>${list.dailySales}</td>
										<td>${list.dailyFee}</td>
										<td>${list.dailySettlement}</td>
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

	<!-- 검색바 함수 -->
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
    </script>
   
   
   <!-- 매출 차트 토글 함수 -->
	<script>
	$(document).ready(function() {
	    // 마이페이지 전환 초기 설정
	    $("#getMonthlySalesChart").hide();
	
	    // 마이페이지 전환 함수
	    function toggleMypage(target) {
	        $("#getDailySalesChart").hide();
	        $("#chart1").removeClass("on");
	        $("#getMonthlySalesChart").hide();
	        $("#chart2").removeClass("on");
	      
	      if (target === "dailyChart") {
	          $("#getDailySalesChart").show();
	          $("#chart1").addClass("on");
	      } else if (target === "monthlyChart") {
	          $("#getMonthlySalesChart").show();
	          $("#chart2").addClass("on");
	      }
	    }
	  // 메뉴 클릭 이벤트 핸들러
	  $(".toggle-chart").on("click", function(e) {
	    e.preventDefault();
	    let target = $(this).data("target");
	    toggleMypage(target);
	  });
	 });  
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/sellerMain</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
    
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Farmtastic Seller</h1>
                    </div>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- Content Row -->
                    <div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
						    <div class="card border-left-primary shadow h-100 py-2">
						        <div class="card-body">
						            <div class="row no-gutters align-items-center">
						                <div class="col mr-2">
						                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
						                        당월 매출액</div>
						                    <div class="h5 mb-0 font-weight-bold text-gray-800">
						                        <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
						                            <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales)}" type="number" pattern="#,##0" />
						                        </c:forEach>
						                    </div>
						                </div>
						                <div class="col-auto">
						                    <i class="fa-2x text-gray-300"> 
											<% int currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
											</i>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
						    <div class="card border-left-success shadow h-100 py-2">
						        <div class="card-body">
						            <div class="row no-gutters align-items-center">
						                <div class="col mr-2">
						                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
						                        당월 수수료</div>
						                    <div class="h5 mb-0 font-weight-bold text-gray-800">
						                        <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
						                            <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales * 0.05)}" type="number" pattern="#,##0" />
						                        </c:forEach>
						                    </div>
						                </div>
						                <div class="col-auto">
						                    <i class="fa-2x text-gray-300"> 
											<% currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
											</i>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
							<div class="col-xl-3 col-md-6 mb-4">
							    <div class="card border-left-info shadow h-100 py-2">
							        <div class="card-body">
							            <div class="row no-gutters align-items-center">
							                <div class="col mr-2">
							                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1"> 당월 정산액
							                    </div>
							                    <div class="h5 mb-0 font-weight-bold text-gray-800">
							                        <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
							                            <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales - (sales.order_mm_totalSales * 0.05))}" type="number" pattern="#,##0" />
							                        </c:forEach>
							                    </div>
							                </div>
							                <div class="col-auto">
							                    <i class="fa-2x text-gray-300"> 
												<% currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
												</i>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">일자별 매출</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
									
									<!-- 선진) 매출 그래프를 표시할 캔버스 요소 -->					
									<div>
									  <canvas id="getDailySalesChart" width="1000" height="200"></canvas>
									</div>
									
									<!-- 선진) 해당 월의 일자별 매출 차트 -->
									<div>
									<script>
									  // 차트를 그리기 위한 함수 - 기존 템플릿거로 수정중
// 									  function drawDailySalesChart(data) {
// 									    const labels = data.map(item => item.order_mmdd);
// 									    const sales = data.map(item => item.order_mmdd_totalSales);
									
// 									    const ctx = document.getElementById('getDailySalesChart').getContext('2d');
// 									    const myChart = new Chart(ctx, {
// 									      type: 'line',
// 									      data: {
// 									        labels: labels,
// 									        datasets: [{
// 									          label: '매출',
// 									          data: sales,
// 									          borderColor: 'rgba(75, 192, 192, 1)',
// 									          backgroundColor: 'rgba(75, 192, 192, 0.2)',
// 									          borderWidth: 1
// 									        }]
// 									      },
// 									      options: {
// 									        scales: {
// 									          x: {
// 									            title: {
// 									              display: true,
// 									              text: '날짜'
// 									            }
// 									          },
// 									          y: { beginAtZero: true, title: { display: true, text: '매출' },
// 									            gridLines:{
// 													color: 'rgba(166, 201, 226, 1)',
// 													lineWidth:3
// 												}
// 									          }
// 									        }
// 									      }
// 									    });
// 									  }
									  // 템플릿 적용
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
									          lineTension: 0.3,
									          data: sales,
									          borderColor: "rgba(78, 115, 223, 1)",
									          backgroundColor: "rgba(78, 115, 223, 0.05)",
									          pointBackgroundColor: "rgba(78, 115, 223, 1)",
									          pointBorderColor: "rgba(78, 115, 223, 1)",
									          pointHoverRadius: 3,
									          pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
									          pointHoverBorderColor: "rgba(78, 115, 223, 1)",
									          pointHitRadius: 10,
									          pointBorderWidth: 2
									        }]
									      },
									      options: {
								    	    maintainAspectRatio: false,
								    	    layout: {
								    	      padding: {
								    	        left: 10,
								    	        right: 25,
								    	        top: 25,
								    	        bottom: 0
								    	      }
								    	    },
									        scales: {
									          x: {
									            title: {
									              display: true,
									              text: '날짜'
									            },
									            gridLines: {
									                display: false,
									                drawBorder: false
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
									<!-- 매출통계그래프 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 도넛 차트 -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">품목</h6>
<!--                                     <div class="dropdown no-arrow"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!--                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                             <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!--                                         </a> -->
<!--                                         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuLink"> -->
<!--                                             <div class="dropdown-header">Dropdown Header:</div> -->
<!--                                             <a class="dropdown-item" href="#">Action</a> -->
<!--                                             <a class="dropdown-item" href="#">Another action</a> -->
<!--                                             <div class="dropdown-divider"></div> -->
<!--                                             <a class="dropdown-item" href="#">Something else here</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </div>
                                <!-- 차트 바디 시작 -->
                                <div class="card-body">
                                	<!-- 선진) 파이 차트 표시할 캔버스 요소 -->
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="getMonthlyItemsChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">

                                    </div>
                                </div>
                                <!-- 차트 바디 끝 -->
                                <!-- 템플릿 차트 바디 시작 -->
<!--                                 <div class="card-body"> -->
<!--                                     <div class="chart-pie pt-4 pb-2"> -->
<%--                                         <canvas id="myPieChart"></canvas> --%>
<!--                                     </div> -->
<!--                                     <div class="mt-4 text-center small"> -->
<!--                                         <span class="mr-2"> -->
<!--                                             <i class="fas fa-circle text-primary"></i> Direct -->
<!--                                         </span> -->
<!--                                         <span class="mr-2"> -->
<!--                                             <i class="fas fa-circle text-success"></i> Social -->
<!--                                         </span> -->
<!--                                         <span class="mr-2"> -->
<!--                                             <i class="fas fa-circle text-info"></i> Referral -->
<!--                                         </span> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <!-- 템플릿 차트 바디 끝 -->
                            </div>
                        </div>
                    </div>
                    <!-- 도넛 차트 끝 -->

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- 리뷰관리 시작 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"><a href="${pageContext.request.contextPath}/reviewMng">리뷰 관리</a></h6>
                                </div>
                                <div class="card-body">
                                <!-- 리뷰관리 가져옴 시작-->
                                	<div class="table-responsive" style="height: 378px;">
										<div class="_qna_list_container scrl uio_grid" style="width: 100%; height: 377px;">
											<div class="_flexible_area flexible_area" style="display: block;">
												<div style="height: 35px;">
													<table class="table table-bordered">
													  <colgroup>
													    <col style="width: 150px;">
													    <col style="width: 120px;">
													    <col style="width: 100px;">
													    <col style="width: 500px;">
													    <col style="width: 400px;">
													  </colgroup>
													  <tbody>
													  <tr>
													  <th class="custom-th">상품명</th>
													  <th class="custom-th">별점</th>
													  <th class="custom-th">작성</th>
													  <th class="custom-th">제목</th>
													  <th class="custom-th">작성일</th>
													  </tr>
													  </tbody>
													</table>
													<div class="_resize_handle_container resize_handle_container"></div>
												</div>
												<div>
													<div>
													<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
														<table class="table table-bordered" id="date-table">
															<colgroup>
															<col data-columnname="regDate" style="width: 150px;">
															<col style="width: 120px;">
															<col style="width: 100px;">
															<col style="width: 500px;">
															<col style="width: 400px;">
															</colgroup>
															<tbody>
															  <c:forEach var="row" items="${buyreview}">
															    <tr>															     
															      <td>${row.item_name}</td>
															      <td id="review-star">${row.review_star}</td>
															      <td>${row.member_name}</td>
															      <td><a onclick="reviewPop(${row.review_num})">${row.review_title}</a></td>
															      <td>${row.review_day}</td>
															    </tr>
															  </c:forEach>
															</tbody>
														</table>
													</div>
													<div class="_selection_layer selection_layer"></div>
												</div>
												
												<!-- 목록 없으면 -->
												<div class="_no_review_message" style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
												<c:if test="${empty buyreview}">
													<i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
													<p style="margin: 0;">오늘 등록된 리뷰가 없습니다.</p>
												</c:if>
												</div>
												
												
											</div>
										</div>
									</div>
									<!-- 리뷰관리에서 가져옴 끝 -->
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 mb-4">
                            <!-- 문의관리 시작 -->
                            <div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary" style="display: flex; align-items: center;">
 										<span class="toggle-table on" id="todayQue" style="cursor: pointer; flex: 1; text-align: center; font-weight: bold; padding-right: 10px; border-right: 1px solid #ccc;" data-target="today">오늘의 문의</span>
 										<span class="toggle-table on" id="unrepQue" style="cursor: pointer; flex: 1; text-align: center; font-weight: bold; padding-left: 10px;" data-target="unrep">미답변 문의</span>
									</h6>
								</div>
                                <div class="card-body">
                                <!-- 문의관리에서 가져옴 시작1-->
                               	<div class="table-responsive" style="height: 378px; position: relative;"> <!-- 포지션 요소는 밑에 문의관리로이동 박스와 관련있는 요소임 일단 남겨둠 -->
									<div class="_qna_list_container scrl uio_grid" style="width: 100%; height: 377px;">
										<div class="_flexible_area flexible_area" style="display: block;">
											<div style="height: 35px;">
												<table class="table table-bordered">
												  <colgroup>
												    <col style="width: 150px;">
												    <col style="width: 120px;">
												    <col style="width: 100px;">
												    <col style="width: 500px;">
												    <col style="width: 400px;">
												    <col style="width: 150px;">
												    <col style="width: 150px;">
												  </colgroup>
												  <tbody>
												  <tr>
												  <th class="custom-th">접수일</th>
												  <th class="custom-th">처리상태</th>
												  <th class="custom-th">제목</th>
												  <th class="custom-th">상품명</th>
												  <th class="custom-th">질문자</th>
												  <th class="custom-th">처리상태</th>
												  <th class="custom-th">처리일시</th>
												  </tr>
												  </tbody>
												</table>
												<div class="_resize_handle_container resize_handle_container"></div>
											</div>
											<div>
												<div>
												<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
													<!-- 토글1 -->
													<div id="divTable1">
													<table class="table table-bordered" id="date-table toggle1">
														<colgroup>
														<col style="width: 150px;">
														<col style="width: 120px;">
														<col style="width: 500px;">
														<col style="width: 400px;">
														<col style="width: 150px;">
														<col style="width: 100px;">														
														<col style="width: 150px;">
														</colgroup>
														<tbody>
														  <c:forEach var="today" items="${todayOneboard}">
														    <tr>  
														      <td>${today.one_board_day}</td>
														      <td>${today.one_board_repYn}</td>
														      <td><a onclick="boardPop(${today.one_board_num})">${today.one_board_title}</a></td> <!--  class="one_board_title" -->
														      <td>${today.item_name}</td>
														      <td>${today.member_name}</td>
														      <td>${today.one_board_type}</td> 
														      <td>${today.one_board_repDay}</td>
														    </tr>
														  </c:forEach>
														</tbody>
													</table>
											<!-- 목록 없으면 -->
											<div class="_no_board_message" style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
											<c:if test="${empty todayOneboard}">
												<i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
												<p style="margin: 0;">오늘 등록된 문의가 없습니다.</p>
											</c:if>
											</div>
													</div>
													<!-- 토글2 -->
													<div id="divTable2">
													<table class="table table-bordered" id="date-table toggle2">
														<colgroup>
														<col style="width: 150px;">
														<col style="width: 120px;">
														<col style="width: 500px;">
														<col style="width: 400px;">
														<col style="width: 150px;">
														<col style="width: 100px;">														
														<col style="width: 150px;">
														</colgroup>
														<tbody>
														  <c:forEach var="unrep" items="${unrepboard}">
														    <tr>  
														      <td>${unrep.one_board_day}</td>
														      <td>${unrep.one_board_repYn}</td>
														      <td><a onclick="boardPop(${unrep.one_board_num})">${unrep.one_board_title}</a></td> <!--  class="one_board_title" -->
														      <td>${unrep.item_name}</td>
														      <td>${unrep.member_name}</td>
														      <td>${unrep.one_board_type}</td> 
														      <td>${unrep.one_board_repDay}</td>
														    </tr>
														  </c:forEach>
														</tbody>
													</table>
											<!-- 목록 없으면 -->
											<div class="_no_board_message" style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
											<c:if test="${empty unrepboard}">
												<i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
												<p style="margin: 0;">미답변 문의가 없습니다.</p>
											</c:if>
											</div>
													</div>
												</div>
												<div class="_selection_layer selection_layer"></div>
											</div>									
										</div>
									</div>
								</div>
								<!-- 문의관리에서 가져옴 끝1--> 		
								<!-- 문의 관리로 이동1 -->								
								<div style="text-align:center;">
								    <a href="${pageContext.request.contextPath}/questionMng" style="color:#666;border-color:#dbdde2!important;border :1px solid;display:block;padding :10px;text-align:center;text-decoration:none;line-height :1;background:none;">
								        문의 관리
								    </a>
								</div>
                                </div>
                            </div>
                        </div>
                    </div>

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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

	<script>
	
	<!-- 품목별 월 매출 차트 -->
	// 차트를 그리기 위한 함수
	function drawMonthlyItemsChart(data) {
	  const labels = data.map(item => item.item_num);
	  const sales = data.map(item => item.item_totalSales);
	
// 	  const ctx = document.getElementById('getMonthlyItemsChart').getContext('2d');
// 	  const myChart = new Chart(ctx, {
// 	    type: 'pie',
// 	    data: {
// 	      labels: labels,
// 	      datasets: [{
// 	        label: '매출',
// 	        data: sales,
// 	        borderColor: 'rgba(75, 192, 192, 1)',
// 	        backgroundColor: 'rgba(75, 192, 192, 0.2)',
// 	        borderWidth: 1
// 	      }]
// 	    },
// 	    options: {
// 	      scales: {
// 	        x: {
// 	          title: {
// 	            display: true,
// 	            text: '날짜'
// 	          }
// 	        },
// 	        y: { beginAtZero: true, title: { display: true, text: '매출' },
// 	          gridLines:{
// 			color: 'rgba(166, 201, 226, 1)',
// 			lineWidth:3
// 		}
// 	        }
// 	      }
// 	    }
// 	  });
// 	}
	  const ctx = document.getElementById('getMonthlyItemsChart').getContext('2d');
	  const myChart = new Chart(ctx, {
			  type: 'pie',
			  data: {
				  labels: labels,
				  datasets: [{
				      label: '매출',
				      data: sales,
				      backgroundColor: 'rgba(75, 192, 192, 0.2)',
				  }]
			  },
			  options: {
			    responsive: true,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: 'Chart.js Pie Chart'
			      }
			    }
			  }
			}
	// 페이지 로딩 시 매출 데이터 가져와서 차트 그리기
	$(document).ready(function() { 
	  ajaxMonthlyItems();
	});
	
	// 매출 데이터를 가져오는 함수
	function ajaxMonthlyItems() {
	  $.ajax({
	    url: '${pageContext.request.contextPath}/chartMonthlyItems',
	    type: 'get',
	    dataType: 'json',
	    success: function(result) {
	      drawMonthlyItemsChart(result);
	    },
	    error: function() {
	      alert('매출 데이터를 가져오는데 실패했습니다.');
	    }
	  });
	}
	
	
	
	
	
	let message = '<%=request.getParameter("message")%>';
	if (message !== 'null' && message !== null && message !== undefined) {
        alert(message);
    }
	
	// 리뷰 제목 누르면 팝업창 띄움
	function reviewPop(reviewNum) {
	    // 회원 정보 조회 API URL
		  const url = '${pageContext.request.contextPath}/reviewDetail?review_num=' + reviewNum;
	    // 팝업 창 열기
	    window.open(url, 'reviewInfoPopup', 'width=800,height=600');
	    
	    // 팝업 창에서 메인 창으로 포커스 이동
	    opener.focus();
	}
	
	// 문의 제목 누르면 팝업창 띄움
	function boardPop(boardNum) {
	    // 회원 정보 조회 API URL
		  const url = '${pageContext.request.contextPath}/questionDetail?one_board_num=' + boardNum;
	    // 팝업 창 열기
	    window.open(url, 'boardInfoPopup', 'width=800,height=600');
	    console.log("boardPop is called with", boardNum);
	    // 팝업 창에서 메인 창으로 포커스 이동
	    opener.focus();
	}

 	// 별점을 ★로 변경
    let reviewStars = document.querySelectorAll('#review-star');
    reviewStars.forEach(function (starElement) {
        let starCount = parseInt(starElement.textContent, 10);
        let stars = '';
        for (let i = 1; i <= starCount; i++) {
            stars += '★';
        }
        starElement.textContent = stars;
    });
    
    // 문의 팝업창 답변 등록하기 이동
    function redirectToQuestionMngFromPopup() {
    window.location.href = "${pageContext.request.contextPath}/questionMng";
	}
    
	// 문의관리 토글함수
	$(document).ready(function() {
	    $("#divTable2").hide();
	
	    function toggleQuestion(target) {
	        $("#divTable1").hide();
	        $("#todayQue").removeClass("on");
	        $("#divTable2").hide();
	        $("#unrepQue").removeClass("on");
	      
	      if (target === "today") {
	          $("#divTable1").show();
	          $("#todayQue").addClass("on");
	      } else if (target === "unrep") {
	          $("#divTable2").show();
	          $("#unrepQue").addClass("on");
	      }
	    }
	  // 메뉴 클릭 이벤트 핸들러
	  $(".toggle-table").on("click", function(e) {
	    e.preventDefault();
	    let target = $(this).data("target");
	    toggleQuestion(target);
	  });
	 });  
</script>

</body>
</html>
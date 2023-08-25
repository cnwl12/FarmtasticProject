
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="m-0 font-weight-bold text-primary">Main</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                매출액 (월별)</div>
                                                <input type="hidden" id="hidden_month" value="${fn:substring(currentMonth, 0, 7)}" />
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sales.month_fee}</div>
                                        </div>
                                        <div class="col-auto">
                                           <a href="sales"> <i class="fas fa-calendar fa-2x text-gray-300"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
    										<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
        										매출액 (연간)</div>
    										<div class="h5 mb-0 font-weight-bold text-gray-800">${totalSales.total_fee}</div>
										  </div>
                                        <div class="col-auto">
                                           <a href="totalSales"> <i class="fas fa-dollar-sign fa-2x text-gray-300"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">미승인업체
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${count}</div>
                                                </div>
                                           <!--      <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
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
                                    <h6 class="m-0 font-weight-bold text-primary">월별매출차트</h6>
                                   
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                   <div class="chart-area">
  										<canvas id="myChart"></canvas>
								   </div>
										<script>
   										 // total_fee와 month_fee를 담을 배열 생성
    									 let total_fee = 0;
    									 let month_fee = Array(12).fill(0); 
    									 let labels = ['1월', '2월', '3월', '4월', '5월', '6월', 
    										 		   '7월','8월','9월','10월','11월','12월'];

    									 // data에서 total_fee와 month_fee 가져오기
    
    									 var list = JSON.parse('${data_json}');
    
										 const sales = [];
	
											labels.forEach((e, i) => {
											var input = 0;
											list.forEach((data, index) => {
												if(e == data.month){
												input = data.month_fee2;
												} 
											  });
											sales.push(input);
											});
	
										// 차트 생성...
										var ctx = document.getElementById('myChart').getContext('2d');
     								    var chart = new Chart(ctx, {
         								type: 'line',
         								data: {
			 							labels : labels,
             							datasets : [{
                 							label : "Total Fee",
                 							borderColor : "#3e95cd",
                 							fill:false,
                 							yAxisID:'y-axis-1',
				 							data : sales
			 								}]
		 								},
		 								options:{
		     							responsive:true,
		     							hoverMode:'index',  
		  	 							stacked:false ,
		  	 							title:{
		     								display:true ,
		      								text:"Monthly Total and Month Fees"
		  								},
		  									scales:{   
		        								yAxes:[{
		            							type:"linear" ,
		            							display:true ,    
		            							position :"left" ,
			        							id :"y-axis-1"
		       									},{
			      								type :'linear',  
			     								display: true,
			    								position :'right',
			    								id :'y-axis-2'
			  									}]
	      									}
	  									}		
									});
									</script>

                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">품목별 매출차트</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="pieChart"></canvas>
                                    </div>
                             <script>
   								 var pieData = ${jsonData};

    							// 상위 5개 데이터만 추출한 후 정렬
   				 				 pieData.sort(function(a,b) {return b.total_amount - a.total_amount});
    							 var top5Data = pieData.slice(0, 5);
    							 var ctx = document.getElementById("pieChart").getContext("2d");
    							 
    							 var myPieChart = new Chart(ctx, {
        						 	type: 'doughnut',
        							data: {
            						labels: top5Data.map(function(item) { return item.seller_type; }),
            						datasets: [{
                						data: top5Data.map(function(item) { return item.total_amount; }),
                						backgroundColor: [
                    						"#4e73df",
                    						"#1cc88a",
                    						"#36b9cc",
                    						"#f6c23e",
                    						"#e74a3b"
                							]
            							}]
        							},
        						  	options: {
            						responsive: true
        							}
    							});
								</script>
                               </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->

                        <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">미승인 업체목록</h6>
                                </div>
                                <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" class="reject-check-all"/></th>
                                            <th>번호</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>사업장 번호</th>
                                            <th>상태</th>
                                            <th>가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
    								<c:set var="total" value="${fn:length(sellers)}" /> <!-- 전체 업체 수를 계산 -->
    								<c:set var="count" value="0" /> <!-- 순차 카운터 변수 초기화 -->
    								<c:forEach items="${sellers}" var="seller" varStatus="status">
        							<c:if test="${seller.seller_recoYn != 'Y'}">
            						<c:set var="reversedCount" value="${total - status.index}" /> <!-- 역방향 카운트 계산 -->
            						<c:set var="count" value="${count + 1}" scope="page"/> <!-- 순차 카운터 변수 증가 -->
            						<tr>
                						<td><input type="checkbox" class="sellerRejectbox" name="result" value="${seller.seller_num}" /></td>
                						<td>${count}</td> <!-- 순차 카운터 표시 -->
                						<td>${seller.seller_storeName}</td>
                						<td>${seller.seller_name}</td>
                						<td>${seller.seller_licenseNum}</td>
                						<td>${seller.seller_recoYn}</td>
                						<td>${seller.seller_joinDay}</td>
            						</tr>
        							</c:if>
    								</c:forEach>
									</tbody>
                                </table>
                            </div>
                                </div>
                            </div>
								
                          

                        </div>
                          <div class="col-lg-6 mb-4">
								   <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">미승인업체
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${count}</div>
                                                </div>
                                           <!--      <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
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

</body>

</html>
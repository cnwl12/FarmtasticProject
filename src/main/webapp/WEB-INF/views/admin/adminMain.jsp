
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
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 15px;">
                                                매출액 (월별)</div>
                                                <input type="hidden" id="hidden_month" value="${fn:substring(currentMonth, 0, 7)}" />
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sales.month_fee} 원</div>
                                        </div>
                                        <div class="col-auto">
                                           <a href="sales"> <i class="fas fa-dollar-sign fa-2x text-gray-300"></i></a>
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
    										<div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size: 15px;">
        										매출액 (연간)</div>
    										<div class="h5 mb-0 font-weight-bold text-gray-800">${totalSales.total_fee} 원</div>
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
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="font-size: 15px;">미승인업체
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
   														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${sellers[0].count_null} 곳</div>
												</div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                           <a href="sellerAdmin"> <i class="fas fa-clipboard-list fa-2x text-gray-300"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						 <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" style="font-size: 15px;">
                                                오늘 주문 건수</div>
                                                  <input type="hidden" id="hidden_date" value="${currentDay}" />
                                                   
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${today[0].count} 건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
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
  										<canvas id="myChart" style="margin-left: 15%;"></canvas>
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
                                <div class="card-body" style="padding: 41px;">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="pieChart" style="margin-left: 22%;"></canvas>
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
            						labels: top5Data.map(function(item) {  return item.seller_type + ": " + item.type_name; }),
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

	<script>
  var contextPath = "//c2d2303t2.itwillbs.com/FarmProject";

  <c:if test="${openChatPopup}">
    openChatPopup();
  </c:if>
  
  function openChatPopup() {
    // 팝업 창 옵션 설정
    var popupWidth = 400; // 팝업 창 가로 크기
    var popupHeight = 500; // 팝업 창 세로 크기

    // 브라우저 창의 가운데 좌표 계산
    var leftPosition = (window.screen.width - popupWidth) / 2;
    var topPosition = (window.screen.height - popupHeight) / 2;

    // 실제 팝업 창 열기
    var chatPopup = window.open("", "chatPopup", "width=" + popupWidth + ", height=" + popupHeight +
                ", left=" + leftPosition + ", top=" + topPosition +
                ", resizable=no, scrollbars=no, status=no");

    // 팝업 내부에서 페이지 이동 처리
    chatPopup.document.location.href = contextPath + "/adminrealtimechatBot";
}
</script>
	


</body>

</html>
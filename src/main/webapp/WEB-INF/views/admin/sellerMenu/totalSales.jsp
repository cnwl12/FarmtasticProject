
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="../inc/sidemenu.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                 <jsp:include page="../inc/top.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">매출관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">총 매출</h6>
                       
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<table class="table table-bordered" id="dataTable2">
                            		<thead>
                            		 	<tr id="totalavg" style="background-color: #7fad39; color: #f8f9fc;">
                                            <th colspan="2">업체 총매출</th>
                                            <th colspan="2">업체 총정산액</th>
                                            <th colspan="2">본사 총매출</th>
                                          
                                        </tr>
                                      </thead>
                                      <tbody>  
                                      <c:forEach items="${sellers}" var="seller" begin="0" end="0">
    									<tr>
    									    <td colspan="2">${seller.total_sales}</td>
        									<td colspan="2">${seller.total_settlement}</td>
        									<td colspan="2"  style="color: black; font-weight: bold;" >${seller.total_fee}</td>
        									
    									</tr>
									  </c:forEach>
                            		</tbody>
                            	</table>
                            </div>
                        </div>
                        <div class="card-body">
                     
                          <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                   
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
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>
      <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>
	
</body>

</html>
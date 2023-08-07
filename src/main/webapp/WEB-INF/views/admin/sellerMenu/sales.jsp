
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
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                            <div>
    						<button id="prev_month" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">이전 월</button>
    						<label for="current_month">${fn:substring(currentMonth, 5, 7)}월</label>
   			 				<button id="next_month" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">다음 월</button>
							</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<table class="table table-bordered" id="dataTable">
                            		
                            		 <tr id="avg" style="background-color: #4167d5; color: #f8f9fc;">
                                            <th colspan="2">총 정산액</th>
                                            <th colspan="2">총 수수료</th>
                                            <th colspan="2">총 매출</th>
                                        </tr>
                                      <c:forEach items="${sellers}" var="seller" begin="0" end="0">
    									<tr>
        									<td colspan="2">${seller.grand_settlement_amount}</td>
        									<td colspan="2">${seller.grand_fee}</td>
        									<td colspan="2" style="color: black; font-weight: bold;" >${seller.grand_total_revenue}</td>
    									</tr>
									  </c:forEach>
									   <tr id="avg" style="background-color: #4167d5; color: #f8f9fc;">
                                            <th colspan="2">월 정산액</th>
                                            <th colspan="2">월 수수료</th>
                                            <th colspan="2">월 매출</th>
                                        </tr>
                                      <c:forEach items="${sellers}" var="seller" begin="0" end="0">
    									<tr>
        									<td colspan="2">${seller.month_settlement}</td>
        									<td colspan="2">${seller.month_fee}</td>
        									<td colspan="2" style="color: black; font-weight: bold;" >${seller.month_sales}</td>
    									</tr>
									  </c:forEach>
                            	
                            	</table>
                                <table class="table table-bordered" id="dataTable">
                                 
                                    <thead>
                                        
                                        <tr style="background-color: #edf1f5;">
                                            <th>코드</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>매출일</th>
                                            <th>정산액</th>
                                            <th>수수료</th>
                                            <th>매출액(업체)</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr style="background-color: #edf1f5;">
                                            <th>코드</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>매출일</th>
                                            <th>정산액</th>
                                            <th>수수료</th>
                                            <th>매출액(업체)</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                     <c:forEach items="${sellers}" var="seller">
    									<c:set var="sellerMonth" value="${seller.monthly}" />
   										<c:if test="${sellerMonth == currentMonth}">
        									<tr>
            									<td>${seller.seller_num}</td>
            									<td>${seller.seller_storeName}</td>
            									<td>${seller.seller_name}</td>
            									<td>${seller.pay_day}</td>
            									<td>${seller.daily_settlement}</td>
            									<td>${seller.daily_fee}</td>
            									<td>${seller.daily_sales}</td>
        									</tr>
    									</c:if>
									</c:forEach>
                                    </tbody>
                                </table>
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

</body>

</html>

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
                          
                        <div class="card-body">
                           
                                <table class="table table-bordered" id="salesTable">
                                    <thead>
                                        <tr  id="avg" style="background-color: #7fad39; color: #f8f9fc;">
                                            <th>업체 월매출</th>
                                            <th>업체 월정산액</th>
                                            <th>본사 월매출액</th>
                                           
                                        </tr>
                                        </thead>
                                        <tbody id="avgContent">
                                      <c:forEach items="${sellers}" var="seller" begin="0" end="0">
    									<tr style="background-color: #ffffff;">
    										<td >${seller.month_sales}</td>
        									<td >${seller.month_settlement}</td>
        									<td style="color: black; font-weight: bold;">${seller.month_fee}</td>
    									</tr>
									  </c:forEach>
                            			</tbody>
                                </table>
                           
                        </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" id="sellerAdmin">
                      <div>
                        <h6 class="m-0 font-weight-bold text-primary">월별매출</h6>
                    	<button id="prev_month" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">이전 월</button>
    						<label id="current_month_label" for="current_month">${fn:substring(currentMonth, 0, 4)}-${fn:substring(currentMonth, 5, 7)}</label>

   			 				<input type="hidden" id="hidden_month" value="${fn:substring(currentMonth, 0, 7)}" />
   			 				<button id="next_month" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">다음 월</button>
							
                        </div>
                 
                       <form action="${pageContext.request.contextPath}/changeSellerStatus" method="post" id="changeSellerStatus2">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable2">
                                   <thead>
                                        
                                        <tr style="background-color: #edf1f5;" >
                                            <th>코드</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>매출일</th>
                                            <th>업체 매출액</th>
                                            <th>업체 정산액</th>
                                            <th>본사 매출(수수료)</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="monthlysales">
                                     <c:forEach items="${sellers}" var="seller">
    									<c:set var="sellerMonth" value="${seller.monthly}" />
   										<c:if test="${sellerMonth == currentMonth}">
        									<tr>
        										<td><a href="${pageContext.request.contextPath}/detailSales?seller_num=${seller.seller_num}&pay_day=${seller.pay_day}">${seller.seller_num}</a></td>
            									<td>${seller.seller_storeName}</td>
            									<td>${seller.seller_name}</td>
            									<td>${seller.pay_day}</td>
            									<td>${seller.daily_sales}</td>
            									<td>${seller.daily_settlement}</td>
            									<td>${seller.daily_fee}</td>
        									</tr>
    									</c:if>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       </form>
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

<script>
$(document).ready(function () {

    function pad(str) {
        return String(str).padStart(2, "0");
    }

    function incrementMonth(date, increment) {
        var year = parseInt(date.substr(0, 4));
        var month = parseInt(date.substr(5, 2)) + increment;
        if (month < 1) {
            year -= 1;
            month = 12 + month;
        } else if (month > 12) {
            year += 1;
            month = month - 12;
        }
        return year + "-" + pad(month);
    }

    function updateSalesTableByMonth(monthly) {
        var apiUrl = "${pageContext.request.contextPath}/sales_ajax";

        // 월별 데이터 가져오기
        $.get(apiUrl + "?monthly=" + monthly, function (data) {
            var tableBody = $("#monthlysales");
            tableBody.empty(); // 기존 데이터 삭제

            // 데이터를 업데이트하는 부분
            $.each(data, function (index, seller) {
                var newRow = $("<tr></tr>");

                newRow.append($("<td></td>").text(seller.seller_num));
                newRow.append($("<td></td>").text(seller.seller_storeName));
                newRow.append($("<td></td>").text(seller.seller_name));
                newRow.append($("<td></td>").text(seller.pay_day));
                newRow.append($("<td></td>").text(seller.daily_sales));
                newRow.append($("<td></td>").text(seller.daily_settlement));
                newRow.append($("<td></td>").text(seller.daily_fee));

                tableBody.append(newRow);
            });

            $("#hidden_month").val(monthly);
            var year = monthly.substr(0, 4);
            var month = monthly.substr(5, 2);
            var formattedDate = year + '-' + month;

            // 월 표시 업데이트
            $("#current_month_label").text(formattedDate);
        });
    }

 // 이벤트 핸들러 등록
    $("#prev_month").click(function () {
        var currentMonth = $("#hidden_month").val();
        var prevMonth = incrementMonth(currentMonth, -1);
        updateSalesTableByMonth(prevMonth);

        // DataTables 초기화 설정 추가
        $('#salesTable').DataTable({
        	"retrieve": true, // 이 줄을 추가하세요.
            "lengthChange": true,
            "searching": false,
            "paging": true,
            "info": false,
            "sDom": '<"top"i>rt<"bottom"flp><"clear">',
            "ordering": false
        });
    });

    $("#next_month").click(function () {
        var currentMonth = $("#hidden_month").val();
        var nextMonth = incrementMonth(currentMonth, 1);
        updateSalesTableByMonth(nextMonth);

        // DataTables 초기화 설정 추가
        $('#salesTable').DataTable({
        	"retrieve": true, // 이 줄을 추가하세요.
            "lengthChange": true,
            "searching": false,
            "paging": true,
            "info": false,
            "sDom": '<"top"i>rt<"bottom"flp><"clear">',
            "ordering": false
        });
    });

    // 초기 데이터 로딩
    var initialMonth = $("#hidden_month").val();
    updateSalesTableByMonth(initialMonth);

    // 최초로 DataTables 초기화 설정 추가
    $('#salesTable').DataTable({
    	"retrieve": true, // 이 줄을 추가하세요.
        "lengthChange": true,
        "searching": false,
        "paging": true,
        "info": false,
        "sDom": '<"top"i>rt<"bottom"flp><"clear">',
        "ordering": false
    });
});
    </script>


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
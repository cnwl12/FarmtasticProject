<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
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
                 	 <div class="card-header py-3" style="border-bottom: none; margin-left: -10px;">
							<h3 class="m-0 font-weight-bold text-primary">정산관리</h3>
						</div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                         <form action="updateSettlementYn" method="post" id="settlementForm">
                         <div style="margin: 10px 5px -10px 20px;">
                   		<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" type="submit">정산하기</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" class="js-check-all"/></th>
                                            <th>코드</th>
                                            <th>업체명</th>
                                            <th>대표자</th>
                                            <th>매출월</th>
                                            <th>매출액(업체)</th>
                                            <th>수수료</th>
                                            <th>정산액</th>
                                            <th>정산여부</th>
                                            <th>정산일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sales}" var="sale">
                                          <tr>
                                          	<td><input type="checkbox" class="saleCheckbox" data-seller-num="${sale.seller_num}" data-order-month="${sale.order_month}" /></td>
                                            <td><a href="${pageContext.request.contextPath}/settle_day?seller_num=${sale.seller_num}&order_month=${sale.order_month}"> ${sale.seller_num}</a></td>
                                            <td>${sale.seller_storeName}</td>
                                            <td>${sale.seller_name}</td>
                                            <td>${sale.order_month}</td>
                                            <td>${sale.total_revenue}</td>
                                            <td>${sale.fee}</td>
                                            <td>${sale.settlement_amount}</td>
                                            <td>${sale.settlementComplete}</td>
                                            <td>${sale.settlementComplete_day}</td>
                                     	   </tr>	
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
	<script>
$(document).ready(function() {
    document.getElementById("settlementForm").addEventListener("submit", function(event) {
        const checkboxes = document.getElementsByClassName("saleCheckbox");
        let sellerNums = [];
        let orderMonths = [];
        let alreadySettled = false;

        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                let settlementComplete = checkboxes[i].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent.trim();
                if (settlementComplete === 'Y') {
                    alreadySettled = true;
                    break;
                }
                sellerNums.push(checkboxes[i].dataset.sellerNum);
                orderMonths.push(checkboxes[i].dataset.orderMonth);
            }
        }
        if (alreadySettled) {
            event.preventDefault();
            alert("이미 정산된 내역입니다!");
        } else if (sellerNums.length === 0) {
            event.preventDefault();
            alert("적어도 하나의 업체를 선택해주세요!");
        } else {
            const sellerNumInput = document.createElement("input");
            sellerNumInput.type = "hidden";
            sellerNumInput.name = "sellerNum";
            sellerNumInput.value = sellerNums.join(",");
            event.target.appendChild(sellerNumInput);

            const orderMonthInput = document.createElement("input");
            orderMonthInput.type = "hidden";
            orderMonthInput.name = "orderMonth";
            orderMonthInput.value = orderMonths.join(",");
            event.target.appendChild(orderMonthInput);
        }
    });
});
</script>

</body>

</html>
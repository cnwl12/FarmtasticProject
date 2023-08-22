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

    <title>seller/settlementList</title>

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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                    <h1 class="h3 mb-2 text-gray-800">정산관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 정산 신청 시작 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">정산관리</h6>
                        </div>
					    
                        <form action="${pageContext.request.contextPath}/settlementRequest" method="post" id="settlementRequest">
                        <input type="hidden" id="selectedMonths" name="selectedMonths" value=""/>
                   		
                   		<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" name="action" value="request" id="request" type="submit" onClick="submitAction('request');">정산신청</button>
                   		<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" name="action" value="cancel" id="cancel" type="submit" onClick="submitAction('cancel');">신청취소</button> <!-- deleteSettlement();  -->
                   		
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" id="allSetRequestCB"/></th>
                                            <th>정산월</th>
                                            <th>매출액</th>
                                            <th>수수료</th>
                                            <th>정산액</th>
                                            <th>정산신청여부</th>
                                            <th>정산신청일</th>
                                            <th>정산완료여부</th>
                                            <th>정산완료일</th>
                                        </tr>
                                    </thead>
                                    <tbody id="getSettlementList">
                                    <c:forEach items="${MonthSettlementList}" var="slist">
                                          <tr>
                                          	<td><input type="checkbox" class="setRequestCB" name="checkedSettlements" value="${slist.settlementMonth}" onchange="onChangeCheckbox(event, '${slist.settlementMonth}')"/></td>
                                            <td>${slist.settlementMonth}</td>
                                            <td>${slist.totalSales}</td>
                                            <td>${slist.totalFee}</td>
                                            <td>${slist.totalSettlement}</td>
                                            <td>${slist.settlementApplication}</td>
                                            <td>${slist.applyDay}</td>
                                            <td>${slist.settlementComplete}</td>
                                            <td>${slist.completeDay}</td>
                                     	   </tr>	
                                     </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                      </form>
                 
                    </div>
                    
                  
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
    
    <!-- 정산 신청/정산 취소 -->
 	<script>
	var selectedSettlementMonths = [];

	function onChangeCheckbox(event, month) { // 체크박스 선택
	  if (event.target.checked) {
	    selectedSettlementMonths.push(month);
	  } else {
	    var index = selectedSettlementMonths.indexOf(month);
	    if (index > -1) {
	      selectedSettlementMonths.splice(index, 1);
	    }
	  }
	  // 여기에서 selectedMonths 값을 업데이트
	  document.getElementById("selectedMonths").value = selectedSettlementMonths.join(",");
	}

	function submitAction(action) { // 정산신청, 정산취소 버튼으로 폼 제출
	    let selectedRows = Array.from(document.querySelectorAll('input.setRequestCB:checked'))
	        .map(checkbox => checkbox.parentElement.parentElement);

	    if (selectedRows.length === 0) { // 체크박스로 선택하지 않고 버튼을 눌렀다면 메시지 띄우기
	        alert("선택된 정산건이 없습니다!");
	        return;
	    }

	    const messages = {
	        1: "이미 신청된 정산입니다!",
	        2: "정산 처리가 완료된 정산입니다!",
	        3: "정산이 완료된 건입니다. 관리자에게 문의하세요!",
	        4: "취소 가능한 정산건이 존재하지 않습니다!"
	    };

	    let alertMessage = null;

	    for (const row of selectedRows) {
	        const requestStatus = row.children[5].innerText;
	        const completeStatus = row.children[7].innerText;

	        if (alertMessage) {
	            // 이미 메시지가 결정된 경우, 더 이상 검사를 진행하지 않는다.
	            break;
	        }

	        if (action === 'request') {
	            if (requestStatus === 'Y' && completeStatus !== 'Y') {
	                alertMessage = messages[1];
	            } else if (requestStatus === 'Y' && completeStatus === 'Y') {
	                alertMessage = messages[2];
	            }
	        } else if (action === 'cancel') {
	            if (requestStatus === 'Y' && completeStatus === 'Y') {
	                alertMessage = messages[3];
	            } else if (requestStatus !== 'Y') {
	                alertMessage = messages[4];
	            }
	        }
	    }

	    if (alertMessage) {
	        alert(alertMessage);
	        return;
	    }

	    $('#action').val(action);
	    $('#settlementRequest').submit(); // 폼 제출
	}
	
	// 지피티코드
//     function submitAction(action) {
//         let selectedMonths = document.querySelectorAll('input.setRequestCB:checked');
        
//         if (selectedMonths.length === 0) {
//             alert("선택된 정산건이 없습니다!");
//             return;
//         } else {
//             let errorMessage = null;

//             selectedMonths.forEach(function(month) {
//                 let row = month.closest('tr');
//                 let settlementApplication = row.querySelector('td:nth-child(6)').textContent;
//                 let settlementComplete = row.querySelector('td:nth-child(8)').textContent;

//                 if (action === 'request') {
//                     if (settlementApplication === 'Y') {
//                         errorMessage = "이미 신청된 정산입니다!";
//                     } else if (settlementComplete === 'Y') {
//                         errorMessage = "정산 처리가 완료된 정산입니다!";
//                     }
//                 } else if (action === 'cancel') {
//                     if (settlementComplete === 'Y') {
//                         errorMessage = "정산이 완료된 건입니다. 관리자에게 문의하세요!";
//                     } else if (settlementApplication === '') {
//                         errorMessage = "취소 가능한 정산건이 존재하지 않습니다!";
//                     }
//                 }
//             });

//             if (errorMessage) {
//                 alert(errorMessage);
//                 return;
//             } else {
//                 $('#action').val(action);
//                 $('#settlementRequest').submit();
//             }
//         }
//     }
    </script> 
    
</body>
</html>
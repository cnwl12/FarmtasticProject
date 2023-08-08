<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/memberMng</title>
	
	
	
	
	
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
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net"> official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 검색바 시작 -->
                    <div class="panel panel-seller"
                        ng-include="'shared/products/relation-list/include/search-condition-area.html.inc'">
                        <form id="searchForm" name="vm.searchForm" novalidate="" class="ng-pristine ng-valid ng-valid-pattern ng-valid-max-size-by-split ng-valid-maxlength ng-valid-required ng-valid-date-time-input">
                            <div class="panel-body">
                                <div class="seller-search-section">
                                    <ul class="seller-list-border">
                                        <li><label class="control-label">회원 검색</label>
                                        <div class="input-content">
                                                <div class="form-inline narrow-area"
                                                    ng-class="{'has-error-msg': (vm.searchForm.fromDate.$invalid || vm.searchForm.toDate.$invalid)}">
													<!--달력들어가는곳start-->
												
													<!--달력들어가는곳end-->
                                                </div>
                                            </div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="seller-btn-area btn-group-lg">
                                    <button id="searchButton" type="button" class="btn btn-primary">검색</button>
                                    <button type="button" class="btn btn-default" ng-click="vm.func.reset()">초기화</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- 검색바 끝 -->
                    
                  <!-- 주문회원 목록 시작 -->
                    <table class="table table-bordered" id="dataTable" width="50%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>상품번호</th>
                                <th>주문금액</th>
                                <th>결제금액</th>
                                <th>주문일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="member" items="${MemberMngjoin}">
                                <tr>
                                    <td>${member.member_num}</td>
                                    <td>${member.item_num}</td>
                                    <td>${member.order_amount}</td>
                                    <td>${member.order_pay}</td>
                                    <td>${member.order_day}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- 주문회원 목록 끝 -->

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
    
    <script>
      const searchForm = document.getElementById('searchForm');
      const searchButton = document.getElementById('searchButton');
      searchButton.addEventListener('click', (event) => {
        event.preventDefault();
        searchForm.submit();
        window.location.href = "${pageContext.request.contextPath}/memberMngPro";
      });
    </script>

</body>

</html>

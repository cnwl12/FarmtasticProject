<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ItemList</title>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<!-- 사이드바 줄어든거 되돌리기 -->
	<style type="text/css">
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
	 #none{border:none;}
	</style>

<script type="text/javascript">
	function updateStatus(item_num){
		
		if(confirm("판매상태를 변경하시겠습니까?")){
			location.href="ChangeItemStatus?item_num="+item_num;
		}
	}
	</script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="../inc/sidemenu.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 컨텐츠 시작 -->
			<div id="content">

				<jsp:include page="../inc/top.jsp"></jsp:include>

	   <div class="container-fluid">
	   <div class="card-header py-3">
							<h3 class="m-0 font-weight-bold text-primary">상품관리</h3>
						</div>

                    <!-- Page Heading -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" id="sellerAdmin">
                      	<div>
                        <div class="card-header py-3">
                            <h4 class="m-0 font-weight-bold text-primary">상품 카테고리</h4>
                        </div>
							<form action="${pageContext.request.contextPath}/makeCategory"
								method="post" id="makeCategory">
								<input type="hidden" id="actionCate" name="actionCate" />

								<div class="card-body">
									<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
										id="addCate" type="submit">카테고리 추가</button>
									<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
										id="insertCate" type="submit">카테고리 등록</button>
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>카테고리타입(seller_type)</th>
													<th>카테고리명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" name="newCategoryType[]" placeholder="카테고리 타입입력"></td>
													<td><input type="text" name="newCategoryName[]" placeholder="카테고리 이름입력"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</form>
						</div>

<!-- /////////////////////////////////////////////////////////////////////////////// -->
				<!-- 페이지 컨텐츠 시작 -->
				<div class="container-fluid">
					<!-- 상품목록 시작 -->
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">상품목록</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>업체명</th>
											<th>상품번호</th>
											<th>상품타입</th>
											<th>상품명</th>
											<th>재고</th>
											<th>판매상태변경</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${itemList}">
											<tr>
												<td>${item.seller_storeName}</td>
												<td>${item.item_num}</td>
												<td>${item.seller_type}</td>
												<td>${item.item_name}</td> 
												<td>${item.item_left}</td>
												<td>
													<c:choose>
														<c:when test="${item.item_salesStatus eq 'Y'}">
															<button id="none" onclick="updateStatus(${item.item_num})">판매중지</button>
														</c:when>
														<c:otherwise>
															<button id="none" onclick="updateStatus(${item.item_num})">판매</button>
														</c:otherwise>
													</c:choose> 
									     	    </td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 상품목록 끝 -->
                    
				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/adminItem.js"></script>
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
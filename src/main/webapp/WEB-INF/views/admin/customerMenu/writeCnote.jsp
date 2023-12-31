
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

                   		<div class="card-header py-3" style="border-bottom: none; margin-left: -10px;">
							<h3 class="m-0 font-weight-bold text-primary">공지사항 등록</h3>
						</div>
						
                 <div class="card shadow mb-4">
                    <!--글쓰기  -->
                    <form action="writePro"  id="insertForm" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="card-header py-3">
                           <div class="row">
                            <input type="hidden" name="admin_id" value="${admin.admin_id}" />
                          	 <button type="submit" style="margin-left: 12px; margin-bottom: 13px;"
                          	 onclick="submitForm()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">등록</button>
                          </div>
                         	<label>작성자: </label><input type="text" id="adminId" name="admin_id" style="width: 20%; border: none; background-color: #f8f9fc;" value="${admin.admin_id}" readonly="readonly"/><br>
							<label>제목: </label><input type="text" name="admin_csnotice_sub" style="width: 40%; border: none; background-color: #f8f9fc;"/> 
						    <input type="hidden" name="admin_cs_day" style="width: 40%; border: none; background-color: white;"/> <br>
							<label>첨부파일: </label><input type="file" name="file" style="width: 40%; border: none; background-color: #f8f9fc;"/>
                        </div>   
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         			<tr>
                         				
                         				<td><textarea name="admin_cs_view" rows="25" cols="60" value="" style="border-color: white; width: 100%;"></textarea></td>
                         			
                         			</tr>
                         		</table>
                            </div>
                          </div>
                        </form>
                      </div>
                <!-- DataTales Example End -->
                      
                </div>
				 <!-- Begin Page Content End -->
					</div>
					<!-- Main Content End -->	         

               
                <!-- /.container-fluid -->

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
function setCurrentDate() {
  var dateInput = document.querySelector('input[name="admin_cs_day"]');
  var currentDate = new Date().toISOString().slice(0, 10);
  dateInput.value = currentDate;
}
setCurrentDate();
</script>
<script>
function submitForm() {
    const adminId = document.getElementById("adminId");

    // 입력값에서 앞뒤 공백 제거
    const adminIdTrimmed = adminId.value.trim();

    adminId.value = adminIdTrimmed;

    // 폼 제출
    document.getElementById("insertForm").submit();
}

</script>
</body>

</html>


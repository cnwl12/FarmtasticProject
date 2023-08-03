
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
                    <h1 class="h3 mb-2 text-gray-800">공지사항글쓰기</h1>
					 <!-- DataTales Example -->
                 <div class="card shadow mb-4">
                    <!--글쓰기  -->
                        <div class="card-header py-3">
                           <div class="row">
                            <input type="hidden" name="admin_id" value=" ${admin.admin_id}"/>
                            <input type="hidden" name="admin_cs_num" value="${admin_cs_num}">
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                            <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="수정" onclick="updateContent('${content.admin_cs_num}')">수정</button>
                          </div>
                             <label>작성자: </label><input type="text" name="admin_id" value="${content.admin_id}" style="width: 20%; border: none; background-color: white;" readonly="readonly"/><br>    
           					 <label>제목: </label><input type="text" name="admin_csnotice_sub" value="${content.admin_csnotice_sub}" style="width: 40%; border: none; background-color: white;" readonly="readonly"/><br>
           					 <label>첨부파일: </label><input type="text" name="file" value="${content.admin_cs_file}" style="width: 60%; border: none; background-color: white;" readonly="readonly"/>
                        </div>   
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         			<tr>
                         				
                         				<td>
    										<c:choose>
        										<c:when test="${content.admin_cs_file != null && content.admin_cs_file != ''}">
            									<img src="${content.admin_cs_file}" style="width: 500px; height: 500px;"><br>
        										</c:when>
    										</c:choose>
    											<input type="text" name="admin_cs_view" value="${content.admin_cs_view}" style="width: 70%; border: none; background-color: white;" readonly="readonly"/>
										</td>
                         			</tr>
                         		</table>
                            </div>
                          </div>
                      </div>
                <!-- DataTales Example End -->
                      
                </div>
				 <!-- Begin Page Content End -->
					</div>
					<!-- Main Content End -->	         
                 </div>

               
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
  		function updateContent(admin_cs_num) {
    		window.location.href = "${pageContext.request.contextPath}/contentUpdate?admin_cs_num=" + admin_cs_num;
 		}
	</script>



</body>

</html>



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
                    <h1 class="m-0 font-weight-bold text-primary">공지사항글쓰기</h1>
					 <!-- DataTales Example -->
                 <div class="card shadow mb-4"  style="width: 1400px; height: 800px; overflow-y: auto;">
               
                    <!--글쓰기  -->
                        <div class="card-header py-3">
                           <div class="row">
                           
                            <input type="hidden" name="admin_id" value=" ${admin.admin_id}"/>
                            <input type="hidden" name="admin_cs_num" value="${admin_cs_num}">
                            
                            
                            <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                            
                               <c:if test="${content.admin_id eq sessionScope.admin.admin_id}">
        						<button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="수정" onclick="updateContent('${content.admin_cs_num}')">수정</button>
        						<button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="삭제" onclick="deleteContent('${content.admin_cs_num}')">삭제</button>
    						   </c:if>
    						   
                            <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="목록" onclick="cnotice()">목록</button>
                     		
                          </div>
                             <label>작성자: </label><input type="text" name="admin_id" value="${content.admin_id}" style="width: 20%; border: none; background-color: white;" readonly="readonly"/><br>    
           					 <label>제목: </label><input type="text" name="admin_csnotice_sub" value="${content.admin_csnotice_sub}" style="width: 40%; border: none; background-color: white;" readonly="readonly"/><br>
           					 <label>첨부파일: </label><input type="text" name="file" value="${content.admin_cs_file}" style="width: 60%; border: none; background-color: white;" readonly="readonly"/>
                        </div>   
                        <div class="card-body">
                            <div class="table-responsive">
                                
                               		 <c:choose>
        								<c:when test="${content.admin_cs_file != null && content.admin_cs_file != ''}">
            									<img src="${content.admin_cs_file}" style="width: 300px; height: 300px;"><br>
        								</c:when>
    								</c:choose>
    								<textarea name="admin_cs_view" style="width: 450px; height: 300px; border: none; background-color: white;" readonly>${content.admin_cs_view}</textarea>
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
   <!--
	<script>
  function showButtons(admin_id, content_admin_id, content_admin_cs_num) {
    if (admin_id === content_admin_id) {
      const updateButton = document.createElement('button');
      updateButton.type = 'button';
      updateButton.classList.add('d-none', 'd-sm-inline-block', 'btn', 'btn-sm', 'btn-primary', 'shadow-sm');
      updateButton.value = '수정';
      updateButton.onclick = function() { updateContent(content_admin_cs_num); };
      updateButton.textContent = '수정';

      const deleteButton = document.createElement('button');
      deleteButton.type = 'button';
      deleteButton.classList.add('d-none', 'd-sm-inline-block', 'btn', 'btn-sm', 'btn-primary', 'shadow-sm');
      deleteButton.value = '삭제';
      deleteButton.onclick = function() { deleteContent(content_admin_cs_num); };
      deleteButton.textContent = '삭제';

      document.querySelector('.button-container').appendChild(updateButton);
      document.querySelector('.button-container').appendChild(deleteButton);
    }
  }
</script>

	  -->
	
	<script>
  		function updateContent(admin_cs_num) {
    		window.location.href = "${pageContext.request.contextPath}/contentUpdate?admin_cs_num=" + admin_cs_num;
 		}
	</script>
	<script>
  		function deleteContent(admin_cs_num) {
    		if (confirm("정말로 이 글을 삭제하시겠습니까?")) {
     		 window.location.href = "${pageContext.request.contextPath}/deleteContent?admin_cs_num=" + admin_cs_num;
   			 }
  		}
	</script>
	<script>
  		function cnotice(){
    		window.location.href = "${pageContext.request.contextPath}/cnotice";
 		}
	</script>




</body>

</html>


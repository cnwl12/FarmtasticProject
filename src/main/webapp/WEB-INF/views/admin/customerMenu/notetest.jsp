
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
	<!-- include libraries(jQuery, bootstrap) -->
<!--   	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
	 <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">



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
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    
                    <div class="card shadow mb-4">
                      <!-- 글쓰기 -->
                   		 <form action="${pageContext.request.contextPath }/writePro" method="post" enctype="multipart/form-data" >
                    		<div class="card-header py-3">
                    			<div class="row">
                         			<input type="hidden" name="admin_id" value=" ${admin.admin_id}" /> 
                             		<h6 class="m-0 font-weight-bold text-primary">공지사항 글쓰기</h6> 
                            		<button type="submit" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="등록">등록</button>
                            	</div>
                             <label>작성자: </label><input type="text" name="writer" style="width: 20%; border: none; background-color: white; "value=" ${admin.admin_id}" readonly="readonly"/><br>	
                             <label>제목: </label><input type="text" name="title" style="width: 40%; border: none; background-color: white;"/>
                            </div>
                			<div style="width: 80%; margin: auto;">
								<br><br> 
								    <textarea id="summernote" name="content"></textarea>
								<!-- 	<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/> -->
							</div>
						</form>
					</div>	         
                         
                       
                         
                    <%--  	 <form action="${pageContext.request.contextPath }/writePro" method="post" > 
                     		 <div class="card-header py-3">
                         		<div class="row"> 
                          		<input type="hidden" name="admin_id" value=" ${admin.admin_id}" />
                          		 <h6 class="m-0 font-weight-bold text-primary">공지사항 글쓰기</h6>
                           		 <button type="submit" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="등록">등록</button>
                            	</div>
                         <label>title</label><input type="text">
                           	  </div>
                 
                        	<div class="card shadow mb-4" id="summernote"></div>
                      </form>	 --%>
                	
                
                
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
	
	<!-- include libraries(jQuery, bootstrap) -->
	<!--jquery중복안됨  -->
<!--   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- include summernote css/js-->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	
	$(document).ready(function() {
		  $('#summernote').summernote({
	 	    	placeholder: '게시글을 작성해주세요.',
		        minHeight: 370,
		        maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR',
		        toolbar: [
	              ["style", ["style"]],
	              ["font", ["bold", "underline", "clear"]],
	              ["fontname", ["fontname"]],
	              ["para", ["ul", "ol", "paragraph"]],
	              ["table", ["table"]],
	              ["insert", ["link", "picture", "video"]],
	              ["view", ["fullscreen", "codeview"]],
	              ['highlight', ['highlight']]
	            ],
	            
	            callbacks : {
	        		onImageUpload : function(files, editor, welEditable) {
	        			debugger;
	        			for (var i = 0; i < files.length; i++) {
	        				sendFile(files[i], this);
	        			}
	        		}
	        	}
	            
		  });
	});

	function sendFile(file, editor) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : 'summerimages',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$(editor).summernote('insertImage', url, function($image) {
					$image.css('width', "25%");
				});
			}
		});
	}

</script>

</body>

</html>


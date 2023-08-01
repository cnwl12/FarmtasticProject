
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
	            /*
	            callbacks : {
	        		onImageUpload : function(files, editor, welEditable) {     
	        			for (var i = 0; i < files.length; i++) {
	        				sendFile(files[i], this);
	        			}
	        		}
	        	}
		  	*/
		  });
	});

	function sendFile(file, editor) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '${pageContext.request.contextPath }/resources/summerimages',
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

<!-- 
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            codeviewFilter: false, // 코드 보기 필터 비활성화
            codeviewIframeFilter: false, // 코드 보기 iframe 필터 비활성화
			
            height: 500, // 에디터 높이
            minHeight: null, // 최소 높이
            maxHeight: null, // 최대 높이
            focus: true, // 에디터 로딩 후 포커스 설정
            lang: 'ko-KR', // 언어 설정 (한국어)

            toolbar: [
                ['style', ['style']], // 글자 스타일 설정 옵션
                ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
                ['font', ['bold','italic', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
                ['color', ['color']], // 글자 색상 설정 옵션
                ['table', ['table']], // 테이블 삽입 옵션
                ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
                ['height', ['height']], // 에디터 높이 조절 옵션
                ['insert', ['picture', 'link', 'video']], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
                ['view', ['codeview', 'fullscreen', 'help']], // 코드 보기, 전체 화면, 도움말 옵션
                
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'], 
            fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New',  '맑은 고딕', '굴림', '돋움'],

            fontSizes: [
                '8', '9', '10', '11', '12', '14', '16', '18',
                '20', '22', '24', '28', '30', '36', '50', '72',
            ], // 글꼴 크기 옵션

            styleTags: [
                'p',  // 일반 문단 스타일 옵션
                {
                    title: 'Blockquote',
                    tag: 'blockquote',
                    className: 'blockquote',
                    value: 'blockquote',
                },  // 인용구 스타일 옵션
                'pre',  // 코드 단락 스타일 옵션
                {
                    title: 'code_light',
                    tag: 'pre',
                    className: 'code_light',
                    value: 'pre',
                },  // 밝은 코드 스타일 옵션
                {
                    title: 'code_dark',
                    tag: 'pre',
                    className: 'code_dark',
                    value: 'pre',
                },  // 어두운 코드 스타일 옵션
                'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // 제목 스타일 옵션
            ],

            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
                    // 파일 업로드 (다중 업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                        var fileName = files[i].name

                        // 이미지 alt 속성 삽일을 위한 설정
                        var caption = prompt('이미지 설명 :', fileName)
                        if (caption == '') {
                            caption = '이미지'
                        }
                        uploadSummernoteImageFile(files[i], this, caption)
                    }
                },
           },
        })
    });
    /* 
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
     */
    // 이미지 업로드 함수 ajax 활용
    function uploadSummernoteImageFile(file, el, caption) {
        data = new FormData()
        data.append('file', file)
        $.ajax({
            data: data,
            type: 'POST',
            url: 'uploadSummernoteImageFile',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (data) {
                $(el).summernote(
                    'editor.insertImage',
                    data.url,
                    function ($image) {
                        $image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
                    }
                )},
        })
    };
    	function uploadSummernoteImageFile(file, editor) {
		var data = new FormData();
		data.append("file", file);
		
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	            //항상 업로드된 파일의 url이 있어야 한다.
            	// @param {String} url
            	// @param {String|Function} filename - optional
            	$('#summernote').summernote('insertImage', url, filename);
            	          
            	                alert("Success");
			 }
			,error:function(request,status,error, data){
            	            alert("Error");
         	}
		});
	
	}
	$(function() { 
		$("#commentForm").validate();
		$.extend( $.validator.messages, { 
			required: "필수항목입니다."
		} ); 
	});
</script>
 -->
</body>

</html>


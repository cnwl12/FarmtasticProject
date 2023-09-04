<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>member/questionAdmin</title>


	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/npay_seller.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/uio_calendar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/grid.css">
	
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerquestion.css">

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
						
	<!-- 사이드바 줄어든거 되돌리기 -->
	<style type="text/css">
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
	</style>
	<style>
	.space_h {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
}

.text_info {
    display: flex;
    align-items: baseline;
}

.textCount, .textTotal {
    margin-right: 10px;
}
	
	.uio_grid table td {
	white-space: nowrap;
	word-break: break-all
	}
	
	</style>
	<style>
	    .custom-th {
    padding-top: 8px;
    padding-bottom: 8px;
    vertical-align: middle; /* 글자를 수직 가운데 정렬합니다. */
  }
	</style>

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

                <!-- 페이지 컨텐츠 시작 -->
                <div class="container-fluid">

                    <!-- 페이지 상단 시작 -->
<!--                     <h1 class="h3 mb-2 text-gray-800">문의관리</h1> -->
<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
<!--                         For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p> -->
                    <!-- 페이지 상단 끝 -->


					<!-- 고객문의관리 시작 -->
						<div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">고객문의</h6>
	                        </div>
							<div class="card-body">
								<div class="table-responsive">
									<form id="searchForm" name="searchForm">
										<table class="custom-table" id="custom-none">
											<caption>고객문의</caption>
											<colgroup>
												<col width="16%">
											    <col width="12%">
											    <col width="12%">
											    <col width="15%">
											    <col width="15%">
											    <col width="15%">
											    <col width="15%">
											</colgroup>

										</table>
									</form>
								</div>
				
								<div class="table-responsive" style="height: 378px;">
									<div class="_qna_list_container scrl uio_grid"
										style="width: 100%; height: 377px;">
										<div class="_flexible_area flexible_area" style="display: block;">
											<div style="height: 35px;">
												<table class="table table-bordered">
												  <colgroup>
												    <col style="width: 150px;">
												    <col style="width: 120px;">
												    <col style="width: 100px;">
												    <col style="width: 500px;">
												    <col style="width: 400px;">
												    <col style="width: 150px;">
												    <col style="width: 150px;">
												  </colgroup>
												  <tbody>
												    <tr>
												<th class="custom-th">접수일</th>
												  <th class="custom-th">처리일</th>
												  <th class="custom-th">회원 번호</th>
												  <th class="custom-th">질문</th>
												  <th class="custom-th">답변</th>
												    </tr>
												  </tbody>
												</table>

												<div class="_resize_handle_container resize_handle_container"></div>
											</div>
										</div>
									</div>
								</div>
				
								<div class="box_column2">
									<div class="ct_box">
										<div class="hd_wrap">
										<input type="hidden" id="admin_id" value="${sessionScope.admin_id}">
											<h3 class="hd3">
												고객문의 내용 보기
											</h3>
										</div>
										<div class="tbl_type">
				
											<table>
												<caption>고객문의 내용 보기</caption>
												<colgroup>
													<col width="25%">
													<col width="25%">
													<col width="25%">
													<col width="25%">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">접수일</th>
														<td id="two_board_day" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
													<th scope="row">처리일</th>
														<td id="two_board_repDay" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
													<th scope="row">질문자</th>
														<td id="member_num" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
														<th scope="row">문의내용:${query }</th>
														<td id="two_board_content" colspan="3" class="line_h18" style="height: 100px;">&nbsp;</td>
														
													</tr>
													<tr>
														<th scope="row">답변</th>
														<td id="two_board_reply" colspan="3" class="line_h18" style="height: 100px;">&nbsp;</td>
														
													</tr>
												</tbody>
											</table>
										</div>
									</div>
				
									<div class="ct_box fr">
										<div class="hd_wrap">
											<h3 class="hd3 fl">판매자 답변 처리</h3>
											
										</div>
										<div class="tbl_type">
											<form id="answerForm" method="POST">
											  <input type="hidden" id="admin_id" value="${sessionScope.admin_id}">
											  <input type="hidden" id="two_board_num" name="two_board_num">
											  
											  <table>
											    <caption>판매자 답변 처리</caption>
											    <colgroup>
											      <col width="25%">
											      <col>
											    </colgroup>
											    <tbody>
												  <tr>
												    <th scope="row">답변내용</th>
												    <td>
												    	<div class="form-group col-12" >
													      <textarea cols="30" rows="5" id="two_board_reply_td"
													                name="two_board_reply" class="ta scrl"
													                style="width: 100%; height: 250px" onkeyup="updateCharCount()" maxlength="200"></textarea>
													      <div class="space_h">
													         <div class="text_info">
														        <p class="textCount" id="_char_count_span">0자</p>
														        <p class="textTotal">/200자</p>
														    </div>
															<button type="button" class="btn_d" onclick="sendFormData()"><span>답변하기</span></button>
													      </div>
												      </div>
												    </td>
												  </tr>
												</tbody>
											  </table>
											</form>


										</div>
									</div>
								</div>
				
								<script type="text/javascript">
									var toDate = "2023-07-20";
									var fromDate = "2023-04-20";
									var treatmentStatus = false;
									var productUrl = "http://sell.smartstore.naver.com/p";
									var wtfProductUrl = "https://sell.smartstore.naver.com/#/products";
									var orderSellerAdminUrl = "https://sell.smartstore.naver.com/o";
									var viewInquiryId = "0";
									var templates = {};
								</script>
				
							</div>
						</div>
					<!-- 고객문의관리 끝 -->

			</div>
				<!-- 페이지 컨텐츠 끝 -->
				
		</div>
			<!-- 메인 컨텐츠 끝 -->	
	</div>
      <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
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
    
    <script>
	function getDetail() {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/getAdminDetails",  // 이 URL은 실제 서버의 API 엔드포인트에 따라 변경해야 합니다.
	        type: "GET",
	        dataType: "json",
	        success: function(data) {
	            var tbody = $(".table-responsive table tbody");

	            data.forEach(function(twoBoard) {
	                var row = $("<tr class='data-row'></tr>");
	                row.append($("<td></td>").text(twoBoard.two_board_day));
	                row.append($("<td></td>").text(twoBoard.two_board_repDay));
	                row.append($("<td></td>").text(twoBoard.member_num));
	                row.append($("<td></td>").text(twoBoard.two_board_content));
	                row.append($("<td></td>").text(twoBoard.two_board_reply));
	                
	                row.attr("data-two-board-content", twoBoard.two_board_content);
	                row.attr("data-two-board-num", twoBoard.two_board_num);
	                row.attr("data-two-board-reply", twoBoard.two_board_reply);

	                tbody.append(row);
	            });

	            // 새로 생성된 행에 클릭 이벤트 핸들러 추가
	            $(".data-row").on("click", function () {
	              $(".data-row").removeClass("selected");
	              $(this).addClass("selected");
	              var two_board_day = $(this).find("td:eq(0)").text();
	              var two_board_repDay = $(this).find("td:eq(1)").text();
	              var member_num = $(this).find("td:eq(2)").text();
	              var two_board_content = $(this).data("two-board-content");
	              var two_board_num = $(this).data("two-board-num");
	              var two_board_reply = $(this).data("two-board-reply");

	             $('#two_board_day').html(two_board_day || '&nbsp;');
	             $('#two_board_repDay').html(two_board_repDay || '&nbsp;');
	             $('#member_num').html(member_num || '&nbsp;');
	             $('#two_board_content').html(two_board_content || '&nbsp;');
	             $('#two_board_num').val(two_board_num);
	             $('#two_board_reply').html(two_board_reply || '&nbsp;');
	           });
	        },
	        error: function(error) {
	            console.error('Error getting data:', error);
	        }
	    });
	}

	// 페이지 로딩 후 getDetail 함수 호출
	$(document).ready(function() {
	    getDetail();
	});

	

	document.getElementById("processComment").addEventListener("click", sendFormData);

function sendFormData() {
    const answerForm = document.getElementById("answerForm");
    const formData = new FormData(answerForm);

    // action 변수를 "update"로 설정
    const action = "update";
    formData.append("action", action);
    
    // 현재 선택된 행에서 memberNum 값 가져오기
    var selectedRow = $(".data-row.selected");
    var memberNum = selectedRow.find("td:eq(2)").text();
    
    formData.append("member_num", memberNum);
    
    $.ajax({
        url: "${pageContext.request.contextPath}/updateAdminReply",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            // 업데이트 성공시 처리
            getDetail();
        },
        error: function (error) {
            console.error("Error sending form data:", error);
        }
    });
}

// 선택한 행의 데이터를 answerForm에 설정하는 함수
function setAnswerFormData(selectedRow) {
  const twoBoardNum = selectedRow.getAttribute("data-two-board-num");

  document.getElementById("two_board_num").value = twoBoardNum;
}

</script>

<script>
function updateCharCount() {
	  var textarea = document.getElementById('two_board_reply_td');
	  var charCountSpan = document.getElementById('_char_count_span');
	  if (textarea && charCountSpan) {
	    var charCount = textarea.value.length;
	    charCountSpan.innerHTML = charCount + '자';
	  } else {
	    console.error('Cannot find textarea element with id "two_board_reply" or charCountSpan element.');
	  }
	}

	window.onload = function() {
	  var textarea = document.getElementById('two_board_reply_td');
	  if(textarea) {
	    textarea.addEventListener("keyup", updateCharCount);
	  } else {
	    console.error('Cannot find textarea element with id "two_board_reply" to attach event listener.');
	  }
	};

</script>






</body>

</html>
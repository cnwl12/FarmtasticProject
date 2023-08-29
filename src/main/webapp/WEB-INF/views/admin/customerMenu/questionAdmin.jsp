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

    <title>seller/questionAdmin</title>


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
										<input type="submit"
											style="position: absolute; left: -5000px; top: -5000px"
											value="검색">
										<table class="custom-table">
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

											<tbody>
												<tr>
													<td>
													  <select id="sel_choice0" name="sequence" style="width: 120px" >
													    <option value="desc">최근날짜순</option>
													    <option value="asc">오래된순</option>
													  </select>
													</td>


													<th scope="row" class="vline_m"><label for="sel_choice">처리상태</label></th>
													<td><select id="sel_choice" name="treatmentStatus"
														style="width: 85px">
															<option value="all">전체</option>
															<option value="답변완료">답변완료</option>
															<option value="미답변">미답변</option>
													</select></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
				
								<div class="btn_wrap" style="margin-top: 20px">
									<button type="button" id="search-btn" onclick="searchFormSubmit(event)" class="btn">검색</button>
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
												  <th class="custom-th">처리상태</th>
												  <th class="custom-th">문의제목</th>
												  <th class="custom-th">질문자</th>
												  <th class="custom-th">처리일시</th>
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
										<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
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
														<td id="one_board_day" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
													<th scope="row">처리일</th>
														<td id="one_board_repDay" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
													<th scope="row">질문자</th>
														<td id="seller_name" colspan="3" class="line_h18">&nbsp;</td>
													</tr>
													<tr>
														<th scope="row">문의내용:${query }</th>
														<td id="one_board_content" colspan="3" class="line_h18" style="height: 100px;">&nbsp;</td>
														
													</tr>
													<tr>
														<th scope="row">답변</th>
														<td id="one_board_reply" colspan="3" class="line_h18" style="height: 100px;">&nbsp;</td>
														
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
											<form id="answerForm" action="updateReply" method="POST">
											  <input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
											  <input type="hidden" id="one_board_num" name="one_board_num">
											  
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
													      <textarea cols="30" rows="5" id="one_board_reply_td"
													                name="one_board_reply" class="ta scrl"
													                style="width: 100%; height: 250px" onkeyup="updateCharCount()" maxlength="200"></textarea>
													      <div class="space_h">
													         <div class="text_info">
														        <p class="textCount" id="_char_count_span">0자</p>
														        <p class="textTotal">/200자</p>
														    </div>
														    <button type="submit" class="btn_d"><span>답변하기</span></button>
													        <a href="#" style="display: none;" onclick="sendFormData(event, 'update')" id="editComment" class="btn_d"><span>답변수정</span></a>
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
function sortTable() {
	  var table, tbody, rows, sortOrder;
	  table = document.getElementById("date-table"); // id를 사용하여 테이블 선택
	  tbody = table.tBodies[0]; // 테이블 본문 선택
	  sortOrder = document.getElementById("sel_choice0").value; // 선택된 정렬 순서를 가져옴

	  // 행만 선택
	  rows = tbody.querySelectorAll("tr.data-row");

	  // 선택된 정렬 순서에 따라 행을 정렬합니다.
	  if (sortOrder === 'desc') {
	    rows = Array.from(rows).sort(compareRows).reverse();
	  } else {
	    rows = Array.from(rows).sort(compareRows);
	  }

	  // 정렬된 행을 테이블에 추가합니다.
	  for (const row of rows) {
	    tbody.appendChild(row);
	  }
	}

	function compareRows(a, b) {
	  var aValue = parseDate(a.children[0].innerText);
	  var bValue = parseDate(b.children[0].innerText);

	  return aValue < bValue ? -1 : aValue > bValue ? 1 : 0;
	}

	function parseDate(dateString) {
	  var parts = dateString.split("-");
	  return new Date(parts[0], parts[1] - 1, parts[2]);
	}



</script>
<script>
function updateCharCount() {
	  var textarea = document.getElementById('one_board_reply_td');
	  var charCountSpan = document.getElementById('_char_count_span');
	  if (textarea && charCountSpan) {
	    var charCount = textarea.value.length;
	    charCountSpan.innerHTML = charCount + '자';
	  } else {
	    console.error('Cannot find textarea element with id "one_board_reply" or charCountSpan element.');
	  }
	}

	window.onload = function() {
	  var textarea = document.getElementById('one_board_reply_td');
	  if(textarea) {
	    textarea.addEventListener("keyup", updateCharCount);
	  } else {
	    console.error('Cannot find textarea element with id "one_board_reply" to attach event listener.');
	  }
	};

</script>






</body>

</html>
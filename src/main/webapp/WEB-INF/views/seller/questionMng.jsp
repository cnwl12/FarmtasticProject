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

    <title>seller/questionMng</title>

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

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/npay_seller.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/uio_calendar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/grid.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
						
	<!-- 사이드바 줄어든거 되돌리기 -->
	<style type="text/css">
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
	</style>
	<style>
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
		<jsp:include page="./inc/sidemenu.jsp"></jsp:include>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 컨텐츠 시작 -->
            <div id="content2">

                 <jsp:include page="./inc/top.jsp"></jsp:include>

                <!-- 페이지 컨텐츠 시작 -->
                <div class="container-fluid">

                    <!-- 페이지 상단 시작 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">문의관리</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
                        </a>
                    </div>
                    <!-- 페이지 상단 끝 -->


					<!-- 고객문의관리 시작 -->
						<div id="wrap">
							<div id="container">
								<div id="content2">
									<div class="hd2_wrap">
										<h2 class="hd2 h_sell8 fl">
											<span class="blind">고객문의 관리</span>
										</h2>
									</div>
					
									<div class="tbl_type">
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
														<th scope="row" class="vline_m"><label for="sel_choice2">문의유형</label></th>
														<td><select id="sel_choice2" name="inquiryType"
															style="width: 85px">
																<option value="all">전체</option>
																<option value="상품">상품</option>
																<option value="배송">배송</option>
																<option value="환불">환불</option>
																<option value="기타">기타</option>
														</select></td>
														<th scope="row" class="vline_m"><label for="sel_choice3">상품명</label></th>
														<td>
														    <select id="sel_choice3" name="item_name" style="width: 85px">
															    <option value="all">전체</option>
															    <c:forEach var="itemName" items="${itemNames}">
															        <option value="${itemName}">${itemName}</option>
															    </c:forEach>
															</select>
														</td>

													</tr>
												</tbody>
											</table>
											<!--  어디에쓰는건지 몰라서 주석 : 서영 -->
<!-- 											<input type="hidden" name="orderBy" value=""> <input -->
<!-- 												type="hidden" name="orderDir" value=""> -->
										</form>
									</div>
					
									<div class="btn_wrap" style="margin-top: 20px">
										<button type="button" id="search-btn" onclick="searchFormSubmit(event)">검색</button>
									</div>
					
									<div style="height: 378px;">
										<div class="_qna_list_container scrl uio_grid"
											style="width: 100%; height: 377px;">
											<div class="_flexible_area flexible_area" style="display: block;">
												<div class="_header header2" style="height: 35px;">
													<table>
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
													  <th class="custom-th">문의유형</th>
													  <th class="custom-th">문의제목</th>
													  <th class="custom-th">상품명</th>
													  <th class="custom-th">질문자</th>
													  <th class="custom-th">처리일시</th>
													    </tr>
													  </tbody>
													</table>

													<div class="_resize_handle_container resize_handle_container"></div>
												</div>
												<div class="_body body" style="height: 350px;  overflow: hidden;">
													<div class="_table_container" style="height: 350px; overflow-y: scroll;">
													<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
														<table id="date-table">
															<colgroup>
															<col data-columnname="regDate" style="width: 150px;">
															<col data-columnname="answerYn" style="width: 120px;">
															<col data-columnname="inquiryCategory" style="width: 100px;">
															<col data-columnname="title" style="width: 500px;">
															<col data-columnname="productName" style="width: 400px;">
															<col data-columnname="inquiryMemberName" style="width: 150px;">
															<col data-columnname="treatmentDate" style="width: 150px;">
															</colgroup>
															<tbody>
															  <c:forEach var="row" items="${oneboard}">
															    <tr class="data-row" data-one-board-content="${row.one_board_content}" data-one-board-num="${row.one_board_num}" data-one-board-reply="${row.one_board_reply}" >
															      <td>${row.one_board_day}</td>
															      <td>${row.one_board_repYn}</td>
															      <td>${row.one_board_type}</td>
															      <td class="one_board_title">${row.one_board_title}</td>
															      <td>${row.item_name}</td>
															      <td>${row.member_name}</td>
															      <td>${row.one_board_repDay}</td>
															    </tr>
															  </c:forEach>
															</tbody>

														</table>
													</div>
													<div class="_selection_layer selection_layer"></div>
												</div>
											</div>
											<div class="left_line"></div>
											<div class="right_line"></div>
											<textarea class="_clipboard clipboard"></textarea>
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
															<th scope="row">상품명</th>
															<td id="item_name">&nbsp;</td>
															<th scope="row">문의유형</th>
															<td id="one_board_type">&nbsp;</td>
														</tr>
														<tr>
															<th scope="row">제목</th>
															<td id="one_board_title" colspan="3" class="line_h18">&nbsp;</td>
														</tr>
														<tr>
															<th scope="row">문의내용</th>
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
												          <textarea cols="30" rows="5" id="one_board_reply"
												            name="one_board_reply" onfocus="this.className='ta scrl ta_on';"
												            onblur="this.className='ta scrl';" class="ta scrl"
												            style="width: 100%; height: 250px"></textarea>
												          <div class="space_h">
												            <span class="num_meta2 fr"><em><span
												              class="blind">입력된 글자수 : </span><span
												              id="_char_count_span">0</span></em>/<strong><span
												              class="blind">최대 입력 글자 : </span>1,000</strong></span>
												           <button type="submit" class="btn_d"><span>답변하기</span></button>
												
												            <a href="#" style="display: none;" onclick="sendFormData(event, 'update')" id="editComment" class="btn_d"><span>답변수정</span></a>
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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

	<!-- 서영: 1대1문의를 위한 js -->
	<script>
	$(document).ready(function () {
		  // 기존 코드
		  var seller_num = $("#seller_num").val();

		  if (seller_num) {
		    getDetail(seller_num);
		  } else {
		    console.error("seller_num is undefined");
		  }

		  // 이벤트 핸들러 추가
		  $(".data-row").on("click", function () {
		    var one_board_day = $(this).find("td:eq(0)").text();
		    var one_board_repDay = $(this).find("td:eq(1)").text();
		    var one_board_type = $(this).find("td:eq(2)").text();
		    var one_board_title = $(this).find("td.one_board_title").text();
		    var item_name = $(this).find("td:eq(4)").text();
		    var member_name = $(this).find("td:eq(5)").text();
		    var one_board_repDay = $(this).find("td:eq(6)").text();
		    var one_board_content = $(this).data("one-board-content");
		    var one_board_num = $(this).data("one-board-num");
		    var one_board_reply = $(this).data("one-board-reply");

		 // 이 정보를 사용하여 필요한 곳에 데이터를 채웁니다.
		    $('#one_board_day').html(one_board_day || '&nbsp;');
		    $('#one_board_repDay').html(one_board_repDay || '&nbsp;');
		    $('#seller_name').html(member_name || '&nbsp;');
		    $('#item_name').html(item_name || '&nbsp;');
		    $('#one_board_type').html(one_board_type || '&nbsp;');
		    $('#one_board_title').html(one_board_title || '&nbsp;');
		    $('#one_board_content').html(one_board_content || '&nbsp;');
		    $('#one_board_num').val(one_board_num);
		    $('#one_board_reply').html(one_board_reply || '&nbsp;');
		  });
		});


	function getDetail(seller_num) {
	  $.ajax({
	    url: "/getDetails",
	    type: "GET",
	    data: {seller_num: seller_num},
	    dataType: "json",
	    success: function(response){
	      // Assign fetched data to the elements
	      $('#one_board_day').html(response.one_board_day || '&nbsp;');
	      $('#one_board_repDay').html(response.one_board_repDay || '&nbsp;');
	      $('#seller_name').html(response.seller_name || '&nbsp;');
	      $('#item_name').html(response.item_name || '&nbsp;');
	      $('#one_board_type').html(response.one_board_type || '&nbsp;');
	      $('#one_board_title').html(response.one_board_title || '&nbsp;');
	      $('#one_board_content').html(response.one_board_content || '&nbsp;');
	      $('#one_board_num').html(response.one_board_num || '&nbsp;');
	      $('#one_board_reply').html(response.one_board_reply || '&nbsp;');
	    },
	    error: function(error){
	      console.error("Error fetching detail data:", error);
	    }
	  });
	}
	
// 	function handleClickOneBoardTitle(event) {
// 	    const targetRow = event.target.closest('tr');
// 	    const one_board_num = targetRow.getAttribute('data-one-board-num'); // 속성을 변경했습니다.
// 	    const one_board_repYn = targetRow.querySelector('td:nth-child(2)').textContent;

// 	    if (one_board_num) {
// 	        const currentForm = document.getElementById('answerForm');

// 	        const regCommentButton = document.getElementById('regComment');
// 	        const editCommentButton = document.getElementById('editComment');

// 	        if (one_board_repYn === '미답변') {
// 	            regCommentButton.style.display = 'inline';
// 	            editCommentButton.style.display = 'none';
// 	        } else if (one_board_repYn === '답변완료') {
// 	            regCommentButton.style.display = 'none';
// 	            editCommentButton.style.display = 'inline';
// 	        }

// 	        const existingHiddenInput = document.querySelector('input[name="one_board_num"]');
// 	    }
// 	}

	document.getElementById("processComment").addEventListener("click", sendFormData);

function sendFormData() {
    const answerForm = document.getElementById("answerForm");
    const formData = new FormData(answerForm);

    // action 변수를 "update"로 설정
    const action = "update";
    formData.append("action", action);
    for (const [key, value] of formData.entries()) {
        console.log(key, value);
    }

    $.ajax({
        url: "/updateReply",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            // 업데이트 성공시 처리
            // getDetail 함수 호출 시 적절한 seller_num 값을 전달해야 합니다.
            getDetail(formData.get("seller_num"));
        },
        error: function (error) {
            console.error("Error sending form data:", error);
        }
    });
}

// 선택한 행의 데이터를 answerForm에 설정하는 함수
function setAnswerFormData(selectedRow) {
  const oneBoardNum = selectedRow.getAttribute("data-one-board-num");

  document.getElementById("one_board_num").value = oneBoardNum;
}

$(document).ready(function () {
	  searchFormSubmit();
	  $('#search-btn').on('click', searchFormSubmit); // 검색 버튼의 ID가 'search-btn'인 경우
	});


	  

function searchFormSubmit(event) {
	  if (event) {
	    event.preventDefault();
	  }

	  // 폼 데이터를 가져옵니다.
	  var sequence = document.querySelector("#sel_choice0").value;
	  var treatmentStatus = document.querySelector("#sel_choice").value;
	  var inquiryType = document.querySelector("#sel_choice2").value;
	  var item_name = document.querySelector("#sel_choice3").value;

	  // 콘솔에 결과를 출력합니다.
	  console.log("정렬순서", sequence);
	  console.log("처리상태:", treatmentStatus);
	  console.log("문의유형:", inquiryType);
	  console.log("상품명", item_name);

	  // 실제 데이터 처리 및 필터링 코드를 작성합니다.
	  $("tbody tr.data-row").each(function () {
	    var $row = $(this);
	    var one_board_day = $row.find("td").eq(0).text();
	    var one_board_repYn = $row.find("td").eq(1).text();

	    // 필요한 경우 다른 칼럼에 대한 변수를 추가합니다.
	    var one_board_inquiryType = $row.find("td").eq(2).text(); // 아래 추가된 if 조건에 맞게 수정
	    var one_board_item_name = $row.find("td").eq(4).text(); 

	    var match_sequence = sequence === one_board_day || sequence === "asc" || sequence === "desc";
	    var match_treatmentStatus = treatmentStatus === one_board_repYn || treatmentStatus === "all";
	    var match_inquiryType = inquiryType === one_board_inquiryType || inquiryType === "all";
	    var match_item_name = item_name === one_board_item_name || item_name === "all";
	    // 필요한 경우 다른 조건을 추가합니다.

	    if (
	      match_treatmentStatus &&
	      match_inquiryType &&
	      match_item_name &&
	      match_sequence
	      // 필요한 경우 다른 조건을 추가합니다.
	    ) {
	      $row.show();
	    } else {
	      $row.hide();
	    }
	  });

	  // 날짜 순 정렬 함수 호출
	  sortTable();
	}

//실제 데이터 처리 및 필터링 코드를 작성합니다.


</script>

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



</body>

</html>
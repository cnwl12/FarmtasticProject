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

    <title>seller/reviewMng</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">
    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
		
<!-- 사이드바 줄어든거 되돌리기 -->
<style type="text/css">
html {font-size: 1rem !important;
}
body {font-size: 1rem !important;
}
	 
.seller-grid-area {
    width: 100%;
    height: 800px;
}

.review-img {
  width: 80px; 
  height: 80px;
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
            <div id="content">

                 <jsp:include page="./inc/top.jsp"></jsp:include>

                <!-- 페이지 컨텐츠 시작 -->
                <div class="container-fluid">

                    <!-- 페이지 상단 시작 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">리뷰관리</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
                        </a>
                    </div>
                    <!-- 페이지 상단 끝 -->                     

					<!-- 검색바(작성일, 타입, 카테고리, 조건, 상세검색) 시작 -->
					<div class="seller-sub-content">
					<div id="search" >
  						<form name="searchForm" onsubmit="event.preventDefault(); applyFilters()" novalidate
							class="ng-pristine ng-valid-date-time-input ng-invalid ng-invalid-required ng-valid-pattern ng-valid-max-size-by-split">
							<div class="panel panel-seller">
								<div class="panel-body">
									<div class="seller-search-section">
										<ul class="seller-list-border">
											<li><label class="control-label">리뷰작성일</label>
													<div class="form-inline narrow-area">
													<label for="start-date"></label> <input type="date" id="start-date" name="startDate" class="form-control mx-2">
													<label for="end-date">~</label> <input type="date" id="end-date" name="endDate" class="form-control mx-2">
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(7)">1주</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(30)">1개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(90)">3개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(180)">6개월</button>
													<button type="button" class="btn btn-primary btn-sm mx-2" onclick="setDateRange(365)">1년</button>
													<button class="btn btn-primary" type="button" onclick="reset()">초기화</button>
												</div>
												</li>

												<li>
  												<label class="control-label">구매자평점</label>
  												<div class="input-content">
    												<div class="form-inline">
      													<div class="pc-inline-block">
        													<div class="seller-input form-group">
          														<select id="reviewScoresSelect" class="form-control">
            														<option value="">전체</option>
            														<option value="1">1점</option>
            														<option value="2">2점</option>
            														<option value="3">3점</option>
            														<option value="4">4점</option>
            														<option value="5">5점</option>
          														</select>
        													</div>
      													</div>
    												</div>
  												</div>
												</li>
											<!---->
											<!---->
											<!---->
												<li>
  												<label class="control-label">상세검색</label>
  												<div class="input-content">
    												<div class="form-inline has-error-msg">
      													<div class="form-group">
        													<select id="searchKeywordTypeSelect" class="form-control">
          														<option value="PRODUCT_NAME" selected>상품명</option>
          														<option value="AUTHOR_NAME">작성자명</option>
        													</select>
      													</div>
      													<div class="form-group" id="searchKeywordInputWrapper">
        													<div class="seller-input-wrap">
          														<input type="text" class="form-control" id="searchKeywordInput" placeholder="검색어를 입력해주세요.">
        													</div>
      													</div>
    												</div>
  												</div>
												</li>
											</ul>
										</div>
									</div>
								<!--  -->								
								<!--  -->
								<div class="panel-footer">
									<div class="seller-btn-area btn-group-lg">
										<button class="btn btn-primary" type="button" onclick="applyFilters()">검색</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색바(작성일, 타입, 카테고리, 조건, 상세검색) 끝 -->
					
					<!-- 리뷰 목록 시작 -->
					<div class="list">
					<div class="panel panel-seller">
					<div class="panel-heading">
  						<div class="pc-pull-left">
    						<h3 class="panel-title">리뷰목록</h3>
    						<button class="btn btn-primary" id="del-review-button">삭제</button>
  						</div>
					</div>
					
					<div class="panel-body">
					<p class="sub-text text-primary mg-top-reset mg-bottom">욕설, 허위, 비방, 음란물 등 상품과 관련 없는 내용의 부적절한 리뷰는 '리뷰 신고' 기능을 이용해주세요 서비스 규정에 맞춰 관리자 검수하여 삭제 조치될 수 있습니다.</p>
        			 <div class="review-list">
					<input type="hidden" name="seller_num" value="${sessionScope.seller_num}">
					<input type="hidden" id="item_name"name="item_name" value="${item.item_name}">
					<input type="hidden" id="member_num"name="member_num" value="${review.member_num}">
					<input type="hidden" id="review_num"name="review_num" value="${review.review_num}">
    				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        			<thead>
            			<tr>
            				<th>리뷰</th>
            				<th>상품명</th>
            				<th>별점</th>
            				<th>작성자</th>
            				<th>제목</th>
           					<th>내용</th>
           					<th>이미지</th>
 							<th>작성일</th>
           				</tr>
        			</thead>
        			<tbody id="review">
        			</tbody>
    				</table>
					</div>
    			</div>
    		</div>
   		 </div>
   	 </div>
					<!-- 리뷰 목록 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
			</div>
			<!-- 메인 컨텐츠 끝 -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
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
<%--     <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script> --%>

    <!-- Page level custom scripts -->
<%--     <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


<script>
    function setDateRange(days) {
        const now = new Date();
        const startDateInput = document.getElementById('start-date');
        const endDateInput = document.getElementById('end-date');
        const startDate = new Date(now - days * 24 * 60 * 60 * 1000);
        startDateInput.valueAsDate = startDate;
        endDateInput.valueAsDate = now;
    }
    
    function applyFilters() {
    	  const startDate = document.getElementById("start-date").value;
    	  const endDate = document.getElementById("end-date").value;
    	  const reviewScore = document.getElementById("reviewScoresSelect").value;
    	  const keywordType = document.getElementById("searchKeywordTypeSelect").value;
    	  const keyword = document.getElementById("searchKeywordInput").value;

    	  const table = $("#dataTable").DataTable();
    	  
    	  $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
    	    const rowDate = moment(data[7], "YYYY-MM-DD");
    	    const rowScore = (data[2] === '★★★★★') ? 5 : data[1].length;
    	    const rowKeyword = keywordType === "PRODUCT_NAME" ? data[1] : data[3];

    	    const isDateInRange =
    	      (!startDate || moment(startDate).isBefore(rowDate) || moment(startDate).isSame(rowDate)) &&
    	      (!endDate || moment(endDate).isSame(rowDate) || moment(endDate).isAfter(rowDate));
    	    const isScoreMatched = !reviewScore || rowScore == reviewScore;
    	    const isKeywordMatched = !keyword || rowKeyword.includes(keyword);

    	    return isDateInRange && isScoreMatched && isKeywordMatched;
    	  });

    	  table.draw();
    	  $.fn.dataTable.ext.search.pop();
    	}

    const resetButton = document.querySelector('button[type="reset"]');
    if (resetButton) {
        resetButton.addEventListener('click', (event) => {
            event.preventDefault();
            document.getElementById('start-date').value = '';
            document.getElementById('end-date').value = '';
            document.getElementById("reviewScoresSelect").value = '';
            document.getElementById("searchKeywordTypeSelect").selectedIndex = 0;
            document.getElementById("searchKeywordInput").value = '';
            setDateRange(30);
            applyFilters();
        });
    }

    setDateRange(30);

</script>

<script>
//작성자 이름 마스킹 처리 함수 
function maskWriterName(name) {
  if (!name || name.length === 0) {
    return '';
  }

  if (name.length > 2) {
    return name[0] + "*".repeat(name.length - 2) + name[name.length - 1];
  } else {
    return name[0] + "*";
  }
}

function getReview(startDate, endDate, selectedReviewScore, keywordTypeIndex, keyword) {
    var seller_num = '<%= request.getSession().getAttribute("seller_num") %>';

    if (seller_num) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getReview",
            data: { seller_num: seller_num },
            dataType: "json",
            success: function(buyreview) {
                var table = $('#dataTable').DataTable();
                table.clear().draw();

                if (buyreview.length === 0) {
                    $("#review").html("<tr><td colspan='6' style='text-align:center;'>리뷰가 없습니다.</td></tr>");
                } else {
                    $.each(buyreview, function(index, seller) {
                    	var maskedName = maskWriterName(seller.member_name);
                        var review_stars = '';
                        for (let i = 1; i <= seller.review_star; i++) {
                            review_stars += '★';
                        }
                        var review_date = moment(seller.review_day).format('YYYY-MM-DD');

                        table.row.add([
                        	'<input type="checkbox" class="review-checkbox" data-review_num="' + seller.review_num + '" data-member_num="' + seller.member_num + '"/>',
                            seller.item_name,
                            review_stars,
                            maskedName,
                            seller.review_title,
                            seller.review_content,
                            seller.review_img ? "<img src='" + seller.review_img + "' class='review-img'>" : "",
                            review_date
                        ]).draw();
                    });
                }
            },
            error: function () {
                alert("리뷰를 가져오는 데 실패하였습니다. 페이지를 새로 고치거나 나중에 다시 시도해 주십시오.");
            }
        });
    } else {
        alert("오류가 발생했습니다.");
    }
}

// 이벤트 리스너 추가
document.getElementById("reviewScoresSelect").addEventListener("change", function() {
    // 필터링 함수 호출
    applyFilters();
});

// 처음 페이지 로드 시 모든 리뷰 가져오기
getReview(); 
</script>
<script type="text/javascript">
$(document).ready(function () {
  var selectedReview;
  var selectedMember;

  // 삭제 버튼 클릭 이벤트
  $(document).on('click', '#del-review-button', function () {
	  var checkedReviews = $('input[type=checkbox][name=review-checkbox]:checked');
    if (checkedReviews.length === 1) {
      // 첫 번째 체크된 리뷰 요소에서 data-review_num 값을 가져옵니다.
      selectedReview = checkedReviews.first().data("review_num");
      selectedMember = checkedReviews.first().data("member_num");
      console.log('Selected review number:', selectedReview);

      deleteReview(selectedReview, selectedMember);
    } else {
      alert('한 개의 리뷰만 선택해 주세요.');
    }
  });

  // 리뷰를 삭제하는 함수
  function deleteReview(selectedReview, selectedMember) {
    $.ajax({
      type: 'POST',
      url: 'deleteReview',
      data: {
        review_num: selectedReview,
        member_num: selectedMember // 쉼표로 구분하세요.
      },
      dataType: 'text',
      success: function (responseText) {
        console.log(responseText);
        if (responseText === 'The review has been successfully deleted.') {
          alert('리뷰가 성공적으로 삭제되었습니다.');
          location.reload(); // 페이지를 새로고침합니다.
        } else {
          alert('리뷰 삭제에 실패했습니다. 다시 시도해 주세요.');
        }
      },
      error: function () {
        alert('리뷰 삭제에 실패했습니다. 다시 시도해 주세요.');
      },
    });
  }
});
</script>
</body>

</html>
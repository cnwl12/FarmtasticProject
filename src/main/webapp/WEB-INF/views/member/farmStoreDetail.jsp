<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	
  	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<style>
 
.fa-star-half-o:before {
    content: "\f130";
    color: #EDBB0E !important;
}

.fa-star-o:before {
	color: #b2b2b2 !important;
}
.star {
    font-size: 24px;
	color: #dddddd; 
    cursor: pointer;
    margin-right: 5px;
	}
.star.selected {
    color: #EDBB0E;
	}		
	
.product__details__tab .product__details__tab__desc h6 {
    font-weight: 700;
    color: #333333;
    margin-bottom: 5px;
	}
	
textarea#review_content {
    border-top: none;
    border-left: none;
    border-right: none;
	}

input#review_title {
	border-top: none;
    border-left: none;
    border-right: none;
	} 	

input#file-upload-button {
    font-size: 14px;
    color: #ffffff;
    font-weight: 800;
    text-transform: uppercase;
    display: inline-block;
    padding: 13px 30px 12px;
    background: #7fad39;
    border: none;
	}		    
}

</style>	
	
<!-- 카트추가 함수 -->
<script type="text/javascript">
function insertCart(){	// 이동변경여부는 추후 작업할것임 (ajax)
	
	var cart_cnt = $("#cart_cnt").val(); // cart_cnt id값의 value값 
	var item_num = $('.item_wrap').data("item_num");
	
	//console.log(item_num);
	
	location.href="insertCart?item_num="+item_num+"&cart_cnt="+cart_cnt;
	
}

</script>
 

</head>

<body>
<jsp:include page="../top.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FarmFarm Market</h2>
                        <div class="breadcrumb__option">
                            <a href="index">Home</a>
                            <a href="index">Vegetables</a>
                            <span>맛있는 채소</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${item.item_mainImg}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/img/product/details/product-details-2.jpg"
                                src="${pageContext.request.contextPath}/resources/img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/img/product/details/product-details-3.jpg"
                                src="${pageContext.request.contextPath}/resources/img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/img/product/details/product-details-5.jpg"
                                src="${pageContext.request.contextPath}/resources/img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/img/product/details/product-details-4.jpg"
                                src="${pageContext.request.contextPath}/resources/img/product/details/thumb-4.jpg" alt="">
                        </div>
                    </div>
                </div>
                							<!-- class 추가 / 임의로 데이터 item_num 생성 / 모델에 담긴 값  -->
                <div class="col-lg-6 col-md-6 item_wrap" data-item_num = "${item.item_num}">
                    <div class="product__details__text">
                        <h3>${item.item_name}</h3>
                        <div class="product__details__rating">
    <c:forEach var="i" begin="1" end="5">
        <c:choose>
            <c:when test="${averageStarRating - i >= 0}">
                <i class="fa fa-star"></i>
            </c:when>
            <c:when test="${averageStarRating - i >= -0.5}">
                <i class="fa fa-star-half"></i>
            </c:when>
            <c:otherwise>
                <i class="fa fa-star-o"></i>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <span>(${reviewCount} reviews)</span>
</div>

                        <div class="product__details__price">${item.item_price}</div>
                       <%--  <p>${item.item_detail}</p> --%>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="cart_cnt">
                                </div>  
                            </div>
                        </div>  
                        <input type="button" onclick="insertCart()" class="primary-btn" value="ADD TO CART">
                        <a href="#" class="heart-icon wishlist-btn" data-member-num="${sessionScope.member_num}" data-item-num="${item.item_num}">
  <span class="${wishlist.contains(item.item_num) ? 'icon_heart_red' : 'icon_heart_alt'}"></span>
</a>


                        
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                        
                        
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(${reviewCount})</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab"
                                    aria-selected="false">1:1 문의 <span>(${fn:length(oneBoardList)})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>${item.item_detail}</p>
                                </div>
                            </div>
                            <!-- 로그인 후 구매내역이 있는지 없는지를 추가로 넣으면 될 듯 -->
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                	<div>
                                	<c:choose>
    								<c:when test="${empty sessionScope.member_num}">
     								 <p>로그인이 필요합니다. 리뷰를 작성하려면 로그인하세요.</p>
    								</c:when>
    								<c:otherwise>
                                    <h6>리뷰 쓰기</h6>
                                    <form action="${pageContext.request.contextPath}/insertReview" method="post" name="insertReview" id="insertReview" enctype="multipart/form-data">
    								<input type="hidden" id="item_num"name="item_num" value="${item.item_num}">
    								<input type="hidden" name="member_num" value="${sessionScope.member_num}">
   									<div class="rating">
  									<span class="star" data-value="1">★</span>
  									<span class="star" data-value="2">★</span>
  									<span class="star" data-value="3">★</span>
 					 				<span class="star" data-value="4">★</span>
  									<span class="star" data-value="5">★</span>
  									<input type="hidden" id="review_star" name="review_star" value="">
									</div>
									<br>
    								<label for="review_title"></label>
    								<input type="text" name="review_title" id="review_title" style="width:300px;height:20px;font-size:16px;" placeholder="제목을 입력해주세요" required> 
 									<label for="file"></label>
        							<input type="file" id="review_img" name="review_image"  style="padding-left: 73px;">
    								<br><br>
    								<label for="review_content"></label>
    								<textarea name="review_content" id="review_content" cols="80" rows="4" style="font-size:16px;" placeholder="내용을 입력해주세요" required></textarea>
    								<br>
    								<button id="write-review-btn" type="submit">리뷰 작성</button>
									</form>
									</c:otherwise>
  									</c:choose>
  									</div>
                                    <br>
                                    <br>
									<h6>리뷰 목록</h6>
									<div class="reviews-list">
    								<table class="table" id="getItemReviews" >
        							<thead>
            						<tr>
                					<th>번호</th>
                					<th>작성자</th>
                					<th>별점</th>
                					<th>제목</th>
                					<th>내용</th>
                					<th>작성일</th>
                					<th>이미지</th>
           							</tr>
        							</thead>
        							<tbody>
            						
        							</tbody>
    								</table>
									</div>
                                </div>
                            </div>

                            <!--  리뷰칸 끝 -->
                            <c:set var="selectedBoardNum" value="${sessionScope.selectedBoardNum}" />
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
			        		<div class="product__details__tab__desc">
			        		<a class="custom-link" href="#" onclick="checkLogin()">문의하기</a>
						        <input type="hidden" id="member_num" value="${sessionScope.member_num}">
						        <input type="hidden" name="item_num" value="${item_num}">
						        <input type="hidden" name="seller_num" value="${seller_num}">
						        <div>
						            <table class="table">
						                <thead>
						                    <tr>
						                        <th>답변상태</th>
						                        <th>문의유형</th>
						                        <th>제목</th>
						                        <th>작성자</th>
						                        <th>작성일</th>
						                    </tr>
						                 </thead>
						                 <tbody id="inquiryList">
						                   <c:set var="inquiryCount" value="0" />
						                    <!-- 여기에 문의 내용이 추가됩니다. -->
						                    <c:forEach var="row" items="${oneBoardList}">
						                   		<c:set var="inquiryCount" value="${inquiryCount + 1}" />
								                    <tr class="boardTitle" onclick="handleRowClick('${row.one_board_private}' == '비공개', ${row.one_board_num}, '${row.one_board_pass}', 'boardPassword${row.one_board_num}');">
								                        <td>${row.one_board_repYn}</td>
								                        <td>${row.one_board_type}</td>
								                        <td>${row.one_board_title}</td>
								                        <td>${row.member_name}</td>
								                        <td>${row.one_board_day}</td>
								                    </tr>
								                    
								                    <c:choose>
													 <c:when test="${row.one_board_private eq '비공개' and sessionScope.member_num eq row.member_num}">
														<tr class="boardContent" id="password_row${row.one_board_num}" style="display:none;">
															<td colspan="5">
																비밀번호: <input type="password" id="boardPassword${row.one_board_num}" />
																<button onclick="checkPassword('${row.one_board_pass}', ${row.one_board_num}, 'boardPassword${row.one_board_num}')">확인</button>
															</td>
														</tr>
														<!-- 비밀번호 확인 후 나타납니다. -->
														<tr class="boardContent" id="question${row.one_board_num}" data-one-board-num="${row.one_board_num}"  style="display:none;">
														<!-- 여기에 공개 글일 때 나오는 질문 파트 -->
															<td colspan="5">
																 <div class="image">
																	<strong>Q:</strong>
																	<c:if test="${row.one_board_file != null && not empty row.one_board_file}">
																		<img src="${row.one_board_file}" />
																	</c:if>
																	<div class="content">
																		${row.one_board_content}
																	</div>
																</div>
															</td>
														</tr>
														<tr class="boardContent" id="answer${row.one_board_num}" data-one-board-num="${row.one_board_num}" style="display:none;">
															<!-- 여기에 공개 글일 때 나오는 답변 파트 -->
															<td colspan="5">
																<div class="content">
																	<strong>A:</strong>
																	<c:if test="${row.one_board_reply != null}">
																		${row.one_board_reply}
																	</c:if>
																</div>
															</td>
														</tr>
													</c:when>
													<c:when test="${row.one_board_private eq '비공개' and sessionScope.member_num ne row.member_num}">
														<tr class="boardContent" id="answer${row.one_board_num}" data-one-board-num="${row.one_board_num}" style="display:none;">
															<td colspan="5">
																비공개된 게시글입니다.
															</td>
														 </tr>
													</c:when>
												<c:otherwise>
													 <tr class="boardContent" id="question${row.one_board_num}" data-one-board-num="${row.one_board_num}"  style="display:none;">
														<td colspan="5">
															<div class="image">
																<strong>Q:</strong>
																<c:if test="${row.one_board_file != null && not empty row.one_board_file}">
																	<img src="${row.one_board_file}" />
																</c:if>
																<div class="content">
																	${row.one_board_content}
																</div>
															</div>
														</td>
													</tr>
													<tr class="boardContent" id="answer${row.one_board_num}" data-one-board-num="${row.one_board_num}" style="display:none;">
														<td colspan="5">
															<div class="content">
																<strong>A:</strong>
																<c:if test="${row.one_board_reply != null}">
																	${row.one_board_reply}
																</c:if>
															</div>
														</td>
													</tr>
												</c:otherwise>
											 </c:choose>
								</c:forEach>

			                 </tbody>
			            	 </table>
			            	 </div>
			        		</div>
                         </div>

			        </div>
			        		</div>
                        </div>
                    </div>
                </div>
        
    </section>
    <!-- Product Details Section End -->



	<!-- 최근 본 상품 나열 페이지 : 일단은 삭제함 -->
    <!-- Related Product Section Begin -->
   <%--  <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text"> 
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
    <!-- Related Product Section End -->

   <!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	
	 <!-- Js Plugins -->
	
	<script>
	function openPopup() {
	  window.open(
	    "oneboard?item_num=" + item_num, 
	    "oneboardpop", 
	    "width=600, height=1000, left=100, top=50, scrollbars=no, resizable=yes"
	  );
	}
	function checkLogin() {
		  // 로그인 여부를 확인하려면 input 태그에서 member_num 값을 가져옵니다.
		  var member_num = document.getElementById("member_num").value;

		  if (member_num == null || member_num == "") {
		    // 로그인되어 있지 않은 경우 login.jsp로 이동합니다.
		    window.location.href = "login";
		  } else {
		    // 로그인된 경우 openPopup 함수를 호출하여 문의하기 창을 엽니다.
		    openPopup();
		  }
		}
	</script>
	
	<script>
	function handleRowClick(isPrivate, oneBoardNum, oneBoardPass, boardPasswordInputId) {
		  var questionElement = document.getElementById("question" + oneBoardNum);
		  var answerElement = document.getElementById("answer" + oneBoardNum);
		  var passwordRowElement = document.getElementById("password_row" + oneBoardNum);
		  
		  // 내용이 열려있는 것이 숨김 처리되는 경우
		  if (
		    (questionElement.style.display !== "none" && isPrivate) ||
		    (!isPrivate && questionElement.style.display !== "none")
		  ) {
		    questionElement.style.display = "none";
		    answerElement.style.display = "none";
		    passwordRowElement.style.display = "none";
		  } else {
		    if (isPrivate) {
		      passwordRowElement.style.display = "";
		    } else {
		      questionElement.style.display = "";
		      answerElement.style.display = "";
		    }
		  }
		}

		function showQuestionAndAnswer(oneBoardNum) {
		  // 질문과 답변 element를 가져옵니다.
		  var questionElement = document.getElementById("question" + oneBoardNum);
		  var answerElement = document.getElementById("answer" + oneBoardNum);

		  // 질문과 답변 element의 display 상태를 전환합니다.
		  questionElement.style.display = questionElement.style.display === "table-row" ? "none" : "table-row";
		  answerElement.style.display = answerElement.style.display === "table-row" ? "none" : "table-row";
		}

	function checkPassword(savedPassword, oneBoardNum, inputPasswordId) {
		  var inputPassword = document.getElementById(inputPasswordId).value;

		  if (savedPassword === inputPassword) {
		    // 비밀번호가 일치할 경우 비밀번호 입력창을 숨기고 질문과 답변을 표시합니다.
		    showQuestionAndAnswerAndHidePasswordInput(oneBoardNum, inputPasswordId);
		  } else {
		    // 일치하지 않는 경우 경고 메시지를 표시합니다.
		    alert("비밀번호가 일치하지 않습니다.");
		  }
		}

		function showQuestionAndAnswerAndHidePasswordInput(oneBoardNum, inputPasswordId) {
		  var questionElement = document.getElementById("question" + oneBoardNum);
		  var answerElement = document.getElementById("answer" + oneBoardNum);
		  var passwordRowElement = document.getElementById("password_row" + oneBoardNum);

		  // 질문과 답변 창을 표시합니다.
		  questionElement.style.display = "table-row";
		  answerElement.style.display = "table-row";

		  // 비밀번호 입력창을 숨깁니다.
		  passwordRowElement.style.display = "none";
		}

		function togglePasswordInput(oneBoardNum) {
		  var passwordRowElement = document.getElementById("password_row" + oneBoardNum);

		  // 비밀번호 입력창의 display 상태를 전환합니다.
		  passwordRowElement.style.display = passwordRowElement.style.display === "table-row" ? "none" : "table-row";
		}



// 	function handleBoardClick(one_board_num) { 
// 	    sessionStorage.setItem('selectedBoardNum', one_board_num); // 선택한 문의의 one_board_num 값을 웹 브라우저의 sessionStorage에 저장
// 	}
</script>


	<script>
	  var item_num = document.querySelector(".item_wrap").dataset.item_num;
	</script>
	
	<script type="text/javascript">
	const stars = document.querySelectorAll(".star");

	stars.forEach((star) => {
	  star.addEventListener("click", function () {
	    const selectedValue = parseInt(this.getAttribute("data-value"));
	    stars.forEach((s) => {
	      if (parseInt(s.getAttribute("data-value")) <= selectedValue) {
	        s.classList.add("selected");
	      } else {
	        s.classList.remove("selected");
	      }
	    });

	    document.getElementById("review_star").value = selectedValue;
	  });
	});
	
	// ----------------------------------------------------------------------
	
	$("#insertReview").submit(function (e) {
    e.preventDefault();
    var formData = new FormData($("#insertReview")[0]);

    // member_num과 item_num 값을 가져옵니다.
    var member_num = $("#insertReview input[name=member_num]").val();
    var item_num = $("#insertReview input[name=item_num]").val();

    // getItemOrder 엔드포인트에서 여러 order_num 값을 가져옵니다.
    $.get("${pageContext.request.contextPath}/getItemOrder", {
        member_num: member_num,
        item_num: item_num
    }, function (data) {
        var selectedOrder = null;
      
        data.forEach(memberDTO => {
            var order_num = memberDTO.order_num;
          
            if (!selectedOrder || order_num > selectedOrder) {
                selectedOrder = order_num;
            }
        });

        // order_num이 null이 아닌 경우에만 formData에 추가합니다.
        if (selectedOrder !== null) {
            formData.append("order_num", selectedOrder);

            // 원래의 AJAX 코드를 새로운 order_num 값을 포함하여 실시합니다.
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/insertReview",
                data: formData,
                enctype: "multipart/form-data",
                contentType: false,
                processData: false,
                success: function () {
                    alert("리뷰가 등록되었습니다.");
                    location.reload();
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log("Error response: ", xhr.responseText);
                    alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
                }
            });
        } else {
            // order_num이 null인 경우 사용자에게 알려줍니다.
            alert("order_num을 찾을 수 없습니다. 다시 시도해주세요.");
        }
    });
});
	
	//------------------------------------------------------------

	$(document).ready(function () {
    getItemReviews();
    function getItemReviews() {
        var item_num = ${item.item_num};
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getItemReviews",
            data: { item_num: item_num },
            dataType: "json",
            success: function(reviews) {
                if (reviews.length === 0) {
                    $("#getItemReviews tbody").html("<tr><td colspan='6' style='text-align:center;'>리뷰가 없습니다.</td></tr>");
                } else {
                    var rows = "";
                    for (var i = reviews.length - 1; i >= 0; i--) {
                        var review = reviews[i];
                        rows += "<tr>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + review.member_name + "</td>" +
                            "<td class='review-star'>" + review.review_star + "</td>" +
                            "<td>" + review.review_title + "</td>" +
                            "<td>" + review.review_content + "</td>" +
                            "<td class='review-date' data-timestamp='" + review.review_day + "'></td>" +
                            "<td><img src='" + review.review_img + "' alt='Review image' width='100'></td>" +
                        "</tr>";
                    }
                    $("#getItemReviews tbody").html(rows);

                    // 별점을 ★로 변경
                    let reviewStars = document.querySelectorAll('.review-star');
                    reviewStars.forEach(function(starElement){
                        let starCount = parseInt(starElement.textContent, 10);
                        let stars = '';
                        for (let i = 1; i <= starCount; i++) {
                            stars += '★';
                        }
                        starElement.textContent = stars;
                    });

                    // 작성일을 YYYY-MM-DD 형식으로 변경
                    let reviewDates = document.querySelectorAll('.review-date');
                    reviewDates.forEach(function (dateElement) {
                        let timestamp = parseInt(dateElement.getAttribute('data-timestamp').trim(), 10);

                        // 만약 timestamp가 NaN이라면, 값이 정상적으로 파싱되지 않은 것입니다.
                        if (isNaN(timestamp)) {
                            console.error('Invalid timestamp value:', dateElement.getAttribute('data-timestamp'));
                            return;
                        }

                        let date = moment(timestamp).format('YYYY-MM-DD'); // moment.js를 사용해 날짜를 변환합니다.

                        // 포맷된 날짜를 표시합니다.
                        dateElement.textContent = date;
                    });
                }
            },
            error: function () {
                alert("리뷰를 가져오는 데 실패하였습니다. 페이지를 새로 고치거나 나중에 다시 시도해 주십시오.");
            }
        });
    }
});
	
	
	
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	
</body>

</html>
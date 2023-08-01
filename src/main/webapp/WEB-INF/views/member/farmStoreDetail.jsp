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
                        <p>${item.item_detail}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="cart_cnt">
                                </div>  
                            </div>
                        </div>  
                        <input type="button" onclick="insertCart()" class="primary-btn" value="ADD TO CART">
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
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
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
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
                                    aria-selected="false">1:1 문의 <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>ris blandit aliquet elit, eget tincidunt nibh pulvinar a.
                                        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
                                        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
                                        sed sit amet dui. Proin eget tortor risus.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        Proin eget tortor risus.</p>
                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                </div>
                            </div>
                            <!-- 리뷰칸 그러나 이미지 작업이 없는.. -->
                            <!-- 원래는 구매자만 작성이 필요하다고 수정해야하는데 구매내역 데이터가 없으니까.. 일단 임시방편으로 로그인만 작업해둠 -->
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
<!--  									<label for="file"></label> -->
<!--         							<input type="file" id="review_img" name="review_img" style="padding-left: 73px;"> -->
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
                					<th>별점</th>
                					<th>작성자</th>
                					<th>작성일</th>
                					<th>제목</th>
                					<th>내용</th>
<!--                 					<th>이미지</th> -->
           							</tr>
        							</thead>
        							<tbody>
            						<c:set var="total" value="${fn:length(reviews)}" />
            						<c:if test="${total eq 0}">
                					<tr>
                    				<td colspan="6" style="text-align:center;">리뷰가 없습니다.</td>
                					</tr>
            						</c:if>
            						<c:set var="count" value="0" />
            						<c:forEach items="${reviews}" var="review" varStatus="status">
                					<c:set var="reversedCount" value="${total - status.index}" />
                					<c:set var="count" value="${count + 1}" />
                					<tr>
                    				<td>${count}</td>
                    				<td class="review-star"><c:out value="${review.review_star}"/></td>
                    				<td>${review.member_num}</td>
                    				<td class="review-date"><c:out value="${review.review_day}"/></td>
                    				<td>${review.review_title}</td>
                    				<td>${review.review_content}</td>
<%--                     				<td>${review.review_img}</td> --%>
                					</tr>
            						</c:forEach>
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
						                    <!-- 여기에 문의 내용이 추가됩니다. -->
						                    <c:forEach var="row" items="${oneBoardList}">
								                    <tr class="boardTitle">
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
  	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
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
    $(document).ready(function() {
        $(".boardTitle").click(function() {
            // 질문을 토글합니다.
            $(this).next(".boardContent").toggle();
            
            // 답변이 있는 경우에만, 답변을 토글합니다.
            const answerRow = $(this).next().next(".boardContent");
            if (answerRow.find(".content").text().trim().length > 3) {
                answerRow.toggle();
            }
        });
    });
	</script>
	
	<script>
	function checkPassword(savedPassword, oneBoardNum, inputElementId) {
		  var inputPassword = document.getElementById(inputElementId).value;

		  if (savedPassword === inputPassword) {
		    // 비밀번호 입력 창 숨기기
		    var passwordRow = $("#password_row" + oneBoardNum);
		    passwordRow.hide();

		    // 질문과 답변 표시
// 		    var questionRow = $("#question" + "${row.one_board_num}");
		    var answerRow = $("#answer" + oneBoardNum);
		    $("#question" + "${row.one_board_num}").show();
		    answerRow.show();
		    var answerSelector = "#answer" + oneBoardNum;
		    var answerRow = $(answerSelector);
		  } else {
		    alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
		  }
		}








	function handleBoardClick(one_board_num) {
	    sessionStorage.setItem('selectedBoardNum', one_board_num); // 선택한 문의의 one_board_num 값을 웹 브라우저의 sessionStorage에 저장
	}
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

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/insertReview",
                data: formData,
                contentType: false,
                processData: false,
                success: function () {
                    alert("리뷰가 등록되었습니다.");
                    location.reload();
                },
                error: function () {
                    alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
                }
            });
        });
	
	//------------------------------------------------------------
	

	// -----------------------------------------------------------------------------
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
                    for (var i = 0; i < reviews.length; i++) {
                        var review = reviews[i];
                        rows += "<tr>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td class='review-star'>" + review.review_star + "</td>" +
                            "<td>" + review.member_num + "</td>" +
                            "<td class='review-date'>" + review.review_day + "</td>" +
                            "<td>" + review.review_title + "</td>" +
                            "<td>" + review.review_content + "</td>" +
//                             "<td>" + review.review_img + "</td>" +
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

                    // 작성일을 YYYY-MM-DD 형식으로 변경 -> 아직 안됌 이거 수정 더 해야할듯
                    let reviewDates = document.querySelectorAll('.review-date');
                    console.log('Total review dates:', reviewDates.length);
                    reviewDates.forEach(function (dateElement) {
                      console.log('Original date text:', dateElement.textContent);
                      
                      let timestamp = parseInt(dateElement.textContent.trim(), 10);
                      
                      console.log('Parsed timestamp:', timestamp);

                      // 만약 timestamp가 NaN이라면, 값이 정상적으로 파싱되지 않은 것입니다.
                      if (isNaN(timestamp)) {
                        console.error('Invalid timestamp value:', dateElement.textContent);
                        return;
                      }

                      let date = new Date(timestamp * 1000); // 여기서 1000을 곱하여 밀리초로 변환합니다.
                      let year = date.getFullYear();
                      let month = String(date.getMonth() + 1).padStart(2, '0');
                      let day = String(date.getDate()).padStart(2, '0');

                      // 포맷된 날짜를 표시합니다.
                      let formattedDate = `${year}-${month}-${day}`;
                      console.log('Formatted date:', formattedDate);
                      dateElement.textContent = formattedDate;
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
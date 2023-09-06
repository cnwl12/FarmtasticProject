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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page.css" type="text/css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<!-- 카트추가 함수 -->
   
<style>

.no-records-message {
  font-weight: bold;
  text-align: center;
  background-color: #f8f9fa;
  padding: 10px;
}
  .special-page .wishlist-btn {
    display: inline-block;
    vertical-align: top;
  }
 .special-page .wishlist-btn i {
      font-size: 40px;
      margin-top : 5px;
      margin-left: 5px;
    }
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
	
.content-container {
  display: flex;
}

.review-content {
  flex: 1;
  margin-right: 10px; /* 내용과 이미지 사이의 간격 */
}

.review-img {
  width: 130px;
  height : auto;
}

.review-img img {
  max-width: 100%; /* 이미지가 컨테이너를 벗어나는 것을 방지 */
}

#oneboardBtn{
   color: white;
   background-color: #7fad39;
   border: none;
}

#write-review-btn{
	border: none;
    background-color: #7fad39;
    color: white;
    padding: 1%;
}
</style>	
	
</head>

<!--  서영 하트 키우는것때문에 바디에 스페셜페이지 클래스 추가한거에요 -->
<body class="special-page">
<jsp:include page="../top.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FarmFarm Market</h2>
                        <div class="breadcrumb__option">
                            <a href="main">Home</a>
                            <a href="main">Vegetables</a>
                            <span>맛있는 채소</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad" 
										     data-item-name="${item.item_name}" 
										     data-item-price="${item.item_price}" 
										     data-item-mainImg="${item.item_mainImg}">
<%--     <input type="hidden" name="member_num" value="${sessionScope.member_num}"> --%>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large" src="${item.item_mainImg}" alt="" style="height: 400px; width: 555px;">
                        </div> 
                			<div class="overlay ${item.item_left <= 0 || item.item_salesStatus == 'N' ? 'sold-out' : (item.item_left < 3 ? 'sold-out' : '')}">
						    	${item.item_left <= 0 || item.item_salesStatus == 'N' ? '판매 종료' : (item.item_left < 3 ? '마감 임박' : '')}
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
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="cart_cnt">
                                </div>  
                            </div>
                        </div>  
                       <c:choose>
                         <c:when test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
                        	<input type="button" class="primary-btn" value="판매종료">
                         </c:when>
                         <c:otherwise>
                        	<input type="button" onclick="insertCart()" class="primary-btn" value="ADD TO CART">
                         </c:otherwise>
                        </c:choose>
                        <a href="#" class="wishlist-btn" data-member-num="${sessionScope.member_num}" data-item-num2="${item.item_num}">
							  <i class="fa fa-heart-o" style="color: red;"></i>
						</a>
                        <ul>
							<li><b>Seller</b> <span>${item.seller_storeName}</span></li>
							<li><b>Availability</b> 
							<c:choose>
									<c:when
										test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
										<span>sold out</span>
									</c:when>
									<c:otherwise>
										<span>In Stock</span>
									</c:otherwise>
								</c:choose></li>
							<li><b>Shipping</b> <span>01 day shipping. 
								<samp>Free pickup today</samp></span>
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
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                	<div>
                                	<c:choose>
    									<c:when test="${empty sessionScope.member_num}">
     								 	<p>로그인이 필요합니다. 리뷰를 작성하려면 로그인하세요.</p>
    									</c:when>
    								<c:otherwise>
            						<div id="review-write-section" style="display:none;">
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
    									<textarea name="review_content" id="review_content" cols="80" rows="4" style="font-size:14px; width: 100%;" placeholder="내용을 입력해주세요. 최대 300자까지 작성 가능합니다." required maxlength="300"></textarea>
    									<br>
    									<div style="margin-left: 47%;">
    										<button id="write-review-btn" type="submit">리뷰 작성</button>
    									</div>
									</form>
									</div>
									<p id="not-eligible-message" style="display:none;">주문 내역을 찾을 수 없습니다. 리뷰를 작성하려면 제품을 구매하세요.</p>
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
                					<th>작성일</th>
           							</tr>
        							</thead>
        							<tbody>
            						
        							</tbody>
    								</table>
    								<div class="pagination">
    									<span class="prev-page">이전</span>
    									<div class="page-numbers"></div>
    									<span class="next-page">다음</span>
									</div>
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
								                         <td>
												            <c:choose>
												                <c:when test="${fn:length(row.member_name) eq 2}">
												                    ${fn:substring(row.member_name, 0, 1)}*
												                </c:when>
												                <c:otherwise>
												                    ${fn:substring(row.member_name, 0, 1)}*${fn:substring(row.member_name, 2, 3)}
												                </c:otherwise>
												            </c:choose>
												        </td>
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
																	<div>
																        <button type="button"  class="edit-button" onclick="openEditPopup('${row.one_board_num}');">수정하기</button>
																        <button type="button"  class="delete-button" onclick="deleteBoard(${row.one_board_num});">삭제하기</button>
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
																<c:choose>
											                        <c:when test="${sessionScope.member_num eq row.member_num}">
											                            <div style="float: right;">
											                                <button type="button" id="oneboardBtn" class="edit-button" onclick="openEditPopup('${row.one_board_num}');">수정하기</button>
											                                <button type="button" id="oneboardBtn" class="delete-button" onclick="deleteBoard(${row.one_board_num});">삭제하기</button>
											                            </div>
											                        </c:when>
											                    </c:choose>
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
								
								<c:if test="${inquiryCount == 0}">
									<tr class="no-records-message">
										<td colspan="5">작성된 문의글이 존재하지 않습니다.</td>
									</tr>
								</c:if>

			                 </tbody>
			            	 </table>
			            	 </div>
			        		</div>
			        		 <div class="inquiry-pagination">
							    <button class="inquiry-prev-page">이전</button>
							    <div class="inquiry-page-numbers">
							    </div>
							    <button class="inquiry-next-page">다음</button>
							</div>
                         </div>

			       				 </div>
			       
			        		</div>
                        </div>
                    </div>
                </div>
        
    </section>

   <!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	
	 <!-- Js Plugins -->
	
	<script>
	  var item_num = document.querySelector(".item_wrap").dataset.item_num;
	</script>
	
	<script>
	function openEditPopup(oneBoardNum) {
	    var popupURL = "updateoneboard?one_board_num=" + oneBoardNum;
	    var popupWindow = window.open(popupURL, "EditPopup", "width=800, height=1000, scrollbar=yes, resizable=yes");
	    popupWindow.focus();
	}
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
	$(document).ready(function() {
    var member_num = $("#insertReview input[name=member_num]").val();
    var item_num = $("#insertReview input[name=item_num]").val();

    if (member_num && item_num) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getItemOrder",
            type: "GET",
            data: {
              member_num: member_num,
              item_num: item_num
            },
            success: function(data) {
                if (data && data.length > 0) {
                    $("#review-write-section").show();
                } else {
                    $("#not-eligible-message").show();
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }
});
	
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
                    alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
                }
            });
        } else {
            // order_num이 null인 경우 사용자에게 알려줍니다.
            alert("구매내역을 찾을 수 없습니다. 다시 시도해주세요.");
        }
    });
});
	
	//------------------------------------------------------------

	$(document).ready(function () {
    let allReviews = [];
    let currentPage = 1;
    const perPage = 7;

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

    function getItemReviews(pageNumber) {
        var item_num = ${item.item_num};
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getItemReviews",
            data: { 
                item_num: item_num,
                page: pageNumber
            },
            dataType: "json",
            success: function (reviews) {
             // 최신 리뷰 순으로 정렬 후 추가로 리뷰 번호로 내림차순 정렬
                allReviews = reviews.sort((a, b) => {
                    if (parseInt(b.review_day) === parseInt(a.review_day)) {
                        return b.review_num - a.review_num;
                    } else {
                        return parseInt(b.review_day) - parseInt(a.review_day);
                    }
                });

                var startIndex = (currentPage - 1) * perPage;
                var endIndex = startIndex + perPage;
                var currentReviews = allReviews.slice(startIndex, endIndex);

                // 작성자 이름 마스킹 처리
                currentReviews.forEach(function (review) {
                    review.member_name = maskWriterName(review.member_name);
                });

                if (currentReviews.length === 0) {
                    $("#getItemReviews tbody").html("<tr><td colspan='6' style='text-align:center;'>리뷰가 없습니다.</td></tr>");
                } else {
                    displayReviews(currentReviews);
                }
                
                // 페이지네이션 업데이트
                updatePagination();
            },
            error: function () {
                alert("리뷰를 가져오는 데 실패하였습니다. 페이지를 새로 고치거나 나중에 다시 시도해 주십시오.");
            }
        });
    }

    function displayReviews(reviews) {
        var rows = "";

        for (var i = 0; i < reviews.length; i++) {
            var review = reviews[i];
            var reversedIndex = allReviews.length - ((currentPage - 1) * perPage + i);
            rows += "<tr>" +
            "<td>" + reversedIndex + "</td>" +
            "<td>" + review.member_name + "</td>" +
            "<td class='review-star'>" + review.review_star + "</td>" +
            "<td class='review-title toggle-content' data-content='" + review.review_content + "' data-image='" + (review.review_img || "") + "' style='cursor: pointer;'>" + review.review_title + "</td>" +
            "<td class='review-date' data-timestamp='" + review.review_day + "'></td>" +
        	"</tr>" +
        	"<tr class='content-row' style='display:none;'>" +
            "<td colspan='5'>" +
            "<div class='content-container'>" +
                "<div class='review-content'></div>" +
                "<div class='review-img'></div>" +
            "</div>" +    
            "</td>" +
        	"</tr>";
        }
        $("#getItemReviews tbody").html(rows);

        // 별점을 ★로 변경
        let reviewStars = document.querySelectorAll('.review-star');
        reviewStars.forEach(function (starElement) {
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
	
    // 제목 클릭 시 리뷰 내용과 이미지 표시
    $(document).on('click', '.toggle-content', function () {
        const contentRow = $(this).parent().next('.content-row');
        const content = $(this).data('content');
        const image = $(this).data('image');
        
        contentRow.find('.review-content').html(content);
        contentRow.find('.review-img').html(image ? "<img src='" + image + "' />" : "");
        contentRow.toggle();
    });
    
    function updatePagination() {
        var totalPages = Math.ceil(allReviews.length / perPage);

        document.querySelector(".prev-page").onclick = function () {
            if (currentPage > 1) {
                currentPage--;
                getItemReviews(currentPage);
            }
        };
        document.querySelector(".next-page").onclick = function () {
            if (currentPage < totalPages) {
                currentPage++;
                getItemReviews(currentPage);
            }
        };

        var pageNumbers = document.querySelector(".page-numbers");
        pageNumbers.innerHTML = "";
        for (var i = 1; i <= totalPages; i++) {
            var pageNumber = document.createElement("span");
            pageNumber.className = "page-number";
            pageNumber.textContent = i;

            pageNumber.onclick = (function (i) {
                return function () {
                    currentPage = i;
                    getItemReviews(currentPage);
                };
            })(i);

            if (i === currentPage) {
                pageNumber.classList.add("active");
            }

            pageNumbers.appendChild(pageNumber);
        }
    }

    // 페이지 로딩 후 첫 호출
    getItemReviews(1);
});
	
	
	
	// ------------------------------------------------
	
	$(document).ready(function() {
		  var totalInquiryItems = ${oneBoardList.size()};
		  var inquiryItemsPerPage = 10;

		  // 페이지 번호를 생성하세요.
		  var inquiryTotalPages = Math.ceil(totalInquiryItems / inquiryItemsPerPage);
		  for (var i = 1; i <= inquiryTotalPages; i++) {
		    $(".inquiry-page-numbers").append('<button class="inquiry-page-number">' + i + '</button>');
		  }

		  // 초기 페이지 내용을 표시하세요.
		  showInquiryPageItems(1, inquiryItemsPerPage);

		  // 페이지 번호 클릭 이벤트를 설정하세요.
		  $(document).on("click", ".inquiry-page-number", function() {
		    var pageNumber = $(this).text();
		    showInquiryPageItems(pageNumber, inquiryItemsPerPage);
		  });

		  // 이전 페이지 버튼 이벤트를 설정하세요.
		  $(".inquiry-prev-page").click(function() {
		    var currentPage = $(".inquiry-page-number.active").text();
		    if (currentPage > 1) {
		      showInquiryPageItems(currentPage - 1, inquiryItemsPerPage);
		    }
		  });

		  // 다음 페이지 버튼 이벤트를 설정하세요.
		  $(".inquiry-next-page").click(function() {
		    var currentPage = $(".inquiry-page-number.active").text();
		    if (currentPage < inquiryTotalPages) {
		      showInquiryPageItems(parseInt(currentPage) + 1, inquiryItemsPerPage);
		    }
		  });

		  // 페이지 항목을 표시하는 함수를 만드세요.
		  function showInquiryPageItems(page, itemsPerPage) {
		    $(".inquiry-item").hide();
		    $(".inquiry-item").slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
		    $(".inquiry-page-number").removeClass("active");
		    $(".inquiry-page-number:eq(" + (page - 1) + ")").addClass("active");
		  }
		});
	
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<script type="text/javascript">
	function insertCart(){	
		
		var cart_cnt = $("#cart_cnt").val(); // cart_cnt id값의 value값 
		var item_num = $('.item_wrap').data("item_num");
		
		console.log(item_num);
		
		/* location.href="insertCart?item_num="+item_num+"&cart_cnt="+cart_cnt; */
		
		$.ajax({
	        url: "insertCart",
	        type: "GET",
	        data: {
	            item_num: item_num,
	            cart_cnt: cart_cnt
	        },
	        success: function(response) {
	            // 추가성공 
	        },
	        error: function() {
	            console.log("상품 추가 중 오류 발생");
	        }
	    });

	    var confirmMove = confirm("장바구니로 이동하시겠습니까?");
	    if (confirmMove) {
	        location.href = "shoppingCart";  
	    }
	}
	
	function deleteBoard(boardNum) {
		  if (confirm("해당 게시물을 삭제하시겠습니까?")) {
		    $.ajax({
		      url: "deleteBoard",
		      type: "POST",
		      data: { boardNum: boardNum },
		      success: function() {
		        alert("게시물이 삭제되었습니다.");
		        location.reload(); // 삭제 후 페이지 새로고침
		      },
		      error: function() {
		        alert("게시물 삭제에 실패하였습니다.");
		      }
		    });
		  }
		}
	</script>
	
    <!-- 선진) 수정 -->
    <script>
    $(document).ready(function() {
    	var itemNum = $('.item_wrap').data("item_num")
    	var itemName = $('.product-details').data('itemName');
    	var itemPrice = $('.product-details').data('itemPrice');
    	var itemMainImg = $('.product-details').data('itemMainimg');

    	// 현재 보고 있는 상품 정보로 onItemClicked 함수 호출
    	onItemClicked(itemNum, itemName, itemPrice, itemMainImg);
   	 
   	    // 페이지 로드 완료 후 최근 본 상품 목록 출력
<%--    	    showViewedItemList('<%= session.getAttribute("member_num") %>'); --%>
   	    
   	 	console.log("테스트)지금 보는 아이템정보 : " + itemNum +", "+ itemName +", "+ itemPrice +", "+ itemMainImg);
    	});
    	

    	// 가상의 로그인 사용자 ID 가져오기 함수
    	function getLoggedInMemberNum() { 
    	   console.log("테스트)멤버정보: " + '<%= session.getAttribute("member_num") %>'); 
    	   return '<%= session.getAttribute("member_num") %>'; 
    	}	    	
    	
    </script>		
</body>

</html>
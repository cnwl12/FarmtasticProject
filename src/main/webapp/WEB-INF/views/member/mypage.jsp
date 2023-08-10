<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmtastic_Mypage</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/zzim.css" type="text/css">
<!-- 지마켓  -->  
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myg.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
.star {  
	color : lightgray;
	cursor : pointer;
}
.review-star {
	color : orange;
}

.star.selected {
  color: orange;
}
#edit-review-popup {
  display: none;
}
</style>

</head>

<body>
	<jsp:include page="../top.jsp"></jsp:include>
  <section class="blog spad" style="padding-top: 10px;">
    <div class="container">
	 <div class="row">
	  <div class="col-lg-4 col-md-5">
                   <div class="blog__sidebar">
                <div class="blog__sidebar__item">      
		<!-- <div id="contents">  -->
			<!-- <div id="main_menu"> -->
			<h4>마이페이지</h4>
				<ul class="menu_list">
					<li id="menu1" class="on"><a href="mypage" class="toggle-mypage" data-target="mypage">나의정보</a></li>
					<li id="menu5"><a href="#" class="toggle-mypage" data-target="myzzim">찜한상품</a></li>
					<li id="menu2"><a href="#" class="toggle-mypage" data-target="myorder">주문관리</a></li>
					<li id="menu3"><a href="#" class="toggle-mypage" data-target="myreview">리뷰관리</a></li>
					<li id="menu4"><a href="#" class="toggle-mypage" data-target="myoneboard">1:1 문의</a></li>
				</ul>
			</div>
			 </div>
                </div>
                <div>

			<div id="menu1_cont" style="width: 780px; margin-left: -80px;">
				<form novalidate 
					action="${pageContext.request.contextPath }/updatePro" method="post">
					<div class="myoption" style="float: right;  margin-bottom: 10px; width: 780px;">
						<h4>나의 정보</h4>
						<table class="myg_tab">
							<tbody>
								<tr>
								</tr>
							</tbody>
						</table>
						<!-- <h5 class="list1">회원정보 설정</h5> -->
						<div class="my_info_setting">
							<table class="myinfo">
								<colgroup>
									<col style="width: 17%;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="name1">이름</label></th>

										<td><span><input type="text" class="txt"
												id="member_name" name="member_name"
												value="${memberDTO.member_name}" required> <span
												class="error-message" style="color: red; display: none;">이름을
													입력하세요</span></span></td>
									</tr>
									<tr>
										<th scope="row">사용자ID</th>
										<td><span><input type="text" class="txt"
												id="member_id" name="member_id"
												value="${memberDTO.member_id}" readonly></span></td>
									</tr>
									<tr style="visibility: visible;">
										<th scope="row">비밀번호</th>
										<td id="PasswordEdit" class="PwdEdit" style="display: block;">
											<ul class="llist-style1">
												<li><label for="nowpw"><span class="bg_bul"></span>현재
														비밀번호</label> <input type="password" class="txt" id="member_pass"
													name="member_pass" size="26" maxlength="15" required=""
													onkeydown="return keycheck(this.event);"
													onkeypress="Capskeycheck(this,'new_member_pass');"
													onkeyup="validatePasswordType(this,'new_member_pass');"
													onfocus="helpOn('new_member_pass');"
													onblur="chkBlur(this,'new_member_pass');"
													style="width: 195px";> <span class="font_style1">현재
														비밀번호를 입력해 주세요</span></li>



												<script>
                                                    function validateNewPassword() {
                                                        var newPassword = document
                                                                .getElementById("new_member_pass").value;
                                                        var confirmPassword = document
                                                                .getElementById("pwd2").value;

                                                        if (newPassword != confirmPassword) {
                                                            document
                                                                    .getElementById("pwd2").style.borderColor = "red";
                                                            document
                                                                    .getElementById("message").innerHTML = "두 개의 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.";
                                                            document
                                                                    .getElementById("img_submit").setAttribute("disabled", "true");
                                                        } else {
                                                            document
                                                                    .getElementById("pwd2").style.borderColor = "";
                                                            document
                                                                    .getElementById("message").innerHTML = "";
                                                            document
                                                                    .getElementById("img_submit").removeAttribute("disabled");
                                                        }
                                                    }
                                                </script>


												<li><label for="newpw"> <span class="bg_bul"></span>새비밀번호
												</label> <input type="password" class="txt" id="new_member_pass"
													name="new_member_pass" size="26" maxlength="15" required=""
													onkeydown="return keycheck(this.event);"
													onkeypress="Capskeycheck(this,'new_member_pass');"
													onkeyup="validatePasswordType(this,'new_member_pass');"
													onfocus="helpOn('new_member_pass');"
													onblur="chkBlur(this,'new_member_pass');"
													style="width: 195px;"> <span class="font_style1"></span>
												</li>
												<li><label for="new_pw_corfirm"> <span
														class="bg_bul"></span>새 비밀번호 확인
												</label> <input type="password" class="txt" id="pwd2" name="pwd2"
													size="26" maxlength="15" required=""
													onfocus="helpOn('new_member_pass');"
													onkeyup="validateNewPassword(); helpOff('new_member_pass');"
													onblur="helpOff('new_member_pass');" style="width: 203px;">
													<span id="message" style="color: red; margin-left: 10px;"></span>
												</li>

											</ul>
										</td>

									</tr>

									<tr>
										<th scope="row"><label>휴대폰번호</label></th>
										<td><input type="text" class="txt" id="member_phone"
											name="member_phone" size="15" maxlength="15"
											value="${memberDTO.member_phone}" title="휴대폰 첫자리">
									</tr>


									<tr style="visibility: visible;">
										<th scope="row"><label for="email">E-mail</label></th>
										<td>
											<!-- 메일 앞부분  --> <input type="text" class="txt"
											id="member_email" name="member_email" title="이메일 아이디" size="50"
											value="${memberDTO.member_email}"> <!-- 주소부분 --> <!-- <input
                                            type="hidden" name="hdnOldIsRcvMail" id="hdnOldIsRcvMail"
                                            value="True"> <input type="hidden" name="old_email"
                                            id="old_email" value="wjc5510@naver.com"> <input
                                            type="hidden" name="old_email_pre" id="old_email_pre"
                                            value="wjc5***"> -->
										</td>
									</tr>
									<tr>
										<th scope="row"><label>우편번호</label></th>
										<td><input type="text" class="txt" name="member_post"
											class="form-control" id="sample4_postcode" placeholder="우편번호"
											required>
											<div id="btbt">
												<input type="button" id="member_post"
													onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
											</div>
											<div class="invalid-feedback">우편번호를 입력해주세요.</div></td>
									</tr>

									<th scope="row"><label>도로명주소</label></th>
									<td><input type="text" class="txt" name="member_addMain"
										id="sample4_roadAddress" placeholder="도로명주소" size="80"
										required>

										<div class="invalid-feedback">주소를 입력해주세요.</div>
									</tr>

									<th scope="row"><label>지번주소</label></th>
									<td><input type="text" class="txt"
										id="sample4_jibunAddress" placeholder="지번주소" size="80">
									</tr>

									<th scope="row"><label>상세주소</label></th>
									<td><input type="text" class="txt" name="member_addSub"
										id="sample4_detailAddress" placeholder="상세주소" size="80">
									</tr>

									<th scope="row"><label>참고항목</label></th>
									<td><input type="text" class="txt"
										id="sample4_extraAddress" placeholder="참고항목" size="80">
									</tr>



								</tbody>
							</table>
						</div>
					</div>
					<div class="btn_center">
						<button type="submit" class="btn_blue_style2" id="img_submit">
							<span style="color: #fff; text-align: center;">수정하기</span>
						</button>
					</div>
				</form> 
			</div>
			
			<!-- 서영 찜페이지 만드는중 -->
			<div id="menu5_cont" style="width: 780px; margin-left: -80px;">
			    <div class="container">
			        <h4>내 찜 목록</h4><br>
			        <input type="checkbox" id="selectAllCheckbox">
				    <label for="selectAllCheckbox"></label>
				    <button id="deleteSelectedButton">선택 삭제</button>
				    <button id="deleteAllButton">전체 삭제</button>
				    <ul class="favorite-list">
			            <c:forEach var="item" items="${zzimlist}">
			                <li class="favorite-item" data-item-num="${item.item_num}">
			                    <input type="checkbox" class="checkbox">
			                    <a href="farmStoreDetail?item_num=${item.item_num}">
			                    <img src="${item.item_mainImg}" alt="제품 이미지"></a>
			                    <div class="product-info">
			                    <a href="farmStoreDetail?item_num=${item.item_num}">
			                        <h2 class="product-name">${item.item_name}</h2></a>
			                        <span class="product-price">₩${item.item_price}</span>
			                        <br>
			                        <span class="store-name">${item.seller_storeName}</span>
			                    </div>
			                    <button class="remove-button">X</button>
			                </li>
			            </c:forEach>
			        </ul>
			    </div>
			</div>
			<!--  서영 찜페이지 끝 -->
			
						
			<div id="menu2_cont" style="width: 780px; margin-left: -80px;">
			<h4>주문관리</h4>
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>주문상태</th>
						<th>배송조회</th>
					</tr>
				</thead>
		   <tbody id="inquiryList">
            <c:forEach var="order" items="${orderList}">
                <tr class="boardTitle">
                    <td><a href="javascript:void(0);" class="orderLink" data-order-num="${order.order_num}">${order.order_num}</a></td>
                    <td>${order.item_name}</td>
                    <td>${order.item_cnt}</td>
                    <td>\ ${order.price}원</td>
                    <td>결제완료</td>
                    <td><input type="button" value="배송조회"></td>
                </tr>
                <tr class="orderItemsRow">
                    <td colspan="6">
                        <div class="orderItemsDropdown" style="display: none;">
                            <c:choose>
                                <c:when test="${order.order_num eq selectedOrder}">
                                    <c:forEach var="item" items="${order.orderItems}">
                                        <div>
                                            <span>${item.item_name}</span> <span>${item.item_cnt}</span>
                                            <span>${item.price}원</span>
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
		 <!-- 주문관리 토글 끝  -->	
			
			<div id="menu3_cont" style="width: 780px; margin-left: -80px;">
			<h4>나의 리뷰</h4>
			<button class="site-btn" id="edit-review-button" >수정</button>			
			<button class="site-btn" id="delete-review-button" >삭제</button>
				<div id="edit-review-popup" style="display:none; position: fixed; top: 50%; left: 50%; 
				transform: translate(-50%, -50%);  width: 500px; height: 300px; border: 1px solid #ccc;
				 padding: 20px; background-color: white;">
		        <h5>리뷰 수정</h5>
        		<p>수정할 리뷰의 정보를 입력하세요:</p>
        		<form id="edit-review-form"  method="post" enctype="multipart/form-data">
            	<!-- 여기에 수정할 리뷰의 내용을 보여주는 input이나 textarea 추가 -->
            	<div class="form-group">
            	<div class="rating">
  				<span class="star" data-value="1">★</span>
  				<span class="star" data-value="2">★</span>
  				<span class="star" data-value="3">★</span>
 				<span class="star" data-value="4">★</span>
  				<span class="star" data-value="5">★</span>
  				<input type="hidden" id="review_star" name="review_star" value="">
				</div>
				</div>
            	<br>
           	 	<input type="text" id="review-title"><br>
            	<textarea name="review_content" id="review_content"  cols="60" rows="4" style="font-size:12px;"></textarea><br>
            	<input type="hidden" id="review_num" name="review_num">
            	<input type="file" id="review_img" name="review_image">
            	<button type="submit" class="site-btn" id="submit-edit-review-btn">저장</button>
            	<button type="button" class="site-btn" id="close-edit-popup">취소</button>
        		</form>
    			</div>
			
				<div class="reviews-list">
				<input type="hidden" name="member_num" value="${sessionScope.member_num}">
				<input type="hidden" name="review_num" value="${review.review_num}">
				<input type="hidden" id="item_name"name="item_name" value="${item.item_name}">
    			<table class="table" id="getItemMyReview" >
        		<thead>
            	<tr>
            	<th>리뷰</th>
            	<th>별점</th>
            	<th>상품명</th>
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
			<div id="menu4_cont" style="width: 780px; margin-left: -80px;">
			<h4>1:1문의</h4>
			<Label>여기 div안에 작업할 거 넣어주시면 토글이 적용되옵니다 - 막내</Label>
			 <input type="hidden" id="member_num" value="${sessionScope.member_num}">
			
			<table class="table">
				<thead>
					<tr>
						<th>상품명</th>
						<th>답변상태</th>
						<th>문의유형</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="inquiryList">
				<!-- 여기에 문의 내용이 추가됩니다. --> 
					<c:forEach var="row" items="${oneBoardList2}">
						<tr class="boardTitle" onclick="handleRowClick('${row.one_board_private}' == '비공개', ${row.one_board_num}, '${row.one_board_pass}', 'boardPassword${row.one_board_num}');">
							<td>${row.item_name}</td>
							<td>${row.one_board_repYn}</td>
							<td>${row.one_board_type}</td>
							<td>${row.one_board_title}</td>
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
     </section>


	<jsp:include page="../bottom.jsp"></jsp:include>

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                    + data.buildingName
                                    : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if (roadAddr !== '') {
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if (data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress
                                    + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                    + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if (data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : '
                                    + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
        }
    </script>

    
<script>

$(document).ready(function() {
    // 마이페이지 전환 초기 설정
    $("#menu2_cont").hide();
    $("#menu3_cont").hide();
    $("#menu4_cont").hide();
    $("#menu5_cont").hide();

    // 마이페이지 전환 함수
    function toggleMypage(target) {
        $("#menu1_cont").hide();
        $("#menu1").removeClass("on");
        $("#menu2_cont").hide();
        $("#menu2").removeClass("on");
        $("#menu3_cont").hide();
        $("#menu3").removeClass("on");
        $("#menu4_cont").hide();
        $("#menu4").removeClass("on");
        $("#menu5_cont").hide();
        $("#menu5").removeClass("on");
      
      if (target === "mypage") {
          $("#menu1_cont").show();
          $("#menu1").addClass("on");
      } else if (target === "myorder") {
          $("#menu2_cont").show();
          $("#menu2").addClass("on");
      } else if (target === "myreview") {
          $("#menu3_cont").show();
          $("#menu3").addClass("on");
      } else if (target === "myoneboard") {
          $("#menu4_cont").show();
          $("#menu4").addClass("on");
      } else if (target === "myzzim") {
          $("#menu5_cont").show();
          $("#menu5").addClass("on");
      }
    }
  // 메뉴 클릭 이벤트 핸들러
  $(".toggle-mypage").on("click", function(e) {
    e.preventDefault();
    let target = $(this).data("target");
    toggleMypage(target);
  });
 });  
</script>
<script>     

    function getItemMyReview() {
    	var member_num =  '<%= request.getSession().getAttribute("member_num") %>';
        
    	if(member_num) {
    		
    	
    	$.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/getItemMyReview",
            data: { member_num: member_num },
            dataType: "json",
            success: function(myreview) {
                if (myreview.length === 0) {
                    $("#getItemMyReview tbody").html("<tr><td colspan='6' style='text-align:center;'>리뷰가 없습니다.</td></tr>");
                } else {
                    var rows = "";
                    for (var i = myreview.length - 1; i >= 0; i--) {
                        var review = myreview[i];
                        rows += "<tr>" +
                        "<td><input type='checkbox' data-member_num='" + review.member_num + "'data-review_num='"+ review.review_num +"' class='review-checkbox' id='review_" + (i + 1) + "' name='review_" + (i + 1) + "'></td>" +
                            "<td class='review-star'>" + review.review_star + "</td>" +
                            "<td>" + review.item_name + "</td>" +
                            "<td>" + review.review_title + "</td>" +
                            "<td>" + review.review_content + "</td>" +
                            "<td class='review-date' data-timestamp='" + review.review_day + "'></td>" +
                            "<td>" + review.review_img + "</td>" +
                        "</tr>";
                    }
                    $("#getItemMyReview tbody").html(rows);

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
    	} else {
    		('로그인이 필요합니다.');	
    	}
    }
    
    $(document).ready(function () {
    	getItemMyReview();
	});

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 주문목록  -->
<script>
    $(document).ready(function() {
        var firstOrderNum = $(".orderLink").first().data("order-num");
        var selectedOrder = firstOrderNum;

        $(".orderLink").click(function() {
            var orderNum = $(this).data("order-num");
            var dropdown = $(this).closest(".boardTitle").next(".orderItemsRow").find(".orderItemsDropdown");

            if (orderNum === selectedOrder) {
                selectedOrder = null;
            } else {
                selectedOrder = orderNum;
            }

            $(".orderItemsDropdown").hide();
            dropdown.toggle();
        });
    });
</script>



<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () { 
	const stars = document.querySelectorAll(".star"); 

 	 stars.forEach(function (star) { 
  // 각 별 요소에 클릭 이벤트 핸들러를 추가 
  star.addEventListener("click", function () { 
    const clickedStarValue = parseInt(this.getAttribute("data-value")); 

    // 별에 selected 클래스를 초기화 -->
    stars.forEach((star) => star.classList.remove("selected")); 

      // 클릭한 별 이전의 별들에 'selected' 클래스 추가 
      for (let i = 0; i < clickedStarValue; i++) { 
	        stars[i].classList.add("selected"); 
	      } 

	      // hidden input 요소의 값을 클릭한 별의 data-value로 변경 
	      document.querySelector("#review_star").value = clickedStarValue; 
	    }); 
	}); 
});


$(document).ready(function () {
	  var selectedReview;

	  // 수정 버튼 클릭 이벤트
	  $(document).on("click", "#edit-review-button", function () {
	    var checkedReviews = $("input[type='checkbox']:checked");
	    if (checkedReviews.length === 1) {
	      selectedReview = checkedReviews.first().data("review_num");
	      console.log("Selected review number:", selectedReview);

	      $("#edit-review-popup").show();
	    } else {
	      alert("한 개의 리뷰만 선택해 주세요.");
	    }
	  });

	// 수정 팝업 '저장' 버튼 클릭
	  $('#submit-edit-review-btn').on('click', function(e) {
	    e.preventDefault();
	    var review_star = $('#edit-review-form #review_star').val();
	    var review_title = $('#edit-review-form #review-title').val();
	    var review_content = $('#edit-review-form #review_content').val();
	    var review_img = $('#edit-review-form input[type="file"]').prop("files")[0];

	    updateReview(selectedReview, review_star, review_title, review_content, review_img);
	  });

// 수정 팝업 '취소' 버튼 클릭
$('#close-edit-popup').on('click', function(e) {
  e.preventDefault();
  $('#edit-review-popup').hide();
});

// 별점 선택 시 발생하는 이벤트
$('.rating .star').on('click', function() {
  var starValue = $(this).data('value');
  $('#review_star').val(starValue);

  // 선택된 별까지 모든 별에 클래스를 추가한다.
  $(this).prevAll().addBack().addClass('active');
  $(this).nextAll().removeClass('active');
});

// 리뷰 정보를 업데이트 하는 함수  
function updateReview(selectedReview, review_star, review_title, review_content, review_img) {
    var formData = new FormData();
    formData.append("review_num", selectedReview);
    formData.append("review_star", review_star);
    formData.append("review_title", review_title);
    formData.append("review_content", review_content);

    if (review_img) {
      formData.append("review_image", review_img);
    }

    $.ajax({
      type: "POST",
      url: "updateReview",
      data: formData,
      enctype: "multipart/form-data",
      processData: false,
      contentType: false,
      success: function(responseText) {
        console.log(responseText);
        if (responseText === "The review has been successfully updated.") {
          alert("리뷰가 성공적으로 수정되었습니다.");
          $("#edit-review-popup").hide();
          location.reload();
        } else {
          alert("리뷰 수정에 실패했습니다. 다시 시도해 주세요.");
        }
      },
      error: function () {
        alert("리뷰 업데이트에 실패했습니다. 다시 시도해 주세요.");
      }
    });
  }
});
</script>
<script type="text/javascript">
$(document).ready(function () {
  var selectedReview;
  var selectedMember;

  // 삭제 버튼 클릭 이벤트
  $(document).on('click', '#delete-review-button', function () {
    var checkedReviews = $('input[type=checkbox]:checked');
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
	


	function deleteFromWishlist(member_num, item_num) {
		  // URLSearchParams를 통해 회원 번호와 아이템 번호를 정수로 보냅니다.
		  const params = new URLSearchParams({
		    member_num: parseInt(member_num, 10),
		    item_num: parseInt(item_num, 10),
		  });

		  fetch("./deleteWishlist", {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/x-www-form-urlencoded",
		    },
		    body: params.toString(),
		  })
		    .then((response) => {
		      if (response.ok) {
		        console.log("찜 DB 항목 삭제 완료");

		        // 삭제된 찜 아이템을 DOM에서 제거
		        let listItem = document.querySelector(
		          `.favorite-item[data-item-num="${item_num}"]`
		        );
		        if (listItem) {
		          listItem.remove();
		        }
		      } else {
		        throw new Error("찜 DB 항목 삭제 오류");
		      }
		    })
		    .catch((error) => {
		      console.error(error);
		    });
		}


	// 선택 삭제
	const deleteSelectedButton = document.getElementById("deleteSelectedButton");
	const allCheckboxes = document.querySelectorAll(".checkbox");
	deleteSelectedButton.addEventListener("click", function () {
	  const member_num = "member_num"; // 사용자 회원 번호를 얻으십시오.

	  allCheckboxes.forEach((checkbox) => {
	    if (checkbox.checked) {
	      const listItem = checkbox.closest(".favorite-item");
	      const item_num = listItem.getAttribute("data-item-num");

	      deleteFromWishlist(member_num, item_num);
	    }
	  });
	});

	// 전체 삭제
	const deleteAllButton = document.getElementById("deleteAllButton");
	deleteAllButton.addEventListener("click", function () {
	  const member_num = "member_num"; // 사용자 회원 번호를 얻으십시오.

	  allCheckboxes.forEach((checkbox) => {
	    const listItem = checkbox.closest(".favorite-item");
	    const item_num = listItem.getAttribute("data-item-num");

	    deleteFromWishlist(member_num, item_num);
	  });
	});
	</script>

</body>
</html>

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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/page.css" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/popup.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>

<style>
.empty-list {
  text-align: center;
  font-weight: bold;
  color: gray;
  font-style: italic;
}
.no-records-message {
  font-weight: bold;
  text-align: center;
  background-color: #f8f9fa;
  padding: 10px;
}

.edit-button {
    position: relative;
    float: right;
    border: none;
    padding: 8px 12px;
    margin-bottom: 8px;
    cursor: pointer;
    color: white;
    background-color: #7fad39;
    margin: 1px;
}

.star { 
   color: lightgray;
   cursor: pointer;
}

.review-star {
   color: orange;
}

.star.selected {
   color: orange;
}

#edit-review-popup {
   display: none;
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
  height : 130px;
}

.review-img img {
  max-width: 100%; /* 이미지가 컨테이너를 벗어나는 것을 방지 */
}

#orderBtn{
   color: white;
    background-color: #7fad39;
    border: none;
}

</style>


</head>

<body>
   <jsp:include page="../top.jsp"></jsp:include>
   
      <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/breadcrumb.jpg">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>MyPage</h2> 
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </section>
   
   <section class="blog spad" style="padding-top: 10px;">
      <div class="container">
         <div class="row">
               <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                     <!-- <div id="contents">  -->
                     <!-- <div id="main_menu"> -->
                     <h4>마이페이지</h4>
                     <ul class="menu_list">
                        <li id="menu1" class="on"><a href="mypage"
                           class="toggle-mypage" data-target="mypage">나의정보</a></li>
                        <li id="menu5"><a href="#" class="toggle-mypage"
                           data-target="myzzim">찜한상품</a></li>
                        <li id="menu2"><a href="#" class="toggle-mypage"
                           data-target="myorder">주문관리</a></li>
                        <li id="menu3"><a href="#" class="toggle-mypage"
                           data-target="myreview">리뷰관리</a></li>
                        <li id="menu4"><a href="#" class="toggle-mypage"
                           data-target="myoneboard">1:1 문의</a></li>
                     </ul>
                  </div>
               </div>
            <div>

               <div id="menu1_cont" style="width: 780px;  margin-top: 45px; margin-left: 24%;">
                  <form novalidate
                     action="${pageContext.request.contextPath }/updatePro"
                     method="post">
                     <div class="myoption"
                        style="float: right; margin-bottom: 10px; width: 780px;">
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
                                    <td id="PasswordEdit" class="PwdEdit"
                                       style="display: block;">
                                       <ul class="llist-style1">
                                          <li><label for="nowpw"><span class="bg_bul"></span>현재
                                                비밀번호</label> <input type="password" class="txt" id="member_pass"
                                             name="member_pass" size="26" maxlength="15"
                                             onkeydown="return keycheck(this.event);"
                                             onkeypress="Capskeycheck(this,'new_member_pass');"
                                             onkeyup="validatePasswordType(this,'new_member_pass');"
                                             onfocus="helpOn('new_member_pass');"
                                             onblur="chkBlur(this,'new_member_pass');"
                                             style="width: 195px;"></li>

                                          <li><label for="newpw"> <span class="bg_bul"></span>새비밀번호
                                          </label> <input type="password" class="txt" id="new_member_pass"
                                             name="new_member_pass" size="26" maxlength="15"
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
                                             size="26" maxlength="15" required
                                             onfocus="helpOn('new_member_pass');"
                                             onkeyup="validateNewPassword(); helpOff('new_member_pass');"
                                             onblur="helpOff('new_member_pass');"
                                             style="width: 203px;"> <span id="message"
                                             style="color: red; margin-left: 10px;"></span></li>

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
                                    <td><input type="text" class="txt" id="member_email"
                                       name="member_email" title="이메일 아이디" size="50"
                                       value="${memberDTO.member_email}"> <!-- 주소부분 --></td>
                                 </tr>
                                 <tr>
                                    <th scope="row"><label>우편번호</label></th>
                                    <td><input type="text" class="txt" name="member_post"
                                       class="form-control" id="sample4_postcode"
                                       value="${memberDTO.member_post}" placeholder="우편번호"
                                       required>
                                     <!--   <div id="btbt"> -->
                                          <input type="button" id="sample4_execDaumPostcode()"
                                             onclick="sample4_execDaumPostcode()" style="margin-left: -95px;" value="우편번호 찾기">
                                       <!-- </div> -->
                                       <div class="invalid-feedback">우편번호를 입력해주세요.</div></td>
                                 </tr>

                                 <tr>
                                    <th scope="row"><label>도로명주소</label></th>
                                    <td><input type="text" class="txt"
                                       name="member_addMain" id="sample4_roadAddress"
                                       value="${memberDTO.member_addMain}" placeholder="도로명주소"
                                       size="80" required>

                                       <div class="invalid-feedback">주소를 입력해주세요.</div>
                                 </tr>

                                 <tr>
                                    <th scope="row"><label>상세주소</label></th>
                                    <td><input type="text" class="txt" name="member_addSub"
                                       id="sample4_detailAddress"
                                       value="${memberDTO.member_addSub}" placeholder="상세주소"
                                       size="80">
                                 </tr>

                                 <tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                     <div class="btn_center">
                        <button type="submit" class="btn_blue_style2" id="img_submit">
                           <span style="color: #fff; text-align: center;">수정하기</span>
                        </button>
                        <button id="withdrawBtn" onclick="withdraw()" class="btn_blue_style2">
							<span style="color: #fff; text-align: center;">회원탈퇴</span>
						</button>
                     </div>
                  </form>
               </div>

               <!-- 서영 찜페이지 만드는중 -->
               <div id="menu5_cont" style="width: 780px; margin-left:24%; margin-top: 33px;">
                  <div class="container">
                     <h4>내 찜 목록</h4> 
                    <!--  <label for="selectAllCheckbox"> -->
                     <div style="float: right; margin-bottom: 6px;">
					<button class="site-btn" id="deleteSelectedButton">선택 삭제</button>			
					<button class="site-btn" id="deleteAllButton" >전체 삭제</button>
					</div>
                     <!-- </label> --> 
					<!-- 
                     <button id="deleteSelectedButton" style="border:none;">선택 삭제</button>
                     <button id="deleteAllButton" style="border:none;">전체 삭제</button> -->
                     <div style="clear: right;">
                     <ul class="favorite-list">
                     
                     <c:if test="${empty zzimlist}">
					  <li class="empty-list">찜 목록이 비어있습니다.</li>
					</c:if>
                     
                        <c:forEach var="item" items="${zzimlist}">
                           <li class="favorite-item" data-item-num="${item.item_num}">
                              <input type="checkbox" class="checkbox"> <a
                              href="farmStoreDetail?item_num=${item.item_num}"> <img
                                 src="${item.item_mainImg}" alt="제품 이미지"></a>
                              <div class="product-info">
                                 <a href="farmStoreDetail?item_num=${item.item_num}"></a>
                                 <h2 class="product-name">${item.item_name}</h2>
                                 <span class="product-price">₩${item.item_price}</span> <br>
                                 <span class="store-name">${item.seller_storeName}</span>
                              </div>
                              <button class="remove-button" id="remove-button">X</button>
                           </li>
                        </c:forEach>
                     </ul>
                     </div>
                     <!-- 페이징 처리를 위한 페이지 네비게이션 추가 -->
                     <div class="pagination">
                        <button class="prev-page">이전</button>
                        <div class="page-numbers">
                           <!-- 여기에 동적으로 페이지 번호를 생성할 예정입니다.-->
                        </div>
                        <button class="next-page">다음</button>
                     </div>
                  </div>
               </div>
               <!--  서영 찜페이지 끝 -->


               <div id="menu2_cont" style="width: 780px; margin-left:24%; margin-top: 45px;">
                  <h4>주문관리</h4>
                  <table class="table" style="margin-top:5px;">
                     <thead>
                        <tr style="text-align: center;">
                           <th>주문번호</th>
                           <th>상품명</th>
                           <th>가격</th>
                           <th>주문상태</th>
                           <th>배송조회</th>
                           <th>변경</th>
                        </tr>
                     </thead>

                     <tbody id="inquiryList">
                        <c:forEach var="order" items="${orderList}">
                           <tr class="orderRow">
                              <td class="orderNum"><a href="javascript:void(0);"
                                 class="viewDetails" data-order="${order.order_num}">${order.order_num}</a>
                              </td>
                              <td>${order.item_name}···</td>
                              <td>\ ${order.order_pay}원</td>
                              <td>${order.order_cancel eq 'Y' ? '주문 취소' : '결제완료'}</td>
                              <td><a href="javascript:void(0);" onclick="openPopup()">
                              <input type="button" value="배송조회" id="orderBtn"></a></td>
								

                              <td>
                              <c:choose>
                              <c:when test="${order.order_cancel eq 'Y'}">
                             <input type="button" id="orderBtn" class="cancelList" data-order="${order.order_num}" value="취소확인" onclick="openCancelPopup(${order.order_num});">
                                 </c:when>
                                   <c:otherwise>
                                       <input type="button" class="orderCancelButton" id="orderBtn"
                                		 data-order="${order.order_num}" value="주문취소">
                                   </c:otherwise>
                                 </c:choose>
                                 </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>


               <!-- 주문관리 토글 끝  -->	
			
			<div id="menu3_cont" style="width: 780px; margin-left: 24%; margin-top: 45px;">
			<h4>나의 리뷰</h4>
			<div style="float: right; margin-bottom: 6px;">
			<button class="site-btn" id="edit-review-button">수정</button>			
			<button class="site-btn" id="delete-review-button" >삭제</button>
			</div>
				<div id="edit-review-popup" style="display:none; position: fixed; top: 50%; left: 50%; 
				transform: translate(-50%, -50%);  width: 600px; height: 370px; border: 1px solid #ccc;
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
            				<textarea name="review_content" id="review_content"  cols="80" rows="4" style="font-size:12px;" placeholder="내용을 입력해주세요. 최대 300자까지 작성 가능합니다." required maxlength="300"></textarea><br>
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
<!--            					<th>내용</th> -->
           					<th>작성일</th>
<!--  							<th>이미지</th> -->
           					</tr>
        					</thead>
        					<tbody>
        					</tbody>
    					</table>
    				<div class="pagination">
    					<span class="prev-page1">이전</span>
    					<div class="page-numbers1"></div>
    					<span class="next-page1">다음</span>
					</div>
				</div>
			</div>
               
               <div id="menu4_cont" style="width: 780px; margin-left:24%; margin-top: 45px;">
                  <h4>1:1문의</h4>
                  <input type="hidden" id="member_num"
                     value="${sessionScope.member_num}">

                  <table class="table" style="margin-top: 5px;">
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
                     
						<c:if test="${empty oneBoardList2}">
						  <tr class="no-records-message">
						    <td colspan="5">작성된 문의글이 존재하지 않습니다.</td>
						  </tr>
						</c:if>
                        <!-- 여기에 문의 내용이 추가됩니다. -->
                        <c:forEach var="row" items="${oneBoardList2}">
                           <tr class="inquiry-item"
                              onclick="handleRowClick('${row.one_board_private}' == '비공개', ${row.one_board_num}, '${row.one_board_pass}', 'boardPassword${row.one_board_num}');">
                              <td>${row.item_name}</td>
                              <td>${row.one_board_repYn}</td>
                              <td>${row.one_board_type}</td>
                              <td>${row.one_board_title}</td>
                              <td>${row.one_board_day}</td>
                           </tr>

                           <c:choose>
                              <c:when
                                 test="${row.one_board_private eq '비공개' and sessionScope.member_num eq row.member_num}">
                                 <tr class="boardContent"
                                    id="password_row${row.one_board_num}" style="display: none;">
                                    <td colspan="5">비밀번호: <input type="password"
                                       id="boardPassword${row.one_board_num}" />
                                       <button
                                          onclick="checkPassword('${row.one_board_pass}', ${row.one_board_num}, 'boardPassword${row.one_board_num}')">확인</button>
                                    </td>
                                 </tr>
                                 <!-- 비밀번호 확인 후 나타납니다. -->
                                 <tr class="boardContent" id="question${row.one_board_num}"
                                    data-one-board-num="${row.one_board_num}"
                                    style="display: none;">
                                    <!-- 여기에 공개 글일 때 나오는 질문 파트 -->
                                    <td colspan="5">
                                       <div class="image">
                                          <strong>Q:</strong>
                                          <c:if
                                             test="${row.one_board_file != null && not empty row.one_board_file}">
                                             <img src="${row.one_board_file}" />
                                          </c:if>
                                          <div class="content">${row.one_board_content}</div>
                                       </div>
                                        <div style="margin: 1px;"> 
									        <button type="button" class="edit-button" onclick="openEditPopup('${row.one_board_num}');">수정하기</button>
									        <button type="button" class="edit-button" onclick="deleteBoard(${row.one_board_num});">삭제하기</button>
									    </div>
                                    </td>
                                 </tr>
                                 <tr class="boardContent" id="answer${row.one_board_num}"
                                    data-one-board-num="${row.one_board_num}"
                                    style="display: none;">
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
                              <c:when
                                 test="${row.one_board_private eq '비공개' and sessionScope.member_num ne row.member_num}">
                                 <tr class="boardContent" id="answer${row.one_board_num}"
                                    data-one-board-num="${row.one_board_num}"
                                    style="display: none;">
                                    <td colspan="5">비공개된 게시글입니다.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <tr class="boardContent" id="question${row.one_board_num}"
                                    data-one-board-num="${row.one_board_num}"
                                    style="display: none;">
                                    <td colspan="5">
                                       <div class="image">
                                          <strong>Q:</strong>
                                          <c:if
                                             test="${row.one_board_file != null && not empty row.one_board_file}">
                                             <img src="${row.one_board_file}" />
                                          </c:if>
                                          <div class="content">${row.one_board_content}</div>
                                       </div>
                                       <div>
									       <button type="button" class="edit-button" onclick="openEditPopup('${row.one_board_num}');">수정하기</button>
									       <button type="button" class="edit-button" onclick="deleteBoard(${row.one_board_num});">삭제하기</button>
									    </div>
                                    </td>
                                 </tr>
                                 <tr class="boardContent" id="answer${row.one_board_num}"
                                    data-one-board-num="${row.one_board_num}"
                                    style="display: none;">
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
                  <div class="inquiry-pagination">
                     <button class="inquiry-prev-page">이전</button>
                     <div class="inquiry-page-numbers"></div>
                     <button class="inquiry-next-page">다음</button>
                  </div>
               </div>
			</div>
		</div>
	</div>	
   </section>


   <jsp:include page="../bottom.jsp"></jsp:include>

   <!-- Js Plugins -->
   <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>







   <script>  
   
   let error = '<%=request.getParameter("error")%>';
   
   <%--   let seller = '<%=request.getParameter("seller")%>'; --%>
     if (error !== 'null' && error !== null && error !== undefined) {
         alert(error);
     }
   
   
$(document).ready(function () {
    let allReviews = [];
    let currentPage = 1;
    const perPage = 4;

    function getItemMyReview(pageNumber) {
        var member_num = '<%= request.getSession().getAttribute("member_num") %>';
        
        if (member_num) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/getItemMyReview",
                data: { 
                    member_num: member_num,
                    page: pageNumber
                },
                dataType: "json",
                success: function (myreview) {
                	allReviews = myreview.sort((a, b) => {
                        if (parseInt(b.review_day) === parseInt(a.review_day)) {
                            return b.review_num - a.review_num;
                        } else {
                            return parseInt(b.review_day) - parseInt(a.review_day);
                        }
                    });
                	
                    
                    if (myreview.length === 0) {
                        $("#getItemMyReview tbody").html("<tr><td colspan='6' style='text-align:center;'>리뷰가 없습니다.</td></tr>");
                    } else {
                        var startIndex = (currentPage - 1) * perPage;
                        var endIndex = startIndex + perPage;
                        var currentReviews = allReviews.slice(startIndex, endIndex);
                        displayReviews(currentReviews);
                    }

                    // 페이지네이션 업데이트
                    updatePagination();
                },
                error: function () {
                    alert("리뷰를 가져오는 데 실패하였습니다. 페이지를 새로 고치거나 나중에 다시 시도해 주십시오.");
                }
            });
        } else {
            alert('로그인이 필요합니다.');
        }
    }

    function displayReviews(reviews) {
        var rows = "";

        for (var i = 0; i < reviews.length; i++) {
            var review = reviews[i];
            rows += "<tr>" +
                "<td><input type='checkbox' data-member_num='" + review.member_num + "'data-review_num='"+ review.review_num +"' class='review-checkbox' id='review_" + (i + 1) + "' name='review_" + (i + 1) + "'></td>" +
                "<td class='review-star'>" + review.review_star + "</td>" +
                "<td><a href='/FarmProject/farmStoreDetail?item_num=" + review.item_num + "' " +
                "onclick='event.preventDefault(); window.location.href=\"/FarmProject/farmStoreDetail?item_num=" + review.item_num + "\";'>" +
                review.item_name + "</a></td>" +
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
        $("#getItemMyReview tbody").html(rows);

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

        document.querySelector(".prev-page1").onclick = function () {
            if (currentPage > 1) {
                currentPage--;
                getItemMyReview(currentPage);
            }
        };
        document.querySelector(".next-page1").onclick = function () {
            if (currentPage < totalPages) {
                currentPage++;
                getItemMyReview(currentPage);
            }
        };

        var pageNumbers = document.querySelector(".page-numbers1");
        pageNumbers.innerHTML = "";
        // 수정된 반복문은 현재 페이지 번호와 totalpages를 비교하여 추가합니다.
        for (var i = 1; i <= totalPages; i++) {
            var pageNumber = document.createElement("span");
            pageNumber.className = "page-number";
            pageNumber.textContent = i;

            pageNumber.onclick = (function (i) {
                return function () {
                    currentPage = i;
                    getItemMyReview(currentPage);
                };
            })(i);

            if (i === currentPage) {
                pageNumber.classList.add("active");
            }

            pageNumbers.appendChild(pageNumber);
        }
    }

    // 페이지 로딩 시 getItemMyReview 함수를 호출하여 리뷰를 표시합니다.
    getItemMyReview(currentPage);
});

</script>

   <!-- 주문관리 팝업 : 상세내용 -->
   <script type="text/javascript">
$(document).ready(function() {
    $(".viewDetails").click(function() {
        var orderNum = $(this).data("order");
        var memberNum = ${memberDTO.member_num}; // session에서 가져오거나 페이지에서 설정

        // 새로운 팝업 창 열기
        var popup = window.open("", "_blank", "width=800,height=500");

        // 팝업 창에 내용 작성
        popup.document.write("<html><head><title>주문 상세 내역</title>");
        popup.document.write("<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/popup-style.css'>");
        popup.document.write("</head><body>");

        popup.document.write("<h2>주문 상세 내역 - 주문번호: " + orderNum + "</h2>");
        popup.document.write("<div id='orderDetailTable'></div>");
        
        // 서버에서 데이터 가져와서 표시
        $.ajax({
            url: "getOrderDetail",
            data: { member_num: memberNum, order_num: orderNum },
            dataType: "json",
            success: function(data) {
                var orderDetailTable = popup.document.getElementById("orderDetailTable");
                orderDetailTable.innerHTML = "<h3>주문 상세 정보</h3>";
                
                var tableHtml = "<table>";
                tableHtml += "<thead><tr><th>상품명</th><th>수량</th><th>가격</th><th>total</th></tr></thead><tbody>";

                for (var i = 0; i < data.length; i++) {
                    tableHtml += "<tr>";
                    tableHtml += "<td><a href='#' onclick='event.preventDefault(); window.opener.location.href=\"/FarmProject/farmStoreDetail?item_num=" + data[i].item_num + "\"; window.close();'>" + data[i].item_name + "</a></td>";
                    tableHtml += "<td>" + data[i].item_cnt + "</td>";
                    tableHtml += "<td>" + data[i].item_price + "</td>";
                    tableHtml += "<td>" + data[i].price + "원</td>";
                    tableHtml += "</tr>";
                }  
 
                tableHtml += "</tbody></table>";
                orderDetailTable.innerHTML += tableHtml;
                orderDetailTable.innerHTML += "<div style='margin-bottom: 20px;'></div>";
                
                orderDetailTable.innerHTML += "<h3>주문/배송정보</h3>";

                var orderInfo = data[0]; // 주문/배송 정보는 첫 번째 요소로 가정

                var tableHtml2 = "<table>";
                tableHtml2 += "<thead><tr><th>주문자</th><th>주소</th><th>상세주소</th><th>요청메시지</th><th>연락처</th></tr></thead><tbody>";

                tableHtml2 += "<tr>";
                tableHtml2 += "<td>"+orderInfo.order_name+"</td>";
                tableHtml2 += "<td>" + orderInfo.order_addMain+ "</td>";
                tableHtml2 += "<td>" + orderInfo.order_addSub + "</td>";
                tableHtml2 += "<td>" + orderInfo.order_msg+"</td>";
                tableHtml2 += "<td>" + orderInfo.order_phone+"</td>";
                tableHtml2 += "</tr>";

                tableHtml2 += "</tbody></table>";

                orderDetailTable.innerHTML += tableHtml2;
 
                // 팝업 창 닫기 버튼 추가
                popup.document.write('<div style="text-align: center; margin-top: 20px;"><button onclick="window.close()">닫기</button></div>');
 
                popup.document.write("</body></html>");
            } 
        });
    });
});
    </script>


   <script type="text/javascript">
    // 주문 취소 버튼 클릭 시
   $(document).ready(function() {
    $(".orderCancelButton").click(function() {
       var orderNum = $(this).data("order");
        var popup = window.open("", "_blank", "width=480,height=300");
        console.log(orderNum);

        // 팝업 창에 내용 작성
        var popupContent = generatePopupContent(orderNum);
        popup.document.write(popupContent);

        var confirmButton = popup.document.getElementById("confirmCancel");
        confirmButton.addEventListener("click", function() {
           var selectedType = popup.document.getElementById("cancel_type").value;
           var detailedReason = popup.document.getElementById("cancel_reason").value;

            $.ajax({
                url: "cancelOrder", // 주문 취소를 처리하는 서버 API URL
                method: "POST",
                data: { 
                     orderNum: orderNum,
                      cancel_reason: detailedReason,
                      cancel_type: selectedType},
                success: function(response) {
                    if (response.success) {
                        alert("주문이 취소되었습니다.");
                        location.reload();
                    } else {
                        alert("주문 취소가 취소되었습니다.");
                    }
                    // 팝업 창 닫기
                    popup.close();
                },
                error: function() {
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            });
        });
    }); 
});


function generatePopupContent(orderNum) {
   console.log(orderNum);
   
   return `
    <html>
    <head>
        <title>주문 취소</title>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/popup-style.css'>
    </head>
    <body>
        <h2>주문 취소 - 주문번호: ` + orderNum + `</h2>
        <p>취소 사유: 
            <select id='cancel_type'>
                <option value=''>사유를 선택해주세요</option>
                <option value='불량'>상품 불량</option>
                <option value='주문오류'>다른 상품을 주문함</option>
                <option value='기타'>기타</option>
            </select>
        </p>
        <p>상세 취소 사유:</p>
        <textarea id='cancel_reason' rows='4' cols='50'></textarea>
        <div id='btnbox'>
        <button id="confirmCancel">주문 취소</button>
        <button onclick="window.close()">닫기</button>
        </div>
    </body>
    </html>`;
	}
// ---------------(취소된 내역)
 

 
</script>

   <!-- 주문취소 끝 -->

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
    } else {
      formData.append("review_image", "");
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

// 선택 삭제
   $("#deleteSelectedButton").click(function () {
     const member_num = <%= session.getAttribute("member_num") %>;
     const checkedItems = $(".checkbox:checked");
     const checkedCount = checkedItems.length;
     let successCount = 0;

     checkedItems.each(function () {
       const listItem = $(this).closest(".favorite-item");
       const item_num = listItem.attr("data-item-num");

       deleteFromWishlist(member_num, item_num, function (response) {
         if (response.message == "찜 목록에서 상품이 삭제되었습니다.") {
           successCount++;

           if (successCount === checkedCount) {
        	 checkedItems.closest(".favorite-item").remove();
             alert("선택한 상품이 찜 목록에서 삭제되었습니다.");
           }
         }
       });
     });
   });

   // 전체 삭제
   $("#deleteAllButton").click(function () {
     const member_num = <%= session.getAttribute("member_num") %>;
     const allItems = $(".checkbox");
     const allItemCount = allItems.length;
     let successCount = 0;

     allItems.each(function () {
       const listItem = $(this).closest(".favorite-item");
       const item_num = listItem.attr("data-item-num");

       deleteFromWishlist(member_num, item_num, function (response) {
         if (response.message == "찜 목록에서 상품이 삭제되었습니다.") {
           successCount++;

           if (successCount === allItemCount) {
        	 allItems.closest(".favorite-item").remove();
             alert("찜 목록에서 모든 상품이 삭제되었습니다.");
           }
         }
       });
     });
   });

   $("#menu5_cont").on("click", "#remove-button", function () {
	   const member_num = <%= session.getAttribute("member_num") %>;
	   const listItem = $(this).closest(".favorite-item");
	   const item_num = listItem.attr("data-item-num");

	   deleteFromWishlist(member_num, item_num, function (response) {
	     if (response.message == "찜 목록에서 상품이 삭제되었습니다.") {
	    	listItem.remove();
	        alert("상품이 찜 목록에서 삭제되었습니다.");
	     }
	   });
	 });

   function openEditPopup(oneBoardNum) {
	    var popupURL = "updateoneboard?one_board_num=" + oneBoardNum;
	    var popupWindow = window.open(popupURL, "EditPopup", "width=800, height=1000, scrollbar=yes, resizable=yes");
	    popupWindow.focus();
	}
   </script>

   <script>
   $(document).ready(function() {
     // 총 데이터 개수와 한 페이지당 항목 개수를 설정하세요.
     var totalItems = ${zzimlist.size()};
     var itemsPerPage = 10;
   
     // 페이지 번호를 생성하세요.
     var totalPages = Math.ceil(totalItems / itemsPerPage);
     for (var i = 1; i <= totalPages; i++) {
       $(".page-numbers").append('<button class="page-number">' + i + '</button>');
     }
   
     // 초기 페이지 내용을 표시하세요.
     showPageItems(1, itemsPerPage);
   
     // 페이지 번호 클릭 이벤트를 설정하세요.
     $(document).on("click", ".page-number", function() {
       var pageNumber = $(this).text();
       showPageItems(pageNumber, itemsPerPage);
     });
   
     // 이전 페이지 버튼 이벤트를 설정하세요.
     $(".prev-page").click(function() {
       var currentPage = $(".page-number.active").text();
       if (currentPage > 1) {
         showPageItems(currentPage - 1, itemsPerPage);
       }
     });
   
     // 다음 페이지 버튼 이벤트를 설정하세요.
     $(".next-page").click(function() {
       var currentPage = $(".page-number.active").text();
       if (currentPage < totalPages) {
         showPageItems(parseInt(currentPage) + 1, itemsPerPage);
       }
     });
   
     // 페이지 항목을 표시하는 함수를 만드세요.
     function showPageItems(page, itemsPerPage) {
       $(".favorite-item").hide();
       $(".favorite-item").slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
       $(".page-number").removeClass("active");
       $(".page-number:eq(" + (page - 1) + ")").addClass("active");
     }
   });
   
   $(document).ready(function() {
	   $(".inquiry-item").hide();

        // 총 데이터 개수와 한 페이지당 항목 개수를 설정하세요.
        var totalInquiryItems = ${oneBoardList2.size()};
        var inquiryItemsPerPage = 8;

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

   <script>
$(document).ready(function() {
  // "수정하기" 버튼 클릭 이벤트 처리
  $('#img_submit').click(function(e) {
	e.preventDefault();

    // 입력 필드의 값을 가져옵니다.
    var currentPassword = $('#member_pass').val();
    var newPassword = $('#new_member_pass').val();
    var confirmPassword = $('#pwd2').val();

    // 입력값이 유효한지 검사합니다.
    if (currentPassword.trim() === '' || newPassword.trim() === '' || confirmPassword.trim() === '') {
      alert('비밀번호를 입력해주세요.');
      return;
    }

    if (newPassword !== confirmPassword) {
      alert('새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않습니다.');
      return;
    }
    if (newPassword !== '' && confirmPassword !== '') {
        $(this).unbind(e);
      }
  });
 }); 
    
	function openPopup() {
  		var width = 500;
  		var height = 800;
  		var left = (window.innerWidth - width) / 2;
  		var top = (window.innerHeight - height) / 2;
  
  		var popup = window.open('parcel', 'popupWindow', 'height=' + height + ',width=' + width + ',left=' + left + ',top=' + top);
  			popup.focus();
	}
	
	function withdraw() {
		  const result = confirm("정말로 탈퇴하시겠습니까?");
		  event.preventDefault();
		  if (result === true) {
		    // 폼 데이터 전송
		    
		    const form = $('<form>', {
		      'action': '${pageContext.request.contextPath }/withdrawPro',
		      'method': 'GET'
		    }).append($('<input>', {
		      'name': 'member_id',
		      'value': $('#member_id').val() // id 값 전송
		    })).append($('<input>', {
		      'name': 'member_pass',
		      'value': $('#member_pass').val() // 비밀번호 값 전송
		    })).append($('<input>', {
		      'name': 'withdraw',
		      'value': 'withdraw' // 회원 탈퇴 기능을 처리하는 값을 전송
		    })).appendTo('body').submit();
		    $(this).unbind(event);
		  } else {
		    // 취소 버튼을 클릭한 경우의 처리
		    alert("회원 탈퇴가 취소되었습니다.");
		   
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
</body>
</html>
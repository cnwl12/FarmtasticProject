<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 Q&amp;A</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/oneboard.css" type="text/css">
	<style>
	textarea#one_board_content {
  position: relative;
}

.content_char_count_wrapper {
  position: absolute;
  right: 0;
  bottom: -20px;
}
	
	</style>
</head>
<body>
  <div class="inquiry-container">
    <h1>상품 Q&amp;A</h1>
    <form action="oneboardForm" method="post" enctype="multipart/form-data">
      <input type="hidden" name="action" value="write">
		<%! int item_num; %>
		<%
		item_num = Integer.parseInt(request.getParameter("item_num"));
		%>      
		<input type="hidden" name="item_num" value="<%= item_num %>">
		 <input type="hidden" name="member_num" value="${sessionScope.member_num}">
      <label for="one_board_type">문의유형</label>
      <select name="one_board_type" id="one_board_type">
        <option value="배송">배송</option>
        <option value="상품">상품</option>
        <option value="환불">환불</option>
        <option value="기타">기타</option>
      </select><br>
      
      <label for="one_board_title">제목</label>
      <input type="text" name="one_board_title" id="one_board_title" required><br>
      
      <label for="one_board_content">내용</label>
		<div style="position: relative;">
		  <textarea name="one_board_content" id="one_board_content" rows="4" cols="50" required onkeyup="updateContentCharCount()" maxlength="200" style="display: block; width: 100%;"></textarea>
		  <div class="content_char_count_wrapper" style="position: absolute; right: 0; bottom: -20px;">
		    <span id="content_char_count">0자</span>
		    <span>/200자</span>
		  </div>
		</div>


      
      <label for="one_board_file">첨부파일</label>
      <input type="file" name="one_board_file" id="one_board_file"><br>
      
     <div class="radio-container">
		<label for="public">공개</label>
		<div>
			<input type="radio" name="one_board_private" id="public" value="공개" checked>
		</div>
		  	<label for="private">비공개</label>
		<div>
		    <input type="radio" name="one_board_private" id="private" value="비공개">
		</div>
	</div>
	<br>
      
      <label for="one_board_pass">작성비밀번호</label>
      <input type="password" name="one_board_pass" id="one_board_pass" required><br>
      
      <input type="submit" value="작성하기">
    </form>
  </div>
  <script>
  function updateContentCharCount() {
	  var contentTextarea = document.getElementById('one_board_content');
	  var contentCharCountSpan = document.getElementById('content_char_count');
	  if (contentTextarea && contentCharCountSpan) {
	    var charCount = contentTextarea.value.length;
	    contentCharCountSpan.innerHTML = charCount + '자';
	  } else {
	    console.error('Cannot find content textarea element with id "one_board_content" or contentCharCountSpan element.');
	  }
	}

	window.onload = function() {
	  var contentTextarea = document.getElementById('one_board_content');
	  if(contentTextarea) {
	    contentTextarea.addEventListener("keyup", updateContentCharCount);
	  } else {
	    console.error('Cannot find content textarea element with id "one_board_content" to attach event listener.');
	  }
	};

  </script>
</body>
</html>
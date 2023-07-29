<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 Q&amp;A</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/oneboard.css" type="text/css">
</head>
<body>
  <div class="inquiry-container">
    <h1>상품 Q&amp;A</h1>
    <form action="oneboardForm" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="action" value="write">
      <input type="hidden" name="item_num" value="${item.item_num}">
      
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
      <textarea name="one_board_content" id="one_board_content" rows="4" cols="50" required></textarea><br>
      
      <label for="one_board_file">첨부파일</label>
      <input type="file" name="one_board_file" id="one_board_file"><br>
      
     <div class="radio-container">
		<label for="public">공개</label>
		<div>
			<input type="radio" name="one_board_private" id="public" value="public" checked>
		</div>
		  	<label for="private">비공개</label>
		<div>
		    <input type="radio" name="one_board_private" id="private" value="private">
		</div>
	</div>
	<br>
      
      <label for="one_board_pass">작성비밀번호</label>
      <input type="password" name="one_board_pass" id="one_board_pass" required><br>
      
      <input type="submit" value="작성하기">
    </form>
  </div>
</body>
</html>
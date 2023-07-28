<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>1대1 문의 작성 페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/oneboard.css" type="text/css">
</head>
<body>
  <h1>1대1 문의 작성 페이지</h1>
  <form action="OneBoardController" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="write">
    <%-- 상품고유번호 자동으로 가져오기 --%>
    <input type="hidden" name="item_num" value="${item.item_num}">
    문의유형: <select name="one_board_type">
                <option value="배송">배송</option>
                <option value="상품">상품</option>
                <option value="환불">환불</option>
                <option value="기타">기타</option>
             </select><br>
    제목: <input type="text" name="one_board_title"><br>
    내용: <textarea name="one_board_content" rows="4" cols="50"></textarea><br>
    첨부파일: <input type="file" name="one_board_file"><br>
    작성비밀번호: <input type="password" name="one_board_pass"><br>
    <input type="submit" value="작성하기">
  </form>
</body>
</html>
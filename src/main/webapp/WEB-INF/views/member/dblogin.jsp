<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB_Test</title>
</head>
<body>


<!-- action="프로젝트명/member/insertPro" -->
<!-- 프로젝트명 <%-- <%=request.getContextPath() %> --%> 대신  -->
<form action="${pageContext.request.contextPath}/loginPro" method="post">
						<!-- 절대경로 프로젝트명 / 폴더 / 파일이름  -->
아이디 : <input type="text" name="member_id"><br>
비밀번호 : <input type="password" name="member_pass"><br>
<input type="submit" value="로그인">
</form>



</body>
</html>
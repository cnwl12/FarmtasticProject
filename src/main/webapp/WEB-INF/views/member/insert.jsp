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
<form action="${pageContext.request.contextPath}/insertPro" method="post">
						<!-- 절대경로 프로젝트명 / 폴더 / 파일이름  -->
회원번호 : <input type="text" name="member_num" ><br><!--name값은 테이블 생성할 때 이름이랑 맞춰주는게 좋음   -->
아이디 : <input type="text" name="member_id"><br><!--name값은 테이블 생성할 때 이름이랑 맞춰주는게 좋음   -->
비밀번호 : <input type="password"	name="member_pass"><br>
이름 : <input type="text"	name="member_name"><br>
<input type="submit" value="회원가입">
</form>



</body>
</html>
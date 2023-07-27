<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sellerUpdate</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/sellerUpdatePro" method="post">
이름 <input type="text" name="seller_name" value="${seller.seller_name}" readonly="readonly"><br>
아이디 <input type="text" name="seller_id" value="${seller.seller_id}" readonly="readonly"><br>
이메일 <input type="text" name="seller_email" value="${seller.seller_email}" ><br>
휴대폰 <input type="text" name="seller_nmobile" value="${seller.seller_nmobile}" ><br>
<input type="submit" value="회원정보수정">
</form>

</body>
</html>
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
휴대폰 <input type="text" name="seller_mobile" value="${seller.seller_mobile}" ><br>
은행명 <input type="text" name="seller_bank" value="${seller.seller_bank}" ><br>
계좌번호 <input type="text" name="seller_accountNo" value="${seller.seller_accountNo}" ><br>
예금주 <input type="text" name="seller_accountHolder" value="${seller.seller_accountHolder}" ><br>
우편번호 <input type="text" name="seller_post" value="${seller.seller_post}" ><br>
일반주소 <input type="text" name="seller_addMain" value="${seller.seller_addMain}" ><br>
상세주소 <input type="text" name="seller_addSub" value="${seller.seller_addSub}" ><br>

<input type="submit" value="회원정보수정">
</form>

</body>
</html>
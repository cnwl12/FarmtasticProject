<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 로그인 페이지</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
        Kakao.init('fa74773a794ad7a254e291d7cbf8fd00');

        Kakao.Auth.authorize({
        	redirectUri: "http://localhost:8080/farmtastic/kakaocallback",
        });
    </script>

</head>
<body>
    <% if (session.getAttribute("kakaoAccessToken") != null) { %>
        로그인 되었습니다. access_token: <%= session.getAttribute("kakaoAccessToken") %>
    <% } %>
</body>
</html>

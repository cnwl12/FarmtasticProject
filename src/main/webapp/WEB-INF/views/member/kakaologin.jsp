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

        window.onload = function() {
            Kakao.Auth.login({
                success: function(authObj) {
                    // 로그인에 성공하면, authObj.access_token이 발급됩니다.
                    location.href = "<%= request.getContextPath() %>/kakaocallback?access_token=" + authObj.access_token;
                },
                fail: function(err) {
                    alert('카카오 로그인에 실패하였습니다.');
                }
            });
        }
    </script>
</head>
<body>
   
</body>
</html>

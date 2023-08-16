<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 로그인 페이지</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript">
        // SDK 초기화
        Kakao.init('fa74773a794ad7a254e291d7cbf8fd00');

        //카카오 로그인 페이지 띄우기 함수
        function openKakaoLoginForm() {
            Kakao.Auth.login({
                success: function(authObj) {
                    // 로그인 성공, authObj에 access_token, refresh_token 등이 담겨있습니다.
                    location.href = "http://localhost:8080/farmtastic/kakaocallback?access_token=" + authObj.access_token;
                },
                fail: function(err) {
                    // 로그인 실패, 에러메시지 alert로 출력
                    alert(JSON.stringify(err));
                }
            });
        }

        openKakaoLoginForm(); //페이지 로딩 시 카카오 로그인 페이지 열기
    </script>
</head>
<body>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 간편로그인</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript">
        // SDK 초기화
        Kakao.init('fa74773a794ad7a254e291d7cbf8fd00');

        // 카카오 로그인 팝업 창을 자동으로 띄우는 코드
        // 페이지 로딩 시 자동 실행 됩니다.
        Kakao.Auth.authorize({
            redirectUri: "http://localhost:8080/farmtastic/kakaocallback",
            success: function(res) {
                var code = res.code; // code 값 가져오기
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'http://localhost:8080/farmtastic/kakaocallback', true); // POST 방식으로 변경
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function() {
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        // 서버로부턴 응답을 처리하는 코드
                        console.log(this.responseText);
                    }
                };
                xhr.send('code=' + code); // code 서버로 전송
            },
            fail: function(err) {
                alert(JSON.stringify(err));
            }
        });
    </script>
</head>
<body>
    
</body>
</html>

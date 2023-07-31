<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>성공</title>
    <script>
        // 페이지가 완전히 로드된 후 부모 창(farmStoreDetail.jsp)을 새로고침하고 창을 닫습니다.
        window.onload = function() {
            try {
                window.opener.location.reload(); // 부모 창 새로고침
            } catch (e) {
                console.error("부모 창을 새로 고침하는데 실패했습니다: ", e);
            }
            window.close(); // 현재 창 닫기
        }
    </script>
</head>
<body>
    <h1>성공!</h1>
    <p>작성이 완료되었습니다. 이 창은 곧 닫힙니다.</p>
</body>
</html>


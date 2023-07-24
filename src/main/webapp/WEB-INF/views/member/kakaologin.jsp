<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>카카오 로그인</title>
</head>
<body>
  <div id="kakaoBtns">
    <%-- 카카오 로그인 버튼 --%>
    <button id="kakaoLoginBtn" onclick="loginWithKakao()">
      <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
    </button>

    <%-- 카카오 로그아웃 버튼 --%>
    <button id="kakaoLogoutBtn" onclick="kakaoLogout()">카카오 로그아웃</button>
  </div>

  <!-- 카카오 SDK 불러오기 -->
  <script src="//developers.kakao.com/sdk/js/kakao.js"></script>

  <script>
    // SDK 초기화
    Kakao.init('1ef18d20aa76028d368f461d227b4c8f');

    // 로그인 버튼 클릭 시 동작
    function loginWithKakao() {
      // 카카오 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          console.log('로그인 성공', authObj);
          // 카카오 로그인 성공 후 필요한 동작 수행하기
          // 예) 로그인 성공 콜백 jsp 파일로 이동
          location.href = "http://localhost:8080/farmtastic/kakaocallback";

          // 로그아웃 버튼 표시
          document.getElementById('kakaoLogoutBtn').style.display = 'inline';
        },
        fail: function(error) {
          console.log('로그인 실패', error);
        }
      });
    }

    // 로그아웃 버튼 클릭 시 동작
     function kakaoLogout() {
    Kakao.Auth.logout()
      .then(function() {
        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
        deleteCookie();
      })
      .catch(function() {
        alert('Not logged in');
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }
    // 카카오 앱 연결 상태에 따라 버튼 표시/숨김 처리
    Kakao.Auth.getStatus(function(statusObj) {
      if (statusObj.status == 'connected') {
        // 연결되어 있으면 로그아웃 버튼 표시
        document.getElementById('kakaoLogoutBtn').style.display = 'inline';
      } else {
        // 연결되어 있지 않으면 로그인 버튼 표시
        document.getElementById('kakaoLoginBtn').style.display = 'inline';
      }
    });
  </script>

</body>
</html>

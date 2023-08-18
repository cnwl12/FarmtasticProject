<%@page import="java.nio.charset.StandardCharsets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>

<%!
  final String CLIENT_ID = "fa74773a794ad7a254e291d7cbf8fd00"; // 카카오 REST API 키 입력
  final String KAKAO_LOGOUT_BASE_URL = "https://kauth.kakao.com/oauth/logout";
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>카카오 로그아웃</title>
</head>
<body>   
  <%   
    // 세션 객체 가져오기
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null) {
        // 세션 초기화 (로그아웃과 동일한 효과)
        sessionObj.invalidate();
    }
  
    try {
        // 카카오 로그아웃 처리를 위한 URL 생성하기
        String redirectUri = "http://c2d2303t2.itwillbs.com/FarmProject/main"; // 로그아웃 후 리다이렉트 될 페이지 주소
        String requestUrl = KAKAO_LOGOUT_BASE_URL + "?client_id=" + CLIENT_ID + "&logout_redirect_uri=" + URLEncoder.encode(redirectUri, StandardCharsets.UTF_8.name());
        // 카카오 로그아웃 처리하기
        response.sendRedirect(requestUrl); 
    } catch (Exception e) {
        out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
        return;
    }
  %>
</body>
</html>

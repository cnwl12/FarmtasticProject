<%@page import="java.nio.charset.StandardCharsets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>

<%!
  final String CLIENT_ID = "93a4658677400f85346634975b9da8d5"; // 카카오 REST API 키 입력
  final String KAKAO_LOGOUT_BASE_URL = "https://kauth.kakao.com/oauth/logout";
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>카카오 로그아웃</title>
</head>
<body>
  <%
try {
    // 카카오 로그아웃 처리를 위한 URL 생성하기
    String redirectUri = "http://localhost:8080/farmtastic/kakaoLogout"; // 로그아웃 후 리다이렉트 될 페이지 주소
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

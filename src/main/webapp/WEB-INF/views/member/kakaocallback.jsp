<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 카카오 로그인 API --%>
<%@ page import="java.net.URLEncoder,
    java.io.BufferedReader,
    java.io.InputStreamReader,
    java.io.OutputStreamWriter,
    java.net.HttpURLConnection"
    import="java.net.HttpURLConnection"
    import="java.net.URL"
    %>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 콜백</title>
</head>
<body>
<%
    String appKey = "93a4658677400f85346634975b9da8d5";
    String redirectUri = "http://localhost:8080/farmtastic/kakaoCallback";
    String code = request.getParameter("code");
    String apiUrl = "https://kauth.kakao.com/oauth/token";

    HttpURLConnection con = null;
    BufferedReader in = null;
    OutputStreamWriter outputStreamWriter = null;
    String result = "";

    try {
        // API 요청 전용 URL 생성
        String url = apiUrl
                + "?grant_type=authorization_code"
                + "&client_id=" + appKey
                + "&redirect_uri=" + URLEncoder.encode(redirectUri, "UTF-8")
                + "&code=" + code;

        // API 호출용 커넥션 객체 생성
        con = (HttpURLConnection) new URL(url).openConnection();
        con.setRequestMethod("POST");

        // API 호출용 파라미터 및 인코딩 설정
        con.setDoOutput(true);
        outputStreamWriter = new OutputStreamWriter(con.getOutputStream());
        outputStreamWriter.write("");
        outputStreamWriter.flush();

        // API 호출 및 결과값 수신
        int responseCode = con.getResponseCode();
        if (responseCode == 200) {
            in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String readLine = null;
            while ((readLine = in.readLine()) != null) {
                result += readLine;
            }
        }

        // 결과값 저장
        session.setAttribute("kakaoToken", result);
        response.sendRedirect("http://localhost:8080/farmtastic/kakaoUserInfo");
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (in != null) in.close();
            if (outputStreamWriter != null) outputStreamWriter.close();
            if (con != null) con.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
%>


</body>

</html>

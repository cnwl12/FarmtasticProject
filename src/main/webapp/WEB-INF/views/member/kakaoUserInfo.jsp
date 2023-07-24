<%-- <%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import = "org.json.JSONTokener"%>

<%
    // 토큰 검색
    String token = (String) session.getAttribute("kakaoToken");
    if (token == null) {
        response.sendRedirect("http://localhost:8080/farmtastic/login");
        return;
    }
    // 카카오 유저 정보 API URL 설정
    String apiUrl = "https://kapi.kakao.com/v2/user/me";

    HttpURLConnection con = null;
    BufferedReader in = null;
    String result = "";

    try {
        con = (HttpURLConnection) new URL(apiUrl).openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "Bearer " + token);

        int responseCode = con.getResponseCode();

        if (responseCode == 200) {
            in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String readLine;
            while ((readLine = in.readLine()) != null) {
                result += readLine;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 예외가 발생하면 null을 반환
        result = null;
    } finally {
        try {
            if (in != null) in.close();
            if (con != null) con.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 사용자 정보</title>
</head>
<body>

<h1>카카오 사용자 정보</h1>

<%
if (result == null) {
    out.println("사용자 정보를 검색할 수 없습니다.");
} else {
    JSONObject jsonResult = JSONValue.parse(result) != null ? (JSONObject) JSONValue.parse(result) : null;
    
    if(jsonResult == null){ // JSON 파싱이 실패한 경우
        result = null; // 사용자 정보를 검색하지 못하도록, result 변수를 null로 초기화
        out.println("오류가 발생했습니다. JSON 파싱에 실패했습니다.<br>");
    } else {
        JSONObject kakaoAccount = (JSONObject) jsonResult.get("kakao_account");
        String email = "";
        String phoneNumber = "";
        
        if (kakaoAccount != null) { // kakaoAccount 객체가 null이 아닌 경우에만 email, phoneNumber 정보를 가져옴
            email = (String) kakaoAccount.get("email");
            phoneNumber = (String) kakaoAccount.get("phone_number");
        }
        
        phoneNumber = phoneNumber.equals("") ? "없음" : phoneNumber;
        out.println("이메일: " + email + "<br>");
        out.println("전화번호: " + phoneNumber + "<br>");
    }
}
%>





<a href="http://localhost:8080/farmtastic/kakaoLogout">로그아웃</a>

</body>
</html>
 --%>
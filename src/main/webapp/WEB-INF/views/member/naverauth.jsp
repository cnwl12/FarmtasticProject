<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 프로필</title>
</head>
<body>
    <%
        String access_token = (String) session.getAttribute("accessToken");
        String apiUrl = "https://openapi.naver.com/v1/nid/me";
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + access_token);

        int responseCode = conn.getResponseCode();

        BufferedReader br;
        if (responseCode == 200) { // HTTP OK
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }

        String inputLine;
        StringBuffer respon = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            respon.append(inputLine);
        }
        br.close();
    %>
    <pre><%=respon.toString()%></pre>
</body>
</html>
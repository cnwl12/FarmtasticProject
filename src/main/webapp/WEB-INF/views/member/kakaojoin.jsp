<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.net.ssl.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.net.ssl.*"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%
    String accessToken = request.getParameter("access_token");
    String apiUrl = "https://kapi.kakao.com/v2/user/me";

    URL url = new URL(apiUrl);
    HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

    // Header에 Access Token 추가
    con.setRequestMethod("POST");
    con.setRequestProperty("Authorization", "Bearer " + accessToken);

    // 응답 받기
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if (responseCode == 200) {
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    } else {
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }
    String inputLine;
    StringBuilder kakaoApiResponse = new StringBuilder();
    while ((inputLine = br.readLine()) != null) {
        kakaoApiResponse.append(inputLine);
    }
    br.close();

    // JSON 파싱
    String json = kakaoApiResponse.toString();
    Map<String, Object> userInfo = new ObjectMapper().readValue(json, Map.class);
    String userId = userInfo.get("id").toString(); // 유저 ID
    String userNickname = userInfo.get("properties.nickname").toString(); // 유저 닉네임
    

    Connection con2 = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url2 = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
        con2 = DriverManager.getConnection(url2, "username", "password");

        // SQL 구문
        String sql = "SELECT * FROM users WHERE user_id = ?";
        pstmt = con2.prepareStatement(sql);
        pstmt.setString(1, userId);

        rs = pstmt.executeQuery();
        if (rs.next()) {
            // 이미 가입한 유저인 경우
            // ...
        } else {
            // 처음 가입하는 유저인 경우
            // ...
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException se) {
        se.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (con2 != null) try { con2.close(); } catch(SQLException ex) {}
    }


%>


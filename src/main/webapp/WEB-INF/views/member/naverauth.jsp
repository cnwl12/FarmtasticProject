<%@page import="com.itwillbs.dao.MemberDAO"%>
<%@page import="com.itwillbs.service.MemberService"%>
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
        
        org.json.JSONObject jsonObject = new org.json.JSONObject(respon.toString());
        org.json.JSONObject auth = jsonObject.getJSONObject("auth");

        String member_name = auth.getString("member_name");
        String member_email = auth.getString("member_email");
        String member_phone = auth.getString("member_phone");

        // 서비스(service)와 데이터 액세스 객체(dao)를 생성 또는 검색
        MemberService service = new MemberService();

        // MemberDTO 객체를 생성하고 추출된 프로필 정보를 설정
        com.itwillbs.domain.MemberDTO memberDTO = new com.itwillbs.domain.MemberDTO();
        memberDTO.setMember_name(member_name);
        memberDTO.setMember_email(member_email);
        memberDTO.setMember_nid("naver_member"); // 네이버아이디는 다른곳
        
        MemberDAO dao = new MemberDAO();
        
        try {
            dao.nuserCheck(memberDTO);
            out.println("회원가입 성공!");
        } catch (Exception e) {
            out.println("회원가입 실패: " + e.getMessage());
        }
    %>
    <pre><%=respon.toString()%></pre>
</body>
</html>
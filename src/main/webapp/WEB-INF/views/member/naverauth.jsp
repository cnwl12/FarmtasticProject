<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
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

        ServletContext servletContext = request.getSession().getServletContext();
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
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
        
        JSONObject jsonObject = new JSONObject(respon.toString());
        JSONObject naverResponse = jsonObject.getJSONObject("response");

        String member_name = naverResponse.getString("name");
        String member_email = naverResponse.getString("email");
        String member_phone = naverResponse.getString("mobile");
        String naver_id = naverResponse.getString("id");
        

        // MemberDTO 객체를 생성하고 추출된 프로필 정보를 설정
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMember_name(member_name);
        memberDTO.setMember_email(member_email);
        memberDTO.setMember_phone(member_phone);
        memberDTO.setMember_nid(naver_id); 
        
        MemberService memberservice = (MemberService) applicationContext.getBean("memberService");
        MemberDTO existingMember = memberservice.nuserCheck(memberDTO);
        if (existingMember != null) {
            // 로그인 처리
            System.out.println("로그인 성공!");
            request.getSession().setAttribute("login", member_name);
        } else {
            // 회원 가입 처리
            memberservice.ninsertMember(memberDTO);
            System.out.println("회원가입 성공!");
            request.getSession().setAttribute("login", member_name);
        }
        
        String result = "네이버 프로필 정보:</br>";
        result += "이름: " + member_name + "</br>";
        result += "이메일: " + member_email + "</br>";
        result += "휴대전화: " + member_phone + "</br>";
        result += "네이버아이디: " + naver_id;
        
//         try {
//             MemberDTO existingMember = service.nuserCheck(memberDTO);
//             if (existingMember != null) {
//                 // 로그인 처리
//                 out.println("로그인 성공!");
//             } else {
//                 // 회원 가입 처리
//                 service.ninsertMember(memberDTO);
//                 out.println("회원가입 성공!");
//             }
//         } catch (Exception e) {
//             out.println("처리 실패: " + e.getMessage());
//             e.printStackTrace();
//         }
    %>
    <p>${result}</p>
    <pre>${response}</pre>
</body>
</html>
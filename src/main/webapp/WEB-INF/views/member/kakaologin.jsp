<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.net.*,java.util.*, org.json.JSONObject"%>
<%@ page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="org.json.*" %>
<%
  String client_id = "93a4658677400f85346634975b9da8d5"; // REST API 키 값
  String client_secret = "93a4658677400f85346634975b9da8d5"; // REST API 시크릿 키 값
  String redirectUri = "http://localhost:8080/farmtastic/kakaoCallback"; // redirect URI 값
  String code = request.getParameter("code"); // 코드 값
  String apiURL;
  apiURL = "https://kauth.kakao.com/oauth/token?" 
          + "grant_type=authorization_code"
          + "&client_id=" + client_id 
          + "&client_secret=" + client_secret
          + "&redirect_uri=" + redirectUri
          + "&code=" + code; // 액세스 토큰 받아 올 주소

  try {
    URL url = new URL(apiURL);
    HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
    con.setRequestMethod("POST");
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) {
    br = new BufferedReader(new InputStreamReader(con.getInputStream()));    
    } else {
    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));  
    }
    String inputLine;
    StringBuffer res = new StringBuffer();
    while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
    }
    br.close();
    if(responseCode==200) {
    
    	JSONObject jsonObj = new JSONObject(res.toString());
       
        String access_token = (String)jsonObj.get("access_token");
        String url2 = "https://kapi.kakao.com/v2/user/me";
        URL obj2 = new URL(url2);
        HttpsURLConnection con2 = (HttpsURLConnection)obj2.openConnection();
        con2.setRequestProperty("Authorization", "Bearer " + access_token);

        responseCode = con2.getResponseCode();
        BufferedReader br2;
        if(responseCode==200) {
          br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));    
        } else {
          br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));  
        }
        String inputLine2;
        StringBuffer res2 = new StringBuffer();
        while ((inputLine2 = br2.readLine()) != null) {
          res2.append(inputLine2);
        } 
        br2.close();
        session.setAttribute("access", res2.toString());

        /* 변경 가능 */
        response.sendRedirect("http://localhost:8080/farmtastic");
    }
  } catch (Exception e) {
    out.println(e);
  }
%>

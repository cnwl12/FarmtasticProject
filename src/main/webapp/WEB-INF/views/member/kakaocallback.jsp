<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카카오 콜백</title>
</head>
<body>
<%
String access_token = request.getParameter("access_token");
   
try {
    String url = "https://kapi.kakao.com/v2/user/me";
    URL myurl = new URL(url);
    HttpURLConnection con = (HttpURLConnection)myurl.openConnection();
    
    String auth = "Bearer " + access_token;
    con.setRequestProperty("Authorization", auth);
    
    con.setRequestMethod("GET");
    con.setRequestProperty("Content-Type", "application/json");
    con.setUseCaches(false);
    con.setDoInput(true);
    con.setDoOutput(true);
    
    int responseCode = con.getResponseCode();
    
    if (responseCode == 200) {
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer buffer = new StringBuffer();
        
        while ((inputLine = in.readLine()) != null) {
            buffer.append(inputLine);
            System.out.println("sys inputLine -->" + inputLine);
        }
        System.out.println("토큰전달성공");
        System.out.println("토큰값 : " + access_token);
        in.close();
        
         

        session.setAttribute("accessToken", access_token);

        response.sendRedirect(request.getContextPath() + "/kakaojoin?access_token=" + access_token);
        
    } else {
    	System.out.println("토큰전달실패");
        out.print("토큰 전달 실패");
    }
} catch (Exception e) {
    out.print(e.toString());
}

%> 
</body>
</html>

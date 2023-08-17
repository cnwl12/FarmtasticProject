<%@page import="org.json.JSONObject"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
String code = request.getParameter("code");

try {
    String url = "https://kauth.kakao.com/oauth/token";
    URL myurl = new URL(url);
    HttpURLConnection con = (HttpURLConnection)myurl.openConnection();
    
    String grant_type = "authorization_code";
    String client_id = "fa74773a794ad7a254e291d7cbf8fd00";
    String redirect_uri = "http://c2d2303t2.itwillbs.com/farmtastic/kakaocallback"; // 허용된 Redirect URI 필요
    
    String parameters = "grant_type=" + grant_type + "&client_id=" + client_id +
    					"&redirect_uri=" + redirect_uri + "&code=" + code;
    
    byte[] postData = parameters.getBytes(Charset.forName("UTF-8"));
    int postDataLength = postData.length;
    
    con.setRequestMethod("POST");
    con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
    con.setRequestProperty("Content-Length", Integer.toString(postDataLength));
    con.setDoOutput(true);
    con.getOutputStream().write(postData);
    
    int responseCode = con.getResponseCode();

    if (responseCode == 200) {
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer buffer = new StringBuffer();
        
        while ((inputLine = in.readLine()) != null) {
            buffer.append(inputLine);
        }
        in.close();
        
        JSONObject jsonObject = new JSONObject(buffer.toString());
        String access_token = jsonObject.getString("access_token");
        
        session.setAttribute("accessToken", access_token);
        response.sendRedirect(request.getContextPath() + "/kakaojoin?access_token=" + access_token);
        
    } else {
        out.print("액세스 토큰 발급 실패");
    }
} catch (Exception e) {
    out.print(e.toString());
}
%>
</body>
</html>

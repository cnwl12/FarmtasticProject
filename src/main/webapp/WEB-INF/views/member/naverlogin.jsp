<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>네이버로그인</title>
    <script>
        function openLoginWindow() {
            <%
                String clientId = "P5XN0dR3HKnKenJtWjZC"; // 애플리케이션 클라이언트 아이디 값
                String redirectURI = URLEncoder.encode("http://c2d2303t2.itwillbs.com/FarmProject/navercallback", "UTF-8");
                SecureRandom random = new SecureRandom();
                String state = new BigInteger(130, random).toString();
                String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
                    + "&client_id=" + clientId
                    + "&redirect_uri=" + redirectURI
                    + "&state=" + state;
                session.setAttribute("state", state);
            %>
            var apiURL = '<%=apiURL%>';
            window.location.replace('<%=apiURL%>');
            
        }
    </script>
</head>
<body onload="openLoginWindow();">
</body>
</html>
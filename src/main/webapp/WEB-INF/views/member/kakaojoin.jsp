<%-- <%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.dao.MemberDAO"%>
<%@page import="com.itwillbs.service.MemberService"%>
<%@page import="org.apache.coyote.Response"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
db연동작업중.....많이기다려줘요...... workspace-sts에서 콜백 토큰정보확인해보세요....
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.net.ssl.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.net.ssl.*"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
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

	/* // JSON 파싱
	JSONObject jsonObject = new JSONObject(kakaoApiResponse.toString());
	JSONObject kakaoResponse = jsonObject.getJSONObject("response");


	String member_id = jsonObject.get("id").toString();
	String member_name = jsonObject.get("properties").toString();
	String member_email = kakaoResponse.getString("email");
	String member_phone = kakaoResponse.getString("phone_number");

	// MemberDTO 객체를 생성하고 추출된 프로필 정보를 설정
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setMember_id(member_id);
	memberDTO.setMember_name(member_name);
	memberDTO.setMember_email(member_email);
	memberDTO.setMember_phone(member_phone); */



%>

<script type="text/javascript"
    		 src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
        $.ajax({
            type: 'GET',
            url:'${pageContext.request.contextPath }/idCheck',
            data:{'id':$('.id').val()},
            success:function(result) {
                if(result == ""){
                	$.ajax({
                		
                		url:'${pageContext.request.contextPath }/insertPro'
                	});
                } else {
                	$.ajax({
                		
                		url:'${pageContext.request.contextPath }/loginPro'
                	});
                }
            }
        });
</script>
</body>
</html>
 --%>
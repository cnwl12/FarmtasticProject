<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="table-responsive">
   <input type="hidden" name="member_num" value="${memberDTO.member_num}">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" class="check-all"/></th>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>상태</th>
                                            <th>정보조회</th> 
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th><input type="checkbox" class="check-all"/></th>
                                             <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>상태</th>
                                            <th>정보조회</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                 	<c:forEach items="${member}" var="members">
                                        <tr>
                                        	<td><input type="checkbox" class="memberCheckbox" name="result" value="${memberDTO.member_num}" /></td>
                                            <td>${members.member_num}</td>
                                            <td>${members.member_id}</td>
                                            <td>${members.member_name}</td>
                                            <td>${members.member_delYn}</td>
                                            <td>$112,000</td>
                                        </tr>
                                     </c:forEach>   
                                    </tbody>
                                </table>
                            </div>
</body>
</html>
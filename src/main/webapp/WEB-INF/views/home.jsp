<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	팜타스틱 파이팅 *~*  !!
</h1>

<P>  The time on the server is ${serverTime}. </P>
 
<p>
<a href="index">일단메인-index</a>
<a href="blog">블로그(제철팜)</a>
<a href="blogDetails">블로그2(제철팜-상세)</a>
<a href="login">로그인</a>
<a href="mypage">마이페이지</a>
<a href="contact">고객센터</a>
<a href="contact">장바구니</a>
<a href="farmStore">팜팜마켓</a>
<a href="farmStoreDetail">팜팜마켓2(상세)</a>
<a href="checkout">주문</a><br>
<a href="oneboard">1:1문의</a><br>
<a href="parcel">택배</a>

</p>

<p>
<a href="sellerMain">판매자(홈)</a>
<a href="adminMain">관리자(홈)</a>
<a href="adminLogin">관리자(로그인)</a>
<a href="settlement">관리자(정산테스트)</a>
<a href="notetest">공지사항테스트</a>
<a href="writeCnote">글쓰기테스트</a>
</p>

<p>
디비연동 확인용 작업 
<a href="itemInsert">판매자-상품 등록</a>
<a href="itemInsertList">판매자 - 상품 리스트</a>
<a href="insert">회원가입</a>
</p>

</body>
</html>

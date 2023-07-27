<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmtastic_Mypage</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">

<!-- 지마켓  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myg.css"
	type="text/css">

</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>

	<div id="contentswrap">
		<div id="contents">
			<div id="main_menu">
				<ul class="menu_list">
					<li id="menu1"><a href="mypage" class="mn1">나의정보</a></li>
					<li id="menu2"><a href="#" class="mn2">주문배송</a></li>
					<li id="menu3"><a href="#" class="mn3">리뷰관리</a></li>
					<li id="menu4"><a href="#" class="mn4">1:1 문의</a></li>
				</ul>
			</div>
			
			<div id="main_cont">
				<form action="${pageContext.request.contextPath }/member/updatePro" method="post">
					<div class="myoption">
						<h4>나의 정보</h4>
						<!-- <h5 class="list1">회원정보 설정</h5>		 -->
						<table class="myg_tab">
							<tbody>
								<tr>
								</tr>
							</tbody>
						</table>
						<!-- <h5 class="list1">회원정보 설정</h5> -->
						<div class="my_info_setting">
							<table class="myinfo">
								<colgroup>
									<col style="width: 17%;">
									<col>
								</colgroup>
								<tbody>
									<!-- 	id, name, type 등 작업하면서 수정해야함 -->
									<!-- 	<input type="hidden" name="hidLoginUserId" id="hidLoginUserId" value="farmtastic"> -->
									<tr>
										<th scope="row"><label for="name1">이름</label></th>

										<td><span><input type="text" class="txt" id="member_name"
											name="member_name" value="${memberDTO.name}">
												</span></td>
									



										<td>
											<div id="CustNAShow" class="nameCell" style="display: inline">

											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">사용자ID</th>
										<td><span>${memberDTO.member_id}</span></td>
									</tr>
									<tr style="visibility: visible;">
										<th scope="row">비밀번호</th>
										<td id="PasswordEdit" class="PwdEdit" style="display: block;">
											<ul class="llist-style1">
												<li><label for="nowpw"><span class="bg_bul"></span>현재
														비밀번호</label> <input type="password" class="txt" id="pwd"
													name="pwd" size="26" maxlength="15" style="width: 195px;">
													<span class="font_style1">현재 비밀번호를 입력해 주세요</span></li>
												<li><label for="newpw"><span class="bg_bul"></span>새
														비밀번호</label> <input type="password" class="txt" id="pwd1"
													name="pwd1" size="26" maxlength="15"
													onkeydown="return keycheck(this.event);"
													onkeypress="Capskeycheck(this,'Password1');"
													onkeyup="validatePasswordType(this,'Password1');"
													onfocus="helpOn('Password1');"
													onblur="chkBlur(this,'Password1');" style="width: 195px;">
													<!-- 비밀번호 안전등급 --> <span class="font_style1">8~15자의
														영문 대/소문자, 숫자 및 특수문자 조합</span></li>
												<li><label for="new_pw_corfirm"><span
														class="bg_bul"></span>새 비밀번호 확인</label> <input type="password"
													class="txt" id="pwd2" name="pwd2" size="26" maxlength="15"
													onfocus="helpOn('Password2');"
													onkeyup="helpOff('Password2');"
													onblur="helpOff('Password2');" style="width: 203px;">
												</li>
											</ul>
										</td>
										<!-- 비밀번호/G통장 비밀번호 리스트 -->
										<td id="PasswordQnAEdit" class="PwdQna" style="display: none">
											<span class="PassEdit"><a
												class="btn_acccount btn_s_gray"><span>비밀번호 수정</span></a></span>
										</td>
									</tr>

									<tr>
										<th scope="row"><label>휴대폰번호</label></th>
										<td><input type="text" class="txt" id="hp_no1"
											name="hp_no1" size="4" maxlength="4" value="" title="휴대폰 첫자리">
											<span>-</span> <input type="text" class="txt" id="hp_no2"
											name="hp_no2" size="4" maxlength="4" value=""
											title="휴대폰 가운데 자리"> <span>-</span> <input type="text"
											class="txt" id="hp_no3" name="hp_no3" size="4" maxlength="4"
											value="" title="휴대폰 뒷자리"></td>


									</tr>


									<tr style="visibility: visible;">
										<th scope="row"><label for="email">E-mail</label></th>
										<td>
											<!-- 메일 앞부분  --> <input type="text" class="txt" id="e_mail1"
											name="e_mail1" title="이메일 아이디" value=""> @ <!-- 주소부분 -->
											<input class="txt" id="e_mail2" name="e_mail2"
											title="이메일 도메인" value="n****.com"> <a
											style="display: none;" id="EmailChange"
											class="btn_acccount btn_s_gray"><span>수정하기</span></a> <input
											type="hidden" name="hdnOldIsRcvMail" id="hdnOldIsRcvMail"
											value="True"> <input type="hidden" name="old_email"
											id="old_email" value="wjc5510@naver.com"> <input
											type="hidden" name="old_email_pre" id="old_email_pre"
											value="wjc5***">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="btn_center">
						<a class="btn_blue_style2" id="img_submit"> <span
							style="color: #fff; text-align: center;">수정하기</span></a>
					</div>
				</form>
			</div>


		</div>

	</div>




	<%-- <div>
	<!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	</div> --%>

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
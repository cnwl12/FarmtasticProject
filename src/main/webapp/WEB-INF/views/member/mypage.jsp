<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmtastic_Mypage</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css"
	type="text/css">

<!-- 지마켓  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/myg.css"
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
				<form novalidate
					action="${pageContext.request.contextPath }/updatePro"
					method="post">
					<div class="myoption">
						<h4>나의 정보</h4>
						<!-- <h5 class="list1">회원정보 설정</h5>     -->
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
									<tr>
										<th scope="row"><label for="name1">이름</label></th>

										<td><span><input type="text" class="txt"
												id="member_name" name="member_name"
												value="${memberDTO.member_name}" required> <span
												class="error-message" style="color: red; display: none;">이름을
													입력하세요</span></span></td>
									</tr>
									<tr>
										<th scope="row">사용자ID</th>
										<td><span><input type="text" class="txt"
												id="member_id" name="member_id"
												value="${memberDTO.member_id}" readonly></span></td>
									</tr>
									<tr style="visibility: visible;">
										<th scope="row">비밀번호</th>
										<td id="PasswordEdit" class="PwdEdit" style="display: block;">
											<ul class="llist-style1">
												<li><label for="nowpw"><span class="bg_bul"></span>현재
														비밀번호</label> <input type="password" class="txt" id="member_pass"
													name="member_pass" size="26" maxlength="15" required=""
													onkeydown="return keycheck(this.event);"
													onkeypress="Capskeycheck(this,'new_member_pass');"
													onkeyup="validatePasswordType(this,'new_member_pass');"
													onfocus="helpOn('new_member_pass');"
													onblur="chkBlur(this,'new_member_pass');"
													style="width: 195px";> <span class="font_style1">현재
														비밀번호를 입력해 주세요</span></li>



												<script>
                                                    function validateNewPassword() {
                                                        var newPassword = document
                                                                .getElementById("new_member_pass").value;
                                                        var confirmPassword = document
                                                                .getElementById("pwd2").value;

                                                        if (newPassword != confirmPassword) {
                                                            document
                                                                    .getElementById("pwd2").style.borderColor = "red";
                                                            document
                                                                    .getElementById("message").innerHTML = "두 개의 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.";
                                                            document
                                                                    .getElementById("img_submit").setAttribute("disabled", "true");
                                                        } else {
                                                            document
                                                                    .getElementById("pwd2").style.borderColor = "";
                                                            document
                                                                    .getElementById("message").innerHTML = "";
                                                            document
                                                                    .getElementById("img_submit").removeAttribute("disabled");
                                                        }
                                                    }
                                                </script>


												<li><label for="newpw"> <span class="bg_bul"></span>새비밀번호
												</label> <input type="password" class="txt" id="new_member_pass"
													name="new_member_pass" size="26" maxlength="15" required=""
													onkeydown="return keycheck(this.event);"
													onkeypress="Capskeycheck(this,'new_member_pass');"
													onkeyup="validatePasswordType(this,'new_member_pass');"
													onfocus="helpOn('new_member_pass');"
													onblur="chkBlur(this,'new_member_pass');"
													style="width: 195px;"> <span class="font_style1"></span>
												</li>
												<li><label for="new_pw_corfirm"> <span
														class="bg_bul"></span>새 비밀번호 확인
												</label> <input type="password" class="txt" id="pwd2" name="pwd2"
													size="26" maxlength="15" required=""
													onfocus="helpOn('new_member_pass');"
													onkeyup="validateNewPassword(); helpOff('new_member_pass');"
													onblur="helpOff('new_member_pass');" style="width: 203px;">
													<span id="message" style="color: red; margin-left: 10px;"></span>
												</li>

											</ul>
										</td>

									</tr>

									<tr>
										<th scope="row"><label>휴대폰번호</label></th>
										<td><input type="text" class="txt" id="member_phone"
											name="member_phone" size="15" maxlength="15"
											value="${memberDTO.member_phone}" title="휴대폰 첫자리">
									</tr>


									<tr style="visibility: visible;">
										<th scope="row"><label for="email">E-mail</label></th>
										<td>
											<!-- 메일 앞부분  --> <input type="text" class="txt"
											id="member_email" name="member_email" title="이메일 아이디" size="50"
											value="${memberDTO.member_email}"> <!-- 주소부분 --> <!-- <input
                                            type="hidden" name="hdnOldIsRcvMail" id="hdnOldIsRcvMail"
                                            value="True"> <input type="hidden" name="old_email"
                                            id="old_email" value="wjc5510@naver.com"> <input
                                            type="hidden" name="old_email_pre" id="old_email_pre"
                                            value="wjc5***"> -->
										</td>
									</tr>
									<tr>
										<th scope="row"><label>우편번호</label></th>
										<td><input type="text" class="txt" name="member_post"
											class="form-control" id="sample4_postcode" placeholder="우편번호"
											required>
											<div id="btbt">
												<input type="button" id="member_post"
													onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
											</div>
											<div class="invalid-feedback">우편번호를 입력해주세요.</div></td>
									</tr>

									<th scope="row"><label>도로명주소</label></th>
									<td><input type="text" class="txt" name="member_addMain"
										id="sample4_roadAddress" placeholder="도로명주소" size="80"
										required>

										<div class="invalid-feedback">주소를 입력해주세요.</div>
									</tr>

									<th scope="row"><label>지번주소</label></th>
									<td><input type="text" class="txt"
										id="sample4_jibunAddress" placeholder="지번주소" size="80">
									</tr>

									<th scope="row"><label>상세주소</label></th>
									<td><input type="text" class="txt" name="member_addSub"
										id="sample4_detailAddress" placeholder="상세주소" size="80">
									</tr>

									<th scope="row"><label>참고항목</label></th>
									<td><input type="text" class="txt"
										id="sample4_extraAddress" placeholder="참고항목" size="80">
									</tr>



								</tbody>
							</table>
						</div>
					</div>
					<div class="btn_center">

						<button type="submit" class="btn_blue_style2" id="img_submit"
							disabled="true">
							<span style="color: #fff; text-align: center;">수정하기</span>
						</button>
					</div>
				</form>
			</div>
			<!-- 나의 정보 끝 -->
			
			
			
			


		</div>

	</div>




	<jsp:include page="../bottom.jsp"></jsp:include>

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                    + data.buildingName
                                    : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if (roadAddr !== '') {
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if (data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress
                                    + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                    + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if (data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : '
                                    + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
        }
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	
	
	<title>seller/sellerMng</title>
	
	<!-- Custom fonts for this template -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css">
    
	<!-- 사이드바 줄어든거 되돌리기 -->
	<style type="text/css">
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
	</style>
	
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="./inc/sidemenu.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 컨텐츠 시작 -->
			<div id="content">
				<jsp:include page="./inc/top.jsp"></jsp:include>

				<!-- 페이지 컨텐츠 시작 -->
				<div class="container-fluid">
					<form action="${pageContext.request.contextPath}/sellerUpdatePro" method="post"> 
					<input type="hidden" name="seller_num" value="${seller.seller_num}">

						<!-- 페이지 상단 시작 -->
<!-- 						<div class="d-sm-flex align-items-center justify-content-between mb-4"> -->
<!-- 							<h1 class="h3 mb-0 text-gray-800">판매자정보</h1> -->
<!-- 						</div> -->
						<!-- 페이지 상단 끝 -->
						
						<!-- 상점 정보 시작 -->
						<div class="panel panel-seller" id="chargePersonInfoPanelInSellerInfoPage">

							<div class="panel-heading">
								<div class="pull-left">
									<h3 class="panel-title">상점 정보</h3>
								</div>
							</div>

							<div class="panel-body">
								<ul class="seller-list-border">
									<li>
									<label class="control-label">상점명</label>
										<div class="input-content">
											<div class="form-control-static">${seller.seller_storeName}</div>
										</div>
									</li>

									<li>
									<label class="control-label">사업자 번호</label>
										<div class="input-content">
											<div class="form-control-static">${seller.seller_licenseNum}</div>
										</div>
									</li>
									
								</ul>
							</div>

						</div>
						<!-- 상점 정보 끝 -->
						
						<!-- 판매자 정보 시작 -->
						<div class="panel panel-seller">

							<div class="panel-heading">
								<div class="pull-left">
									<h3 class="panel-title">판매자 정보</h3>
								</div>
							</div>

							<div class="panel-body">
								<ul class="seller-list-border">
									<li>
									<label class="control-label">이름</label>
										<div class="input-content">
											<div class="form-control-static">${seller.seller_name}</div>
										</div>
									</li>

									<li>
									<label class="control-label">로그인ID</label>
										<div class="input-content">
											<div class="form-control-static"><input type="hidden" class="form-control" id="seller_id" name="seller_id" value="${seller.seller_id}">${seller.seller_id}</div>
										</div>
									</li>
									<li>
									
									<label class="control-label">비밀번호</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="password" class="form-control" id="seller_pass"
                                             name="seller_pass" size="26" maxlength="15"
                                             onkeydown="return keycheck(this.event);"
                                             onkeypress="Capskeycheck(this,'seller_pass2');"
                                             onkeyup="validateNewPassword(this,'seller_pass2');"
                                             onfocus="helpOn('seller_pass2');"
                                             onblur="chkBlur(this,'seller_pass2');"
                                             style="width: 195px;"><span class="font_style1">&nbsp;현재
                                                비밀번호를 입력해 주세요</span>
											</div>
										</div>
									</li>
									<li>
									<label class="control-label">새로운비밀번호</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="password" class="form-control" id="seller_pass2"
                                             name="seller_pass2" size="26" maxlength="15"
                                             onkeydown="return keycheck(this.event);"
                                             onkeypress="Capskeycheck(this,'seller_pass2');"
                                             onkeyup="validateNewPassword(this,'seller_pass2');"
                                             onfocus="helpOn('seller_pass2');"
                                             onblur="chkBlur(this,'seller_pass2');"
                                             style="width: 195px;"><span class="font_style1">&nbsp;새로운
                                                비밀번호를 입력해 주세요</span>
											</div>
										</div>
									</li>
									<li>
									<label class="control-label">새로운비밀번호확인</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="password" class="form-control" id="pwd2"
                                             name="pwd2" size="26" maxlength="15"
                                             onkeydown="return keycheck(this.event);"
                                             onkeypress="Capskeycheck(this,'seller_pass2');"
                                             onkeyup="validateNewPassword(this,'seller_pass2');"
                                             onfocus="helpOn('seller_pass2');"
                                             onblur="chkBlur(this,'seller_pass2');"
                                             style="width: 195px;"><span id="message" Style="color: red; margin-left: 10px;"></span>
											</div>
										</div>
									</li>
										
									<li>
									<label class="control-label">이메일 주소</label>
										<div class="input-content">
											<div class="form-inline mobile-inline"> <!-- 이 클래스는 텍스트박스 길이 줄여줌. 없으면 늘어남 -->
												<input type="text" class="form-control" name="seller_email" value="${seller.seller_email}">
											</div>
										</div>
									</li>

									<li> 							
									<label class="control-label">휴대폰 <br class="visible-xs">번호</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="text" class="form-control seller_edit" name="seller_phone" value="${seller.seller_phone}">
											</div>
										</div>
									</li>
								</ul>
							</div>

						</div>
						<!-- 판매자 정보 끝 -->


						<!-- 계좌정보 시작 -->
						<div class="panel panel-seller">

							<div class="panel-heading">
								<div class="pull-left">
									<h3 class="panel-title">계좌정보</h3>
								</div>
							</div>

							<div class="panel-body">
								<ul class="seller-list-border">
									<li>
										<label class="control-label">예금주</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="text" class="form-control" name="seller_accountHolder" value="${seller.seller_accountHolder}">
											</div>
										</div>
									</li>

									<li>
										<label class="control-label">은행</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<div class="form-control-static">${seller.seller_bank}</div><br>
												<select name="seller_bank" id="seller_bank" style="margin-left: 150px; width: 150px; height: 40px;">
													<option value="${seller.seller_bank}" selected="selected">은행을 선택하세요</option>
												    <option value="Kookmin">국민은행</option>
											        <option value="Busan">부산은행</option>
											        <option value="Kakao">카카오뱅크</option>
											        <option value="Shinhan">신한은행</option>
											        <option value="Woori">우리은행</option>
											        <option value="KEB">기업은행</option>
											        <option value="Nonghyup">농협은행</option>
											        <option value="Suhyup">수협은행</option>
											        <option value="Shinhyup">신협은행</option>
											        <option value="Hana">하나은행</option>
											        <option value="Beobwoon">저축은행</option>
											        <option value="Gwangju">광주은행</option>
											        <option value="Jeju">제주은행</option>
											        <option value="Daegu">대구은행</option>
			  									</select>
											</div>
										</div>
									</li>
									<li>
										<label class="control-label">계좌번호</label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="text" class="form-control" name="seller_accountNum" value="${seller.seller_accountNum}">
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- 계좌정보 끝 -->

						<!-- 배송정보 시작 -->
						<div class="panel panel-seller">

							<div class="panel-heading">
								<div class="pull-left">
									<h3 class="panel-title">배송정보</h3>
								</div>
							</div>

							<div class="panel-body">
								<!-- <div class="panel-body-info"></div> -->
								<ul class="seller-list-border">
									<li>
									<label class="control-label" for="delivery-addr">출고 / 반품지 주소</label>

										<div class="input-content">
											<div class="form-inline">
												<div class="form-group">
													<input type="text" class="form-control" name="seller_post" id="seller_post" value="${seller.seller_post}">
													<input type="button" value="우편번호검색" onclick="checkPost()" style="margin-left: 10px;" class="btn btn-primary"><br>
													<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
													<script>
													    function checkPost() {
													        new daum.Postcode({
													            oncomplete: function(data) {
													                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
													
													                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
													                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													                var addr = ''; // 주소 변수
													                var extraAddr = ''; // 참고항목 변수
													
													                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													                    addr = data.roadAddress;
													                } else { // 사용자가 지번 주소를 선택했을 경우(J)
													                    addr = data.jibunAddress;
													                }
													
													                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													                if(data.userSelectedType === 'R'){
													                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
													                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
													                        extraAddr += data.bname;
													                    }
													                    // 건물명이 있고, 공동주택일 경우 추가한다.
													                    if(data.buildingName !== '' && data.apartment === 'Y'){
													                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
													                    }
													                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													                    if(extraAddr !== ''){
													                        extraAddr = ' (' + extraAddr + ')';
													                    }
													                    // 조합된 참고항목을 해당 필드에 넣는다.
													                    document.getElementById("seller_addSub").value = extraAddr;
													                
													                } else {
													                    document.getElementById("seller_addSub").value = '';
													                }
													
													                // 우편번호와 주소 정보를 해당 필드에 넣는다.
													                document.getElementById('seller_post').value = data.zonecode;
													                document.getElementById("seller_addMain").value = addr;
													                // 커서를 상세주소 필드로 이동한다.
													                document.getElementById("seller_addSub").focus();
													            }
													        }).open();
													    }
													</script>
												</div>
											</div>
											
											<div class="form-group">
												<input type="text" class="form-control" name="seller_addMain" id="seller_addMain" value="${seller.seller_addMain}">
												<input type="text" class="form-control" name="seller_addSub" id="seller_addSub" value="${seller.seller_addSub}">
											</div>
										</div>
									</li>
								</ul>
							<div class="seller-btn-area btn-group-xlg">
								<button class="btn btn-primary" type="submit" id="img_submit">정보 수정</button>
								<button id="withdrawBtn" onclick="withdraw()" class="btn btn-primary">회원 탈퇴</button>
							</div>
							</div>
						

						</div>
						<!-- 배송정보 끝 -->
						
					</form>
				</div>
				<!-- 페이지 컨텐츠 끝 -->

			</div>
			<!-- 메인 컨텐츠 끝 -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i> </a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

  <script type="text/javascript">
  function helpOn() {
	  let modal = document.getElementById("helpOnModal");
	  modal.style.display = "block";
	}

  function keycheck(e) {
	  if (e.keyCode == 13 || e.keyCode == 10) {
	    getLogin();
	    return false;
	  } else {
	    return true;
	  }
	}

  function Capskeycheck(e) {
	  let keyCode = e.keyCode ? e.keyCode : e.which;
	  let shiftKey = e.shiftKey ? e.shiftKey : ((keyCode == 16) ? true : false);
	  if (((keyCode >= 65 && keyCode <= 90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
	    document.getElementById('capsmsg').style.visibility = 'visible';
	  } else {
	    document.getElementById('capsmsg').style.visibility = 'hidden';
	  }
	}

	function validatePasswordType(password) {
	  let pattern = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z~!@#$%^&*()]{8,16}$/;
	  return pattern.test(password);
	}

	function chkBlur(obj, limit) {
		  let len = obj.value.length;
		  if (len == limit) {
		    return true;
		  } else if (len < limit) {
		    obj.focus();
		    return false;
		  } else if (len > limit) {
		    obj.value = obj.value.substring(0, limit);
		    return true;
		  }
		}
  
	function validateNewPassword() {
		  var newPassword = document.getElementById("seller_pass2").value;
		  var confirmPassword = document.getElementById("pwd2").value;

		  if (newPassword !== confirmPassword) {
		    document.getElementById("pwd2").style.borderColor = "red";
		    document.getElementById("message").innerHTML = "두 개의 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.";
		    document.getElementById("img_submit").setAttribute("disabled", "true");                                                            
		  } else {
		    document.getElementById("pwd2").style.borderColor = "";
		    document.getElementById("message").innerHTML = "";
		    document.getElementById("img_submit").removeAttribute("disabled");
		  }
		}

 $(document).ready(function() {
	  // "수정하기" 버튼 클릭 이벤트 처리
	  $('#img_submit').click(function(e) {
		e.preventDefault();

	    // 입력 필드의 값을 가져옵니다.
	    var currentPassword = $('#seller_pass').val();
	    var newPassword = $('#seller_pass2').val();
	    var confirmPassword = $('#pwd2').val();

	    // 입력값이 유효한지 검사합니다.
	    if (currentPassword.trim() === '' || newPassword.trim() === '' || confirmPassword.trim() === '') {
	      alert('비밀번호를 입력해주세요.');
	      return;
	    }

	    if (newPassword !== confirmPassword) {
	      alert('새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않습니다.');
	      return;
	    }
	    if (newPassword !== '' && confirmPassword !== '') {
	        $(this).unbind(e);
	      }
	  });
	 });

 function withdraw() {
	  const result = confirm("정말로 탈퇴하시겠습니까?");
	  event.preventDefault();
	  if (result === true) {
	    // 폼 데이터 전송
	    
	    const form = $('<form>', {
	      'action': '${pageContext.request.contextPath }/withdrawPro',
	      'method': 'POST'
	    }).append($('<input>', {
	      'name': 'seller_id',
	      'value': $('#seller_id').val() // id 값 전송
	    })).append($('<input>', {
	      'name': 'seller_pass',
	      'value': $('#seller_pass').val() // 비밀번호 값 전송
	    })).append($('<input>', {
	      'name': 'withdraw',
	      'value': 'withdraw' // 회원 탈퇴 기능을 처리하는 값을 전송
	    })).appendTo('body').submit();
	    $(this).unbind(event);
	  } else {
	    // 취소 버튼을 클릭한 경우의 처리
	    alert("회원 탈퇴가 취소되었습니다.");
	   
	  }
	}
</script>

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>
</html>
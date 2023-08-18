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

<!-- 페이지에서 번호 중간에 하이픈 추가해서 보여주고 수정 버튼을 누르면 하이픈 뺀 번호만 디비에 전달하는 코드, 불확실해서 잠시 보류 -->
<!-- <script>
 // DB에서 가져온 전화번호에 하이픈 추가하는 함수
function formatPhoneNumber(input) {
  const phoneNumber = input.value.replace(/\D/g, ''); // 입력된 값에서 숫자만 추출

  let formattedPhoneNumber = '';
  // 번호가 10자리인 경우
  if (phoneNumber.length === 10) {
    formattedPhoneNumber = phoneNumber.replace(/^(\d{2,4})(\d{3})(\d{4})$/, '$1-$2-$3');
  }
  // 번호가 11자리인 경우
  else if (phoneNumber.length === 11) {
    formattedPhoneNumber = phoneNumber.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
  }

  // 디비에 저장할 때는 하이픈을 제거하고 숫자만 저장
  const phoneNumberWithoutHyphen = phoneNumber.replace(/\D/g, '');

  input.value = formattedPhoneNumber; // input 요소의 값을 변경하여 화면에 출력
  // 폼 제출 시 디비에 저장할 값을 설정
  input.setAttribute('data-phone-number', phoneNumberWithoutHyphen);
}

document.addEventListener('DOMContentLoaded', function() {
  const inputElements = document.querySelectorAll('.seller_edit');
  inputElements.forEach((inputElement) => {
    formatPhoneNumber(inputElement);
  });

  const form = document.querySelector('form[action$="/sellerUpdatePro"][method="post"]');
  if (form) {
    form.addEventListener('submit', function(event) {
      event.preventDefault(); // 폼 제출 기본 동작 취소
      // 폼 제출 시 디비에 저장할 값을 설정
      const phoneNumberInputs = form.querySelectorAll('.seller_edit');
      phoneNumberInputs.forEach((inputElement) => {
        inputElement.value = inputElement.getAttribute('data-phone-number');
      });
      // 폼 제출
      form.submit();
    });
  }
});

</script> -->


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
						<!-- 기존 템플릿에 있던 부분인데 굳이 없어도 되니까 일단 주석처리 -->
<!-- 						<div class="d-sm-flex align-items-center justify-content-between mb-4"> -->
<!-- 							<h1 class="h3 mb-0 text-gray-800">판매자정보</h1> -->
<!-- 						</div> -->
						<!-- 페이지 상단 끝 -->

						<!-- 판매자 정보 시작 -->
						<div class="panel panel-seller" id="chargePersonInfoPanelInSellerInfoPage">

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
											<div class="form-control-static">${seller.seller_id}</div>
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
									<label class="control-label">휴대폰 <br class="visible-xs">번호 <!-- 이 클래스는 뭐지?  --> </label>
										<div class="input-content">
											<div class="form-inline mobile-inline">
												<input type="text" class="form-control seller_edit" name="seller_mobile" value="${seller.seller_mobile}">
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
<%-- 												<input type="text" class="form-control" name="seller_bank" value="${seller.seller_bank}"> --%>
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
									<!-- 나중에 수정할때 참고하려고 일단 남겨둠. 끝까지 필요없으면 지울거임 -->
									<!-- <li ng-if="vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL' || vm.accountInfo.represent.representType === 'DOMESTIC_BUSINESS'">
								<label class="control-label long-label">정산대금<br class="visible-xs">입금계좌</label>
								<div class="form-group form-control-static">
									 <span class="text-sub"></span>
								</div>
								<div class="form-group">
								</div> -->
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
								<!-- 배송지 설명 입력공간. 일단 남겨두고 끝까지 필요없으면 지울거임 -->
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
											
											<div class="form-inline">
												<div class="form-group">
													<input type="text" class="form-control seller_edit" name="seller_mobile" value="${seller.seller_mobile}">
												</div>
												<div class="form-group">
													<input type="text" class="form-control seller_edit" name="seller_phone" value="${seller.seller_phone}">
												</div>
											</div>
											
										</div>
									</li>
								</ul>
							</div>
						
							<div class="seller-btn-area btn-group-xlg">
								<button class="btn btn-primary" type="submit">정보 수정</button>
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
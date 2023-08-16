<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Join2</title> 

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	
	<!-- 지마켓  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join.css" type="text/css"> 

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	  
<style>
div#btbt {
padding : 0px 60px;   
text-align: right;

}

input#post {
    padding: 0px 10px 19px 113px;
    margin: -5px 0px 0px 137px;
    width: 329px;
}

button#goMain {
    background-color: #7fad39;
    color : #fff !important; 
    min-width: 115px;
    margin-left: 5px;
    padding-right: 15px;
    min-height: 40px;
}

button#submitBtn {
	background: #7fad39; 
	color : #fff !important;
    min-width: 115px;
    margin-left: 5px;
    padding-right: 15px;
    min-height: 40px;
}

.invalid-feedback {
    display: none;
    width: 100%;
    margin-top: 0.25rem;
    font-size: 80%;
    color: #dc3545;
    margin-left: 25px;
}
.idcheck-used {
    color: red;
    margin-left: 25px;
}

 .idcheck-available {
    color: blue;
    margin-left: 25px
}

    li {
        display: flex;
        align-items: center;
    }

    label {
        margin-right: 5px;
    }

</style>
 
</head>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    
</script>



<body>

<jsp:include page="../top.jsp"></jsp:include>

<div id="container"> 
	<div class="join_wrap">
		<div id="join_container" role="main">
<!-- 			join_header -->
			<div class="join_header">
				<h2>사업자 회원가입</h2>
			</div>
<!-- 			// join_header -->
			<div class="join_content">  
				<div class="form">
					<form enctype="multipart/form-data" class="validation-form" novalidate action="${pageContext.request.contextPath}/insertPro2" id="join2" name="join2" method="post">
						<fieldset>
							<legend>팜타스틱 사업자 회원가입 정보입력</legend>
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
							
				<!-- 	구현하는 사람이 NAME, ID 맞추기  -->
 							
							<ul class="form_list">
							
								<li>
								<input type="hidden" name="join_date" id="join_date">
								<input type="text" class="form-control" placeholder="ID를 작성해주세요" name="seller_id" id="seller_id" maxlength="10" >
								<input type="button" value="중복체크" class="idcheckbtn">
								<div id = "idcheckdiv"></div>
								<div id="invalid_id" class="invalid-feedback">
                				아이디를 입력해주세요.
              					</div>
              					<div id="invalid_id2" class="invalid-feedback">
              					최소 2자 이상 최대 10자 / 영문 대소문자, 숫자만 입력하세요. 
              					</div>
								</li>   
								
								<li>
								<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="seller_pass" id="seller_pass" maxlength="15">
								<div id= "invalid_pass" class="invalid-feedback">
                				비밀번호를 입력해주세요.
              					</div>
              					<div id="invalid_pass2" class="invalid-feedback">
              					최소 2자 이상 최대 15자 / 영문 대소문자, 숫자만 입력하세요. 
              					</div>
              					<div id="invalid_pass3" class="invalid-feedback">
              					아이디와 일치한 비밀번호는 사용이 불가능합니다. 
              					</div>
								</li>
								
								<li> 
								
								<input type="password" class="form-control" placeholder="위의 비밀번호를 다시 입력해주세요" name="seller_pass2" id="seller_pass2" maxlength="15">
								<div id= "invalid_pass4" class="invalid-feedback">
                				비밀번호가 일치하지 않습니다.
              					</div>
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="이름" name="seller_name" id="seller_name" maxlength="10">
								<div id= "invalid_name" class="invalid-feedback">
                				이름을 입력해주세요.
              					</div>
              					<div id= "invalid_name2" class="invalid-feedback">
                				최소 2글자 이상, 한글과 영어만 입력하세요.
              					</div>
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="상점명" name="seller_storeName" id="seller_stoerName" maxlength="10">
								<div id= "invalid_storeName" class="invalid-feedback">
                				상점명을 입력해주세요.
              					</div>
              					<div id= "invalid_storeName2" class="invalid-feedback">
                				최소 2글자 이상, 한글과 영어만 입력하세요.
              					</div>
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="사업자 번호" name="seller_licenseNum" id="seller_licenseNum" maxlength="12">
								<div id= "invalid_licenseNum" class="invalid-feedback">
                				사업자번호 입력해주세요.
              					</div>
              					<div id= "invalid_licenseNum2" class="invalid-feedback">
                				양식에 맞추어 작성해주세요.
              					</div>
								</li>
								
								<li>
									<label for="seller_bank">은행명</label>
									<select name="seller_bank" id="seller_bank">
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
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="계좌번호(-없이)" name="seller_accountNum" id="seller_accountNum" maxlength="14">
								<div id= "invalid_accountNum" class="invalid-feedback">
                				계좌번호를 입력해주세요.
              					</div>
              					<div id= "invalid_accountNum" class="invalid-feedback">
                				하이픈(-)없이 숫자만 입력해주세요.
              					</div>
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="예금주" name="seller_accountHolder" id="seller_accountHolder" maxlength="10">
								<div id= "invalid_accountHolder" class="invalid-feedback">
                				예금주를 입력해주세요.
              					</div>
              					<div id= "invalid_accountHolder" class="invalid-feedback">
                				최소 2글자 이상, 한글과 영어만 입력하세요.
              					</div>
								</li>
							  	
							  	<li>
								<input type="text" class="form-control" placeholder="연락처" name="seller_phone" id="seller_phone" maxlength="13">
								<div id= "invalid_phone" class="invalid-feedback">
                				연락처를 입력해주세요.
              					</div>
              					<div id= "invalid_phone2" class="invalid-feedback">
                				연락처를 올바르게 입력해주세요.
              					</div>
								</li>
								
								<li>
								<input type="email" class="form-control" placeholder="이메일" name="seller_email" id="seller_email" >
								<div id= "invalid_email" class="invalid-feedback">
                				이메일을 입력해주세요.
              					</div>
              					<div id= "invalid_email2" class="invalid-feedback">
                				이메일을 올바른 형식으로 입력해주세요.
              					</div>
								</li>
							
								<li>
								<input type="text" name="seller_post" id="sample4_postcode" placeholder="우편번호">
								<div id="btbt">
								<input type="button" id="seller_post" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required>
								</div>
								<div id="invalid_post" class="invalid-feedback">
              					주소를 입력해주세요.
           						</div>
								</li>
								<li>
								<input type="text" name="seller_addMain" id="sample4_roadAddress" placeholder="도로명주소">
								</li>
								<li>
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								</li>
								<li>
								<input type="text" name="seller_addSub" id="sample4_detailAddress" placeholder="상세주소">
								</li>
								<li>
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
								</li>
								
								<li>
								<label for="attachment">첨부파일:</label>
								<input type="file" id="seller_file" name="file" />
								</li>
								
								<li>
									<label for="seller_type">사업자 분류</label>
									<select name="seller_type" id="seller_type">
										<option value="">카테고리를 선택해주세요</option>
										<option value="FR">사과</option>
										<option value="PE">배</option>
										<option value="TA">감귤</option>
										<option value="BA">바나나</option>
										<option value="GR">포도</option>
										<option value="PO">감자</option>
										<option value="SW">고구마</option>
										<option value="ON">양파</option>
										<option value="CA">당근</option>
										<option value="MU">버섯</option>
										<option value="ETC">기타</option>
  									</select>
								</li>
							</ul>
							
								
							
							<div class="btn_zone"> 
							<button type="button" id="goMain" class="site-btn">처음으로</button>
							<button type="button" id="submitBtn" class="site-btn">가입</button>
							</div>
 							
							
						</fieldset>  
					</form> 
				</div>
			</div>
		</div> 
	</div>
</div>



<script>  
      window.addEventListener('load', () => { 
      const forms = document.getElementsByClassName('validation-form'); 

      Array.prototype.filter.call(forms, (form) => { 
      form.addEventListener('submit', function (event) { 
      if (form.checkValidity() == false) { 
          event.preventDefault(); 
          event.stopPropagation(); 
       }  
      form.classList.add('was-validated'); 
        }, false); 
      }); 
    }, false); 
</script> 


<!-- bottom.jsp로 분리  -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	
<!-- Js Plugins -->
  


<script>
    $(document).ready(function() {
      // 처음으로 버튼 이벤트 핸들러
      $("#goMain").on("click", function() {
        location.href = 'main';
      });
		
      // 유효성 검사 이벤트 핸들러를 각 입력란에 추가
      $("#seller_id").on("input", function() {
        validateId();
      });
      
      $("#seller_pass").on("input", function() {
        validatePass();
      });

      $("#seller_pass2").on("input", function() {
        validatePass2();
      });

      $("#seller_name").on("input", function() {
        validateName();
      });

      $("#seller_phone").on("input", function() {
        validatePhone();
      });

      $("#seller_email").on("input", function() {
        validateEmail();
      });

      $("#sample4_postcode").on("input", function() {
        validatePost();
      });
      
      $("#seller_type").on("input", function() {
          validateType();
        });

      $("#submitBtn").on("click", function() {
    	  // Validation 통과시 폼 제출
    	  if (validateAll()) {
    	    // 가입 날짜를 hidden 필드에 입력
    	    const currDate = new Date(); // 현재 시간 정보 가져오기
    	    const formattedDate = `${currDate.getFullYear()}-${currDate.getMonth() + 1}-${currDate.getDate()}`; // 날짜 정보 포맷팅
    	    $("#seller_joinDay").val(formattedDate); // hidden 필드에 채우기
			$("#join2").submit();
    	    // 폼 데이터를 JavaScript 객체로 만듭니다.
//     	    var formData = $("#join2").serialize();

//     	    // ajax 요청을 보냅니다.
//     	    $.ajax({
//     	      type: "POST",
//     	      url: $("#join2").attr("action"),
//     	      data: formData,
//     	      success: function() {
//     	        // 요청이 성공적으로 처리되었을 때, login 페이지로 이동합니다.
//     	        location.href = 'login';
//     	      },
//     	      error: function() {
//     	        // 요청 처리 중 오류가 발생한 경우에 대한 처리를 여기에 추가할 수 있습니다.
//     	        alert("정보를 처리중에 오류가 발생했습니다. 다시 시도해주세요");
//     	      }
//     	    });
    	  }
    	  
   	 	}); 

 });
    
    $(document).ready(function() {
 $('.idcheckbtn').click(function(){ 
	  if($('#seller_id').val() == "") {
			alert("아이디 입력하세요");
			$('#seller_id').focus();
			return false;
		} 
	  $.ajax({
			url: '${pageContext.request.contextPath }/idCheck2',
			data : {'seller_id' : $('#seller_id').val()},
			success:function(result){
				// id = "idcheckdiv" 출력
				if (result == 'id is used') {
					result =  "<span class='idcheck-used'>아이디 중복</span>";
				} else {
					result =  "<span class='idcheck-available'>아이디 사용가능</span>";
				}
				
				$('#idcheckdiv').html(result);
			}
		});
 	});
 });
 
    // 정규식
    var regId = /^[a-zA-Z0-9]{2,10}$/;
    var regPw = /^[a-zA-Z0-9]{2,10}$/;
    var regName = /^[가-힣a-zA-Z]{2,15}$/;
    var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var regPhone = /^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/;
    var regLicenseNum = /^([0-9]{3})-([0-9]{2})-([0-9]{5})$/;
    var regNumber = /^(\d{1,14})$/;

    //  유효성 검사 메서드
    function validateId() {
      var uid = $("#seller_id");
      if (uid.val() == "" || !regId.test(uid.val())) {
        $('#invalid_id').show();
        uid.focus();
        return false;
      } else {
        $('#invalid_id').hide();
        return true;
      }
    }

    function validatePass() {
      var uid = $("#seller_id");
      var pw = $("#seller_pass");
      if (pw.val() == uid.val()) {
          $('#invalid_pass3').show();
          pw.focus();
          return false;
        } else if (pw.val() == "" || !regPw.test(pw.val())) {
          $('#invalid_pass3').hide();
          $('#invalid_pass2').show();
          pw.focus();
          return false;
        } else {
          $('#invalid_pass3').hide();
          $('#invalid_pass2').hide();
          return true;
        }
      }

    function validatePass2() {
      var pw = $("#seller_pass");
      var cpw = $("#seller_pass2");
      if (cpw.val() == "" || pw.val() != cpw.val()) {
        $('#invalid_pass4').show();
        cpw.focus();
        return false;
      } else {
        $('#invalid_pass4').hide();
        return true;
      }
    }

    function validateName() {
      var uname = $("#seller_name");
      if (uname.val() == "" || !regName.test(uname.val())) {
        $('#invalid_name').show();
        uname.focus();
        return false;
      } else {
        $('#invalid_name').hide();
        return true;
      }
    }
    
    function validateStoreName() {
        var usname = $("#seller_storeName");
        if (usname.val() == "" || !regName.test(usname.val())) {
          $('#invalid_storeName').show();
          usname.focus();
          return false;
        } else {
          $('#invalid_storeName').hide();
          return true;
        }
      }
    
    function validateLicenseNum() {
        var ulnum = $("#seller_licenseNum");
        if (ulnum.val() == "" || !regLicenseNum.test(ulnum.val())) {
          $('#invalid_license_num').show();
          ulnum.focus();
          return false;
        } else {
          $('#invalid_licenseNum').hide();
          return true;
        }
      }
    
    function validateAccountNum() {
        var uanum = $("#seller_accountNum");
        if (uanum.val() == "" || !regNumber.test(uanum.val())) {
          $('#invalid_accountNum').show();
          uanum.focus();
          return false;
        } else {
          $('#invalid_accountNum').hide();
          return true;
        }
      }
    
    function validateAccountHolder() {
        var uaholder = $("#seller_accountHolder");
        if (uaholder.val() == "" || !regName.test(uanum.val())) {
          $('#invalid_accountHolder').show();
          uaholder.focus();
          return false;
        } else {
          $('#invalid_accountHolder').hide();
          return true;
        }
      }

    function validatePhone() {
      var uphone = $("#seller_phone");
      if (uphone.val() == "" || !regPhone.test(uphone.val())) {
        $('#invalid_phone').show();
        uphone.focus();
        return false;
      } else {
        $('#invalid_phone').hide();
        return true;
      }
    }

    function validateEmail() {
      var mail = $("#seller_email");
      if (mail.val() == "" || !regMail.test(mail.val())) {
        $('#invalid_email').show();
        mail.focus();
        return false;
      } else {
        $('#invalid_email').hide();
        return true;
      }
    }

    function validatePost() {
      var post = $("#sample4_postcode");
      if (post.val() == "") {
        $('#invalid_post').show();
        post.focus();
        return false;
      } else {
        $('#invalid_post').hide();
        return true;
      }
    }	

    function validateAll() {
      return validateId() && validatePass() && validatePass2() && validateName() && validatePhone() && validateEmail() && validatePost();
    }

    </script>
</body>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html> 
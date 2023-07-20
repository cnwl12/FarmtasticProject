<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Join</title> 

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
 
</head>
<body>

<jsp:include page="../top.jsp"></jsp:include>

<div id="container"> 
	<div class="join_wrap">
		<div id="join_container" role="main">
			<!-- join_header -->
			<div class="join_header">
				<h2>회원가입</h2>
			</div>
			<!-- // join_header -->
			<div class="join_content">  
				<div class="form">
					<form class="validation-form" novalidate action="" id="join" name="info" method="post" onsubmit="return false;">
						<fieldset>
							<legend>팜타스틱 회원가입 정보입력</legend>
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
							
							<!-- 구현하는 사람이 NAME, ID 맞추기  -->
 							
							<ul class="form_list">
								<li>
								<input type="text" class="form-control" placeholder="ID를 만들어주세요" name="id" id="id" maxlength="10" >
								<div id="invalid_id" class="invalid-feedback">
                				아이디를 입력해주세요.
              					</div>
              					<div id="invalid_id2" class="invalid-feedback">
              					최소 2자 이상 최대 10자 / 영문 대소문자, 숫자만 입력하세요. 
              					</div>
								</li>   
								
								<li>
								<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="pass" id="pass" maxlength="15">
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
								<input type="password" class="form-control" placeholder="위의 비밀번호를 다시 입력해주세요" name="pass2" id="pass2" maxlength="15">
								<div id= "invalid_pass4" class="invalid-feedback">
                				비밀번호가 일치하지 않습니다.
              					</div>
								</li>
								
								<li>   
								<input type="text" class="form-control" placeholder="이름" name="name" id="name" maxlength="10">
								<div id= "invalid_name" class="invalid-feedback">
                				이름을 입력해주세요.
              					</div>
              					<div id= "invalid_name2" class="invalid-feedback">
                				최소 2글자 이상, 한글과 영어만 입력하세요.
              					</div>
								</li>
							  	
							  	<li>
								<input type="text" class="form-control" placeholder="연락처" name="phone" id="phone" maxlength="13">
								<div id= "invalid_phone" class="invalid-feedback">
                				연락처를 입력해주세요.
              					</div>
              					<div id= "invalid_phone2" class="invalid-feedback">
                				연락처를 올바르게 입력해주세요.
              					</div>
								</li>
								
								<li>
								<input type="email" class="form-control" placeholder="이메일" name="email" id="email" >
								<div id= "invalid_email" class="invalid-feedback">
                				이메일을 입력해주세요.
              					</div>
              					<div id= "invalid_email2" class="invalid-feedback">
                				이메일을 올바른 형식으로 입력해주세요.
              					</div>
								</li>
							</ul>

							
							<div class="btn_zone">
								<a href=main id="" class="bg_area btn_bg l2"><span>처음으로</span></a>
								<a href="login" id="" type="" class="bg_area btn_bg l1 md" onclick="Validation()"><span>확인</span></a>
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
  	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
<script>
    // 유효성 검사 메서드
    function Validation() {
        //변수에 저장 (html에서 jsp한테 어떻게 들고오냐? -> document.getElementById)
        var uid = document.getElementById("id")
        var pw = document.getElementById("pass")
        var cpw = document.getElementById("pass2")
        var uname = document.getElementById("name")
        var uphone = document.getElementById("phone")
        var mail = document.getElementById("email")
        
        // 정규식
        // id, pw
        var regId = /^[a-zA-Z0-9]{2,10}$/;
        var regPw = /^[a-zA-Z0-9]{2,10}$/;
        // 이름
        var regName = /^[가-힣a-zA-Z]{2,15}$/;
        // 이메일
        var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        
			
		/* /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/; */
        
		//전화번호
		var regPhone = /^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/;

		//아이디 확인
        if(uid.value == ""){
//         	alert("아이디를 입력해주세요")
            document.getElementById('invalid_id').style.display = 'block';
            uid.focus();
            return false;
        } 
		
        //아이디 영어 대소문자 확인
        else if(!regId.test(uid.value)){
//             alert("최소 2자 이상 최대 10자 / 영문 대소문자, 숫자만 입력하세요.")
            document.getElementById('invalid_id2').style.display = 'block';
            uid.focus();
            return false;
        }
		
     // 아이디가 공백이 아닐때
        else if(uid.value != ""){
        	document.getElementById('invalid_id').style.display = 'none';
        	document.getElementById('invalid_id2').style.display = 'none';
        }
		
		
        //비밀번호 확인
        if(pw.value == ""){
            document.getElementById('invalid_pass').style.display = 'block';
            pw.focus();
            return false;
        }
     
        //비밀번호 영어 대소문자 확인
        else if(!regPw.test(pw.value)){
//             alert("최소 2자 최대 15자 영문 대소문자, 숫자만 입력하세요.")
			document.getElementById('invalid_pass').style.display = 'none';
            document.getElementById('invalid_pass2').style.display = 'block';
            pw.focus();
            return false;
        }
       
        //비밀번호와 아이디 비교
        else if(pw.value == uid.value){
//             alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
			document.getElementById('invalid_pass').style.display = 'none';
			document.getElementById('invalid_pass2').style.display = 'none';
            document.getElementById('invalid_pass3').style.display = 'block';
            pw.focus();
            return false;
        }

     // 비밀번호가 공백이 아닐때
        else if(pw.value != ""){
        	document.getElementById('invalid_pass').style.display = 'none';
        	document.getElementById('invalid_pass2').style.display = 'none';
        	document.getElementById('invalid_pass3').style.display = 'none';
        }
        
        //비밀번호 재확인
        if(cpw.value !== pw.value){
//             alert("비밀번호와 동일하지 않습니다.")
            document.getElementById('invalid_pass4').style.display = 'block';
            cpw.focus();
            return false;
        }
        
       // 비밀번호가 일치할 때
        else if(cpw.value == pw.value ){
        	document.getElementById('invalid_pass4').style.display = 'none';
        }
        
     	 //이름 확인 = 한글과 영어만 가능하도록
        if(uname.value == ""){
//             alert("이름을 입력하세요.")
            document.getElementById('invalid_name').style.display = 'block';
            uname.focus();
            return false;
        }
		
     	 // 이름 글자수 확인
        else if(!regName.test(uname.value)){
//          alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
		document.getElementById('invalid_name2').style.display = 'block';
         uname.focus();
         return false;
     }
     	 
     	 
     	// 이름 정상적으로 작성했을 때
        else if(name.value != ""){
        	document.getElementById('invalid_name').style.display = 'none';
        	document.getElementById('invalid_name2').style.display = 'none';
        }
     	 
        
		//연락처 확인
        if(uphone.value == ""){
            document.getElementById('invalid_phone').style.display = 'block';
            uphone.focus();
            return false;
        }
		
		// 연락처 잘쳤을때
        else if(!regPhone.test(uphone.value)){
        	document.getElementById('invalid_phone').style.display = 'none';
        	document.getElementById('invalid_phone2').style.display = 'block';
            uphone.focus();
            return false;
        } 
		
     // 연락처 잘 쳤을 때
        else if(uphone.value != ""){
        	document.getElementById('invalid_phone').style.display = 'none';
        	document.getElementById('invalid_phone').style.display = 'none';
        }
       
		
        //메일주소 확인
        if(mail.value.length == 0){
            document.getElementById('invalid_email').style.display = 'block';
            mail.focus();
            return false;
        }
		
        else if(!regMail.test(mail.value)){
            document.getElementById('invalid_email').style.display = 'none';
            document.getElementById('invalid_email2').style.display = 'block';
         mail.focus();
         return false;
     }
        
     // 이메일 올바를 때
        else if(mail.value != ""){
        	document.getElementById('invalid_email').style.display = 'none';
        	document.getElementById('invalid_email2').style.display = 'none';
        	
        }
        

        // 유효성 문제 없을 시 폼에 submit
//         	document.info.submit();
        	
        
        
    }

   
</script>

</html>
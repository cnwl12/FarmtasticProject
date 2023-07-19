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
					<form id="form1" method="post" action="">
						<fieldset>
							<legend>팜타스틱 회원가입 정보입력</legend>
							<p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
							
							<!-- 구현하는 사람이 NAME, ID 맞추기  -->
							<form class="validation-form" id="join" name="join" method="post">
							<ul class="form_list">
								<li>
								<input type="text" placeholder="ID를 만들어주세요" name="id" id="id" maxlength="10">
								<div class="invalid-feedback">
                				아이디를 입력해주세요.
              					</div>
								</li>   
								
								<li>
								<input type="password" placeholder="비밀번호 입력" name="pass" id="pass" maxlength="15">
								<div class="invalid-feedback">
                				비밀번호를 입력해주세요.
              					</div>
								</li>  
								
								<li> 
								<input type="password" placeholder="위의 비밀번호를 다시 입력해주세요" name="pass2" id="pass2" maxlength="15">
								<div class="invalid-feedback">
               					비밀번호를 다시 확인해주세요.
              					</div>
								</li>
								
								<li>   
								<input type="text" placeholder="이름" name="name" id="name" maxlength="10">
								<div class="invalid-feedback">
                				이름을 입력해주세요.
              					</div>
								</li>
							  	
							  	<li>
								<input type="text" placeholder="연락처" name="phone" id="phone" maxlength="10">
								<div class="invalid-feedback">
                				연락처를 입력해주세요.
              					</div>
								</li>
								
								<li>
								<input type="email" placeholder="이메일" name="email" id="email" >
								<div class="invalid-feedback">
                				이메일을 입력해주세요.
              					</div>
								</li>
							</ul>
							</form>
							
							<div class="btn_zone">
								<a href="#" id="" class="bg_area btn_bg l2"><span>처음으로</span></a>
								<a href="#" id="next" class="bg_area btn_bg l1 md" type="submit" onClick="Validation()"><span>확인</span></a>
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
          if (form.checkValidity() === false) {
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
        //변수에 저장
        var uid = document.getElementById("id")
        var pw = document.getElementById("pass")
        var cpw = document.getElementById("pass2")
        var uname = document.getElementById("name")
        var uphone = document.getElementById("phone")
        var mail = document.getElementById("email")
        
        // 정규식
        // id, pw
        var regIdPw = /^[a-zA-Z0-9]{2,10}$/;
        // 이름
        var regName = /^[가-힣a-zA-Z]{2,15}$/;
        // 이메일
        var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        
			
		/* /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/; */
        
		//전화번호
		var regPhone = /^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/;
		
		//아이디 확인
        if(uid.value == ""){
            alert("아이디를 입력하세요.")
            uid.focus();
            return false;
        }
        //아이디 영어 대소문자 확인
        else if(!regIdPw.test(uid.value)){
            alert("최대 10자 영문 대소문자, 숫자만 입력하세요.")
            uid.focus();
            return false;
        }

        //비밀번호 확인
        if(pw.value == ""){
            alert("비밀번호를 입력하세요.")
            pw.focus();
            return false;
        }
        //비밀번호 영어 대소문자 확인
        else if(!regIdPw.test(pw.value)){
            alert("최대 15자 영문 대소문자, 숫자만 입력하세요.")
            pw.focus();
            return false;
        }
       
        //비밀번호와 아이디 비교
        else if(pw.value == uid.value){
            alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
            pw.focus();
            return false;
        }


        //비밀번호 확인
        if(cpw.value !== pw.value){
            alert("비밀번호와 동일하지 않습니다.")
            cpw.focus();
            return false;
        }
     	 //이름 확인 = 한글과 영어만 가능하도록
        if(uname.value == ""){
            alert("이름을 입력하세요.")
            uname.focus();
            return false;
        }

        else if(!regName.test(uname.value)){
            alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
            uname.focus();
            return false;
        }

        
		//연락처 확인
        if(uphone.value == ""){
            alert("연락처를 입력하세요.")
            uphone.focus();
            return false;
        }
       /*  else if(!regPhone.test(uphone.value)){
            alert("연락처를 정확하게 입력해주세요.")
            uphone.focus();
            return false;
        } */
		
		
        //메일주소 확인
        if(mail.value.length == 0){
            alert("메일주소를 입력하세요.")
            mail.focus();
            return false;
        }

        else if(!regMail.test(mail.value)){
            alert("잘못된 이메일 형식입니다.")
            mail.focus();
            return false;
        }

        
      
       

        // 유효성 문제 없을 시 폼에 submit
        document.info.submit();
    }

   
</script>

</html>
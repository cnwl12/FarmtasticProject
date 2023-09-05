window.addEventListener('load', () => { 
    const forms = document.getElementsByClassName('validation-form'); 

    Array.prototype.filter.call(forms, (form) => { 
        form.addEventListener('submit', function (event) { 
            if (form.checkValidity() == false) { 
                event.preventDefault(); // 이 부분만 유지하고
            }
            form.classList.add('was-validated'); 
        }, false);
    });
});


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
      
      $("#seller_storeName").on("input", function() {
    	  validateStoreName();
      });
      
      $("#seller_accountNum").on("input", function() {
    	  validateAccountNum();
      });
     
      $("#seller_accountHolder").on("input", function() {
    	  validateAccountHolder();
      });
      
      $("#seller_licenseNum").on("input", function() {
    	  validateLicenseNum();
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
           alert("가입을 환영합니다. 승인을 기다려주세요!")
           // 폼 데이터를 JavaScript 객체로 만듭니다.
//            var formData = $("#join2").serialize();

//            // ajax 요청을 보냅니다.
//            $.ajax({
//              type: "POST",
//              url: $("#join2").attr("action"),
//              data: formData,
//              success: function() {
//                // 요청이 성공적으로 처리되었을 때, login 페이지로 이동합니다.
//                location.href = 'login';
//              },
//              error: function() {
//                // 요청 처리 중 오류가 발생한 경우에 대한 처리를 여기에 추가할 수 있습니다.
//                alert("정보를 처리중에 오류가 발생했습니다. 다시 시도해주세요");
//              }
//            });
         }
         
          }); 

 });
    
    var isIdDuplicated = false;
    var isEmailDuplicated = false
    
    // 정규식
    var regId = /^[a-zA-Z0-9]{2,10}$/;
    var regPw = /^[a-zA-Z0-9]{2,10}$/;
    var regName = /^[가-힣a-zA-Z]{2,15}$/;
    var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var regPhone = /^01[0-9]{1}[0-9]{8,9}$/;
    var regLicenseNum = /^([0-9]{3})-([0-9]{2})-([0-9]{5})$/;
    var regLicenseNum2 = /^([0-9]{10})$/;
    var regNumber = /^(\d{1,14})$/;

    //  유효성 검사 메서드
    function validateId() {
      var uid = $("#seller_id");
      if (uid.val() == "" || !regId.test(uid.val())) {
        $('#invalid_id2').show();
        uid.focus();
        return false;
      } else if (isIdDuplicated) { // 아이디가 중복되었을 경우
        $('#invalid_id').show();
        uid.focus();
        return false;
      }else {
        $('#invalid_id2').hide();
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
		  if (usname.val().trim() === "" || !regName.test(usname.val())) {
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

    	  if (ulnum.val() == "") {
    	    $('#invalid_licenseNum').show();
    	    ulnum.focus();
    	    return false;
    	  } else {
    	    if (!regLicenseNum.test(ulnum.val()) && regLicenseNum2.test(ulnum.val())){
    	      var formattedLicenseNum = addHyphenToLicenseNum(ulnum.val());
    	      ulnum.val(formattedLicenseNum);
    	    } else if (!regLicenseNum.test(ulnum.val()) && !regLicenseNum2.test(ulnum.val())) {
    	      $('#invalid_licenseNum').show();
    	      ulnum.focus();
    	      return false;
    	    }

    	    $('#invalid_licenseNum').hide();
    	    return true;
    	  }
    	}

    
    function addHyphenToLicenseNum(licenseNum) {

    	  // 재배치 후 하이픈 추가
    	  var formattedLicenseNum =
    		licenseNum.slice(0, 3) +
    	    '-' +
    	    licenseNum.slice(3, 5) +
    	    '-' +
    	    licenseNum.slice(5, 10);

    	  return formattedLicenseNum;
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
        if (uaholder.val() == "" || !regName.test(uaholder.val())) {
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
      var phoneNumber = uphone.val();
       var onlyNumbers = phoneNumber.replace(/[^0-9]/g, '');
       
       uphone.val(onlyNumbers);
       
     if (phoneNumber !== onlyNumbers) {
        $('#invalid_phone2').show(); // 다른 문자가 포함된 경우 오류 메시지 표시
        $('#invalid_phone').hide();
        uphone.focus();
        return false;
    } else if (!regPhone.test(onlyNumbers)) {
        $('#invalid_phone').show(); // 올바르지 않은 전화번호 형식일 경우 오류 메시지 표시
        $('#invalid_phone2').hide();
        uphone.focus();
        return false;
    } else {
        $('#invalid_phone').hide();
        $('#invalid_phone2').hide();
        return true;
    }
   }

    function validateEmail() {
      var mail = $("#seller_email");
      if (mail.val() == "" || !regMail.test(mail.val())) {
        $('#invalid_email').show();
        mail.focus();
        return false;
      } else if (isEmailDuplicated) { // 이메일 중복되었을 경우
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
    
    function validateType() {
        var type = $("#seller_type");
        if (type.val() == "") {
          $('#invalid_type').show();
          type.focus();
          return false;
        } else {
          $('#invalid_type').hide();
          return true;
        }
      }    

    function validateAll() {
      return validateId() && validatePass() && validatePass2() && validateName() && validatePhone() && validateEmail() && validatePost() && validateStoreName() && validateAccountNum() && validateAccountHolder() && validateLicenseNum() && validateType();
    }
    
    $(document).ready(function() {
        var timeoutId;

        $("#seller_email").on("keyup", function() {
            clearTimeout(timeoutId); // 이미 설정된 타이머 제거

            var seller_email = $(this).val();

            // 새로운 타이머 설정: 500ms 동안 추가 입력이 없으면 함수 실행
            timeoutId = setTimeout(function() {
                $.ajax({
                    url: "emailCheck2",
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {
                        "seller_email": seller_email
                    },
                    success: function(data) {
                        if (data === 1) {
                            $("#invalid_email").text("이메일이 중복입니다.").show();
                            isEmailDuplicated = true;
                        } else {
                            $("#invalid_email").hide();
                            isEmailDuplicated = false;
                        }
                    },
                    error: function(xhr, textStatus, error) {
                    }
                });
            }, 500); // 타이머 시간 설정 (ms)
        });
    });
    
    $(document).ready(function() {
        var timeoutId;

        $("#seller_id").on("keyup", function() {
            clearTimeout(timeoutId); // 이미 설정된 타이머 제거

            var seller_id = $(this).val();

            // 새로운 타이머 설정: 500ms 동안 추가 입력이 없으면 함수 실행
            timeoutId = setTimeout(function() {
                $.ajax({
                    url: "idCheck2",
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {
                        "seller_id": seller_id
                    },
                    success: function(data) {
                        if (data === 1) {
                            $("#invalid_id").text("아이디가 중복입니다.").show();
                            isIdDuplicated = true;
                        } else {
                            $("#invalid_id").hide();
                            isIdDuplicated = false;
                        }
                    },
                    error: function(xhr, textStatus, error) {
                    }
                });
            }, 500); // 타이머 시간 설정 (ms)
        });
    });


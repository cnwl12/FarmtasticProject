function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
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
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = data.roadAddress;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            document.getElementById("sample4_extraAddress").value = data.userSelectedType === "R" ? data.bname : "";
           
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            document.getElementById("sample4_extraAddress").value = '';
            if (roadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                
            }
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if (data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
           
            window.opener.closeDaumPostcode();
        
        },
    
    }).open();
}

function closeDaumPostcode() {
        // 팝업 창을 닫습니다.
        window.close();
}

function validateNewPassword() {
    var newPassword = document.getElementById("new_member_pass").value;
    var confirmPassword = document.getElementById("pwd2").value;

    if (newPassword != confirmPassword) {
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
    // 마이페이지 전환 초기 설정
    $("#menu2_cont").hide();
    $("#menu3_cont").hide();
    $("#menu4_cont").hide();
    $("#menu5_cont").hide();

    // 마이페이지 전환 함수
    function toggleMypage(target) {
        $("#menu1_cont").hide();
        $("#menu1").removeClass("on");
        $("#menu2_cont").hide();
        $("#menu2").removeClass("on");
        $("#menu3_cont").hide();
        $("#menu3").removeClass("on");
        $("#menu4_cont").hide();
        $("#menu4").removeClass("on");
        $("#menu5_cont").hide();
        $("#menu5").removeClass("on");
      
      if (target === "mypage") {
          $("#menu1_cont").show();
          $("#menu1").addClass("on");
      } else if (target === "myorder") {
          $("#menu2_cont").show();
          $("#menu2").addClass("on");
      } else if (target === "myreview") {
          $("#menu3_cont").show();
          $("#menu3").addClass("on");
      } else if (target === "myoneboard") {
          $("#menu4_cont").show();
          $("#menu4").addClass("on");
      } else if (target === "myzzim") {
          $("#menu5_cont").show();
          $("#menu5").addClass("on");
      }
    }
  // 메뉴 클릭 이벤트 핸들러
  $(".toggle-mypage").on("click", function(e) {
    e.preventDefault();
    let target = $(this).data("target");
    toggleMypage(target);
  });
 }); 
 
 $(document).ready(function () {
  var selectedReview;
  var selectedMember;

  // 삭제 버튼 클릭 이벤트
  $(document).on('click', '#delete-review-button', function () {
    var checkedReviews = $('input[type=checkbox]:checked');
    if (checkedReviews.length === 1) {
      // 첫 번째 체크된 리뷰 요소에서 data-review_num 값을 가져옵니다.
      selectedReview = checkedReviews.first().data("review_num");
      selectedMember = checkedReviews.first().data("member_num");
      console.log('Selected review number:', selectedReview);

      deleteReview(selectedReview, selectedMember);
    } else {
      alert('한 개의 리뷰만 선택해 주세요.');
    }
  });

  // 리뷰를 삭제하는 함수
  function deleteReview(selectedReview, selectedMember) {
    $.ajax({
      type: 'POST',
      url: 'deleteReview',
      data: {
        review_num: selectedReview,
        member_num: selectedMember // 쉼표로 구분하세요.
      },
      dataType: 'text',
      success: function (responseText) {
        console.log(responseText);
        if (responseText === 'The review has been successfully deleted.') {
          alert('리뷰가 성공적으로 삭제되었습니다.');
          location.reload(); // 페이지를 새로고침합니다.
        } else {
          alert('리뷰 삭제에 실패했습니다. 다시 시도해 주세요.');
        }
      },
      error: function () {
        alert('리뷰 삭제에 실패했습니다. 다시 시도해 주세요.');
      },
    });
  }
});


function handleRowClick(isPrivate, oneBoardNum, oneBoardPass, boardPasswordInputId) {
     var questionElement = document.getElementById("question" + oneBoardNum);
     var answerElement = document.getElementById("answer" + oneBoardNum);
     var passwordRowElement = document.getElementById("password_row" + oneBoardNum);
     
     // 내용이 열려있는 것이 숨김 처리되는 경우
     if (
       (questionElement.style.display !== "none" && isPrivate) ||
       (!isPrivate && questionElement.style.display !== "none")
     ) {
       questionElement.style.display = "none";
       answerElement.style.display = "none";
       passwordRowElement.style.display = "none";
     } else {
       if (isPrivate) {
         passwordRowElement.style.display = "";
       } else {
         questionElement.style.display = "";
         answerElement.style.display = "";
       }
     }
   }

 function showQuestionAndAnswer(oneBoardNum) {
     // 질문과 답변 element를 가져옵니다.
     var questionElement = document.getElementById("question" + oneBoardNum);
     var answerElement = document.getElementById("answer" + oneBoardNum);

     // 질문과 답변 element의 display 상태를 전환합니다.
     questionElement.style.display = questionElement.style.display === "table-row" ? "none" : "table-row";
     answerElement.style.display = answerElement.style.display === "table-row" ? "none" : "table-row";
   }
 
 
 function checkPassword(savedPassword, oneBoardNum, inputPasswordId) {
     var inputPassword = document.getElementById(inputPasswordId).value;

     if (savedPassword === inputPassword) {
       // 비밀번호가 일치할 경우 비밀번호 입력창을 숨기고 질문과 답변을 표시합니다.
       showQuestionAndAnswerAndHidePasswordInput(oneBoardNum, inputPasswordId);
     } else {
       // 일치하지 않는 경우 경고 메시지를 표시합니다.
       alert("비밀번호가 일치하지 않습니다.");
     }
   }
   
    function showQuestionAndAnswerAndHidePasswordInput(oneBoardNum, inputPasswordId) {
     var questionElement = document.getElementById("question" + oneBoardNum);
     var answerElement = document.getElementById("answer" + oneBoardNum);
     var passwordRowElement = document.getElementById("password_row" + oneBoardNum);

     // 질문과 답변 창을 표시합니다.
     questionElement.style.display = "table-row";
     answerElement.style.display = "table-row";

     // 비밀번호 입력창을 숨깁니다.
     passwordRowElement.style.display = "none";
   }

   function togglePasswordInput(oneBoardNum) {
     var passwordRowElement = document.getElementById("password_row" + oneBoardNum);

     // 비밀번호 입력창의 display 상태를 전환합니다.
     passwordRowElement.style.display = passwordRowElement.style.display === "table-row" ? "none" : "table-row";
   }

 function deleteFromWishlist(member_num, item_num, callback) {
	   // 서버에 삭제 요청 보내기 (AJAX)
	   $.ajax({
	     url: "toggle_favorite?_num=" + item_num,
	     type: "GET",
	     dataType: "json",
	     data: {
	       member_num: member_num,
	       item_num: item_num,
	     },
	     success: function (response) {
	       if (typeof callback === "function") {
	         callback(response);
	       }
	     },
	     error: function (request, status, error) {
	       alert("찜하기 처리에 실패하였습니다. 다시 시도해주세요.");
	     },
	   });
	 }
	 
	 
 
 
  
 
 
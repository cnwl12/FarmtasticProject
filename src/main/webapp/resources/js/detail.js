function openPopup() {
	  window.open(
	    "oneboard?item_num=" + item_num, 
	    "oneboardpop", 
	    "width=600, height=1000, left=100, top=50, scrollbars=no, resizable=yes"
	  );
	}
	
function checkLogin() {
		  // 로그인 여부를 확인하려면 input 태그에서 member_num 값을 가져옵니다.
		  var member_num = document.getElementById("member_num").value;

		  if (member_num == null || member_num == "") {
		    // 로그인되어 있지 않은 경우 login.jsp로 이동합니다.
		    window.location.href = "login";
		  } else {
		    // 로그인된 경우 openPopup 함수를 호출하여 문의하기 창을 엽니다.
		    openPopup();
		  }
		}
		
function handleRowClick(isPrivate, oneBoardNum, oneBoardPass, boardPasswordInputId) {
		  var questionElement = document.getElementById("question" + oneBoardNum);
		  var answerElement = document.getElementById("answer" + oneBoardNum);
		  var passwordRowElement = document.getElementById("password_row" + oneBoardNum);

		  // 로그 추가

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
		
					
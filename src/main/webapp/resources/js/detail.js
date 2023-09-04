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

// 사용자가 상품을 클릭했을 때 실행되는 함수입니다.
function viewItem(member_num, item) {
    let viewedItems = localStorage.getItem(member_num);
    if (viewedItems === null) {
      viewedItems = [];
      console.log("상품클릭)아이템null : " + JSON.stringify(viewedItems));
    } else {
      viewedItems = JSON.parse(viewedItems);
      console.log("상품클릭)아이템있음 : " + JSON.stringify(viewedItems));
    }

    // 이미 본 상품이면 리스트에서 제거 후 다시 추가(최신 위치로)
    const existingIndex = viewedItems.findIndex(i => i.num === item.num);
    if (existingIndex > -1) {
      viewedItems.splice(existingIndex, 1);
    }

    // 최근 본 상품에 추가
    viewedItems.push(item);
    console.log("최근 본 상품에 추가 : " + JSON.stringify(viewedItems));
    
     // 리스트가 너무 길어지지 않도록 항상 일정 크기 유지(예: 최근 10개만 유지)
     while (viewedItems.length > 10) {
       viewedItems.shift();
     }

   localStorage.setItem(member_num, JSON.stringify(viewedItems));
   console.log("로컬스터리지에 저장 : " + JSON.stringify(viewedItems));
}

 // 가상의 UI 이벤트 핸들러
function onItemClicked(itemNum, itemName, itemPrice, itemMainImg) {
    let loggedInMemberNum = getLoggedInMemberNum(); // 현재 로그인한 사용자 ID 가져오기

    if (loggedInMemberNum !== null) {        
        let item ={
            num : itemNum,
            name : itemName,
            price : itemPrice,
            mainImg : itemMainImg,
        };
          
        viewItem(loggedInMemberNum,item );
    }
}

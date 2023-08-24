<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇 테스트</title>

<style>
body {
    font-family: Arial, sans-serif;
}

#questions {
    display: flex;
    flex-direction: column;
}

.question {
    margin-bottom: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
}

#answer {
    margin-top: 20px;
    border: 1px solid #ccc;
    padding: 10px;
}
</style>


</head>
<body>
	<button id="chat-toggle" style="display: none;">열기</button>
	<div id="chat-panel" style="display: none;">
	    <div id="questions">
	        <button class="question" data-answer="버튼1에 대한 대답입니다.">질문1</button>
	        <button class="question" data-answer="버튼2에 대한 대답입니다.">질문2</button>
	        <button class="question" data-answer="버튼3에 대한 대답입니다.">질문3</button>
	    </div>
	    <div id="answer"></div>
	</div>
    
	<script>
		document.querySelectorAll('.question').forEach(function(button) {
		    button.addEventListener('click', function() {
		        const answer = button.getAttribute('data-answer');
		        document.getElementById('answer').textContent = answer;
		    });
		});
	</script>
    
</body>
</html>
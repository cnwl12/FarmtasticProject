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
#chat-toggle, #chat-panel {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
}

#chat-panel {
    display: none;
    width: 300px;
    height: 400px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    padding: 20px;
    background-color: white;
    color: black;
}

#chat-panel #questions {
    flex-direction: column;
    overflow-y: auto;
    max-height: 70%;
}

#chat-panel #answer {
    margin-top: 20px;
    border: 1px solid #ccc;
    padding: 10px;
    height: 25%;
    overflow-y: auto;
}

.question {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
    margin-bottom: 10px;
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
	
	document.getElementById('chat-toggle').addEventListener('click', function() {
	    const chatPanel = document.getElementById('chat-panel');
	    const chatToggle = document.getElementById('chat-toggle');
	    if (chatPanel.style.display === 'none') {
	        chatPanel.style.display = 'block';
	        chatToggle.style.display = 'none';
	    } else {
	        chatPanel.style.display = 'none';
	        chatToggle.style.display = '';
	    }
	});

	window.addEventListener('DOMContentLoaded', function() {
	    document.getElementById('chat-toggle').style.display = '';
	});
	</script>
    
</body>
</html>
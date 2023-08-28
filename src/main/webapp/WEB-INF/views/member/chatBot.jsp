<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇 테스트</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/joinPost.js"></script>

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

#close-chat {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #f44336;
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

.message {
    margin: 10px;
    padding: 10px;
    border-radius: 5px;
}

.user-message {
   align-self: flex-end;
   background-color: #4CAF50; 
   color: white;
}

.bot-message {
   align-self: flex-start;
   background-color: #f1f0f0; 
}

#chat-container {
	height: 100%;
    overflow-y: auto;
}

</style>


</head>
<body>
<button id="chat-toggle" style="display: none;">열기</button>
<div id="chat-panel" style="display: none;">
    <button id="close-chat">닫기</button>
    <div id="chat-container">
        <div class="message bot-message">안녕하세요! 어떻게 도와드릴까요?</div>
    </div>
</div>
    
	<script>
	document.getElementById('chat-toggle').addEventListener('click', function() {
	    const chatPanel = document.getElementById('chat-panel');
	    const chatToggle = document.getElementById('chat-toggle');
	    const closeChat = document.getElementById('close-chat');
	    if (chatPanel.style.display === 'none') {
	        chatPanel.style.display = 'block';
	        chatToggle.style.display = 'none';
	        closeChat.style.display = '';
	    } else {
	        chatPanel.style.display = 'none';
	        chatToggle.style.display = '';
	        closeChat.style.display = 'none'; 
	    }
	});

	$(document).ready(function() {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/chatBot2",
	        type: "GET",
	        dataType: "json",
	        success: function(data) {
	            const chatContainer = $("#chat-container");
	            $.each(data, function(index, chatbotData) {
	                const button = $("<button>")
	                    .addClass("question")
	                    .text(chatbotData.chatbot_question)
	                    .data('id', chatbotData.chatbot_id)
	                    .click(function() {
	                        // 사용자의 질문 추가
	                        const userQuestionDiv = $("<div>").addClass("message user-message").text(chatbotData.chatbot_question);
	                        chatContainer.append(userQuestionDiv);

	                        // 여기서 AJAX 요청을 통해 상세질문 데이터를 가져옵니다.
	                        $.ajax({
	                            url: "${pageContext.request.contextPath}/detailChatBot/" + $(this).data('id'),
	                            type: 'GET',
	                            dataType: 'json',
	                            success: function(detailData) {
	                            	console.log(detailData);
	                                $.each(detailData, function(index, detailChatBotData) {
	                                    const detailButton = $('<button>')
	                                        .addClass('detail-question')
	                                        .text(detailChatBotData.detailChatbotDetailed_question)
	                                        .attr('data-answer', detailChatBotData.detailChatbotDetailed_answer)
	                                        .click(function() {
	                                            // 사용자의 상세질문 추가
	                                            const userDetailQuestionDiv = $('<div>').addClass('message user-message').text(detailChatBotData.detailChatbotDetailed_question);
	                                            chatContainer.append(userDetailQuestionDiv);

	                                            // 챗봇의 답변 추가
	                                            const botAnswerDiv = $('<div>').addClass('message bot-message').text($(this).attr('data-answer'));
	                                            chatContainer.append(botAnswerDiv);

	                                            setTimeout(function() {
	                                                var chatContainerElement = document.getElementById('chat-container');
	                                                console.log("Scroll Height: ", chatContainerElement.scrollHeight);  // 로그 추가
	                                                chatContainerElement.scrollTop = chatContainerElement.scrollHeight;
	                                            }, 0);
	                                        });
	                                    // 초기에는 모든 상세질문을 보여주기 위해 버튼들을 #chat-container 에 추가합니다.
	                                    // 필요에 따라 다른 위치(예 : 별도의 패널)에 배치할 수 있습니다.
	                                    chatContainer.append(detailButton);
	                                });
	                            },
	                            error: function(jqXHR, textStatus, errorThrown) {
	                                console.error(textStatus, errorThrown);
	                            }
	                        });
	                    });

	                // 초기에는 모든 질문을 보여주기 위해 버튼들을 #chat-container 에 추가합니다.
	                // 필요에 따라 다른 위치(예: 별도의 패널)에 배치할 수 있습니다.
	                chatContainer.append(button);
	            });

	            $("#chat-toggle").show();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error(textStatus, errorThrown);
	        }
	    });
	});

	
	document.getElementById('close-chat').addEventListener('click', function() {
	    const chatPanel = document.getElementById('chat-panel');
	    const chatToggle = document.getElementById('chat-toggle');
	    
	    // 챗봇 패널을 숨김
	    chatPanel.style.display = 'none';

	    // "열기" 버튼을 다시 보여줌
	    chatToggle.style.display = '';
	});

	</script>
	
	<!-- Js Plugins -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
</body>
</html>
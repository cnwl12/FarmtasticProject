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
	        url: "chatBot2",
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
	                            url: "detailChatBot/" + $(this).data('id'),
	                            type: 'GET',
	                            dataType: 'json',
	                            success: function(detailData) {
	                                $.each(detailData, function(index, detailChatBotData) {
	                                    const detailButton = $('<button>')
	                                        .addClass('detail-question')
	                                        .text(detailChatBotData.detailChatbotDetailed_question)
	                                        .attr('data-answer', detailChatBotData.detailChatbotDetailed_answer)
	                                        .click(function() {
	                                            if (detailChatBotData.detailChatbotDetailed_question == "처음으로") {
	                                                // 챗봇 패널 내용 초기화
	                                                chatContainer.empty();
	                                                
	                                             	// 초기 메시지 다시 표시
	                                                const botMessageDiv = $("<div>").addClass("message bot-message").text("또 무엇을 도와드릴까요?");
	                                                chatContainer.append(botMessageDiv);
	                                                
	                                                // 첫 번째 질문들을 다시 로드합니다.
	                                                loadFirstQuestions(chatContainer);
	                                            }
	                                        	// 사용자의 상세질문 추가
	                                        	const userDetailQuestion = detailChatBotData.detailChatbotDetailed_question;
	                                        	const userDetailQuestionDiv = $('<div>').addClass('message user-message').text(userDetailQuestion);
												 if (userDetailQuestion !== "처음으로") {
												     chatContainer.append(userDetailQuestionDiv);
												 }
	                                        	if (detailChatBotData.detailChatbotDetailed_question == "문의 남기기") {
                                        		    if ($('input[name="member_num"]').val() == "") {
												        alert("로그인 후 이용해주세요");
												        window.location.href = "/FarmProject/login";
												    } else {
	                                        	    const inputBox = $('<textarea>').attr('id', 'queryText');
	                                        	    const submitButton = $('<button>').text('제출').addClass('submit-button').click(function() {
	                                        	        // 여기서 query 변수를 서버에 전송하거나 처리합니다.
	                                        	        var query = $("#queryText").val();
	                                        	        var memberNum = $('input[name="member_num"]').val();
	                                        	        console.log(query);
	                                        	        $.ajax({
	                                        	            url: "submitQuery",
	                                        	            type: 'POST',
	                                        	            data: { 
	                                        	                'query': query,
	                                        	                'member_num': memberNum
	                                        	            },
	                                        	            success: function(response) {
	                                        	                // 서버에서 응답이 오면 이 부분이 실행됩니다.
	                                        	                // response 변수는 서버에서 보낸 데이터입니다.
	                                        	                console.log(response);
	                                        	                if(response == "Not logged in"){
	                                        	                	alert("문의는 로그인 후 이용 가능합니다.");
	                                        	                }else{
	                                        	                	alert("문의가 성공적으로 전달되었습니다. 답변은 3일내 가입 시 입력한 이메일로 발송 될 예정입니다.")
	            	                                                // 챗봇 패널 내용 초기화
	            	                                                chatContainer.empty();
	            	                                                
	            	                                             	// 초기 메시지 다시 표시
	            	                                                const botMessageDiv = $("<div>").addClass("message bot-message").text("또 무엇을 도와드릴까요?");
	            	                                                chatContainer.append(botMessageDiv);
	            	                                                
	            	                                                // 첫 번째 질문들을 다시 로드합니다.
	            	                                                loadFirstQuestions(chatContainer);
	                                        	                }
	                                        	            },
	                                        	            error: function(jqXHR, textStatus, errorThrown) {
	                                        	                console.error(textStatus, errorThrown);
	                                        	            }
	                                        	        });
	                                        	    });
	                                        	    var inputDiv = $('<div>');
													inputDiv.append(inputBox);
													inputDiv.append(submitButton);
													
													chatContainer.append(inputDiv); 
	                                        	  }
	                                        	} else {
	                                        	    chatContainer.append(userDetailQuestionDiv);

	                                        	    // 챗봇의 답변 추가
	                                        	    const botAnswer = detailChatBotData.detailChatbotDetailed_answer;
													if (botAnswer !== null) {
													    const botAnswerDiv = $('<div>').addClass('message bot-message');
													    const botImage = $("<img>").attr("src", "/FarmProject/resources/img/gamza.png").addClass("message-img");
													    botAnswerDiv.append(botImage);
													    botAnswerDiv.append(botAnswer);
													    chatContainer.append(botAnswerDiv);
													    loadFirstQuestions(chatContainer)
													}
	                                        	}
	                                            setTimeout(function() {
	                                                var chatContainerElement = document.getElementById('chat-container');
	                                                console.log("Scroll Height: ", chatContainerElement.scrollHeight);  // 로그 추가
	                                                chatContainerElement.scrollTop = chatContainerElement.scrollHeight;
	                                            }, 0);
	                                        });
	                                    chatContainer.append(detailButton);
	                                });
	                            },
	                            error: function(jqXHR, textStatus, errorThrown) {
	                                console.error(textStatus, errorThrown);
	                            }
	                        });
	                    });
	                chatContainer.append(button);
	            });

	            $("#chat-toggle").show();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error(textStatus, errorThrown);
	        }
	    });
	});
	
	function loadFirstQuestions(chatContainer) {
	    $.ajax({
	        url: "chatBot2",
	        type: "GET",
	        dataType: "json",
	        success: function(data) {
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
	                            url: "detailChatBot/" + $(this).data('id'),
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
	                                            if (detailChatBotData.detailChatbotDetailed_question == "처음으로") {
	                                            	// 챗봇 패널 내용 초기화
	                                                chatContainer.empty();
	                                            	
	                                                // 초기 메시지 다시 표시
	                                                const botMessageDiv = $("<div>").addClass("message bot-message").text("또 무엇을 도와드릴까요?");
	                                                chatContainer.append(botMessageDiv);
	                                                
	                                                // 첫 번째 질문들을 다시 로드합니다.
	                                                loadFirstQuestions(chatContainer);
	                                            }
	                                        	// 사용자의 상세질문 추가
	                                        	const userDetailQuestion = detailChatBotData.detailChatbotDetailed_question;
	                                        	const userDetailQuestionDiv = $('<div>').addClass('message user-message').text(userDetailQuestion);
												 if (userDetailQuestion !== "처음으로") {
												     chatContainer.append(userDetailQuestionDiv);
												 }
	                                        	if (detailChatBotData.detailChatbotDetailed_question == "문의 남기기") {
		                                        	if ($('input[name="member_num"]').val() == "") {
												        alert("로그인 후 이용해주세요");
												        window.location.href = "/FarmProject/login";
												    } else {
	                                        	    const inputBox = $('<textarea>').attr('id', 'queryText');
	                                        	    const submitButton = $('<button>').text('제출').addClass('submit-button').click(function() {
	                                        	        // 여기서 query 변수를 서버에 전송하거나 처리합니다.
	                                        	        var query = $("#queryText").val();
	                                        	        var memberNum = $('input[name="member_num"]').val();
	                                        	        console.log(query);
	                                        	        $.ajax({
	                                        	            url: "submitQuery",
	                                        	            type: 'POST',
	                                        	            data: { 
	                                        	                'query': query,
	                                        	                'member_num': memberNum
	                                        	            },
	                                        	            success: function(response) {
	                                        	                // 서버에서 응답이 오면 이 부분이 실행됩니다.
	                                        	                // response 변수는 서버에서 보낸 데이터입니다.
	                                        	                console.log(response);
	                                        	                if(response == "Not logged in"){
	                                        	                	alert("문의는 로그인 후 이용 가능합니다.");
	                                        	                } else {
	                                        	                	alert("문의가 성공적으로 전달되었습니다. 답변은 3일내 가입 시 입력한 이메일로 발송 될 예정입니다.")
	            	                                                // 챗봇 패널 내용 초기화
	            	                                                chatContainer.empty();
	            	                                                
	            	                                             	// 초기 메시지 다시 표시
	            	                                                const botMessageDiv = $("<div>").addClass("message bot-message").text("또 무엇을 도와드릴까요?");
	            	                                                chatContainer.append(botMessageDiv);
	            	                                                
	            	                                                // 첫 번째 질문들을 다시 로드합니다.
	            	                                                loadFirstQuestions(chatContainer);
	                                        	                }
	                                        	            },
	                                        	            error: function(jqXHR, textStatus, errorThrown) {
	                                        	                console.error(textStatus, errorThrown);
	                                        	            }
	                                        	        });
	                                        	    });
	                                        	    
	                                        	    var inputDiv = $('<div>');
													inputDiv.append(inputBox);
													inputDiv.append(submitButton);
													
													chatContainer.append(inputDiv); 

	                                        	  }
	                                        	} else {
	                                        	    chatContainer.append(userDetailQuestionDiv);

	                                        	    // 챗봇의 답변 추가
	                                        	    const botAnswer = detailChatBotData.detailChatbotDetailed_answer;
													if (botAnswer !== null) {
													    const botAnswerDiv = $('<div>').addClass('message bot-message');
													    const botImage = $("<img>").attr("src", "/FarmProject/resources/img/gamza.png").addClass("message-img");
													    botAnswerDiv.append(botImage);
													    botAnswerDiv.append(botAnswer);
													    chatContainer.append(botAnswerDiv);
													    loadFirstQuestions(chatContainer);
													}
	                                        	}
	                                            setTimeout(function() {
	                                                var chatContainerElement = document.getElementById('chat-container');
	                                                console.log("Scroll Height: ", chatContainerElement.scrollHeight);  // 로그 추가
	                                                chatContainerElement.scrollTop = chatContainerElement.scrollHeight;
	                                            }, 0);
	                                        });
	                                    chatContainer.append(detailButton);
	                                });
	                                
	                            },
	                            error: function(jqXHR, textStatus, errorThrown) {
	                                console.error(textStatus, errorThrown);
	                            }
	                        });
	                    });
	                chatContainer.append(button);
	            });
	            
	            $("#chat-toggle").show();
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error(textStatus, errorThrown);
	        }
	    });
	};

	
	document.getElementById('close-chat').addEventListener('click', function() {
	    const chatPanel = document.getElementById('chat-panel');
	    const chatToggle = document.getElementById('chat-toggle');
	    
	    // 챗봇 패널을 숨김
	    chatPanel.style.display = 'none';

	    // "열기" 버튼을 다시 보여줌
	    chatToggle.style.display = '';
	});


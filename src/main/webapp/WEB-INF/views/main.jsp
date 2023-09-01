<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
 
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Farmtastic_Main</title>
    
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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
 
    <!-- Css Styles --> 
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
 	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/autoComplete.css">
 	    
 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</head>

<body>
 <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                </div> 
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3"> 
                    <div class="header__logo">
                        <a href="main"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6"> 
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="main">팜타스틱</a></li>
                            <li><a href="farmStore">팜팜마켓</a></li>
                            <li><a href="blog">제철팜</a></li>
                            <li><a href="contact">공지사항</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="mypage"><i class="fa fa-user"></i></a></li>
                           <li><a href="shoppingCart"><i class="fa fa-shopping-bag"></i>
										<c:if test="${not empty sessionScope.member_num && sessionScope.item_count > 0}">
											<span>${sessionScope.item_count}</span>
										</c:if>
									 </a></li>
                        </ul>
                     <div class="header__top__right__auth">
  						<c:choose>
      					<c:when test="${empty sessionScope.member_num}">
         				 <a href="login">Login</a>
      					</c:when>
      					<c:otherwise>
         				<a href="farm/logout"><i class="fa fa-sign-out"></i>Logout</a>
     					</c:otherwise>
  						</c:choose>
					</div>
                    </div>
  	               </div>
            </div>  
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div> 
    </header>
    <!-- Header Section End -->
 
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>모든 카테고리</span>
                        </div>
                        <ul style="display: block;"> 
                        <c:forEach var="type" items="${typeList}">  
                            <li><a href="${pageContext.request.contextPath}/search?query=${type.type_name}">${type.type_name}</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                          <form action="search" method="get" id="search-form">
                               <section class="search">	
                                <input type="text" name="query" id="searchQuery" autocomplete="off">
                                  <div class="autocomplete"></div>
                                </section>
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                    </div> 
                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br>100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="farmStore" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
              <c:forEach var="item" items="${itemList}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg">
                                  <a href="farmStoreDetail?item_num=${item.item_num}">
                              <div class="image-container">
				                        <div class="product-image"
				                             style="background-image: url('${item.item_mainImg}');"></div>
				                       <c:choose>
				                         <c:when test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
				                            <div class="overlay sold-out">판매 종료</div>
				                        </c:when>
				                        <c:when test="${item.item_left < 3}">
				                            <div class="overlay sold-out">마감 임박</div>
				                        </c:when>
				                        </c:choose>
				                    </div>
				                  </a>
                            <ul class="featured__item__pic__hover">
                               <li>
	                             <a href="#" class="wishlist-btn" data-member-num="${sessionScope.member_num}" data-item-num="${item.item_num}">
								  <i class="${item.isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
								</a>
								</li>
								<c:choose>
						    <c:when test="${item.item_left > 0 && item.item_salesStatus != 'N'}">
											<li><a href="#" onclick="insertCart(${item.item_num});">
													<i class="fa fa-shopping-cart"></i>
											</a></li>
										</c:when>
						</c:choose>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="farmStoreDetail?item_num=${item.item_num}">${item.item_name}</a></h6>
                            <h5>${item.item_price}</h5>
                        </div>
                    </div>
                </div>
               </c:forEach>
            </div>
        </div>
    </section>
    
    <button id="chat-toggle" style="display: none;">열기</button>
	<div id="chat-panel" style="display: none;">
	<input type="hidden" name="member_num" value="${sessionScope.member_num}">
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
	                                        	if (detailChatBotData.detailChatbotDetailed_question == "문의 남기기") {
	                                        	    const inputBox = $('<textarea>').attr('id', 'queryText');
	                                        	    const submitButton = $('<button>').text('제출하기').click(function() {
	                                        	        // 여기서 query 변수를 서버에 전송하거나 처리합니다.
	                                        	        var query = $("#queryText").val();
	                                        	        var memberNum = $('input[name="member_num"]').val();
	                                        	        console.log(query);
	                                        	        $.ajax({
	                                        	            url: "${pageContext.request.contextPath}/submitQuery",
	                                        	            type: 'POST',
	                                        	            data: { 
	                                        	                'query': query,
	                                        	                'member_num': memberNum
	                                        	            },
	                                        	            success: function(response) {
	                                        	                // 서버에서 응답이 오면 이 부분이 실행됩니다.
	                                        	                // response 변수는 서버에서 보낸 데이터입니다.
	                                        	                console.log(response);
	                                        	            },
	                                        	            error: function(jqXHR, textStatus, errorThrown) {
	                                        	                console.error(textStatus, errorThrown);
	                                        	            }
	                                        	        });
	                                        	    });
	                                        	    
	                                        	    chatContainer.append(inputBox).append(submitButton);
	                                        	} else {
	                                        	    chatContainer.append(userDetailQuestionDiv);

	                                        	    // 챗봇의 답변 추가
	                                        	    const botAnswerDiv = $('<div>').addClass('message bot-message').text($(this).attr('data-answer'));
	                                        	    chatContainer.append(botAnswerDiv);
	                                        	}
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

	<!-- bottom.jsp로 분리  -->
	<jsp:include page="bottom.jsp"></jsp:include>

	<!--  서영 - 찜기능때문에 hquery가 위이고 heart 아래임 farmStore에선 반대 -->
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/heart.js"></script>
    <script>
    window.addEventListener("DOMContentLoaded", () => {
    	  initialize_favorite_items();
    	});
	
    </script>
    <script>
    let error = '<%=request.getParameter("error")%>';
    
  <%--   let seller = '<%=request.getParameter("seller")%>'; --%>
    if (error !== 'null' && error !== null && error !== undefined) {
        alert(error);
    }
    
  
</script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<%--     <script src="${pageContext.request.contextPath}/resources/js/autoComplete.js"></script> --%>


</body>

</html>





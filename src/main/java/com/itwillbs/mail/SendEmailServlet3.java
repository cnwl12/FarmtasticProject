package com.itwillbs.mail;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SendEmailServlet3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이메일 입력값 받아오기
        String receiverEmail = request.getParameter("email");
        
        // 답변 내용 받아오기
        String answerContent = request.getParameter("answer");	

        // 이메일 보내기 메서드 호출
        VerifyEmail3 mailSender = new VerifyEmail3();
        
        mailSender.sendAnswerEmail(receiverEmail, answerContent);
        
    }
}

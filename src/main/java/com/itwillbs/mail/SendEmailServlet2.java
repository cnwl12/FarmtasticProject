package com.itwillbs.mail;

import com.itwillbs.mail.VerifyEmail;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SendEmailServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이메일 입력값 받아오기
        String receiverEmail = request.getParameter("email");

        // 이메일 보내기 메서드 호출
        VerifyEmail mailSender = new VerifyEmail();
        
        String verificationCode = mailSender.sendEmail(receiverEmail); // 인증번호 반환 받음
        
        HttpSession session = request.getSession();
        session.setAttribute("verificationCode", verificationCode);
        
    }
}

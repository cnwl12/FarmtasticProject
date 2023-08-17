package com.itwillbs.mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 필요한 클래스를 추가하십시오.
import com.itwillbs.dao.MemberDAO;

public class CheckVerificationCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        System.out.println("이메일 값: " + userEmail);
        String userCode = request.getParameter("code");

        HttpSession session = request.getSession();
        String serverCode = (String) session.getAttribute("verificationCode");

        // 인스턴스화해서 searchId 메서드를 사용할 수 있도록 하십시오.
        MemberDAO memberDAO = new MemberDAO();
        String memberId = memberDAO.searchId(userEmail); // 결과 저장

        // 인증번호와 사용자 이메일 확인
        if (userCode != null && userCode.equals(serverCode)) {
            response.getWriter().write("인증번호가 올바르며 사용자 ID는 다음과 같습니다: " + memberId);
        } else {
            response.getWriter().write("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
        }
    }
}
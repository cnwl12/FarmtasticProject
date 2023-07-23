package com.itwillbs.farmtastic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.itwillbs.domain.AdminDTO;

@ControllerAdvice
public class SessionHandler {
    @ModelAttribute
    public void handleSession(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        AdminDTO adminInfo = (AdminDTO) session.getAttribute("adminInfo");
        model.addAttribute("admin", adminInfo);
    }
}
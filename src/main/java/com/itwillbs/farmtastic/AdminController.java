package com.itwillbs.farmtastic;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AdminDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.SellerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin(Locale locale, Model model) {
		
		System.out.println("adminLogin 매핑확인여부");
		
		return "/admin/adminLogin";
	}
	@Autowired
    private AdminService adminService;
	 @RequestMapping(value = "/Login", method = RequestMethod.POST)
	    public String login(String admin_id, String admin_pass, HttpSession session, RedirectAttributes rttr) {
	        try {
	            AdminDTO adminInfo = adminService.adminCheck(admin_id);
	            if (adminInfo != null && adminInfo.getAdmin_pass().equals(admin_pass)) {
	            	System.out.println("로그인성공!: "+admin_id);
	                session.setAttribute("admin", adminInfo);
	                return "redirect:/adminMain";
	            } else {
	                rttr.addFlashAttribute("msg", "로그인 실패");
	                System.out.println("로그인실패");
	                return "redirect:/adminLogin";
	            }
	        } catch (Exception e) {
	        	System.out.println("로그인오류");
	            rttr.addFlashAttribute("msg", "로그인 과정에서 오류가 발생하였습니다: " + e.getMessage());
	            return "redirect:/adminLogin";
	        }
	    }

	/*map쓸때 구문
	 * @RequestMapping(value = "/Login", method = RequestMethod.POST) public String
	 * adminLogin(String admin_id, Model model, RedirectAttributes rttr) { try {
	 * Map<String, Object> admin = adminService.adminCheck(admin_id); if (admin !=
	 * null) { model.addAttribute("admin", admin); return "redirect:/adminMain"; }
	 * else { rttr.addFlashAttribute("msg", "로그인에 실패하였습니다."); return
	 * "redirect:/adminLogin"; } } catch (Exception e) { e.printStackTrace();
	 * rttr.addFlashAttribute("msg", "로그인 중 오류가 발생했습니다."); return
	 * "redirect:/adminLogin"; } }
	 */
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String logout(HttpServletRequest request) {
	     HttpSession session = request.getSession();
	     if (session != null) {
	         session.invalidate();
	     }
	     // 로그아웃 후, 리디렉션할 페이지를 반환합니다.
	     return "redirect:/adminLogin";
	 } 
	 
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("adminMain 매핑확인여부");
		
		return "/admin/adminMain";
	}
	
	@RequestMapping(value = "/cnotice", method = RequestMethod.GET)
	public String cnotice(Locale locale, Model model) {
		
		System.out.println("cnotice 매핑확인여부");
		
		return "/admin/customerMenu/cnotice";
	}
	@RequestMapping(value = "/customerAdmin", method = RequestMethod.GET)
	public String customerAdmin(Locale locale, Model model) {
		
		System.out.println("cnotice 매핑확인여부");
		
		return "/admin/customerMenu/customerAdmin";
	}
	@RequestMapping(value = "/customerLev", method = RequestMethod.GET)
	public String customerLev(Locale locale, Model model) {
		
		System.out.println("cnotice 매핑확인여부");
		
		return "/admin/customerMenu/customerLev";
	}
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		
		System.out.println("report 매핑확인여부");
		
		return "/admin/customerMenu/report";
	}
	@RequestMapping(value = "/cupon", method = RequestMethod.GET)
	public String cupon(Locale locale, Model model) {
		
		System.out.println("cupon 매핑확인여부");
		
		return "/admin/customerMenu/cupon";
	}
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String point(Locale locale, Model model) {
		
		System.out.println("point 매핑확인여부");
		
		return "/admin/customerMenu/point";
	}
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Locale locale, Model model) {
		
		System.out.println("event 매핑확인여부");
		
		return "/admin/customerMenu/event";
	}
	@RequestMapping(value = "/snotice", method = RequestMethod.GET)
	public String snotice(Locale locale, Model model) {
		
		System.out.println("snotice 매핑확인여부");
		
		return "/admin/sellerMenu/snotice";
	}
	@RequestMapping(value = "/sellerAdmin", method = RequestMethod.GET)
	public String sellerAdmin(Locale locale, Model model) {
		
		System.out.println("sellerAdmin 매핑확인여부");
		
		return "/admin/sellerMenu/sellerAdmin";
	}
	@RequestMapping(value = "/settlement", method = RequestMethod.GET)
	public String settlement(Locale locale, Model model) {
		
		System.out.println("settlement 매핑확인여부");
		
		return "/admin/sellerMenu/settlement";
	}
	
	//admin에 매출관리 목록 불러오기위한 구문
	@Autowired
	    private SellerService sellerService;
	// "/sales" 매핑값을 여러번 사용 할 수 없기때문에 한 곳에 몰아서 넣음
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public String sales(Locale locale, Model model) {
		
		System.out.println("sales 매핑확인여부");
		
		 List<Map<String, Object>> resultList = sellerService.getSellers();
		 model.addAttribute("sellers", resultList);
		
		return "/admin/sellerMenu/sales";
	}
	
	
}

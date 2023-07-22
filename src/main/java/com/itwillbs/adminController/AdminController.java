package com.itwillbs.adminController;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@Autowired
	    private SellerService sellerService;
	
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public String sales(Locale locale, Model model) {
		
		System.out.println("sales 매핑확인여부");
		
		 List<Map<String, Object>> resultList = sellerService.getSellers();
		 model.addAttribute("sellers", resultList);
		
		return "/admin/sellerMenu/sales";
	}
	
	
}

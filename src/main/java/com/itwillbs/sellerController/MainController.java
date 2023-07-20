package com.itwillbs.sellerController;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("sellerMain 매핑확인여부");
		
		return "/seller/sellerMain";
	}
	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		
		System.out.println("tables 매핑확인여부");
		
		return "/seller/tables";
	}
	@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
	public String sellerMemb(Locale locale, Model model) {
		
		System.out.println("sellerMemb 매핑확인여부");
		
		return "/seller/sellerMemb";
	}
	@RequestMapping(value = "/memberMng", method = RequestMethod.GET)
	public String memberMng(Locale locale, Model model) {
		
		System.out.println("memberMng 매핑확인여부");
		
		return "/seller/memberMng";
	}
	
	@RequestMapping(value = "/itemMng", method = RequestMethod.GET)
	public String itemMng(Locale locale, Model model) {
		
		System.out.println("itemMng 매핑확인여부");
		
		return "/seller/itemMng";
	}
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	public String itemRegister(Locale locale, Model model) {
		
		System.out.println("itemRegister 매핑확인여부");
		
		return "/seller/itemRegister";
	}
	@RequestMapping(value = "/reviewMng", method = RequestMethod.GET)
	public String reviewAdmin(Locale locale, Model model) {
		
		System.out.println("reviewMng 매핑확인여부");
		
		return "/seller/reviewMng";
	}
	@RequestMapping(value = "/settlementList", method = RequestMethod.GET)
	public String settlementList(Locale locale, Model model) {
		
		System.out.println("settlementList 매핑확인여부");
		
		return "/seller/settlementList";
	}
	@RequestMapping(value = "/questionMng", method = RequestMethod.GET)
	public String questionMng(Locale locale, Model model) {
		
		System.out.println("questionMng 매핑확인여부");
		
		return "/seller/questionMng";

	
	}
}
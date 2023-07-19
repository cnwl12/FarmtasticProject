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
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
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
	@RequestMapping(value = "/membAdmin", method = RequestMethod.GET)
	public String membAdmin(Locale locale, Model model) {
		
		System.out.println("membAdmin 매핑확인여부");
		
		return "/seller/membAdmin";
	}
	
	@RequestMapping(value = "/itemAdmin", method = RequestMethod.GET)
	public String itemAdmin(Locale locale, Model model) {
		
		System.out.println("itemAdmin 매핑확인여부");
		
		return "/seller/itemAdmin";
	}
}

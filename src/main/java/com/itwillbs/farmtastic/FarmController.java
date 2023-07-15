package com.itwillbs.farmtastic;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FarmController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		
		System.out.println("index 매핑확인여부");
		
		return "index";
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {
		
		System.out.println("blog 매핑확인여부");
		
		return "/member/blog";
	}
}

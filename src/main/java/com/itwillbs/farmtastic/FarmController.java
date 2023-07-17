package com.itwillbs.farmtastic;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FarmController { // 소비자 (컨트롤러) 

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
	 
	@RequestMapping(value = "/blogDetails", method = RequestMethod.GET)
	public String blogDetails(Locale locale, Model model) {
		
		System.out.println("blogDetails 매핑확인여부");
		return "/member/blogDetails";
	} 
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		System.out.println("login 매핑확인여부");
		 
		return "/member/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		System.out.println("join 매핑확인여부");
		
		return "/member/join";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		
		System.out.println("mypage 매핑확인여부");
		
		return "/member/mypage";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Locale locale, Model model) {
		
		System.out.println("contact 매핑확인여부");
		
		return "/member/contact";
	}
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Locale locale, Model model) {
		
		System.out.println("shoppingCart 매핑확인여부");
		
		return "/member/shoppingCart";
	}
	
	@RequestMapping(value = "/farmStore", method = RequestMethod.GET)
	public String farmStore(Locale locale, Model model) {
		
		System.out.println("farmStore 매핑확인여부");
		
		return "/member/farmStore";
	}
	
	@RequestMapping(value = "/farmStoreDetail", method = RequestMethod.GET)
	public String farmStoreDetail(Locale locale, Model model) {
		
		System.out.println("farmStoreDetail 매핑확인여부");
		
		return "/member/farmStoreDetail";
	}
	
	
}

package com.itwillbs.farmtastic;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
public class FarmController { // 소비자 (컨트롤러)

	@Inject
	private MemberService memberService;

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

	@RequestMapping(value = "/naverlogin", method = RequestMethod.GET)
	public String naverlogin(Locale locale, Model model) {

		System.out.println("naverlogin 매핑확인여부");

		return "/member/naverlogin";
	}

	@RequestMapping(value = "/navercallback", method = RequestMethod.GET)
	public String navercallback(Locale locale, Model model) {

		System.out.println("navercallback 매핑확인여부");

		return "/member/navercallback";
	}
	
	@RequestMapping(value = "/naverauth", method = RequestMethod.GET)
	public String naverauth(Locale locale, Model model) {

		System.out.println("naverauth 매핑확인여부");

		return "/member/naverauth";
	}

	@RequestMapping(value = "/kakaologin", method = RequestMethod.GET)
	public String kakaologin(Locale locale, Model model) {

		System.out.println("kakaologin 매핑확인여부");

		return "/member/kakaologin";
	}
	
	@RequestMapping(value = "/kakaocallback", method = RequestMethod.GET)
	public String kakaocallback(Locale locale, Model model) {

		System.out.println("kakaocallback 매핑확인여부");

		return "/member/kakaocallback";
	}
	
	@RequestMapping(value = "/kakaoUserInfo", method = RequestMethod.GET)
	public String kakaoUserInfo(Locale locale, Model model) {

		System.out.println("kakaoUserInfo 매핑확인여부");

		return "/member/kakaoUserInfo";
	}

	@RequestMapping(value = "/kakaoLogout", method = RequestMethod.GET)
	public String kakaoLogout(Locale locale, Model model) {

		System.out.println("kakaoLogout 매핑확인여부");

		return "/member/kakaoLogout";
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

	// 디비 연동 확인용

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {

		System.out.println("insert 매핑확인여부");
		return "/member/insert";
	}

	@RequestMapping(value = "/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {

		System.out.println(memberDTO.getMember_id());
		System.out.println(memberDTO.getMember_pass());
		System.out.println(memberDTO.getMember_name());

		// insertMember() 메서드 호출
		memberService.insertMember(memberDTO);

		return "redirect:/contact";
	}

	   
	
}
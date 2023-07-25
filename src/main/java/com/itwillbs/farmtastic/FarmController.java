package com.itwillbs.farmtastic;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.naverController.NaverController;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.SellerService;

@Controller
public class FarmController { // 소비자 (컨트롤러)

	@Inject
	private MemberService memberService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private NaverController naverController;

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
	
	@RequestMapping(value = "/kakaojoin", method = RequestMethod.GET)
	public String kakaoUserInfo(Locale locale, Model model) {

		System.out.println("kakaojoin 매핑확인여부");

		return "/member/kakaojoin";
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

	// 팜팜마켓에 등록된 아이템 전부 가지고 올 것임 
	@RequestMapping(value = "/farmStore", method = RequestMethod.GET)
	public String farmStore(Locale locale, Model model) {
		
		 List<Map<String, Object>> itemList = sellerService.getItems();
		 model.addAttribute("itemList", itemList);

		System.out.println("팜팜마켓 매핑확인여부");

		return "/member/farmStore";
	}
	
	// 상품 개별 페이지로 이동
	@RequestMapping(value = "/farmStoreDetail", method = RequestMethod.GET)
	public String farmStoreDetail(@RequestParam("item_num") int item_num, Model model) {
		
		/* System.out.println("item_num : ??? "+item_num); */
		
		Map<String, Object> item = sellerService.getItem(item_num);

		 model.addAttribute("item", item);
		 
		/* System.out.println(item); */
		 System.out.println("farmStoreDetail 매핑확인여부");

		return "/member/farmStoreDetail";
	}
	
	// 디비 연동 확인용

//	@RequestMapping(value = "/insert", method = RequestMethod.GET)
//	public String insert() {
//
//		System.out.println("insert 매핑확인여부");
//		return "/member/insert";
//	}
//
	
	
	// ---------------카트 조지는 중임 --------------------------
	// if(담는건 맞고, 페이지 유지 or 이동할것)
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(@RequestParam("item_num") int item_num,
							 @RequestParam HashMap<String, String> cartProduct) {
		
		System.out.println("addToCart Controller 오는지");
		memberService.insertCart(cartProduct);

//		// insertCart() 메서드 호출
//		memberService.insertCart();

		return "redirect:/shoppingCart";
	}
	
	
//	@RequestMapping(value = "/itemInsertPro", method = RequestMethod.POST)
//	public String itemInsertList(@RequestParam HashMap<String, String> itemList,
//	                             @RequestParam("file") List<MultipartFile> files,
//	                             HttpSession session) {
//		
//		System.out.println(itemList);
//		System.out.println(files);
//	    sellerService.itemInsert(itemList, files, session);
//	    
//	    return "redirect:/itemInsertList";
//	}
	
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Model model) {
		/* @RequestParam("item_num") int item_num, */
		
		System.out.println("shoppingCart 매핑확인여부");

		return "/member/shoppingCart";
	}

	
	
	// -------------------------------------------------------
	
	@RequestMapping(value = "/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO ) {
		
		System.out.println(memberDTO.getMember_id());
		System.out.println(memberDTO.getMember_pass());
		System.out.println(memberDTO.getMember_name());
		System.out.println(memberDTO.getMember_phone());
		System.out.println(memberDTO.getMember_email());
		System.out.println(memberDTO.getMember_joinDay());
		System.out.println(memberDTO.getMember_post());
		System.out.println(memberDTO.getMember_addMain());
		System.out.println(memberDTO.getMember_addSub());
		// insertMember() 메서드 호출
		memberService.insertMember(memberDTO);

		return "redirect:/login";
	}
   
	
	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if(memberDTO2 != null) {
			session .setAttribute("member_id", memberDTO.getMember_id());
			return "redirect:/index";
		} else {
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		
		String member_id = request.getParameter("member_id");
		
		MemberDTO memberDTO = memberService.getMember(member_id);
		String result = "";
		if (memberDTO != null) {
			// 아이디 있음 => 아이디 중복
			result = "id is used";
		} else {
			// 아이디 없음 => 아이디 사용가능
			result = "id is available";
		}
		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}// idCheck 끝
	
	
	
}
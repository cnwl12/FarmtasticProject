package com.itwillbs.farmtastic;

import java.util.HashMap;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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

import com.itwillbs.dao.MemberDAO;
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
	public String naverAuth(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String access_token = (String) session.getAttribute("accessToken");
        String apiUrl = "https://openapi.naver.com/v1/nid/me";

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_token);
    
            int responseCode = conn.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // HTTP OK
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }
    
            String inputLine;
            StringBuffer respon = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                respon.append(inputLine);
            }
            br.close();
            
            org.json.JSONObject jsonObject = new org.json.JSONObject(respon.toString());
            org.json.JSONObject userProfile = jsonObject.getJSONObject("response");

            String member_nid = userProfile.getString("id");
            String member_name = userProfile.getString("name");
            String member_email = userProfile.getString("email");
            String member_phone = userProfile.getString("mobile");
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setMember_nid(member_nid);
            memberDTO.setMember_name(member_name);
            memberDTO.setMember_email(member_email);
            memberDTO.setMember_phone(member_phone);
            System.out.println(memberDTO.getMember_name());
            MemberDAO memberDAO = new MemberDAO();
            
            MemberDTO existingMember = memberService.nuserCheck(memberDTO);
            if(existingMember != null){
                System.out.println("로그인");
                session .setAttribute("member_nid", memberDTO.getMember_nid());
    			return "redirect:/index";
            } else {
                memberService.ninsertMember(memberDTO);
                System.out.println("회원가입");
                return "redirect:/index";
            }

        }
        catch (Exception e) {
            e.printStackTrace();
            return "errorPage"; // 오류가 발생한 경우 에러 페이지로 이동
        }// 정상적으로 처리된 경우 authResult 페이지로 이동
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
	public String insertCart(@RequestParam HashMap<String, Object> cart
							 ,HttpServletRequest session) {
		
		// 나중에 변경할거임...
		// String member_num = (String)session.getAttribute("member_num");
		int member_num = 321; // <- 로그인 됐을 때 지울거임
		System.out.println(member_num + ", "+ cart);
		
		cart.put("member_num", member_num);
		
		//System.out.println("insertCart 오는지");
		
		memberService.insertCart(cart);
		
		return "redirect:/shoppingCart";
	}
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Model model, HttpServletRequest session) {
		
		System.out.println("shoppingCart 매핑확인여부");
		
		// 나중에 변경할거임...
		//int member_num = (int) session.getAttribute("member_num");
		int member_num = 321; // <- 로그인 됐을 때 지울거임
		
		
		 List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		 model.addAttribute("itemList", itemList);
		// System.out.println(itemList);

		return "/member/shoppingCart";
	}
	
	// 장바구니 멤버에서 새로 생길 예정임!! 일단은 확인용으로 여기있는거!!!!! 
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Model model, HttpServletRequest session) {

		System.out.println("checkout 매핑확인여부");
		
		int member_num = 321;
		
		List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		model.addAttribute("itemList", itemList);

		return "/member/checkout";
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
	
	@RequestMapping(value = "/farm/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
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
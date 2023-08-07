package com.itwillbs.farmtastic;

import java.util.Arrays;
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.apache.commons.io.FilenameUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.SellerDTO;
import com.itwillbs.domain.WishlistDTO;
import com.itwillbs.naverController.NaverController;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.SellerService;

@Controller
public class FarmController { // 소비자 (컨트롤러)

	@Inject
	private MemberService memberService;

	@Autowired
	private SellerService sellerService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private NaverController naverController;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		System.out.println("index 매핑확인여부");

		List<Map<String, Object>> itemList = sellerService.getItems();
		model.addAttribute("itemList", itemList);

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
			if (existingMember != null) {
				System.out.println("로그인");
				session.setAttribute("member_num", existingMember.getMember_num()); 

				return "redirect:/index";
			} else {
				memberService.ninsertMember(memberDTO);
				System.out.println("회원가입");
				return "redirect:/index";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "errorPage"; // 오류가 발생한 경우 에러 페이지로 이동
		}
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
	public String kakaojoin(HttpServletRequest request, Model model) {

		System.out.println("kakaojoin 매핑확인여부");

		HttpSession session = request.getSession();
		String access_token = request.getParameter("access_token");
		String apiUrl = "https://kapi.kakao.com/v2/user/me";

		JSONObject jsonObject = null;
		try {
			URL url = new URL(apiUrl);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			System.out.println("토큰값컨트롤러확인:" + access_token);

			// Header에 Access Token 추가
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer " + access_token);

			/// 응답 받기
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode:" + responseCode);

			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			jsonObject = new JSONObject(response.toString());

		} catch (Exception e) {
			// 카카오 API 호출 과정에서 예외 발생 시 에러 페이지로 이동
			e.printStackTrace();
			return "errorPage";
		}

		System.out.println("jsonObject -->>>>>" + jsonObject.toString());

		JSONObject userProfile = jsonObject.getJSONObject("kakao_account");

		String member_id = jsonObject.optString("id");
		String member_name = userProfile.getString("name");
		String member_email = userProfile.getString("email");
		/*
		 * String member_phone = userProfile.getString("phone_number").replace("+82 10",
		 * "010"); // repalce말고 딴걸로 바꿔야됨(외국사람거는처리가안됨)
		 * System.out.println("member_phone -->>>>>" + member_phone);
		 */

		String member_phone = userProfile.getString("phone_number");

		// 국제 전화번호일 경우 국가 코드를 "00"으로 변경
		if (member_phone.startsWith("+")) {
			member_phone = member_phone.replace("+", "00");
		}

		// 국내 전화번호일 경우 번호의 길이에 따라 처리
		if (member_phone.startsWith("02")) {
			if (member_phone.length() == 9) {
				member_phone = member_phone.replaceFirst("02", "02-");
			} else if (member_phone.length() == 10) {
				member_phone = member_phone.replaceFirst("02", "02-");
			}
		} else { // 국내 지역번호가 아니면서 "01"로 시작하는 경우
			if (member_phone.length() == 10) {
				member_phone = "010-" + member_phone.substring(2, 6) + "-" + member_phone.substring(6);
			}
		}

		System.out.println(member_phone); // 출력 예시: 010-1234-5678 혹은 02-123-4567 혹은 00123-456-7890

		// MemberDTO 객체를 생성하고 추출된 프로필 정보를 설정
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_name(member_name);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_phone(member_phone);

		System.out.println(memberDTO.getMember_name());
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if (memberDTO2 != null) {
			System.out.println("로그인");
			session.setAttribute("member_num", memberDTO2.getMember_num());
			return "redirect:/index";
		} else {
			memberService.insertMember(memberDTO);
			System.out.println("회원가입");
			return "redirect:/index";
		}

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

	@RequestMapping(value = "/join2", method = RequestMethod.GET)
	public String join2(Locale locale, Model model) {

		System.out.println("join2 매핑확인여부");

		return "/member/join2";
	}

	/* sungha 07.29마이페이지 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		System.out.println("mypage 매핑확인여부");
		Integer member_num = (Integer) session.getAttribute("member_num");
		MemberDTO memberDTO = memberService.getMember1(member_num);
		model.addAttribute("memberDTO", memberDTO);
		return "/member/mypage";
	}

	/* 택배구현중 */
	@GetMapping
	@RequestMapping(value = "/parcel", method = RequestMethod.GET)
	public String parcel(Locale locale, Model model) {

		System.out.println("parcel 매핑확인여부");

		return "/member/parcel";
	}

	/* 검색기능 */
	@RequestMapping(value = "/searchd", method = RequestMethod.GET)
	public String searchd(Locale locale, Model model) {

		System.out.println("searchd 매핑확인여부");

		return "/member/searchd";
	}

	@GetMapping("/search")
	public String search(@RequestParam("query") String query, Model model) {
		System.out.println("FarmController /search");
		List<Map<String, Object>> itemList = memberService.getItemsearch(query);
		model.addAttribute("itemList", itemList);
		return "/member/searchd";
	}

//	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
//	public String updatePro(MemberDTO memberDTO) {
//		System.out.println("MemberController updatePro()");
//		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
//		if (memberDTO2 != null) {
//			// 아이디 비밀번호 일치 => 수정작업 => /member/index 이동
//			
//			memberService.updateMember(memberDTO);
//			System.out.println(memberDTO);
//			return "redirect:/member/index";
//			
//		} else {
//			// 아이디 비밀번호 틀림 => member/msg.jsp 이동
//			return "member/msg";
//		}
//	}
//
//	

	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpSession session, @RequestParam(value = "member_id", required = false) String member_id,
			@RequestParam(value = "member_pass", required = false) String member_pass,
			@RequestParam(value = "new_member_pass", required = false) String new_member_pass,
			@RequestParam(value = "member_name", required = false) String member_name,
			@RequestParam(value = "member_phone", required = false) String member_phone,
			@RequestParam(value = "member_email", required = false) String member_email,
			@RequestParam(value = "member_post", required = false) String member_post,
			@RequestParam(value = "member_addMain", required = false) String member_addMain,
			@RequestParam(value = "member_addSub", required = false) String member_addSub) throws Exception {

		Integer member_num = (Integer) session.getAttribute("member_num");

		// 입력된 값들도 세션에 저장합니다.
		session.setAttribute("member_id", member_id);
		session.setAttribute("member_pass", member_pass);
		session.setAttribute("member_name", member_name);
		session.setAttribute("member_phone", member_phone);
		session.setAttribute("member_email", member_email);
		session.setAttribute("member_post", member_post);
		session.setAttribute("member_addMain", member_addMain);
		session.setAttribute("member_addSub", member_addSub);

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(member_num);
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pass(member_pass);

		MemberDTO memberDTO2 = memberService.userCheck1(memberDTO);

		if (memberDTO2 != null && memberDTO2.getMember_pass().equals(member_pass)) {
			// memberDTO 객체에 입력된 값들을 설정합니다.
			memberDTO.setMember_id(member_id);
			memberDTO.setMember_pass(new_member_pass);
			memberDTO.setMember_name(member_name);
			memberDTO.setMember_phone(member_phone);
			memberDTO.setMember_email(member_email);
			memberDTO.setMember_post(member_post);
			memberDTO.setMember_addMain(member_addMain);
			memberDTO.setMember_addSub(member_addSub);

			memberService.updateMember(memberDTO);
			return "/index";
		} else {
			System.out.println("비밀번호 오류");
			return "/index";
		}
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Locale locale, Model model) {

		System.out.println("contact 매핑확인여부");
		List<Map<String, Object>> resultList = adminService.getCnotice();
		model.addAttribute("notice", resultList);
		System.out.println(resultList);
		return "/member/contact";
	}

	@RequestMapping(value = "/contactContent", method = RequestMethod.GET)
	public String contactContent(@RequestParam("admin_cs_num") int admin_cs_num, Locale locale, Model model) {
		System.out.println("contactContent 매핑확인여부");
		Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
		model.addAttribute("content", resultMap);
		model.addAttribute("admin_cs_num", admin_cs_num);
		System.out.println("controller" + resultMap);
		return "/member/contactContent";
	}

	// 팜팜마켓에 등록된 아이템 전부 가지고 올 것임
	@RequestMapping(value = "/farmStore", method = RequestMethod.GET)
	public String farmStore(Locale locale, Model model) {

		List<Map<String, Object>> itemList = sellerService.getItems();
		model.addAttribute("itemList", itemList);

		System.out.println("팜팜마켓 매핑확인여부");

		return "/member/farmStore";
	}

	// 상품 개별 페이지로 이동 + 막내 리뷰기능 용도 추가함
	@RequestMapping(value = "/farmStoreDetail", method = RequestMethod.GET)
	public String farmStoreDetail(@RequestParam("item_num") int item_num, Model model) {

		/* System.out.println("item_num : ??? "+item_num); */

		Map<String, Object> item = sellerService.getItem(item_num);

		model.addAttribute("item", item);

		int reviewCount = memberService.getReviewCountByItemNum(item_num);
		double averageStarRating = memberService.getAverageReviewStarByItemNum(item_num);

		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("averageStarRating", averageStarRating);

		/* System.out.println(item); */
		System.out.println("farmStoreDetail 매핑확인여부");

		List<OneBoardDTO> oneBoardList = memberService.findByItemNum(item_num);
		System.out.println(oneBoardList + "가나다");
		model.addAttribute("oneBoardList", oneBoardList);

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
	public String insertCart(@RequestParam HashMap<String, Object> cart, HttpSession session) {

		// 나중에 변경할거임...
		int member_num = (int)session.getAttribute("member_num");
		 // int member_num = 16; // <- 로그인 됐을 때 지울거임
		// System.out.println(member_num + ", "+ cart);
		
		 session.setAttribute("member_num", member_num);
		// session.setAttribute("member_num", memberDTO2.getMember_num());
		
		cart.put("member_num", member_num);

		memberService.insertCart(cart);
		
		// 수량을 조회하는 메서드 따로 필요
		// session.setAttribute("cart_num", cart_num);

		return "redirect:/shoppingCart";
	}

	// cartlist에서 주문테이블로 insert되면 cartlist delete될 예정
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Model model, HttpSession session) {

		System.out.println("shoppingCart 매핑확인여부");

		// 나중에 변경할거임...
		int member_num = (int)session.getAttribute("member_num");
		// String member_num = (String)session.getAttribute("member_num");
		// int member_num = 16; // <- 로그인 됐을 때 지울거임
		session.setAttribute("member_num", member_num);
		 
		System.out.println(member_num);

 		List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		model.addAttribute("itemList", itemList);
		// System.out.println(itemList);

		return "/member/shoppingCart";
	}

	@RequestMapping(value = "/cartInUpdate", method = RequestMethod.GET)
	public String cartInUpdate(@RequestParam HashMap<String, Object> cart, HttpSession session) {

		// 나중에 변경할거임...
		// int member_num = 16; // <- 로그인 됐을 때 지울거임
		//System.out.println(member_num + ", "+ cart);
		 int member_num = (int)session.getAttribute("member_num");
		 
		 cart.put("member_num", member_num);

		// System.out.println("insertCart 오는지");
		
		memberService.updateInCart(cart);

		return "redirect:/shoppingCart";
	}

	// 결제 버튼으로 넘어갈때 주문상세 테이블, 주문 테이블 동시 insert가 이루어져야함
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Model model, HttpSession session) {

		System.out.println("checkout 매핑확인여부");

		int member_num = (int)session.getAttribute("member_num");

		memberService.getMember1(member_num);

		List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		model.addAttribute("itemList", itemList);
		MemberDTO memberDTO = memberService.getMember1(member_num);
		model.addAttribute("memberDTO", memberDTO);

		return "/member/checkout";

	}
	
	// 인호 결제 확인중!!!!!! 
	
	// 결제 성공 페이지로 이동하는 컨트롤러 메소드
		@RequestMapping(value = "/paySuccess", method = RequestMethod.GET)
		public String paySuccess(Model model, PayDTO payDTO) {
		    // HashMap 객체 생성 및 결제 정보 추가
		    HashMap<String, Object> payInfo = new HashMap<String, Object>();
		    payInfo.put("order_num", payDTO.getOrder_num());
		    payInfo.put("member_num", payDTO.getMember_num());
		    payInfo.put("item_num", payDTO.getItem_num());
		    payInfo.put("order_pay", payDTO.getOrder_pay());
		    payInfo.put("order_post", payDTO.getOrder_post());
		    payInfo.put("order_addMain", payDTO.getOrder_addMain());
		    payInfo.put("order_addSub", payDTO.getOrder_addSub());
		    payInfo.put("order_phone", payDTO.getOrder_phone());
		    payInfo.put("order_msg", payDTO.getOrder_msg());
		    payInfo.put("order_name", payDTO.getOrder_name());
		    payInfo.put("order_day", payDTO.getOrder_day());
		    System.out.println("payinfo:" + payInfo);
		    // 모델 객체에 HashMap 추가
		    model.addAttribute("payInfo", payInfo);
		    
		    memberService.insertOrders(payInfo);
		    System.out.println(payInfo);
		    
		    // paySuccess.jsp 페이지로 리다이렉트
		    return "/member/paySuccess";
		    //return "/member/paySuccess";
		}
		
		@RequestMapping(value = "/insertOrders", method = RequestMethod.GET)
		public String insertOrders(PayDTO payDTO) {
			
//			System.out.println(payDTO.getMember_num());
//			System.out.println(payDTO.getOrder_pay());
//			System.out.println(payDTO.getOrder_name());
//			System.out.println(payDTO.getOrder_addMain());
//			System.out.println(payDTO.getOrder_addSub());
//			System.out.println(payDTO.getOrder_post());
//			System.out.println(payDTO.getOrder_phone());
//			System.out.println(payDTO.getOrder_msg());
//			System.out.println(payDTO.getOrder_day());
//			// insertMember() 메서드 호출
//			memberService.insertOrders(payDTO);
//			System.out.println("FarmController insertOrders");

			return "redirect:/index";
		}	
		
		
		

	// 주문창으로 넘어갔을때 임의로 주문상세테이블에 insert를 시키고, 결제가 y가 되면 (1. update 2. delete, insert)
	// 진행
	// 주문 버튼 눌렀을 때 주문상세테이블에 1차로 추가
	@RequestMapping(value = "/insertOrderDetail", method = RequestMethod.GET)
	public String insertOrderDetail(@RequestParam HashMap<String, Object> orderDetail, HttpSession session) {

		System.out.println("orderDetail 매핑 처음 됐을 때" + orderDetail);

		int member_num = (int)session.getAttribute("member_num");
		//int member_num = 16; // <- 로그인 됐을 때 지울거임
//		System.out.println(member_num + ", "+ orderDetail);

		orderDetail.put("member_num", member_num);

		memberService.insertOrderDetail(orderDetail);
		// System.out.println("컨-서 다녀왔을 때" + orderDetail);

		// cartlist에서 주문테이블로 insert되면 cartlist delete될 예정
		return "redirect:/checkout";
	}

	// 카트안 아이템 삭제
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	public String deleteCart(@RequestParam HashMap<String, Object> cart, HttpSession session) {

	//	int member_num = 16;
		int member_num = (int)session.getAttribute("member_num");
		cart.put("member_num", member_num);

		System.out.println("deleteCart 컨트롤러 오는지");
		memberService.deleteCart(cart);

		return "redirect:/shoppingCart";
	}

	// -------------------------------------------------------

	@RequestMapping(value = "/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {

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

	@RequestMapping(value = "/insertPro2", method = RequestMethod.POST)
	public String insertPro2(SellerDTO sellerDTO) {

		System.out.println(sellerDTO.getSeller_id());
		System.out.println(sellerDTO.getSeller_pass());
		System.out.println(sellerDTO.getSeller_name());
		System.out.println(sellerDTO.getSeller_phone());
		System.out.println(sellerDTO.getSeller_email());
		System.out.println(sellerDTO.getSeller_joinDay());
		System.out.println(sellerDTO.getSeller_post());
		System.out.println(sellerDTO.getSeller_addMain());
		System.out.println(sellerDTO.getSeller_addSub());
		// insertSeller() 메서드 호출
		sellerService.insertSeller(sellerDTO);

		return "redirect:/login";
	}
	
	

	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletResponse response) {
		System.out.println("MemberController loginPro()");
		
		MemberDTO memberDTO2 = memberService.userCheck0(memberDTO);

		if (memberDTO2 != null && !"N".equals(memberDTO2.getMember_delYn())) {
			session.setAttribute("member_num", memberDTO2.getMember_num());
			return "redirect:/index";
		} else if (memberDTO2 != null && "N".equals(memberDTO2.getMember_delYn())){
			// 승인되지 않은 사용자
            sendResponse(response, "탈퇴한 회원입니다.");
            return "redirect:/login";
        } else { 
        	// 아이디 또는 비밀번호가 틀린 경우 또는 예외 상황
            sendResponse(response, "아이디 또는 비밀번호가 틀립니다.");
            return "redirect:/login";
        }

	}
	
	// 응답메시지 전송
    private void sendResponse(HttpServletResponse response, String message) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('" + message + "');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
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

//	 @RequestMapping(value = "/oneboard", method = RequestMethod.GET)
//	    public String oneBoardmypage(HttpServletRequest request) {
//	        List<MemberDTO> oneBoardList = memberService.getOneBoardList();
//	        model.addAttribute("oneBoardList", oneBoardList);
//
//	        return "/member/oneboard";
//	    }

	@RequestMapping(value = "/idCheck2", method = RequestMethod.GET)

	@ResponseBody
	public ResponseEntity<String> idCheck2(HttpServletRequest request) {

		String seller_id = request.getParameter("seller_id");

		Map<String, Object> sellerDTO = sellerService.sellerCheck(seller_id);
		String result = "";
		if (sellerDTO != null) {
			// 아이디 있음 => 아이디 중복
			result = "id is used";
		} else {
			// 아이디 없음 => 아이디 사용가능
			result = "id is available";
		}
		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);

		return entity;
	}// idCheck2 끝

	// Review 기능! - 막내
	// 리뷰작성 -> 데이터저장
	@PostMapping(value = "/insertReview")
	@ResponseBody
	public ResponseEntity<?> insertReview(@ModelAttribute("memberDTO") MemberDTO memberDTO, 
			@RequestParam("review_image") MultipartFile file, HttpSession session) throws Exception {
		System.out.println("controller 리뷰작성");
		 System.out.println("item_num: " + memberDTO.getItem_num());
		    System.out.println("member_num: " + memberDTO.getMember_num());
		    System.out.println("review_title: " + memberDTO.getReview_title());
		    System.out.println("review_content: " + memberDTO.getReview_content());
		    System.out.println("File: " + file.getOriginalFilename());
		
		// 첨부파일 올라갈 물리적 경로 
				String uploadPath = session.getServletContext().getRealPath("/resources/upload");
				
//				System.out.println(uploadPath);
				
//				for (int i = 0; i < files.size(); i++) {
//		            MultipartFile file = files.get(i);
//		            if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
//		                String fileName = file.getOriginalFilename(); // 파일 원래 이름
//		                String fileExtension = FilenameUtils.getExtension(fileName); // 확장자

				if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
				        String fileName = file.getOriginalFilename(); // 파일 원래 이름
				        String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
				
				
				     // 허용되는 파일 확장자 리스트
				        List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");

				        if (allowedExtensions.contains(fileExtension.toLowerCase())) {

				            String uuid = UUID.randomUUID().toString();
				            String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

				            String filePath = uploadPath + "/" + storedFileName;

				            System.out.println("filePath : " + filePath);

				            String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

				            System.out.println("Received file: " + file.getOriginalFilename());

				            // 서버에 파일 저장
				            File dest = new File(filePath);
				            try {
				                file.transferTo(dest);
				            } catch (IOException e) {
				                // 여기서 예외를 처리하세요.
				                e.printStackTrace();
				                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				                        .body("{\"status\": \"failure\", \"message\": \"파일 저장 중 문제가 발생했습니다.\"}");
				            }

				            memberDTO.setReview_img(saveFileName);
				        } else {
				            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				                    .body("{\"status\": \"failure\", \"message\": \"지원하지 않는 이미지 형식입니다.\"}");
				        }
				    }

					memberService.insertReview(memberDTO);
				    return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON)
				            .body("{\"status\": \"success\", \"message\": \"리뷰가 등록되었습니다.\"}");
				    
	}

	// 리뷰목록이 불러오고싶다
	@RequestMapping(value = "/getItemReviews", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberDTO> getItemReviews(@RequestParam("item_num") Integer item_num) {
		List<MemberDTO> reviews = memberService.getItemReviews(item_num);
		return reviews;
	}

	// 마이페이지 - 리뷰관리 -> 리뷰목록
	@RequestMapping(value = "/getItemMyReview", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberDTO> getItemMyReview(@RequestParam("member_num") Integer member_num) {
		List<MemberDTO> myreview = memberService.getItemMyReview(member_num);
		return myreview;
	}

	// 마이페이지 - 리뷰관리 => 리뷰 수정 (개편 하려했으나 선생님 버전이 어려워서 일단 보류)
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateReview(@RequestParam("review_num") int review_num,
									@RequestParam("review_star") int review_star,
	                                @RequestParam("review_title") String review_title,
	                                @RequestParam("review_content") String review_content) {
	    try {
	        memberService.updateReview(review_num, review_star,review_title, review_content);
	        return ResponseEntity.status(HttpStatus.OK).body("The review has been successfully updated.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 업데이트 중 오류가 발생했습니다.");
	    }

	}

	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public ResponseEntity<String> deleteReview(@RequestParam("review_num") int review_num, @RequestParam("member_num") int member_num) {
		try {
			memberService.deleteReview(review_num, member_num);
			return ResponseEntity.status(HttpStatus.OK).body("The review has been successfully deleted.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 업데이트 중 오류가 발생했습니다.");
		}
	}

	// 서영 작업중
	@RequestMapping(value = "/oneboard", method = RequestMethod.GET)
	public String oneBoard(Model model) {
		System.out.println("FarmController oneboard()!");
		return "/member/oneboard";
	}

	@RequestMapping(value = "/oneboardForm", method = RequestMethod.GET)
	public String oneBoardForm(OneBoardDTO oneboardDTO) {
		System.out.println("oneboardForm() 로드");
		memberService.insertOneBoard(oneboardDTO);

		return "/member/success";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> addWishlist(WishlistDTO wishlistDTO, @RequestParam("item_num") Integer item_num) {
		Map<String, String> response = new HashMap<>();
		System.out.println("찜기능하는중입니다");

		WishlistDTO existingWishlistDTO = memberService.selectWishlist(wishlistDTO);
		System.out.println(existingWishlistDTO);
		if (existingWishlistDTO == null) {
			memberService.insertWishlist(wishlistDTO);
			response.put("message", "찜 목록에 상품이 추가되었습니다.");
		} else {
			memberService.deleteWishlist(wishlistDTO);
			response.put("message", "찜 목록에 상품을 삭제하였습니다.");
		}

		return response;
	}

	@RequestMapping(value = "/like_farm", method = RequestMethod.GET)
	public String likeFarm(Model model) {
		System.out.println("WLarkqhwkdk");
		return "/member/oneboard";
	}

}
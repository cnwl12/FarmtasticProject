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
import org.springframework.web.bind.annotation.SessionAttribute;
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
		
		List<Map<String, Object>> bContent = adminService.getBlog();
		model.addAttribute("bContent", bContent);
		System.out.println(bContent);
		
		return "/member/blog";
	}

	@RequestMapping(value = "/blogDetails", method = RequestMethod.GET)
	public String blogDetails(@RequestParam("admin_blog_num") int admin_blog_num, Locale locale, Model model) {

		System.out.println("blogDetails 매핑확인여부");
		
		Map<String, Object> bContent = adminService.getblogContent(admin_blog_num);
		model.addAttribute("bContent", bContent);
		model.addAttribute("admin_blog_num", admin_blog_num);
		System.out.println("controller" + bContent);
		
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
		List<OneBoardDTO> oneBoardList2 = memberService.findByItemNum2(member_num);
		System.out.println(oneBoardList2 + "가나다");
		model.addAttribute("oneBoardList2", oneBoardList2);
		List<WishlistDTO> zzimlist = memberService.getzzimlist(member_num);
		System.out.println(zzimlist + "가나다");
		model.addAttribute("zzimlist", zzimlist);
		
		// 주문관리 - 지원
		List<Map<String, Object>> orderList = memberService.getOrderList(member_num);
		model.addAttribute("orderList", orderList);
		
		return "/member/mypage";
	}
	
	@RequestMapping(value="/searchId", method = RequestMethod.GET)
	public String searchId(Locale locale, Model model) {
		
		System.out.println("searchId 매핑확인여부");
		
		return "/member/searchId";
	}

	/* 택배 */
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
	public String farmStoreDetail(@RequestParam("item_num") int item_num, Model model,HttpSession session) {
		
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

	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(@RequestParam HashMap<String, Object> cart, HttpSession session, Model model) {

		// 나중에 변경할거임...
		Integer member_num = (Integer) session.getAttribute("member_num");
		
		 session.setAttribute("member_num", member_num);
		
		 // 바꿀것임!!! 
		 if(session.getAttribute("member_num") == null) {
				model.addAttribute("msg", "로그인 이후 사용가능합니다.");
				return "redirect:/login";
		}
		 
		cart.put("member_num", member_num);

		memberService.insertCart(cart);
		
		// 수량을 조회하는 메서드 따로 필요
		System.out.println("countCart 컨트롤러 시작");

		return "redirect:/shoppingCart";
	}

	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Model model, HttpSession session) {

		System.out.println("shoppingCart 매핑확인여부");
		
		Integer member_num = (Integer) session.getAttribute("member_num");
		session.setAttribute("member_num", member_num);
		
		System.out.println(member_num);
		
		 if (member_num == null) {
		        return "redirect:/login";
		 }
		 
		System.out.println(member_num);

 		List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		model.addAttribute("itemList", itemList);
		int item_count = memberService.countCart(member_num);
		session.setAttribute("item_count", item_count);
		
		return "/member/shoppingCart";
	}

	@RequestMapping(value = "/cartInUpdate", method = RequestMethod.GET)
	public String cartInUpdate(@RequestParam HashMap<String, Object> cart, HttpSession session) {

		 int member_num = (int)session.getAttribute("member_num");
		 
		 cart.put("member_num", member_num);
		
		memberService.updateInCart(cart);

		return "redirect:/shoppingCart";
	}

	// 결제 버튼으로 넘어갈때 주문상세 테이블, 주문 테이블 동시 insert가 이루어져야함
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(Model model, HttpSession session) {

		System.out.println("checkout 매핑확인여부");

		int member_num = (int)session.getAttribute("member_num");
		session.setAttribute("member_num", member_num);

		memberService.getMember1(member_num);

		List<Map<String, Object>> itemList = memberService.getCartList(member_num);
		model.addAttribute("itemList", itemList);
		MemberDTO memberDTO = memberService.getMember1(member_num);
		model.addAttribute("memberDTO", memberDTO);

		return "/member/checkout";

	}
	
	
	// 결제 성공 페이지로 이동하는 컨트롤러 확인하는 페이지
		@RequestMapping(value = "/paySuccess", method = RequestMethod.GET)
		public String paySuccess(@RequestParam  HashMap<String, Object> payInfo
								 ,Model model
								 ,HttpSession session) {
		    int member_num = (int)session.getAttribute("member_num");
		    model.addAttribute("payInfo", payInfo);
		    payInfo.put("member_num", member_num);
		    
		    // paySuccess 넘어오는 애들 자체가 pay가 완료해서 넘어오는거임
		    // pay 먼저 insert ! (pay가 먼저 insert되어야지,  order-detail-cartdelete실행 
			
		    // 없어도 될거 같음 일단은 남겨둠 (지원)
		    // memberService.insertPay(payInfo);
		    
		    // orders 테이블에 DB인서트 작업 
		    memberService.insertOrders(payInfo);
		    System.out.println(payInfo + " member_num : " + member_num);
		    
		    // paySuccess.jsp 페이지로 리다이렉트
		    return "redirect:/insertOrderDetail"; // 주문상세테이블에 인서트하고, 
		}

	// 주문창으로 넘어갔을때 임의로 주문상세테이블에 insert를 시키고, 결제가 y가 되면 (1. update 2. delete, insert)
	// 진행
	// 주문 버튼 눌렀을 때 주문상세테이블에 1차로 추가
	@RequestMapping(value = "/insertOrderDetail", method = RequestMethod.GET)
	public String insertOrderDetail(@RequestParam HashMap<String, Object> orderDetail, HttpSession session) {

		System.out.println("orderDetail 매핑 처음 됐을 때" + orderDetail);

		int member_num = (int)session.getAttribute("member_num");
		orderDetail.put("member_num", member_num);

		memberService.insertOrderDetail(orderDetail);
		System.out.println("인서트 다녀왔음!");
		
		// cartlist에서 주문테이블로 insert되면 cartlist delete될 예정
		memberService.deleteAllCart(orderDetail);
		// 주문완료했다 페이지로 이동~~ (메인으로 이동 등) 
		return "redirect:/orderSuccess";
	}
	
	// 주문완료 페이지 정보
	@RequestMapping(value = "/orderSuccess", method = RequestMethod.GET)
	public String orderSuccess(Model model, HttpSession session) {
		
		int member_num = (int)session.getAttribute("member_num");

	    List<Map<String, Object>> orderPayList = memberService.getOrderPay(member_num);
	    
	    if (!orderPayList.isEmpty()) {
	        Map<String, Object> orderPay = orderPayList.get(0);
	        model.addAttribute("orderPay", orderPay);
	    }
	    return "/member/orderSuccess";
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
		
		memberService.insertMember(memberDTO);

		return "redirect:/login";
	}

	@RequestMapping(value = "/insertPro2", method = RequestMethod.POST)
	public String insertPro2(SellerDTO sellerDTO) {

		sellerService.insertSeller(sellerDTO);

		return "redirect:/login";
	}
	
	

	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletResponse response) {
		System.out.println("MemberController loginPro()");
		
		MemberDTO memberDTO2 = memberService.userCheck0(memberDTO);

		if (memberDTO2 != null && !"N".equals(memberDTO2.getMember_delYn())) {
			session.setAttribute("member_num", memberDTO2.getMember_num());
			
			// 장바구니 수량 세션 가져오기
			int item_count = memberService.countCart((int) session.getAttribute("member_num"));
			session.setAttribute("item_count", item_count);
			
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
	// 리뷰작성 -> 데이터저장 / 사진은 1개만 가능
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
		
		    // 세션에서 회원 번호를 가져옵니다.
		    int member_num = (int) session.getAttribute("member_num");

		    // 상품 번호는 memberDTO에서 가져올 수 있습니다.
		    int item_num = memberDTO.getItem_num();

		    // getItemOrder를 호출하여 order_num을 가져옵니다.
		    List<MemberDTO> order_num = memberService.getItemOrder(member_num, item_num);

		 // 구매 기록이 없는 경우 리뷰 작성을 허용하지 않습니다.
		    if (order_num == null || order_num.isEmpty()) {
		        return ResponseEntity.status(HttpStatus.FORBIDDEN)
		                .body("{\"status\": \"failure\", \"message\": \"구매 이력이 존재하지 않아 리뷰를 작성할 수 없습니다.\"}");
		    }
		    
		// 첨부파일 올라갈 물리적 경로 
				String uploadPath = session.getServletContext().getRealPath("/resources/upload");
				
//				System.out.println(uploadPath);
				// 이건 여러개 (map 쓸때 사용할 수도 있어서 남겨둠)
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
	
	
	// order_num 가져오고싶은 나 제법... 간절해요
	@GetMapping("/getItemOrder")
	@ResponseBody
	public List<MemberDTO> getItemOrder(@RequestParam("member_num") int member_num,
	                         @RequestParam("item_num") int item_num) {
	    return memberService.getItemOrder(member_num, item_num);
	}

	
	
	// 한 상품에 대한 리뷰목록
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
	                                @RequestParam("review_content") String review_content,
	                                @RequestParam("review_image") MultipartFile file,
	                                 HttpSession session) {
		// 파일을 저장할 폴더 경로
	    String uploadPath = session.getServletContext().getRealPath("/resources/upload");

	    if (!file.isEmpty() && file.getSize() > 0) {
	        String fileName = file.getOriginalFilename();
	        String fileExtension = FilenameUtils.getExtension(fileName);

	        // 허용되는 확장자 리스트
	        List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");

	        if (allowedExtensions.contains(fileExtension.toLowerCase())) {

	            String uuid = UUID.randomUUID().toString();
	            String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

	            String filePath = uploadPath + "/" + storedFileName;
	            String saveFileName = "http://your_website_url/resources/upload/" + storedFileName;

	            // 서버에 파일 저장
	            File dest = new File(filePath);
	            try {
	                file.transferTo(dest);
	            } catch (IOException e) {
	                e.printStackTrace();
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                        .body("파일 저장 중 문제가 발생했습니다.");
	            }

	            // 리뷰 업데이트 작업 진행
	            memberService.updateReview(review_num, review_star, review_title, review_content, saveFileName);
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                    .body("지원하지 않는 이미지 형식입니다.");
	        }
	    } else {
	        // 이미지 업데이트를 진행하지 않음 (기존 이미지 사용)
	        memberService.updateReview(review_num, review_star, review_title, review_content, null);
	    }

	    return ResponseEntity.status(HttpStatus.OK).body("The review has been successfully updated.");
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

	// 서영 :  찜하기용입니다
	@RequestMapping(value = "/toggle_favorite", method = RequestMethod.GET)
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
			response.put("message", "찜 목록에서 상품이 삭제되었습니다.");
		}

		return response;
	}
	
	@RequestMapping(value = "/selectWishlistget", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List<WishlistDTO>> fetchWishlist(WishlistDTO wishlistDTO, @RequestParam("member_num") Integer member_num) {
	    Map<String, List<WishlistDTO>> response = new HashMap<>();
	    
	    List<WishlistDTO> wishList = memberService.selectWishlistget(member_num);
	    
	    response.put("wishList", wishList);
	    
	    return response;
	}
	
	@PostMapping("/deleteWishlist")
	public ResponseEntity<?> deleteWishlist(@RequestBody WishlistDTO wishlistDTO) {
	    try {
	        memberService.deleteWishlist(wishlistDTO);

	        return ResponseEntity.ok().build();
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}

    
	@GetMapping("/favorites")
	public ModelAndView showFavorites(WishlistDTO wishlistDTO, @SessionAttribute("member_num") Integer member_num) {
	    ModelAndView modelAndView = new ModelAndView("favorites");
	    System.out.println("찜을불러오자");
	    List<WishlistDTO> zzimlist = memberService.getzzimlist(member_num);
	    modelAndView.addObject("zzimlist", zzimlist);
	    return modelAndView;
	}

	

}
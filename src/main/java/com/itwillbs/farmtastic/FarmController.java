package com.itwillbs.farmtastic;

import java.util.ArrayList;
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
import org.aspectj.lang.reflect.MemberSignature;
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

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {

		System.out.println("main 매핑확인여부");

		List<Map<String, Object>> itemList = sellerService.getItems();
		model.addAttribute("itemList", itemList);

		return "main"; 
	}

	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog(Locale locale, Model model, HttpServletRequest request) {
		
		// 한 페이지에 보여줄 글 개수 설정
		int pageSize = 2;
		// 페이지 번호
		String spageNum = request.getParameter("pageNum");
		// 페이지 번호가 없을때 1로 설정
		if(spageNum == null) {
			spageNum = "1";
		}
		int pageNum = Integer.parseInt(spageNum);
		int currentPage = Integer.parseInt(spageNum);
		// 전체 글 개수 구하기
		int count = adminService.getBlogCount();
		// 페이징 처리
		int pageBlock = 5; // 화면에 보일 페이지의 수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage + pageBlock-1;
		int pageCount = count / pageSize + (count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount; 
		}
		Map<String, Integer> bMap = new HashMap<String, Integer>();
		bMap.put("pageSize", pageSize);
		bMap.put("pageNum", pageNum);
		bMap.put("currentPage", currentPage);
		bMap.put("count", count);
		bMap.put("pageBlock", pageBlock);
		bMap.put("startPage", startPage);
		bMap.put("endPage", endPage);
		bMap.put("pageCount", pageCount);
		
		List<Map<String, Object>> bContent = adminService.getBlog(bMap);
		model.addAttribute("bContent", bContent);
		model.addAttribute("bMap", bMap);

		return "/member/blog";
	}

	@RequestMapping(value = "/blogDetails", method = RequestMethod.GET)
	public String blogDetails(@RequestParam("admin_blog_num") int admin_blog_num, Locale locale, Model model) {
	    
	    Map<String, Object> bContent = adminService.getblogContent(admin_blog_num);
	    model.addAttribute("bContent", bContent);
	    model.addAttribute("admin_blog_num", admin_blog_num);
	    
	    List<Map<String, Object>> allPosts = adminService.getAllPosts();
	    List<Map<String, Object>> nextThreePosts = new ArrayList<>();

	    int nextIndex = 0;
	    for (int i = 0; i < allPosts.size(); i++) {
	        if ((int) allPosts.get(i).get("admin_blog_num") == admin_blog_num) {
	            nextIndex = (i + 1) % allPosts.size(); // 다음 포스트 인덱스
	            break;
	        }
	    }

	    for (int i = 0; i < 3; i++) {
	        nextThreePosts.add(allPosts.get(nextIndex));
	        nextIndex = (nextIndex + 1) % allPosts.size();
	    }
	    
	    model.addAttribute("nextThreePosts", nextThreePosts);
	    
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

			String member_id = userProfile.getString("id");
			String member_name = userProfile.getString("name");
			String member_email = userProfile.getString("email");
			String member_phone = userProfile.getString("mobile");
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMember_id(member_id);
			memberDTO.setMember_name(member_name);
			memberDTO.setMember_email(member_email);
			memberDTO.setMember_phone(member_phone);
			System.out.println(memberDTO.getMember_name());
			MemberDAO memberDAO = new MemberDAO();

			MemberDTO existingMember = memberService.nuserCheck(memberDTO);
			if (existingMember != null) {
				System.out.println("로그인");
				session.setAttribute("member_num", existingMember.getMember_num()); 

				return "redirect:/main";
			} else {
				memberService.ninsertMember(memberDTO);
				System.out.println("회원가입");
				return "redirect:/main";
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

		String member_id = jsonObject.optString("id") + "+";
		String member_name = userProfile.getString("name");
		String member_email = userProfile.getString("email");
		

		String member_phone = userProfile.getString("phone_number");
		member_phone = member_phone.replaceAll("[^0-9]+", ""); // 숫자 제외한 문자열 모두 제거

		if (member_phone.startsWith("+")) { // 국가코드가 +로 시작하는 경우 처리
		    member_phone = member_phone.substring(1);
		} else if (member_phone.startsWith("00")) { // 국가코드가 00으로 시작하는 경우 처리
		    member_phone = member_phone.substring(2);
		}

		// 국가코드에 따라 전화번호 형식 변경하기
		if (member_phone.startsWith("82")) { // 한국 국가코드인 경우
		    member_phone = "0" + member_phone.substring(2);
		    if (member_phone.startsWith("010")) { // 이미 010-xxxx-xxxx 형태인 경우
		        // 아무런 처리 없이 그대로 두기
		    } else if (member_phone.startsWith("02")) { // 서울 전화번호인 경우
		        if (member_phone.length() == 9) { // 02-xxx-xxxx 형태인 경우
		            member_phone = "02-" + member_phone.substring(2, 5) + "-" + member_phone.substring(5);
		        } else if (member_phone.length() == 10) { // 02-xxxx-xxxx 형태인 경우
		            member_phone = "02-" + member_phone.substring(3, 6) + "-" + member_phone.substring(6);
		        }
		    } else if (member_phone.startsWith("01")) { // 010 또는 지방번호인 경우
		        if (member_phone.length() == 10) { // 지방번호인 경우
		            member_phone = member_phone.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
		        }
		    }
		} else if (member_phone.startsWith("1")) { // 미국 국가코드인 경우
		    member_phone = "+" + member_phone; // "+"를 붙여서 국제 전화번호 형식으로 변경
		    if (member_phone.length() == 12) { // 미국 국가번호인 경우
		        member_phone = member_phone.replaceFirst("(\\d{1})(\\d{3})(\\d{3})(\\d{4})", "+$1-$2-$3-$4");
		    } else if (member_phone.length() == 11) { // 미국 국가번호 없이 숫자 10자리만 있는 경우
		        member_phone = member_phone.replaceFirst("(\\d{3})(\\d{3})(\\d{4})", "+1-$1-$2-$3");
		    }
		} else { // 다른 국가 코드인 경우
		    member_phone = "+" + member_phone; // "+"를 붙여서 국제 전화번호 형식으로 변경
		    // 국가 코드와 지역 번호 파싱이 필요하다면 추가 구현이 필요합니다.
		}
		
		System.out.println("휴대폰번호확인:" + member_phone); // 출력 예시: 010-1234-5678 혹은 02-123-4567 혹은 00123-456-7890

		// MemberDTO 객체를 생성하고 추출된 프로필 정보를 설정
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_name(member_name);
		memberDTO.setMember_email(member_email);
		memberDTO.setMember_phone(member_phone);
		System.out.println("휴대폰번호확인2:" + member_phone);
		System.out.println(memberDTO.getMember_name());
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if (memberDTO2 != null) {
			System.out.println("로그인");
			session.setAttribute("member_num", memberDTO2.getMember_num());
			return "redirect:/main";
		} else {
			memberService.insertMember(memberDTO);
			System.out.println("회원가입");
			return "redirect:/main";
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
		if (member_num == null) {
	        return "redirect:/login";
		}
		MemberDTO memberDTO = memberService.getMember1(member_num);
		model.addAttribute("memberDTO", memberDTO);
		List<OneBoardDTO> oneBoardList2 = memberService.findByItemNum2(member_num);
		model.addAttribute("oneBoardList2", oneBoardList2);
		List<WishlistDTO> zzimlist = memberService.getzzimlist(member_num);
		model.addAttribute("zzimlist", zzimlist);
		
		// 주문관리 - 지원
		List<Map<String, Object>> orderList = memberService.getOrderList(member_num);
		model.addAttribute("orderList", orderList);
		
		return "/member/mypage";
	}
	
	@RequestMapping(value = "/getOrderDetail", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getOrderDetail(@RequestParam int member_num, @RequestParam String order_num) {
	
	    List<Map<String, Object>> orderDetail = memberService.getOrderDetail(member_num, order_num);
	    return orderDetail; // JSON 형식으로 반환
	}
	
	// 주문취소
	@RequestMapping(value="/cancelOrder", method = RequestMethod.POST)
	public String cancelOrder(@RequestParam HashMap<String, Object> cancel) {
		
		String orderNum = cancel.get("orderNum").toString();
	    cancel.put("order_num", orderNum);
		
		// update, insert 과정 
		memberService.cancelOrder(cancel);
		// 취소 했으면 인서트 
		memberService.cancelInsert(cancel);
		
		return "/member/mypage";
	}
	
	// 주문취소 목록
	@RequestMapping(value = "/cancelList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getCancelledOrders(@RequestParam("orderNum") String orderNum) {
	    List<Map<String, Object>> cancelList = memberService.getCancelList(orderNum);
	    System.out.println("cancelList: " + cancelList);
	    Map<String, Object> response = new HashMap<>();
	    response.put("cancelledOrders", cancelList);

	    return new ResponseEntity<>(response, HttpStatus.OK);
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
	public String updatePro(HttpSession session, HttpServletResponse response,@RequestParam(value = "member_id", required = false) String member_id,
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
			sendResponse(response, "비밀번호 변경완료.");
			return "/main";
		} else {
			
			
			sendResponse(response, "비밀번호가 틀립니다.");
			return "/mypage";
		}
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Locale locale, Model model) {

		List<Map<String, Object>> resultList = adminService.getCnotice();
		model.addAttribute("notice", resultList);
		return "/member/contact";
	}

	@RequestMapping(value = "/contactContent", method = RequestMethod.GET)
	public String contactContent(@RequestParam("admin_cs_num") int admin_cs_num, Locale locale, Model model) {
		Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
		model.addAttribute("content", resultMap);
		model.addAttribute("admin_cs_num", admin_cs_num);
		return "/member/contactContent";
	}

	// 팜팜마켓에 등록된 아이템 전부 가지고 올 것임
	@RequestMapping(value = "/farmStore", method = RequestMethod.GET)
	public String farmStore(Locale locale, Model model) {

		List<Map<String, Object>> itemList = sellerService.getItems();
		model.addAttribute("itemList", itemList);

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

		return "redirect:/shoppingCart";
	}

	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String shopingCart(Model model, HttpSession session) {

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
		    
		    System.out.println(payInfo + "item_num 담기는지 확인");
		    // paySuccess 넘어오는 애들 자체가 pay가 완료해서 넘어오는거임
		    // pay 먼저 insert ! (pay가 먼저 insert되어야지,  order-detail-cartdelete실행 
			
		    // 없어도 될거 같음 일단은 남겨둠 (지원)
		    // memberService.insertPay(payInfo);
		    
		    // orders 테이블에 DB인서트 작업 
		    memberService.insertOrders(payInfo);
		    System.out.println(payInfo + " member_num : " + member_num);
		    
		    System.out.println("업데이트 들어갈 예정 :" + payInfo);
		 //   payInfo.put("item_num", item_num);
		    // 아이템 재고 줄이기
			//memberService.updateItemLeft(payInfo);
		    
		    // paySuccess.jsp 페이지로 리다이렉트
		    return "redirect:/insertOrderDetail"; // 주문상세테이블에 인서트하고, 
		}

	// 주문창으로 넘어갔을때 임의로 주문상세테이블에 insert를 시키고, 결제가 y가 되면 (1. update 2. delete, insert)
	// 진행
	// 주문 버튼 눌렀을 때 주문상세테이블에 1차로 추가
	@RequestMapping(value = "/insertOrderDetail", method = RequestMethod.GET)
	public String insertOrderDetail(@RequestParam HashMap<String, Object> orderDetail, HttpSession session) {

		int member_num = (int)session.getAttribute("member_num");
		orderDetail.put("member_num", member_num);

	    memberService.insertOrderDetail(orderDetail);
		
		// cartlist에서 주문테이블로 insert되면 cartlist delete될 예정
		memberService.deleteAllCart(orderDetail);
		// 주문완료했다 페이지로 이동~~ (메인으로 이동 등) 
		
		return "redirect:/orderSuccess";
	}
	
	// 주문완료 페이지 정보
	@RequestMapping(value = "/orderSuccess", method = RequestMethod.GET)
	public String orderSuccess(Model model, HttpSession session) {
	    int member_num = (int) session.getAttribute("member_num");

	    List<Map<String, Object>> orderPayList = memberService.getOrderPay(member_num);

	    if (!orderPayList.isEmpty()) {
	        Map<String, Object> orderPay = orderPayList.get(0);
	        model.addAttribute("orderPay", orderPay);

	        String orderNum = (String) orderPay.get("order_num");
	        List<Map<String, Object>> orderDetailList = memberService.getOrderDetail(member_num, orderNum);

	        for (Map<String, Object> orderDetail : orderDetailList) {
	            memberService.updateItemLeft(orderDetail);
	        }
	    }
	    return "/member/orderSuccess";
	}
	

	// 카트안 아이템 삭제
	@RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
	public String deleteCart(@RequestParam HashMap<String, Object> cart, HttpSession session) {

		int member_num = (int)session.getAttribute("member_num");
		cart.put("member_num", member_num);

		System.out.println("deleteCart 컨트롤러 오는지");
		memberService.deleteCart(cart);

		return "redirect:/shoppingCart";
	}
	
	@RequestMapping(value = "/clearCart", method = RequestMethod.GET)
	public String clearCart(HttpSession session) {

		int member_num = (int)session.getAttribute("member_num");
		session.setAttribute("member_num", member_num);
		System.out.println(member_num);

		System.out.println("clearCart 컨트롤러 오는지");
		memberService.clearCart(member_num);

		return "redirect:/shoppingCart";
	}

	// -------------------------------------------------------

	@RequestMapping(value = "/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		
		memberService.insertMember(memberDTO);

		return "redirect:/login";
	}

	@RequestMapping(value = "/insertPro2", method = RequestMethod.POST)
	public String insertPro2(HttpServletRequest request, @RequestParam("file") List<MultipartFile> files, HttpSession session) throws Exception {
	    
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
        
		SellerDTO sellerDTO = new SellerDTO();
	    // 파일 처리 부분
        for (int i = 0; i < files.size(); i++) {
            MultipartFile file = files.get(i);
            if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
                String fileName = file.getOriginalFilename(); // 파일 원래 이름
                String fileExtension = FilenameUtils.getExtension(fileName); // 확장자

                String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                String filePath = uploadPath + "/" + storedFileName;
                
                System.out.println("filePath : " + filePath);
                
                // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
                String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

                // 임시경로에서 filePath로 파일이동 
                File dest = new File(filePath);
                file.transferTo(dest);

	        // 저장된 파일 경로를 sellerDTO에 저장
	        sellerDTO.setSeller_file(saveFileName);
            }
        } 
	    sellerDTO.setSeller_type(request.getParameter("seller_type"));
	    sellerDTO.setSeller_licenseNum(request.getParameter("seller_licenseNum"));
	    sellerDTO.setSeller_id(request.getParameter("seller_id"));
	    sellerDTO.setSeller_pass(request.getParameter("seller_pass"));
	    sellerDTO.setSeller_name(request.getParameter("seller_name"));
	    sellerDTO.setSeller_storeName(request.getParameter("seller_storeName"));
	    sellerDTO.setSeller_post(request.getParameter("seller_post"));
	    sellerDTO.setSeller_addMain(request.getParameter("seller_addMain"));
	    sellerDTO.setSeller_addSub(request.getParameter("seller_addSub"));
	    sellerDTO.setSeller_mobile(request.getParameter("seller_mobile"));
	    sellerDTO.setSeller_phone(request.getParameter("seller_phone"));
	    sellerDTO.setSeller_bank(request.getParameter("seller_bank"));
	    sellerDTO.setSeller_accountNum(request.getParameter("seller_accountNum"));
	    sellerDTO.setSeller_accountHolder(request.getParameter("seller_accountHolder"));
	    sellerDTO.setSeller_email(request.getParameter("seller_email"));
	    sellerDTO.setSeller_recoYn(request.getParameter("seller_recoYn"));
	    
	    // 회원가입 처리
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
			
			return "redirect:/main";
		} else if (memberDTO2 != null && "N".equals(memberDTO2.getMember_delYn())){
			// 승인되지 않은 사용자
            sendResponse(response, "탈퇴한 회원로그인불가.");
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

	@RequestMapping(value = "/oneboard", method = RequestMethod.GET)
	public String oneBoard(Model model) {
		return "/member/oneboard";
	}

	@RequestMapping(value = "/oneboardForm", method = RequestMethod.POST)
	public String oneBoardForm(HttpServletRequest request, @RequestParam("one_board_file") MultipartFile file, HttpSession session)throws Exception{

				String uploadPath = session.getServletContext().getRealPath("/resources/upload");
				OneBoardDTO oneboardDTO = new OneBoardDTO();
				if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
				        String fileName = file.getOriginalFilename(); // 파일 원래 이름
				        String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
				
				
				        List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");

				        if (allowedExtensions.contains(fileExtension.toLowerCase())) {

				            String uuid = UUID.randomUUID().toString();
				            String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

				            String filePath = uploadPath + "/" + storedFileName;

				            System.out.println("filePath : " + filePath);

				            String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

				            System.out.println("Received file: " + file.getOriginalFilename());

				            File dest = new File(filePath);
				            try {
				              file.transferTo(dest);
				              System.out.println("파일이 정상적으로 저장되었습니다: " + dest.getAbsolutePath()); // 로그 메시지 추가
				            } catch (IOException e) {
				              System.out.println("파일 저장 중 오류 발생: " + e.getMessage()); // 에러 발생 시 로그 메시지 추가
				              e.printStackTrace();
				            }

				            oneboardDTO.setOne_board_file(saveFileName);
				        } else {
				        }
				    }
				
				oneboardDTO.setOne_board_type(request.getParameter("one_board_type"));
				oneboardDTO.setOne_board_title(request.getParameter("one_board_title"));
				oneboardDTO.setOne_board_content(request.getParameter("one_board_content"));
				oneboardDTO.setOne_board_pass(request.getParameter("one_board_pass"));
				oneboardDTO.setOne_board_private(request.getParameter("one_board_private"));
				oneboardDTO.setItem_num(Integer.parseInt(request.getParameter("item_num")));
				oneboardDTO.setMember_num(Integer.parseInt(request.getParameter("member_num")));
		memberService.insertOneBoard(oneboardDTO);

		return "/member/success";
	}
	
	@RequestMapping(value = "/updateoneboard", method = RequestMethod.GET)
	public String updateoneBoard(@RequestParam("one_board_num") int one_board_num, Model model) {

	    List<OneBoardDTO> oneBoard = memberService.findByOneBoardNum(one_board_num);

	    if (oneBoard != null) {
	        model.addAttribute("one_board", oneBoard.get(0));
	    } else {
	        model.addAttribute("errorMessage", "잘못된 접근입니다.");
	    }
	    return "/member/updateoneboard";
	}
	
	@RequestMapping(value = "/updateOneboardForm", method = RequestMethod.POST)
	public String updateOneboardForm(@RequestParam("one_board_num") int one_board_num,
	                                @RequestParam("one_board_title") String one_board_title,
	                                @RequestParam("one_board_content") String one_board_content,
	                                @RequestParam("one_board_pass") String one_board_pass,
	                                @RequestParam("one_board_private") String one_board_private,
	                                @RequestParam("one_board_file") MultipartFile file,
	                                HttpServletRequest request, Model model, HttpSession session)throws Exception {
	    OneBoardDTO originalOneBoard = memberService.getOneBoard(one_board_num);
	    
	    if (one_board_pass.equals(originalOneBoard.getOne_board_pass())) {
	        String uploadPath = session.getServletContext().getRealPath("/resources/upload");
	        OneBoardDTO oneboardDTO = new OneBoardDTO();
	        oneboardDTO.setOne_board_num(one_board_num); // 이 부분이 추가되었습니다.

	        if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
	                String fileName = file.getOriginalFilename(); // 파일 원래 이름
	                String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
	        
	                List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");

	                if (allowedExtensions.contains(fileExtension.toLowerCase())) {

	                    String uuid = UUID.randomUUID().toString();
	                    String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

	                    String filePath = uploadPath + "/" + storedFileName;

	                    String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;
	                    File dest = new File(filePath);
	                    try {
	                      file.transferTo(dest);
	                    } catch (IOException e) {
	                      e.printStackTrace();
	                    }

	                    oneboardDTO.setOne_board_file(saveFileName);
	                }
	            }
	            oneboardDTO.setOne_board_type(request.getParameter("one_board_type")); // 메서드 매개변수를 사용하도록 변경
	                oneboardDTO.setOne_board_title(one_board_title);
	                oneboardDTO.setOne_board_content(one_board_content);
	                oneboardDTO.setOne_board_private(one_board_private);
	        memberService.updateOneBoard(oneboardDTO);
	        return "/member/success";
	    } else {
	        // 비밀번호가 일치하지 않으면, 오류 메시지를 설정합니다.
	        request.getSession().setAttribute("message", "비밀번호가 일치하지 않습니다");
	        // 다시 수정 폼 페이지로 리다이렉트하거나 다른 행동을 수행할 수 있습니다.
	        return "redirect:updateoneboard?one_board_num=" + one_board_num;
	    }
	}




	@RequestMapping(value = "/toggle_favorite", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> addWishlist(WishlistDTO wishlistDTO, @RequestParam("item_num") Integer item_num) {
		Map<String, String> response = new HashMap<>();

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
	
	@RequestMapping(value = "/CheckVerificationCodeServlet", method = RequestMethod.GET)
	@ResponseBody
	public String searchId(@RequestParam String email) {
	    String searchId = memberService.searchId(email);
	    return searchId; // JSON 형식으로 반환
	}

	@RequestMapping(value = "/withdrawPro", method = RequestMethod.GET)
	public String withdrawPro(Model model, HttpSession session,HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "member_id", required = false) String member_id,
			@RequestParam(value = "member_pass", required = false) String member_pass) throws Exception {
		System.out.println("FarmController withdrawPro");
		Integer member_num = (Integer) session.getAttribute("member_num");

		// 입력된 값들도 세션에 저장합니다.
		session.setAttribute("member_id", member_id);
		session.setAttribute("member_pass", member_pass);
		

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(member_num);
		memberDTO.setMember_id(member_id);
		memberDTO.setMember_pass(member_pass);

		MemberDTO memberDTO2 = memberService.userCheck1(memberDTO);

		if (memberDTO2 != null && memberDTO2.getMember_pass().equals(member_pass)) {
			// memberDTO 객체에 입력된 값들을 설정합니다.
			memberDTO.setMember_id(member_id);
			memberDTO.setMember_pass(member_pass);
			
			
			memberService.withdrawMember(memberDTO);
			
			
			model.addAttribute("error", "회원탈퇴완료 잘가요.");
			session.invalidate();
			
			return "redirect:/login";
			
		} else {
			
			
			sendResponse(response, "비밀번호가 틀립니다.");
			return "/mypage";
		}
	}

}
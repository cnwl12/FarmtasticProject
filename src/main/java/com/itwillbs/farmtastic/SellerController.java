package com.itwillbs.farmtastic;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;
import com.itwillbs.service.SellerService;

@Controller
public class SellerController {
	
	@Inject
	private SellerService sellerService;
	
	// 로그인 기능이 없어서 일단 판매자 정보 페이지에 접속하면 이 판매자가 뜨게 하드코딩함
	// 로그인해서 세션으로 값 가져오면 삭제할 코드
	 //String seller_num = "TA002"; ->주석해둠-성하
	
//	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		
//		System.out.println("sellerMain 매핑확인여부");
//		return "/seller/sellerMain";
//	}

	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET) //수정성하
	public String home(Locale locale, Model model, HttpSession session) {

	   System.out.println("sellerMain 매핑확인여부");
	    
	   	String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);

	    model.addAttribute("seller_id", seller_id);
	    return "seller/sellerMain";
	}

	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		
		System.out.println("tables 매핑확인여부");
		return "/seller/tables";
	}
	
//	// 선진) 판매자 정보 페이지들어가면 디비에 입력된 개인정보 출력됨
//		@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
//		public String sellerMemb(Locale locale, Model model) {
//			
//			System.out.println("SellerController의 sellerMemb 매핑완");
//			Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
//			model.addAttribute("seller", sellerInfo);
//			return "/seller/sellerMemb";
//		}
	
	
		
	// 선진) 판매자 정보 페이지들어가면 디비에 입력된 개인정보 출력됨->수정조금했습니다 성하
		@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
		public String sellerMemb(Locale locale, Model model, HttpSession session) {

		    System.out.println("SellerController의 sellerMemb 매핑완");

		    // HttpSession 객체가 null인 경우 예외를 방지하기 위한 null 체크
		    if (session == null) {
		        // 예외 처리 코드
		        return "redirect:/login";
		    }

		    String seller_num = (String) session.getAttribute("seller_num");

		    // seller_num이 null인 경우 예외 처리 코드
		    if (seller_num == null) {
		        // 예외 처리 코드
		        return "redirect:/login";
		    }

		    Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
		    model.addAttribute("seller", sellerInfo);

		    return "/seller/sellerMemb";
		}
	
	
	
	
	/*
	 * // 선진) 판매자 정보 수정, 안쓰는 코드라 삭제 예정
	 *
	 * @RequestMapping(value = "/sellerUpdate", method = RequestMethod.GET) public
	 * String sellerUpdate(Model model) {
	 * System.out.println("SellerController의 sellerUpdate 매핑완");
	 * 
	 * // 나중에 로그인되면 디비에서 가져올 것 // String seller_num =
	 * (String)session.getAttribute("seller_num");
	 * 
	 * // 위로 뺌 String seller_num = "CR0001"; // Map<String, Object> sellerInfoList =
	 * sellerService.getSellerInfo(seller_num); //
	 * model.addAttribute("sellerInfoList", sellerInfoList);
	 * 
	 * Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
	 * model.addAttribute("sellerInfo", sellerInfo);
	 * 
	 * return "/seller/sellerUpdate"; }
	 */
	
	// 선진) 판매자 정보 수정
	@RequestMapping(value = "/sellerUpdatePro", method = RequestMethod.POST)
	public String sellerUpdatePro(@RequestParam Map<String, Object> sellerInfo) {
		
		System.out.println("SellerController의 sellerUpdatePro 매핑완");
//		Map<String, Object> sellerInfoList2 = sellerService.sellerCheck(sellerInfo);
//		System.out.println(sellerInfoList2);
		if(sellerInfo != null) {
			System.out.println("null 아님");
			sellerService.updateSeller(sellerInfo);
			return "redirect:/sellerMain";
		} else {
			System.out.println("null임");
			return "/seller/mgs";
		}
	}
	
	// 선진) 매출관리 페이지 - 매출 차트 있음
	@RequestMapping(value = "/salesMng", method = RequestMethod.GET)
	public String salesMng(Locale locale, Model model) {
		
		System.out.println("SellerController의 salesMng 매핑완");
		List<Map<String,Object>> DailySales = sellerService.getDailySales();
		List<Map<String,Object>> MonthlySales = sellerService.getMonthlySales();
		
	    model.addAttribute("DailySales", DailySales);
	    model.addAttribute("MonthlySales", MonthlySales);
		return "/seller/salesMng";
	}
	
	// 선진) 일자별 매출 제이슨데이터로 변환
	@RequestMapping(value = "/chartDailySales", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String,Object>>> chartDailySales(){
		
		List<Map<String,Object>> jsonDailySales = sellerService.getDailySales();
		// 이동이 아니라 ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<Map<String,Object>>> entityDailySales = new ResponseEntity<List<Map<String,Object>>>(jsonDailySales, HttpStatus.OK);
		return entityDailySales;
	}
	
	// 선진) 월별 매출 제이슨데이터로 변환
	@RequestMapping(value = "/chartMonthlySales", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String,Object>>> chartMonthlySales(){
		
		List<Map<String,Object>> jsonMonthlySales = sellerService.getMonthlySales();
		// 이동이 아니라 ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<Map<String,Object>>> entityMonthlySales = new ResponseEntity<List<Map<String,Object>>>(jsonMonthlySales, HttpStatus.OK);
		return entityMonthlySales;
	}
	
	
	
	@RequestMapping(value = "/memberMng", method = RequestMethod.GET)
	public String memberMng(Locale locale, Model model) {
		
		System.out.println("memberMng 매핑확인여부");
		return "/seller/memberMng";
	}

	/*
	@RequestMapping(value = "/itemMng", method = RequestMethod.GET)
	public String itemMng(Locale locale, Model model) {
		
		System.out.println("itemMng 매핑확인여부");
		return "/seller/itemMng";
	}
	*/
	@RequestMapping(value = "/itemDelMng", method = RequestMethod.GET)
	public String itemDelMng(Locale locale, Model model) {
		
		System.out.println("itemDelMng 매핑확인여부");
		return "/seller/itemDelMng";
	}
	
	@RequestMapping(value = "/itemRetExcMng", method = RequestMethod.GET)
	public String itemRetExcMng(Locale locale, Model model) {
		
		System.out.println("itemRetExcMng 매핑확인여부");
		return "/seller/itemRetExcMng";
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
	// 서영 : 문의게시판
	@RequestMapping(value = "/questionMng", method = RequestMethod.GET)
	public String questionMng(Locale locale, Model model, HttpServletRequest request) {
		
		System.out.println("questionMng 매핑확인여부");
		 String seller_num = (String) request.getSession().getAttribute("seller_num");
	        List<OneBoardDTO> oneboard = sellerService.getBySellerque(seller_num);

	        model.addAttribute("oneboard", oneboard);
		return "/seller/questionMng";
	}
	
	@RequestMapping("/updateReply")
	public String updateReply(Locale locale, Model model, HttpServletRequest request){
	    System.out.println("문의글 답변달자");
	    String seller_num = (String) request.getSession().getAttribute("seller_num");
	    String oneboardnum = (String) request.getParameter("one_board_num");
	    String one_board_reply = request.getParameter("one_board_reply");
	    int one_board_num = Integer.parseInt(oneboardnum);

	    System.out.println(one_board_num);
	    sellerService.updateReply(seller_num, one_board_num, one_board_reply);
	    // 필요한 서비스 또는 리포지토리를 사용하여 해당 게시물의 답변을 업데이트하는 코드를 작성합니다.

	    return "redirect:/questionMng"; // 이 부분은 작성한 코드에 맞게 수정해야 합니다. 업데이트가 완료된 후 원래 페이지로 돌아갑니다.
	}



	
	@GetMapping("/getDetails")
	public ResponseEntity<?> getDetails(@RequestParam("seller_num") String seller_num) {
	    List<OneBoardDTO> oneBoardDetails = sellerService.getBySellerque(seller_num);
	    return ResponseEntity.ok().body(oneBoardDetails);
	}
	
	// 상품등록 
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	public String itemInsert(Model model, HttpSession session) {
		
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
		
		// 삭제예정 
		//String seller_num = "TA002";
		
		// System.out.println("셀러고유번호 확인 : "+seller_num);
		
		//System.out.println("itemRegister 매핑확인여부");
		
		return "/seller/itemRegister";
	}
	
	// 상품등록 처리과정 페이지 
	@RequestMapping(value = "/itemInsertPro", method = RequestMethod.POST)
	public String itemInsertList(@RequestParam HashMap<String, String> itemList,
	                             @RequestParam("file") List<MultipartFile> files,
	                             HttpSession session)throws Exception {
		
		// 첨부파일 올라갈 물리적 경로 
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		
//		System.out.println(uploadPath);
		
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
                
                // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
                // 사진 정보의 경로를 저장
                itemList.put("item_mainImg", saveFileName);

                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
        	}
        }
		
		// 삭제예정 
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
		
		//String seller_num = "TA002";
		
		itemList.put("seller_num", seller_num);
		
		sellerService.itemInsert(itemList, files, session);
	    
	    return "redirect:/itemMng";
	}
	
	// 상품관리 전체목록
	@RequestMapping(value = "/itemMng", method = RequestMethod.GET)
	public String itemMng(Model model, HttpSession session) {
	    // 삭제예정 
	    // String seller_num = "TA002";
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
	    
	    // session.setAttribute("seller_num", seller_num);
	    System.out.println("itemInsertList 매핑확인여부");
	    
	    List<Map<String, Object>> itemList = sellerService.getItemSeller(seller_num);
	    
	    model.addAttribute("itemList", itemList);
	    System.out.println(seller_num);
	    
	    return "/seller/itemMng";
	}
	
	// 판매중지/판매 변경 버튼 - 상태 조회 후 변경 
	@RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
	public String updateStatus(@RequestParam HashMap<String, String> status, HttpSession session){
		
		// String seller_num = "TA002";
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
		status.put("seller_num", seller_num);
		// System.out.println("updateStatus까지 오는지"+ seller_num);
		sellerService.updateStatus(status);
		
		
	    return "redirect:/itemMng";
	}
	
	// 판매 품목 수정 - 해쉬맵으로 수정할예정
	@RequestMapping(value = "/itemUpdate", method = RequestMethod.GET)
	public String itemUpdate(@RequestParam("item_num") int item_num, Model model, HttpSession session) {
		
		 System.out.println("itemUpdate 매핑확인여부");
		
		 // 삭제예정 
		 // String seller_num = "TA002";
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
		 
		 // item.put("seller_num", seller_num);
		 
		 Map<String, Object> item = sellerService.getItem(item_num);
		
		 model.addAttribute("item_num", item_num);
		 model.addAttribute("item", item);
	    
	    return "/seller/itemUpdate";
	}
	
	@RequestMapping(value = "/itemUpdatePro", method = RequestMethod.POST)
	public String itemUpdatePro(@RequestParam HashMap<String, String> itemList,
								@RequestParam("file") List<MultipartFile> files, HttpSession session) throws Exception {
		
			System.out.println("updatePro 오는지");
			
			/* 사진등록 여기부터 서비스 메서드 전까지 들고가면됨! */
			String uploadPath = session.getServletContext().getRealPath("/resources/upload");
			
			for (int i = 0; i < files.size(); i++) {
                MultipartFile file = files.get(i);
                if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
                    String fileName = file.getOriginalFilename(); // 파일 원래 이름
                    String fileExtension = FilenameUtils.getExtension(fileName); // 확장자

                    String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                    String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                    String filePath = uploadPath + "/" + storedFileName;
                    
                    // System.out.println("filePath : " + filePath);
                    
                    // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
                    String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

                    // 임시경로에서 filePath로 파일이동 
                    File dest = new File(filePath);
                    file.transferTo(dest);
                    
                    // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
                    // 사진 정보의 경로를 저장
                    itemList.put("item_mainImg", saveFileName);
                }
			}
            // 삭제예정 
           // String seller_num = "TA002";
			String seller_num = (String) session.getAttribute("seller_num");
			session.setAttribute("seller_num", seller_num);
		 	itemList.put("seller_num", seller_num);
			//itemList.put("item_num", item_num);
            
			sellerService.itemUpdate(itemList, files, session);
	
			return "redirect:/itemMng";
	}
	
	@RequestMapping("/ch_test")
	@ResponseBody
	public Map<String, Object> ch_test() throws Exception{
		
		System.out.println("test 들어가냐");
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Map<String, Object>> list = new ArrayList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "서울");
		map.put("data", new Double[] {-0.3, 1.0, 2.3, -1.3, 5.0});
		
		list.add(map);
		model.put("ch", list);
		
		return model;
	}
	
	
	/* sungha 사업자로그인.... */

	
	
	// 판매자 로그인 처리
	
    @RequestMapping(value = "/sellerloginPro", method = RequestMethod.GET)
    public String sellerloginPro(SellerDTO sellerDTO, HttpSession session, HttpServletResponse response) {
        System.out.println("SellerController sellerloginPro()");

        SellerDTO sellerDTO2 = sellerService.sellerCheck1(sellerDTO);
        
        if (sellerDTO2 != null && "Y".equals(sellerDTO2.getSeller_recoYn())) {
            // 승인된 사용자
            session.setAttribute("seller_num", sellerDTO2.getSeller_num());
            return "redirect:/sellerMain";
        } else if (sellerDTO2 != null && !"Y".equals(sellerDTO2.getSeller_recoYn())) {
        	// 승인되지 않은 사용자
            sendResponse(response, "승인되지 않은 사용자입니다.");
            return "member/login";
        } else { 
        	// 아이디 또는 비밀번호가 틀린 경우 또는 예외 상황
            sendResponse(response, "아이디 또는 비밀번호가 틀립니다.");
            return "member/login";
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
	
	
	/* 로그아웃 사업자*/
	@RequestMapping(value = "/sellerlogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/login";
	}
	
	/* sungha 판매자->회원관리....조회..*/
	@RequestMapping(value = "/memberMngPro", method = RequestMethod.GET)
	public String memberMngPro(Locale locale, Model model) {
		System.out.println("memberMng 매핑확인여부");
		List<Map<String,Object>> MemberMngjoin = sellerService.MemberMngjoin();
	    model.addAttribute("MemberMngjoin", MemberMngjoin);
	    return "/seller/memberMng";
	}
	
	
	
	
	
	
}

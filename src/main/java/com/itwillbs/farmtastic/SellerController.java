package com.itwillbs.farmtastic;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;

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

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;
import com.itwillbs.service.SellerService;

@Controller
public class SellerController {
	

	private static final String seller_num = null;

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

	
	
//  // 응답메시지 전송
//  private void sendResponse(HttpServletResponse response, String message) {
//      try {
//          response.setContentType("text/html;charset=UTF-8");
//          PrintWriter out = response.getWriter();
//          out.println("<script>");
//          out.println("alert('" + message + "');");
//          out.println("history.back();");
//          out.println("</script>");
//          out.close();
//      } catch (IOException e) {
//          e.printStackTrace();
//      }
//  }
	
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws IOException {

	    System.out.println("sellerMain 매핑확인여부");
	    	    
	    if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
	    	model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
	        // 로그인한 경우
	    	String seller_num = (String) session.getAttribute("seller_num");
		    String seller_id = sellerService.idCheck(seller_num);
		    Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
		    model.addAttribute("seller", sellerInfo);
		    model.addAttribute("seller_id", seller_id);
		    return "/seller/sellerMain";
	    }
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
	
	
		
	// 선진) 판매자 정보 페이지들어가면 디비에 입력된 개인정보 출력됨->수정조금했습니다 성하->08.08추가
	@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
	public String sellerMemb(Locale locale, Model model, HttpSession session) throws IOException {

	    
	    if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
	    	model.addAttribute("error", "접근위반 로그인하고와라.");	
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
	        // 로그인한 경우
	    	System.out.println("SellerController의 sellerMemb 매핑완");
	    	String seller_num = (String) session.getAttribute("seller_num");
		    String seller_id = sellerService.idCheck(seller_num);
		    Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
		    model.addAttribute("seller", sellerInfo);
		    model.addAttribute("seller_id", seller_id);
		    return "/seller/sellerMemb";
	    }
	   
	  	    	
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
	public String salesMng(Locale locale, HttpSession session,Model model, HttpServletResponse response) {
		System.out.println("SellerController의 salesMng 매핑완");
		
	    if (session.getAttribute("seller_num") == null) {
	        
	    	model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	        
	    } else {
	    	
	    String seller_num = (String) session.getAttribute("seller_num");
		String seller_id = sellerService.idCheck(seller_num);
		model.addAttribute("seller_id", seller_id);	

		List<Map<String,Object>> DailySales = sellerService.getDailySales(seller_num);
		List<Map<String,Object>> MonthlySales = sellerService.getMonthlySales(seller_num);
		
	    model.addAttribute("DailySales", DailySales);
	    model.addAttribute("MonthlySales", MonthlySales);
	    
		return "/seller/salesMng";
	    }
	}
	
	// 선진) 매출관리 페이지 - 검색바
	@RequestMapping(value = "/salesMngPro", method = RequestMethod.GET)
	public String salesMngPro(@RequestParam(name = "startDate", required = false) String startDate,
	                            @RequestParam(name = "endDate", required = false) String endDate,
	                            Locale locale, Model model, HttpSession session, HttpServletResponse response) {
		System.out.println("SellerController의 salesMngPro 매핑완");
		
	    String seller_num = (String) session.getAttribute("seller_num");
	    
	    Date start = null;
	    Date end = null;
	    try {
	        if (startDate != null && !startDate.trim().isEmpty()) {
	            start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
	        }
	        if (endDate != null && !endDate.trim().isEmpty()) {
	            end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
	        }
	    } catch (ParseException e) {
	        e.printStackTrace();
	        start = null;
	        end = null;
	    }
	    
	    List<Map<String,Object>> DailySalesList = sellerService.getDailySalesList(seller_num, start, end);
	    model.addAttribute("DailySalesList", DailySalesList);
	    
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
	    
	    session.setAttribute("seller_num", seller_num);
	    return "/seller/salesMng";
	}	
	
	// 선진) 일자별 매출 제이슨데이터로 변환
	@RequestMapping(value = "/chartDailySales", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String,Object>>> chartDailySales(HttpSession session){
		String seller_num = (String) session.getAttribute("seller_num");
		List<Map<String,Object>> jsonDailySales = sellerService.getDailySales(seller_num);
		// 이동이 아니라 ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<Map<String,Object>>> entityDailySales = new ResponseEntity<List<Map<String,Object>>>(jsonDailySales, HttpStatus.OK);
		return entityDailySales;
	}
	
	// 선진) 월별 매출 제이슨데이터로 변환
	@RequestMapping(value = "/chartMonthlySales", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String,Object>>> chartMonthlySales(HttpSession session){
		String seller_num = (String) session.getAttribute("seller_num");
		List<Map<String,Object>> jsonMonthlySales = sellerService.getMonthlySales(seller_num);
		// 이동이 아니라 ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<Map<String,Object>>> entityMonthlySales = new ResponseEntity<List<Map<String,Object>>>(jsonMonthlySales, HttpStatus.OK);
		return entityMonthlySales;
	}
	
	@RequestMapping(value = "/memberMng", method = RequestMethod.GET) //성하->수정중
	public String memberMng(Locale locale, HttpSession session, Model model) {
	    
		
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
	        // 로그인한 경우
	        String seller_num = (String) session.getAttribute("seller_num");
	        String seller_id = sellerService.idCheck(seller_num);
	        model.addAttribute("seller_id", seller_id);
	        return "/seller/memberMng";
	    }
	}

	@RequestMapping(value = "/itemDelMng", method = RequestMethod.GET)
	public String itemDelMng(Locale locale, HttpSession session, Model model) {
		
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		System.out.println("itemDelMng 매핑확인여부");
		String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
		return "/seller/itemDelMng";
	    }
	}
	
	
	@RequestMapping(value = "/itemRetExcMng", method = RequestMethod.GET)
	public String itemRetExcMng(Locale locale, HttpSession session, Model model) {
		
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		System.out.println("itemRetExcMng 매핑확인여부");
		String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
		return "/seller/itemRetExcMng";
	    }
	}
	
	@RequestMapping(value = "/reviewMng", method = RequestMethod.GET)
	public String reviewAdmin(Locale locale, HttpSession session, Model model) {
		
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		System.out.println("reviewMng 매핑확인여부");
		String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
		return "/seller/reviewMng";
	    }
	}
	
	// 선진) 정산관리	
	@RequestMapping(value = "/settlementList", method = RequestMethod.GET)
	public String settlementList(Locale locale, HttpSession session, Model model) {
		System.out.println("SellerController의 settlementList 매핑완");
		
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
			
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {

		String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
	    
	    List<Map<String,Object>> MonthSettlementList = sellerService.getSettlementList(seller_num);
	    model.addAttribute("MonthSettlementList", MonthSettlementList);
	    
		return "/seller/settlementList";
	    }
	}

	// 선진) 정산신청 & 정산취소 
	@RequestMapping(value = "/settlementRequest", method = RequestMethod.POST)
	public String settlementRequest(@RequestParam("selectedMonths") String[] selectedMonths, @RequestParam("action") String action, HttpSession session, Model model) {
	    System.out.println("SellerController의 settlementRequest 매핑완");
	    System.out.println(Arrays.toString(selectedMonths)); // 배열 형태로 출력
	    System.out.println("가져오는 셀러넘은 있나요?? : " + session.getAttribute("seller_num"));
	    

	    if ("request".equals(action)) {
	        // 정산 신청 기능 처리
	        if (selectedMonths != null && selectedMonths.length > 0) {
	        	System.out.println("신청 기능 여기오나요?? 액션값은? : " + action);
	            sellerService.insertSettlementRequest((String) session.getAttribute("seller_num"), Arrays.asList(selectedMonths));
	        }
	    } else if ("cancel".equals(action)) {
	        // 정산 취소 기능 처리
	        if (selectedMonths != null && selectedMonths.length > 0) {
	        	System.out.println("취소 기능 여기오나요?? 액션값은? : " + action);
	            sellerService.deleteSettlementRequest((String) session.getAttribute("seller_num"), Arrays.asList(selectedMonths));
	        }
	    } else {System.out.println("암것도아녀 여기오나요?? 액션값은? : " + action);}

	    return "redirect:/settlementList"; // 정산 목록 페이지로 리다이렉트
	}


	// 서영 : 문의게시판
	@RequestMapping(value = "/questionMng", method = RequestMethod.GET)
	public String questionMng(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		
		if (session.getAttribute("seller_num") == null) {
			
			// 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
			return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		
		System.out.println("questionMng 매핑확인여부");
		 String seller_num = (String) request.getSession().getAttribute("seller_num");
	        List<OneBoardDTO> oneboard = sellerService.getBySellerque(seller_num);
	        List<String> itemNames = sellerService.getItemNames(seller_num);
	        model.addAttribute("itemNames", itemNames);
	        model.addAttribute("oneboard", oneboard);
	        String seller_id = sellerService.idCheck(seller_num);
		    model.addAttribute("seller_id", seller_id);
		return "/seller/questionMng";
	    }
	}

	
	@RequestMapping("/updateReply")
	public String updateReply(Locale locale, Model model, HttpSession session, HttpServletRequest request){
		
		
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
		

		
		// 삭제예정 
		//String seller_num = "TA002";

		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		
	    String seller_num = (String) session.getAttribute("seller_num");
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
	    
		System.out.println("셀러고유번호 확인 : "+seller_num);

		// System.out.println("셀러고유번호 확인 : "+seller_num);

		
		//System.out.println("itemRegister 매핑확인여부");
		
		return "/seller/itemRegister";
	    }
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

			
			String seller_num = (String) session.getAttribute("seller_num");

			itemList.put("seller_num", seller_num);

			sellerService.itemInsert(itemList, files, session);

			return "redirect:/itemMng";
		}
	

                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
        
		
		
		

	
	// 상품관리 전체목록
	@RequestMapping(value = "/itemMng", method = RequestMethod.GET)

	public String itemMng(Model model, HttpSession session) {
	   
		if (session.getAttribute("seller_num") == null) {
			// 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
			return "redirect:/login"; // 로그인 페이지로 이동
		} else {
		String seller_num = (String) session.getAttribute("seller_num");
		
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
	    session.setAttribute("seller_num", seller_num);

	    System.out.println("itemInsertList 매핑확인여부");
	    
	    List<Map<String, Object>> itemList = sellerService.getItemSeller(seller_num);
	    
	    model.addAttribute("itemList", itemList);
	    
	    return "/seller/itemMng";
		}
	}
	
	// 판매중지/판매 변경 버튼 - 상태 조회 후 변경 
	@RequestMapping(value = "/updateStatus", method = RequestMethod.GET)

	public String updateStatus(@RequestParam HashMap<String, String> status, Model model, HttpSession session){
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		String seller_num = (String) session.getAttribute("seller_num");
		session.setAttribute("seller_num", seller_num);
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
		
		status.put("seller_num", seller_num);
		sellerService.updateStatus(status);
		
		return "redirect:/itemMng";
	    }
	}
	
	@RequestMapping(value = "/itemUpdate", method = RequestMethod.GET)

	public String itemUpdate(@RequestParam("item_num") int item_num, Model model,HttpSession session, HttpServletResponse response) {
		if (session.getAttribute("seller_num") == null) {
	        // 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
   
	    System.out.println("itemUpdate 매핑확인여부");
		

		 String seller_num = (String) session.getAttribute("seller_num");
		 String seller_id = sellerService.idCheck(seller_num);
		 model.addAttribute("seller_id", seller_id);
         session.setAttribute("seller_num", seller_num);
		 

		 // item.put("seller_num", seller_num);
		 
		 Map<String, Object> item = sellerService.getItem(item_num);
		
		 model.addAttribute("item_num", item_num);
		 model.addAttribute("item", item);
	    
	    return "/seller/itemUpdate";
	 }
}
	
	
	@RequestMapping(value = "/itemUpdatePro", method = RequestMethod.POST)
	public String itemUpdatePro(@RequestParam HashMap<String, String> itemList,
								@RequestParam("file") List<MultipartFile> files, HttpSession session, HttpServletResponse response) throws Exception {
			
			/* 사진등록 여기부터 서비스 메서드 전까지 들고가면됨! */
			String uploadPath = session.getServletContext().getRealPath("/resources/upload");
			
			for (int i = 0; i < files.size(); i++) {
                MultipartFile file = files.get(i);
                
                // 새파일로 바뀔 경우
                if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
                    String fileName = file.getOriginalFilename(); // 파일 원래 이름
                    String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
                    
                    String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                    String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                    String filePath = uploadPath + "/" + storedFileName;
                    
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
			
			// 사진 변경 안할경우 기존 이미지 가져와서 저장하는 부분 
			String item_mainImg = itemList.get("item_mainImg");
		    itemList.put("item_mainImg", item_mainImg);
            
			String seller_num = (String) session.getAttribute("seller_num");
			session.setAttribute("seller_num", seller_num);
		 	itemList.put("seller_num", seller_num);

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
	public String sellerloginPro(SellerDTO sellerDTO, HttpSession session, Model model) {
	    if (sellerDTO == null || sellerDTO.getSeller_id() == null || sellerDTO.getSeller_pass() == null) {
	        // sellerDTO가 null이거나 id/pw 정보가 누락된 경우, 접근권한이 없다는 메시지를 반환
	        model.addAttribute("error", "접근위반 로그인하고와라");
	        return "redirect:/login";
	    } else {
	        // id와 pw 정보가 모두 제공된 경우, 로그인 절차 수행
	        SellerDTO sellerDTO2 = sellerService.sellerCheck1(sellerDTO);

	        if (sellerDTO2 != null && "Y".equals(sellerDTO2.getSeller_recoYn())) {
	            // 승인된 사용자
	            session.setAttribute("seller_num", sellerDTO2.getSeller_num());
	            return "redirect:/sellerMain";
	        } else if (sellerDTO2 != null && "N".equals(sellerDTO2.getSeller_recoYn())) {
	            // 승인 거절된 사용자
	            model.addAttribute("error", "승인이 거부된 사용자입니다. 관리자에게 문의바랍니다.");
	            return "redirect:/login";
	        } else if (sellerDTO2 != null && sellerDTO2.getSeller_recoYn() == null) {
	            // 승인 대기 중인 사용자
	            model.addAttribute("error", "승인을 기다려주세요.");
	            return "redirect:/login";
	        } else { 
	            // 아이디와 비밀번호 정보가 일치하지 않는 경우
	            model.addAttribute("error", "아이디 또는 비밀번호를 확인해주세요.");
	            return "redirect:/login"; 
	        }
	    }
	}




	
	
	/* 로그아웃 사업자*/
	@RequestMapping(value = "/sellerlogout", method = RequestMethod.GET)
	public String logout(HttpSession session,Model model) {
		if (session.getAttribute("seller_num") == null) {
	        
			// 세션에 로그인 정보가 없는 경우
			model.addAttribute("error", "접근위반 로그인하고와라.");
	        return "redirect:/login"; // 로그인 페이지로 이동
	    } else {
		session.invalidate();
		return "/member/login";
	    }
	}
	
	
	/* sungha 판매자->회원관리....조회..*/
	@RequestMapping(value = "/memberMngPro", method = RequestMethod.GET)
	public String memberMngPro(@RequestParam(name = "startDate", required = false) String startDate,
	                            @RequestParam(name = "endDate", required = false) String endDate,
	                            Locale locale, Model model, HttpSession session, HttpServletResponse response) {
	    System.out.println("memberMngPro sellerController()");
	    String seller_num = (String) session.getAttribute("seller_num");
	    
	    Date start = null;
	    Date end = null;
	    try {
	        if (startDate != null && !startDate.trim().isEmpty()) {
	            start = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
	        }
	        if (endDate != null && !endDate.trim().isEmpty()) {
	            end = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
	        }
	    } catch (ParseException e) {
	        e.printStackTrace();
	        start = null;
	        end = null;
	    }
	    List<Map<String,Object>> MemberMngjoin = sellerService.MemberMngjoin(seller_num, start, end);
	    model.addAttribute("MemberMngjoin", MemberMngjoin);
	    String seller_id = sellerService.idCheck(seller_num);
	    model.addAttribute("seller_id", seller_id);
	    session.setAttribute("seller_num", seller_num);
	    return "/seller/memberMng";
	}


	//혜원 판매자 리뷰관리
	@RequestMapping(value = "/getReview", method = RequestMethod.GET)
	@ResponseBody
	public List<SellerDTO> getReview(@RequestParam("seller_num") String seller_num) {
		List<SellerDTO> buyreview = sellerService.getReview(seller_num);
		return buyreview;
	}
	
	@RequestMapping(value = "/deleteSellerReview", method = RequestMethod.POST)
	public ResponseEntity<String> deleteSellerReview(@RequestParam("review_num") int review_num, @RequestParam("member_num") int member_num) {
	    try {
	        // seller 관련 서비스 변경
	        sellerService.deleteSellerReview(review_num, member_num);
	        return ResponseEntity.status(HttpStatus.OK).body("The review has been successfully deleted.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 업데이트 중 오류가 발생했습니다.");
	    }
	}
	
	


}




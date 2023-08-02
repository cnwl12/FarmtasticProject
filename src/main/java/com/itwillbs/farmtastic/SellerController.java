package com.itwillbs.farmtastic;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.SellerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SellerController {
	
	@Inject
	private SellerService sellerService;
	
	// 로그인 기능이 없어서 일단 판매자 정보 페이지에 접속하면 이 판매자가 뜨게 하드코딩함
	// 로그인해서 세션으로 값 가져오면 삭제할 코드
	String seller_num = "CT0001"; 
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("sellerMain 매핑확인여부");
		
		return "/seller/sellerMain";
	}
	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		
		System.out.println("tables 매핑확인여부");
		
		return "/seller/tables";
	}
	
	// 선진) 판매자 정보 페이지들어가면 디비에 입력된 개인정보 출력됨
	@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
	public String sellerMemb(Locale locale, Model model) {
		System.out.println("SellerController의 sellerMemb 매핑완");
		
		Map<String, Object> sellerInfo = sellerService.getSellerInfo(seller_num);
//		System.out.println("가져온 sellerInfo : " + sellerInfo);
		
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
		
		System.out.println("!@#!@#");
		System.out.println(sellerInfo);
		
		if(sellerInfo != null) {
			System.out.println("null 아님");
			sellerService.updateSeller(sellerInfo);
			return "redirect:/sellerMain";
			
		} else {
			System.out.println("null임");
			return "/seller/mgs";
		}
	}
	
	// 선진) 매출관리 페이지 - 차트 만들곳
	@RequestMapping(value = "/salesMng", method = RequestMethod.GET)
	public String salesMng(Locale locale, Model model) {
		System.out.println("SellerController의 salesMng 매핑완");
		
		List<Map<String,Object>> DailySales = sellerService.getDailySales();
	    
	    System.out.println("제대로 가져왔나요?!!! DailySales : " + DailySales);
	    
	    model.addAttribute("DailySales", DailySales);
		
		return "/seller/salesMng";
	}

	@RequestMapping(value = "/memberMng", method = RequestMethod.GET)
	public String memberMng(Locale locale, Model model) {
		
		System.out.println("memberMng 매핑확인여부");
		
		return "/seller/memberMng";
	}


	@RequestMapping(value = "/itemMng", method = RequestMethod.GET)
	public String itemMng(Locale locale, Model model) {
		
		System.out.println("itemMng 매핑확인여부");
		
		return "/seller/itemMng";
	}

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
	@RequestMapping(value = "/questionMng", method = RequestMethod.GET)
	public String questionMng(Locale locale, Model model) {
		
		System.out.println("questionMng 매핑확인여부");
		
		return "/seller/questionMng";
	
	}
	
	// 상품등록 - 테스트 페이지 
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	public String itemInsert(Model model, HttpSession session) {
		
		// 삭제예정 
		String seller_num = "TA002";
		
		System.out.println("셀러고유번호 확인 : "+seller_num);
		
		System.out.println("itemRegister 매핑확인여부");
		
		return "/seller/itemRegister";
	}
	
	
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
		String seller_num = "TA002";
		
		itemList.put("seller_num", seller_num);
		
		sellerService.itemInsert(itemList, files, session);
	    
	    return "redirect:/itemInsertList";
	}
	
	@RequestMapping(value = "/itemInsertList", method = RequestMethod.GET)
	public String itemInsertList(Locale locale, Model model) {
		
		System.out.println("itemInsertList 매핑확인여부");
		
		 List<Map<String, Object>> itemList = sellerService.getItems();
		 model.addAttribute("itemList", itemList);
	    
	    return "/seller/itemInsertList";
	}
	
	// 판매 품목 수정 - 해쉬맵으로 수정할예정
	@RequestMapping(value = "/itemUpdate", method = RequestMethod.GET)
	public String itemUpdate(@RequestParam("item_num") int item_num, Model model) {
		
		 System.out.println("itemUpdate 매핑확인여부");
		
		 // 삭제예정 
		 String seller_num = "TA002";
		 
		 // item.put("seller_num", seller_num);
		 
		 Map<String, Object> item = sellerService.getItem(item_num);
		
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
            String seller_num = "TA002";
			itemList.put("seller_num", seller_num);
            
			sellerService.itemUpdate(itemList, files, session);
	
			return "redirect:/itemInsertList";
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

	@RequestMapping(value = "/sellerloginPro", method = RequestMethod.GET)
	public String sellerloginPro(HttpServletRequest request, HttpSession session) {
	    System.out.println("SellerController sellerloginPro()");
	    String seller_id = request.getParameter("seller_id");

	    Map<String, Object> sellerDTO = sellerService.sellerCheck(seller_id);

	    if (sellerDTO != null) {
	        session.setAttribute("seller_id", seller_id);
	        return "redirect:/sellerMain";
	    } else {
	    	
	        return "redirect:/login";
	    }
	}
}

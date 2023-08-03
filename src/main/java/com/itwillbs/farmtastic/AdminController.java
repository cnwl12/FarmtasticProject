
package com.itwillbs.farmtastic;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.itwillbs.domain.AdminDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.SellerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
    private SellerService sellerService;
	@Autowired
    private AdminService adminService;
	@Autowired
    private MemberService memberService;
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin(Locale locale, Model model) {
		
		System.out.println("adminLogin 매핑확인여부");
		
		return "/admin/adminLogin";
	}
	
	 @RequestMapping(value = "/Login", method = RequestMethod.POST)
	    public String login(String admin_id, String admin_pass, HttpSession session, RedirectAttributes rttr) {
	        try {
	            AdminDTO adminInfo = adminService.adminCheck(admin_id);
	            if (adminInfo != null && adminInfo.getAdmin_pass().equals(admin_pass)) {
	            	System.out.println("로그인성공!: "+admin_id);
	                session.setAttribute("admin", adminInfo);
	                return "redirect:/adminMain";
	            } else {
	                rttr.addFlashAttribute("msg", "로그인 실패");
	                System.out.println("로그인실패");
	                return "redirect:/adminLogin";
	            }
	        } catch (Exception e) {
	        	System.out.println("로그인오류");
	            rttr.addFlashAttribute("msg", "로그인 과정에서 오류가 발생하였습니다: " + e.getMessage());
	            return "redirect:/adminLogin";
	        }
	    }

	/*map쓸때 구문
	 * @RequestMapping(value = "/Login", method = RequestMethod.POST) public String
	 * adminLogin(String admin_id, Model model, RedirectAttributes rttr) { try {
	 * Map<String, Object> admin = adminService.adminCheck(admin_id); if (admin !=
	 * null) { model.addAttribute("admin", admin); return "redirect:/adminMain"; }
	 * else { rttr.addFlashAttribute("msg", "로그인에 실패하였습니다."); return
	 * "redirect:/adminLogin"; } } catch (Exception e) { e.printStackTrace();
	 * rttr.addFlashAttribute("msg", "로그인 중 오류가 발생했습니다."); return
	 * "redirect:/adminLogin"; } }
	 */
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
	 public String logout(HttpServletRequest request) {
	     HttpSession session = request.getSession();
	     if (session != null) {
	         session.invalidate();
	     }
	     // 로그아웃 후, 리디렉션할 페이지를 반환합니다.
	     return "redirect:/adminLogin";
	 } 
	 
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		 List<Map<String, Object>> resultList = sellerService.getSeller();
		 model.addAttribute("sellers", resultList);
		System.out.println("adminMain 매핑확인여부");
		
		return "/admin/adminMain";
	}
	@RequestMapping(value = "/notetest", method = RequestMethod.GET)
	public String notetest(Locale locale, Model model) {
		
		System.out.println("notetest 매핑확인여부");
		
		return "/admin/customerMenu/notetest";
	}
	@RequestMapping(value = "/writetest", method = RequestMethod.GET)
	public String writetest(Locale locale, Model model) {
		
		System.out.println("writetest 매핑확인여부");
		
		return "/admin/customerMenu/writetest";
	}
	@RequestMapping(value = "/contenttest", method = RequestMethod.GET)
	public String contenttest(@RequestParam("admin_cs_num") String admin_cs_num, Locale locale, Model model) {
	    Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
	    model.addAttribute("content", resultMap);
	    model.addAttribute("admin_cs_num", admin_cs_num);
	    System.out.println("controller" + resultMap);
	    System.out.println("contenttest 매핑확인여부");
	    
	    return "/admin/customerMenu/contenttest";
	}
	@RequestMapping(value = "/contentUpdate", method = RequestMethod.GET)
	public String contentUpdate(@RequestParam("admin_cs_num") String admin_cs_num, Locale locale, Model model) {
	    System.out.println("contentUpdate 매핑확인여부");
	    Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
	    model.addAttribute("content", resultMap);
	    model.addAttribute("admin_cs_num", admin_cs_num);
	    System.out.println("controller" + resultMap);
	    return "/admin/customerMenu/contentUpdate";
	}
	
//	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
//	public String updatePro(@RequestParam HashMap<String, String> noticeList,
//	                              @RequestParam("file") List<MultipartFile> files,
//	                             HttpSession session)throws Exception {
//		
//		// 첨부파일 올라갈 물리적 경로 
//		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
//		
////		System.out.println(uploadPath);
//		
//		for (int i = 0; i < files.size(); i++) {
//            MultipartFile file = files.get(i);
//            if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
//                String fileName = file.getOriginalFilename(); // 파일 원래 이름
//                String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
//
//                String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장
//
//                String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지
//
//                String filePath = uploadPath + "/" + storedFileName;
//                
//                System.out.println("filePath : " + filePath);
//                
//                // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
//                String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;
//
//
//                // 임시경로에서 filePath로 파일이동 
//                File dest = new File(filePath);
//                file.transferTo(dest);
//                
//                // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
//                // 사진 정보의 경로를 저장
//                noticeList.put("admin_cs_file", saveFileName);
//
//                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
//        	}
//        }
		
		
		adminService.insertNotice(noticeList,files, session);
	    return "redirect:/cnotice";
	}
//	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
//	public String updatePro(@RequestParam HashMap<String, String> noticeList,
//	                              @RequestParam("file") List<MultipartFile> files,
//	                             HttpSession session)throws Exception {
//		
//		// 첨부파일 올라갈 물리적 경로 
//		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
//		
////		System.out.println(uploadPath);
//		
//		for (int i = 0; i < files.size(); i++) {
//            MultipartFile file = files.get(i);
//            if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
//                String fileName = file.getOriginalFilename(); // 파일 원래 이름
//                String fileExtension = FilenameUtils.getExtension(fileName); // 확장자
//
//                String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장
//
//                String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지
//
//                String filePath = uploadPath + "/" + storedFileName;
//                
//                System.out.println("filePath : " + filePath);
//                
//                // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
//                String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;
//
//
//                // 임시경로에서 filePath로 파일이동 
//                File dest = new File(filePath);
//                file.transferTo(dest);
//                
//                // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
//                // 사진 정보의 경로를 저장
//                noticeList.put("admin_cs_file", saveFileName);
//
//                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
//        	}
//        }
//		
//		
//		adminService.insertNotice(noticeList,files, session);
//	    return "redirect:/cnotice";
//	}

	@RequestMapping(value = "/customerAdmin", method = RequestMethod.GET)
	public String customerAdmin(Locale locale, Model model) {
		
		System.out.println("customerAdmin 매핑확인여부");
		 List<Map<String, Object>> resultList = memberService.getMembers();
		 model.addAttribute("members", resultList);
		return "/admin/customerMenu/customerAdmin";
	}
	
	@PostMapping("/changeMemberStatus")
	public String changeMemberStatus(@RequestParam(value = "result", required = false) List<String> memberNums, RedirectAttributes redirectAttributes) {
	if (memberNums == null || memberNums.isEmpty()) {
	redirectAttributes.addFlashAttribute("message", "체크된 회원이 없습니다.");
	} else {
	System.out.println("/changeMemberStatus 매핑확인여부");
	memberService.changeMemberStatus(memberNums);
	redirectAttributes.addFlashAttribute("message", "선택된 회원의 상태가 변경되었습니다.");
	}
	return "redirect:/customerAdmin";
	}
	
	@RequestMapping(value = "/customerLev", method = RequestMethod.GET)
	public String customerLev(Locale locale, Model model) {
		
		System.out.println("customerLev 매핑확인여부");
		
		return "/admin/customerMenu/customerLev";
	}
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		
		System.out.println("report 매핑확인여부");
		
		return "/admin/customerMenu/report";
	}
	@RequestMapping(value = "/cupon", method = RequestMethod.GET)
	public String cupon(Locale locale, Model model) {
		
		System.out.println("cupon 매핑확인여부");
		
		return "/admin/customerMenu/cupon";
	}
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String point(Locale locale, Model model) {
		
		System.out.println("point 매핑확인여부");
		
		return "/admin/customerMenu/point";
	}
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Locale locale, Model model) {
		
		System.out.println("event 매핑확인여부");
		
		return "/admin/customerMenu/event";
	}
	@RequestMapping(value = "/snotice", method = RequestMethod.GET)
	public String snotice(Locale locale, Model model) {
		
		System.out.println("snotice 매핑확인여부");
		
		return "/admin/sellerMenu/snotice";
	}
	
	//가맹점관리
	@RequestMapping(value = "/sellerAdmin", method = RequestMethod.GET)
	public String sellerAdmin(Locale locale, Model model) {
			
		System.out.println("sellerAdmin 매핑확인여부");
		 List<Map<String, Object>> resultList = sellerService.getSeller();
		 model.addAttribute("sellers", resultList);
		return "/admin/sellerMenu/sellerAdmin";
	}
	
	
	@PostMapping("/changeSellerStatus")
	public String changeSellerStatus(@RequestParam(value = "result", required = false) List<String> sellerNum, @RequestParam("actionType") String actionType, RedirectAttributes redirectAttributes) {
	    if (sellerNum == null || sellerNum.isEmpty()) {
	        redirectAttributes.addFlashAttribute("message", "체크된 가맹점이 없습니다.");
	    } else {
	        if (actionType.equals("approve")) {
	            sellerService.approveSellerStatus(sellerNum);
	        } else if (actionType.equals("reject")) {
	            sellerService.rejectSellerStatus(sellerNum);
	        }
	        redirectAttributes.addFlashAttribute("message", "선택된 가맹점의 상태가 변경되었습니다.");
	    }
	    return "redirect:/sellerAdmin";
	}
	
	@RequestMapping(value = "/settlement", method = RequestMethod.GET)
	public String settlement(Locale locale, Model model) {
		
		System.out.println("settlement 매핑확인여부");
	
   	 // 날짜 정보 추가
//   	    Calendar now = Calendar.getInstance();
//   	    String currentMonth = now.get(Calendar.YEAR) + "-" + String.format("%02d", now.get(Calendar.MONTH) + 1);
//   	    now.add(Calendar.MONTH, -1);
//   	    String prevMonth = now.get(Calendar.YEAR) + "-" + String.format("%02d", now.get(Calendar.MONTH) + 1);
//   	    now.add(Calendar.MONTH, 2);
//   	    String nextMonth = now.get(Calendar.YEAR) + "-" + String.format("%02d", now.get(Calendar.MONTH) + 1);

   	    List<Map<String, Object>> resultList = sellerService.getSales();
   	    model.addAttribute("sales", resultList);

   	    // 모델에 날짜 정보 추가
//   	    model.addAttribute("currentMonth", currentMonth);
//   	    model.addAttribute("prevMonth", prevMonth);
//   	    model.addAttribute("nextMonth", nextMonth);

   	    return "/admin/sellerMenu/settlement";
	}

	
	
	
	@RequestMapping(value = "/settle_day", method = RequestMethod.GET)
	public String settle_day(@RequestParam("seller_num") String sellerNum, @RequestParam("order_month") String orderMonth, Locale locale, Model model) {

	    System.out.println("settle_day 매핑확인여부");

	    // sellerService에서 daySales 메서드를 호출할 때, sellerNum과 orderMonth를 인자로 전달합니다.
	    List<Map<String, Object>> resultList = sellerService.daySales(sellerNum, orderMonth);

	    // resultList를 모델에 추가
	    model.addAttribute("sales", resultList);
	    model.addAttribute("seller_num", sellerNum);
	    model.addAttribute("orderMonth", orderMonth);
	    System.out.println("controller" + resultList);

	    // 뷰 이름 반환
	    return "/admin/sellerMenu/settle_day";
	}
	
	
	@RequestMapping(value = "/settle_year", method = RequestMethod.GET)
	public String settle_year(@RequestParam("seller_num") String sellerNum,Locale locale, Model model) {

	    System.out.println("settle_year 매핑확인여부");
	    List<Map<String, Object>> resultList = sellerService.yearSales(sellerNum);
		 model.addAttribute("sales", resultList);
		 model.addAttribute("seller_num", sellerNum);
		 System.out.println(resultList+sellerNum);
	    return "/admin/sellerMenu/settle_year";
	}
	
	
	
	
	//admin에 매출관리 목록 불러오기위한 구문
	
	// "/sales" 매핑값을 여러번 사용 할 수 없기때문에 한 곳에 몰아서 넣음
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public String sales(Locale locale, Model model) {
		
		System.out.println("sales 매핑확인여부");
		
		 List<Map<String, Object>> resultList = sellerService.getSellers();
		 model.addAttribute("sellers", resultList);
		
		return "/admin/sellerMenu/sales";
	}

	
	@PostMapping("/updateSettlementYn")
	public String batchSettlement(@RequestParam String sellerNum, @RequestParam String orderMonth, RedirectAttributes redirectAttributes) {
		System.out.println("컨트롤러 오나요");
	  sellerService.updateSettlementYn(sellerNum, orderMonth);
	  System.out.println("sellerNum: " + sellerNum);
	  System.out.println("orderMonth: " + orderMonth);
	  String message = "정산 업데이트가 완료되었습니다.";
	  redirectAttributes.addFlashAttribute("message", message);
	  return "redirect:/settlement";
	}
	
	@RequestMapping(value = "/cnotice", method = RequestMethod.GET)
	public String cnotice(Locale locale, Model model) {
		System.out.println("cnotice 매핑확인여부");
		 List<Map<String, Object>> resultList = adminService.getCnotice();
		 model.addAttribute("notice", resultList);
		 System.out.println(resultList);
		return "/admin/customerMenu/cnotice";
	}
//	공지사항글쓰기
	@RequestMapping(value = "/writePro", method = RequestMethod.POST)
	public String insertNoticeList(@RequestParam HashMap<String, String> noticeList,
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
                noticeList.put("admin_cs_file", saveFileName);

                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
        	}
        }
		
		
		adminService.insertNotice(noticeList,files, session);
	    return "redirect:/cnotice";
	}
	
	/*
	
	@PostMapping("/writePro")
	 public String writePro(@RequestParam("writer") String writer, @RequestParam("title") String title, @RequestParam("content") String content) {
		System.out.println("컨트롤러 writePro()");
	    adminService.insertBoard(writer, title, content);
	    return "redirect:/cnotice";
	 }
	 */
	/*
	@RequestMapping(value="/summerimages", method=RequestMethod.POST)
	public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws IOException {
		String path = request.getRealPath("/summerimages");
		Random random = new Random();
	
		long currentTime = System.currentTimeMillis();
		int	randomValue = random.nextInt(100);
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_a_"+img.getOriginalFilename();
		
		File file = new File(path , fileName);
		img.transferTo(file);
		return ResponseEntity.ok().body("/resources/summerimages/"+fileName);

	}
	*/
	
	
//	//썸머노트 이미지처리 ajax
//		@PostMapping("/summerimages")
//		//썸머노트 이미지 처리
//		public String insertFormData2(
//				@RequestParam(value="file", required=false) MultipartFile file,HttpSession session
//				) {
//			//Gson gson = new Gson();
//			Map<String, String> map = new HashMap<String, String>();
//			// 2) 웹 접근 경로(webPath) , 서버 저장 경로 (serverPath)
//			String WebPath = "/resources/summernoteImages/"; //DB에 저장되는 경로
//			String serverPath = session.getServletContext().getRealPath(WebPath);
//			String originalFileName=file.getOriginalFilename();
//			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//			File targetFile = new File(serverPath + savedFileName);	
//			try {
//				InputStream fileStream = file.getInputStream();
//				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//				// contextroot + resources + 저장할 내부 폴더명
//				map.put("url", WebPath+savedFileName);
//				map.put("responseCode", "success");
//			} catch (IOException e) {
//				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//				map.put("responseCode", "error");
//				e.printStackTrace();
//			}
//			return gson.toJson(map);
//		}
//	
//	







}


package com.itwillbs.farmtastic;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	                session.setAttribute("admin_id", admin_id);    // 세션에 admin_id 추가
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
	    public String home(Locale locale, Model model, HttpSession session) throws IOException {
	        System.out.println("adminMain 매핑확인여부");
	        
	        if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            
	            List<Map<String, Object>> resultList = sellerService.getSeller();
	            model.addAttribute("sellers", resultList);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/adminMain";
	        }
	}
	@RequestMapping(value = "/adminProfile", method = RequestMethod.GET)
		public String adminProfile(Locale locale, Model model,HttpSession session) {
			
			System.out.println("adminProfile 매핑확인여부");
			 if (session.getAttribute("admin_id") == null) {
		            // 세션에 로그인 정보가 없는 경우
		            model.addAttribute("error", "로그인후 이용해주세요");
		            return "redirect:/adminLogin"; // 로그인 페이지로 이동
		        } else {
		            // 로그인한 경우
		            String admin_id = (String) session.getAttribute("admin_id");
		            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
		            model.addAttribute("admin", adminInfo);
		            model.addAttribute("admin_id", admin_id);
		            return "/admin/adminProfile";
		        }
			
	}   
	@RequestMapping(value = "/notetest", method = RequestMethod.GET)
	public String notetest(Locale locale, Model model,HttpSession session) {
		
		System.out.println("notetest 매핑확인여부");
		
		return "/admin/customerMenu/notetest";
	}
	@RequestMapping(value = "/writeCnote", method = RequestMethod.GET)
	public String writeCnote(Locale locale, Model model,HttpSession session) {
		
		System.out.println("writeCnote 매핑확인여부");
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/writeCnote";
	        }
		
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(@RequestParam("admin_cs_num") int admin_cs_num, Locale locale, Model model,HttpSession session) {
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
	    	    model.addAttribute("content", resultMap);
	    	    model.addAttribute("admin_cs_num", admin_cs_num);
	    	    String adminId = resultMap.get("admin_id").toString();
	    	    model.addAttribute("admin_id", resultMap.get("admin_id").toString());
	    	    System.out.println("content 매핑확인여부");
	    	    
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/content";
	        }
		
		
	    
	}
//	글 수정화면
	@RequestMapping(value = "/contentUpdate", method = RequestMethod.GET)
	public String contentUpdate(@RequestParam("admin_cs_num") int admin_cs_num, Locale locale, Model model,HttpSession session) {
	    System.out.println("contentUpdate 매핑확인여부");
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            Map<String, Object> resultMap = adminService.getNotice(admin_cs_num);
    	    model.addAttribute("content", resultMap);
    	    model.addAttribute("admin_cs_num", admin_cs_num);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/customerMenu/contentUpdate";
        }
	   
	}
// 글 수정 기능	
	@PostMapping("/contUpdate")
	    public String updateContent(HttpServletRequest request) {
	        int admin_cs_num = Integer.parseInt(request.getParameter("admin_cs_num"));
	        String admin_csnotice_sub = request.getParameter("admin_csnotice_sub");
	        String admin_cs_view = request.getParameter("admin_cs_view");

	        adminService.updateContent(admin_cs_num, admin_csnotice_sub, admin_cs_view);

	        return "redirect:/content?admin_cs_num=" + admin_cs_num;
	
	}
	@RequestMapping(value = "/deleteContent", method = RequestMethod.GET)
	public String deleteContent(@RequestParam("admin_cs_num") int admin_cs_num, HttpSession session) {
	    AdminDTO currentAdmin = (AdminDTO) session.getAttribute("admin"); // 현재 로그인한 사용자 정보
	    String currentUserId = currentAdmin.getAdmin_id(); // 현재 로그인한 사용자 ID

	    Map<String, Object> notice = adminService.getNotice(admin_cs_num); // 게시글 정보
	    String writerId = (String) notice.get("admin_id");  // 게시글 작성자

	    if (writerId == null || !writerId.equals(currentUserId)) { // 작성자와 로그인한 사용자가 일치하지 않으면 삭제 불가능
	        return "redirect:/cnotice";
	    }

	    adminService.deleteContent(admin_cs_num);
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
	public String customerAdmin(Locale locale, Model model,HttpSession session) {
		
		System.out.println("customerAdmin 매핑확인여부");
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            List<Map<String, Object>> resultList = memberService.getMembers();
	   		 	model.addAttribute("members", resultList);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/customerAdmin";
	        }
	}
//	회원관리 상세정보 팝업
	
	
	  @RequestMapping(value = "/memberDetail", method = RequestMethod.GET)
	    public String memberDetail(@RequestParam("member_num") int member_num, Locale locale, Model model,HttpSession session) {
	        System.out.println("memberDetail 매핑 확인 여부");
	        if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            List<Map<String, Object>> result = memberService.getMembers();
	            Map<String, Object> resultList = memberService.getMemberDetails(member_num);
		        model.addAttribute("memberDetail", resultList);
	   		 	model.addAttribute("members", result);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/memberDetail";
	        }
	        
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

	//가맹점관리
	@RequestMapping(value = "/sellerAdmin", method = RequestMethod.GET)
	public String sellerAdmin(Locale locale, Model model,HttpSession session) {
			
		System.out.println("sellerAdmin 매핑확인여부");
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            List<Map<String, Object>> resultList = sellerService.getSeller();
	   		 	model.addAttribute("sellers", resultList);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/sellerMenu/sellerAdmin";
	        }
		
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
	public String settlement(Locale locale, Model model,HttpSession session) {
		
		System.out.println("settlement 매핑확인여부");
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            List<Map<String, Object>> resultList = sellerService.getSales();
	       	    model.addAttribute("sales", resultList);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/sellerMenu/settlement";
	        }
	}

	
	
	
	@RequestMapping(value = "/settle_day", method = RequestMethod.GET)
	public String settle_day(@RequestParam("seller_num") String sellerNum, @RequestParam("order_month") String orderMonth, Locale locale, Model model,HttpSession session) {

	    System.out.println("settle_day 매핑확인여부");
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            // sellerService에서 daySales 메서드를 호출할 때, sellerNum과 orderMonth를 인자로 전달합니다.
    	    List<Map<String, Object>> resultList = sellerService.daySales(sellerNum, orderMonth);
    	    // resultList를 모델에 추가
    	    model.addAttribute("sales", resultList);
    	    model.addAttribute("seller_num", sellerNum);
    	    model.addAttribute("orderMonth", orderMonth);
    	    System.out.println("controller" + resultList);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            // 뷰 이름 반환
    	    return "/admin/sellerMenu/settle_day";
        }

	}
	
	
	@RequestMapping(value = "/settle_year", method = RequestMethod.GET)
	public String settle_year(@RequestParam("seller_num") String sellerNum,Locale locale, Model model,HttpSession session) {
	    System.out.println("settle_year 매핑확인여부");
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            List<Map<String, Object>> resultList = sellerService.yearSales(sellerNum);
   		 	model.addAttribute("sales", resultList);
   		 	model.addAttribute("seller_num", sellerNum);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/sellerMenu/settle_year";
        }
	  
	}
	
	//admin에 매출관리 목록 불러오기위한 구문
	
	// "/sales" 매핑값을 여러번 사용 할 수 없기때문에 한 곳에 몰아서 넣음
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public String sales(@RequestParam(value = "monthly", required = false) String monthly, Locale locale, Model model,HttpSession session) {
	    System.out.println("sales 매핑확인여부");
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            
            if (monthly == null || monthly.isEmpty()) {
    	        LocalDate currentDate = LocalDate.now();
    	        monthly = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
    	    }
            List<Map<String, Object>> resultList = sellerService.getSellers(monthly);
    	    model.addAttribute("sellers", resultList);
    	    model.addAttribute("monthly", monthly);

    	    LocalDate currentDate = LocalDate.now();
    	    String currentMonth = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
    	    model.addAttribute("currentMonth", currentMonth);
            
    	    return "/admin/sellerMenu/sales";
        }
	}
	@RequestMapping(value = "/sales_ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> salesAjax(@RequestParam(value = "monthly", required = true) String monthly) {
	    System.out.println("sales_ajax 매핑 확인");

	    if (monthly == null || monthly.isEmpty()) {
	        LocalDate currentDate = LocalDate.now();
	        monthly = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
	    }

	    System.out.println("Monthly: " + monthly); // 로깅 추가

	    List<Map<String, Object>> result = sellerService.getSellers(monthly);
	    System.out.println("Result: " + result); // 로깅 추가

	    return result;
	}
	@RequestMapping(value = "/detailSales", method = RequestMethod.GET)
	public String detaillSales(@RequestParam("seller_num")String seller_num,@RequestParam("pay_day") String pay_day,Locale locale, Model model,HttpSession session) {
	    System.out.println("detailSales 매핑확인여부");
	    
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            List<Map<String,Object>> DailySalesList = sellerService.dailySales(seller_num);
    	    model.addAttribute("seller_num", seller_num);
    	    model.addAttribute("pay_day", pay_day);
    	    model.addAttribute("DailySalesList", DailySalesList);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/sellerMenu/detailSales";
        }
	}
	@RequestMapping(value = "/totalSales", method = RequestMethod.GET)
	public String totalSales(Locale locale, Model model,HttpSession session) {
	    System.out.println("totalSales 매핑확인여부");
	    
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            List<Map<String, Object>> resultList = sellerService.totalSales();
    	    model.addAttribute("sellers", resultList);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/sellerMenu/totalSales";
        }
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
	public String cnotice(Locale locale, Model model,HttpSession session) {
		System.out.println("cnotice 매핑확인여부");
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            List<Map<String, Object>> resultList = adminService.getCnotice();
	   		 	model.addAttribute("notice", resultList);
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/cnotice";
	        }
		
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
	
	// 제철팜 관리자 화면
	@RequestMapping(value = "/blogMng", method = RequestMethod.GET)
	public String blogMng(Locale locale, Model model, HttpSession session) {
		
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	        	System.out.println("AdminController의 blogMng 매핑완");
	        	
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            
	            model.addAttribute("admin_id", admin_id);
	            model.addAttribute("admin", adminInfo);
	            // 제철팜 글목록 가져오기
	            List<Map<String, Object>> blogList = adminService.getBlogMng();
	   		 	model.addAttribute("blogList", blogList);
	           
	            return "/admin/customerMenu/blogMng";
	        }
		
	}	
	
	// 제철팜 글쓰기 화면
	@RequestMapping(value = "/blogWrite", method = RequestMethod.GET)
	public String blogWrite(Locale locale, Model model, HttpSession session) {
		
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	        	System.out.println("AdminController의 blogWrite 매핑완");
	        	
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            
	            model.addAttribute("admin_id", admin_id);
	            model.addAttribute("admin", adminInfo);
	            return "/admin/customerMenu/blogWrite";
	        }
		
	}
	
	// 글쓰기 등록 버튼을 누르면
	@RequestMapping(value = "/blogWritePro", method = RequestMethod.POST)
	public String blogWritePro(@RequestParam HashMap<String, String> blognoticeList,
							   @RequestParam("blogFile") List<MultipartFile> blogFiles, HttpSession session) throws Exception {
		
		System.out.println("AdminController의 blogWritePro 매핑완");
		
		// 첨부파일 올라갈 물리적 경로 
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		
//		System.out.println(uploadPath);
		
		for (int i = 0; i <blogFiles.size(); i++) {
            MultipartFile blogFile = blogFiles.get(i);
            if (!blogFile.isEmpty() && blogFile.getSize() > 0) { // 파일이 전송되었는지 확인
                String blogFileName = blogFile.getOriginalFilename(); // 파일 원래 이름
                String fileExtension = FilenameUtils.getExtension(blogFileName); // 확장자

                String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                String filePath = uploadPath + "/" + storedFileName;
                
                System.out.println("filePath : " + filePath);
                
                // 서버랑 이름 맞춰줘야함 (현재 공동 서버에 업로드 중임)
                String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;


                // 임시경로에서 filePath로 파일이동 
                File dest = new File(filePath);
                blogFile.transferTo(dest);
                
                // 사진경로 url~ string 타입 >> 이걸 db에 저장하는것임! 
                // 사진 정보의 경로를 저장
                blognoticeList.put("admin_blog_file", saveFileName);

                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
        	}
        }
		
		adminService.insertBlog(blognoticeList, blogFiles, session);
	    return "redirect:/blogMng";
	}
	
	// 제철팜 글내용 화면
	@RequestMapping(value = "/blogContent", method = RequestMethod.GET)
	public String blogContent(@RequestParam("admin_blog_num") int admin_blog_num, Locale locale, Model model, HttpSession session) {
		
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	        	System.out.println("AdminController의 blogContent 매핑완");
	        	
	            // 로그인한 경우
	            String admin_id = (String) session.getAttribute("admin_id");
	            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
	            
	            Map<String, Object> bContent = adminService.getblogContent(admin_blog_num);
	    	    model.addAttribute("bContent", bContent);
	    	    model.addAttribute("admin_blog_num", admin_blog_num);
	    	    
	    	    String adminId = bContent.get("admin_id").toString();
	    	    model.addAttribute("admin_id", bContent.get("admin_id").toString());
	    	    
	    	    model.addAttribute("admin_id", admin_id);
	            model.addAttribute("admin", adminInfo);
	            
	            return "/admin/customerMenu/blogContent";
	        }
		
	}
	
	//	제철팜 글수정 화면
	@RequestMapping(value = "/blogUpdate", method = RequestMethod.GET)
	public String blogUpdate(@RequestParam("admin_blog_num") int admin_blog_num, Locale locale, Model model, HttpSession session) {

	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
        	System.out.println("AdminController의 blogUpdate 매핑완");
    		
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            
            Map<String, Object> bContent = adminService.getblogContent(admin_blog_num);
    	    model.addAttribute("bContent", bContent);
    	    model.addAttribute("admin_blog_num", admin_blog_num);
    	    
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/customerMenu/blogUpdate";
        }
	}
	
	// 수정 버튼을 누르면
	@PostMapping("/blogUpdatePro")
    public String blogUpdatePro(HttpServletRequest request) {
		
		System.out.println("AdminController의 blogUpdatePro 매핑완");
		
        int admin_blog_num = Integer.parseInt(request.getParameter("admin_blog_num"));
        String admin_blog_mainTitle = request.getParameter("admin_blog_mainTitle");
        String admin_blog_subTitle = request.getParameter("admin_blog_subTitle");
        String admin_blog_content = request.getParameter("admin_blog_content");

        adminService.blogUpdatePro(admin_blog_num, admin_blog_mainTitle, admin_blog_subTitle, admin_blog_content);

        return "redirect:/blogContent?admin_blog_num=" + admin_blog_num;
	
	}
	
	// 제철팜 글 삭제
	@RequestMapping(value = "/blogDelete", method = RequestMethod.GET)
	public String blogDelete(@RequestParam("admin_blog_num") int admin_blog_num, HttpSession session) {
		
		System.out.println("AdminController의 blogDelete 매핑완");
		
	    AdminDTO currentAdmin = (AdminDTO) session.getAttribute("admin");
	    String currentUserId = currentAdmin.getAdmin_id();

	    Map<String, Object> bnotice = adminService.getblogContent(admin_blog_num); 
	    String writerId = (String) bnotice.get("admin_id"); 

	    if (writerId == null || !writerId.equals(currentUserId)) { 
	        return "redirect:/blogMng";
	    }

	    adminService.blogDelete(admin_blog_num);
	    return "redirect:/blogMng";
	}
		
		
}

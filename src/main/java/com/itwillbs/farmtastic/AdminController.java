
package com.itwillbs.farmtastic;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.tree.AbstractLayoutCache;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
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
		return "/admin/adminLogin";
	}
	
	 @RequestMapping(value = "/Login", method = RequestMethod.POST)
	    public String login(String admin_id, String admin_pass, HttpSession session, RedirectAttributes rttr) {
	        try {
	            AdminDTO adminInfo = adminService.adminCheck(admin_id);
	            if (adminInfo != null && adminInfo.getAdmin_pass().equals(admin_pass)) {
	                session.setAttribute("admin", adminInfo);
	                session.setAttribute("admin_id", admin_id);    // 세션에 admin_id 추가
	                return "redirect:/adminMain";
	            } else {
	                rttr.addFlashAttribute("msg", "로그인 실패");
	                return "redirect:/adminLogin";
	            }
	        } catch (Exception e) {
	            rttr.addFlashAttribute("msg", "로그인 과정에서 오류가 발생하였습니다: " + e.getMessage());
	            return "redirect:/adminLogin";
	        }
	    }


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
	    public String home(@RequestParam(value = "monthly", required = false) String monthly,Locale locale, Model model, HttpSession session) throws IOException {
	        
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
	            List<Map<String, Object>> resultList = sellerService.getSeller();
	            List<Map<String, Object>> result = sellerService.getSellers(monthly);
	            List<Map<String, Object>> sellerSalesList = sellerService.totalSales();
	            
	            Map<String, Object> sales = result.isEmpty() ? new HashMap<>() : result.get(0);
	            Map<String, Object> totalSales = sellerSalesList.isEmpty() ? new HashMap<>() : sellerSalesList.get(0);
	            List<Map<String, Object>> pieData = sellerService.pieChart();
	            
	            JSONArray json = new JSONArray();
	            for(Map<String, Object> doughnut : pieData) {
	            	json.put(doughnut);
	            }
	            List<Map<String, Object>> chartData = sellerService.selectSalesData();
	            
	            JSONArray jsonArray = new JSONArray();
	            for(Map<String, Object> data : chartData) {
	            	jsonArray.put(data);
	            }
	            
	            model.addAttribute("data", chartData);
	            model.addAttribute("data_json", jsonArray);
	            model.addAttribute("doughnut", pieData);
	            model.addAttribute("jsonData", json);
	            
	            model.addAttribute("totalSales", totalSales);
	            
	            model.addAttribute("sales", sales);

	            model.addAttribute("sellers", resultList);
	            model.addAttribute("monthly", monthly);
	    	    LocalDate currentDate = LocalDate.now();
	    	    String currentMonth = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
	    	    model.addAttribute("currentMonth", currentMonth);
	            
	            
	            return "/admin/adminMain";
	        }
	}
	@RequestMapping(value = "/adminProfile", method = RequestMethod.GET)
		public String adminProfile(Locale locale, Model model,HttpSession session) {
			
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
	@RequestMapping(value = "/writeCnote", method = RequestMethod.GET)
	public String writeCnote(Locale locale, Model model,HttpSession session) {
		
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
	
	@PostMapping("/updateAdmin")
	public String updateAdmin(@RequestParam String pass, @RequestParam String newpass, @RequestParam String admin_nickname,
	                          @RequestParam String admin_birth, HttpSession session, RedirectAttributes redirectAttributes) {
	    String admin_id = (String) session.getAttribute("admin_id");
	    AdminDTO adminInfo = adminService.adminCheck(admin_id);

	    if (adminInfo != null) {
	        // 현재 비밀번호를 입력하지 않은 경우
	        if (pass == null || pass.isEmpty()) {
	            redirectAttributes.addFlashAttribute("message", "empty_password");
	            redirectAttributes.addFlashAttribute("updateMessage", "현재 비밀번호를 입력해주세요.");
	        } 
	        // 현재 비밀번호가 일치하지 않을 경우
	        else if (!adminInfo.getAdmin_pass().equals(pass)) {
	            redirectAttributes.addFlashAttribute("message", "incorrect_password");
	        } 
	        // 현재 비밀번호가 일치할 경우
	        else {
	            // 비밀번호가 빈 문자열인 경우, 닉네임과 생일만 변경
	            if (newpass == null || newpass.isEmpty()) {
	                adminService.updateNicknameAndBirth(admin_id, admin_nickname, admin_birth);
	            } 
	            // 비밀번호가 있을 경우, 비밀번호, 닉네임, 생일 변경
	            else {
	                adminService.updateAdmin(admin_id, newpass, admin_nickname, admin_birth);
	            }
	            redirectAttributes.addFlashAttribute("message", "success");
	            redirectAttributes.addFlashAttribute("updateMessage", "수정이 완료되었습니다.");
	        }
	    }
	    
	    return "redirect:/adminProfile"; // 관리자 페이지로 이동
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
	    	    
	            model.addAttribute("admin", adminInfo);
	            model.addAttribute("admin_id", admin_id);
	            return "/admin/customerMenu/content";
	        }
		
		
	    
	}
//	글 수정화면
	@RequestMapping(value = "/contentUpdate", method = RequestMethod.GET)
	public String contentUpdate(@RequestParam("admin_cs_num") int admin_cs_num, Locale locale, Model model,HttpSession session) {
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


	@RequestMapping(value = "/customerAdmin", method = RequestMethod.GET)
	public String customerAdmin(Locale locale, Model model,HttpSession session) {
		
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
	memberService.changeMemberStatus(memberNums);
	redirectAttributes.addFlashAttribute("message", "선택된 회원의 상태가 변경되었습니다.");
	}
	return "redirect:/customerAdmin";
	}

	//가맹점관리
	@RequestMapping(value = "/sellerAdmin", method = RequestMethod.GET)
	public String sellerAdmin(Locale locale, Model model,HttpSession session) {
			
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
	
	@RequestMapping(value = "/sellerDetail", method = RequestMethod.GET)
    public String sellerDetail(@RequestParam("seller_num") String seller_num, Locale locale, Model model,HttpSession session) {
        if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            List<Map<String, Object>> result = sellerService.getSeller();
            Map<String, Object> resultList = sellerService.getSellerDetails(seller_num);
	        model.addAttribute("sellerDetail", resultList);
   		 	model.addAttribute("seller", result);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/sellerMenu/sellerDetail";
        }
        
    }
	
	@RequestMapping(value = "/updateSellerInfo", method = RequestMethod.POST)
    public ResponseEntity<String> updateSellerInfo(
            @RequestParam("seller_num") String seller_num,
            @RequestParam("seller_storeName") String seller_storeName,
            @RequestParam("seller_name") String seller_name,
            @RequestParam("seller_licenseNum") String seller_licenseNum,
            @RequestParam("seller_file") MultipartFile file,
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
	            String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;

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
	            sellerService.updateSellerInfo(seller_num, seller_storeName, seller_name, seller_licenseNum, saveFileName);
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                    .body("지원하지 않는 이미지 형식입니다.");
	        }
	    } else {
	        // 이미지 업데이트를 진행하지 않음 (기존 이미지 사용)
	        sellerService.updateSellerInfo(seller_num, seller_storeName, seller_name, seller_licenseNum, null);
	    }

	    return ResponseEntity.status(HttpStatus.OK).body("The info has been successfully updated.");
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
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            // 뷰 이름 반환
    	    return "/admin/sellerMenu/settle_day";
        }

	}
	
	
	@RequestMapping(value = "/settle_year", method = RequestMethod.GET)
	public String settle_year(@RequestParam("seller_num") String sellerNum,Locale locale, Model model,HttpSession session) {
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

	    if (monthly == null || monthly.isEmpty()) {
	        LocalDate currentDate = LocalDate.now();
	        monthly = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
	    }


	    List<Map<String, Object>> result = sellerService.getSellers(monthly);

	    return result;
	}
	@RequestMapping(value = "/detailSales", method = RequestMethod.GET)
	public String detaillSales(@RequestParam("seller_num")String seller_num,@RequestParam("pay_day") String pay_day,Locale locale, Model model,HttpSession session) {
	    
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
	    
	    if (session.getAttribute("admin_id") == null) {
            // 세션에 로그인 정보가 없는 경우
            model.addAttribute("error", "로그인후 이용해주세요");
            return "redirect:/adminLogin"; // 로그인 페이지로 이동
        } else {
            // 로그인한 경우
            String admin_id = (String) session.getAttribute("admin_id");
            Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
            List<Map<String, Object>> resultList = sellerService.totalSales();
            List<Map<String, Object>> chartData = sellerService.selectSalesData();
            
            JSONArray jsonArray = new JSONArray();
            for(Map<String, Object> data : chartData) {
            	jsonArray.put(data);
            }
            
            model.addAttribute("data", chartData);
            model.addAttribute("data_json", jsonArray);
    	    model.addAttribute("sellers", resultList);
            model.addAttribute("admin", adminInfo);
            model.addAttribute("admin_id", admin_id);
            return "/admin/sellerMenu/totalSales";
        }
	}
	
	@PostMapping("/updateSettlementYn")
	public String batchSettlement(@RequestParam String sellerNum, @RequestParam String orderMonth, RedirectAttributes redirectAttributes) {
	  sellerService.updateSettlementYn(sellerNum, orderMonth);
	  String message = "정산 업데이트가 완료되었습니다.";
	  redirectAttributes.addFlashAttribute("message", message);
	  return "redirect:/settlement";
	}
	
	@RequestMapping(value = "/cnotice", method = RequestMethod.GET)
	public String cnotice(Locale locale, Model model,HttpSession session) {
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
		
		for (int i = 0; i < files.size(); i++) {
            MultipartFile file = files.get(i);
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
                noticeList.put("admin_cs_file", saveFileName);

                // 처리해야하는 부분! 마지막 사진 List<String, String> itemImg = new ArrayList<> 을 이용해서 새로 저장을 하던지... 고민해야할 부분임! 
        	}
        }
		
		
		adminService.insertNotice(noticeList,files, session);
	    return "redirect:/cnotice";
	}
	// 제철팜 관리자 화면
	@RequestMapping(value = "/blogMng", method = RequestMethod.GET)
	public String blogMng(Locale locale, Model model, HttpSession session) {
		
		 if (session.getAttribute("admin_id") == null) {
	            // 세션에 로그인 정보가 없는 경우
	            model.addAttribute("error", "로그인후 이용해주세요");
	            return "redirect:/adminLogin"; // 로그인 페이지로 이동
	        } else {
	        	
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

		// 첨부파일 올라갈 물리적 경로 
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		
		for (int i = 0; i <blogFiles.size(); i++) {
            MultipartFile blogFile = blogFiles.get(i);
            if (!blogFile.isEmpty() && blogFile.getSize() > 0) { // 파일이 전송되었는지 확인
                String blogFileName = blogFile.getOriginalFilename(); // 파일 원래 이름
                String fileExtension = FilenameUtils.getExtension(blogFileName); // 확장자

                String uuid = UUID.randomUUID().toString(); // 랜덤으로 이름 부여 후 저장

                String storedFileName = uuid.substring(0,8) + "." + fileExtension; // 자리수 0~8까지

                String filePath = uploadPath + "/" + storedFileName;
                
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
    public String blogUpdatePro(HttpServletRequest request, @RequestParam("blogFile") List<MultipartFile> blogFiles, HttpSession session) throws Exception {
        int admin_blog_num = Integer.parseInt(request.getParameter("admin_blog_num"));
        String admin_blog_mainTitle = request.getParameter("admin_blog_mainTitle");
        String admin_blog_subTitle = request.getParameter("admin_blog_subTitle");
        String admin_blog_content = request.getParameter("admin_blog_content");

        String[] blogImgURLs = request.getParameterValues("oldBlogFile");
        
        String uploadPath = session.getServletContext().getRealPath("/resources/upload");
        List<String> storedFileNames = new ArrayList<>();

        for (MultipartFile blogFile : blogFiles) {
        	if (!blogFile.isEmpty()) {
              String blogFileName = blogFile.getOriginalFilename();
              String fileExtension = FilenameUtils.getExtension(blogFileName);

              String uuid = UUID.randomUUID().toString();
              String storedFileName = uuid.substring(0, 8) + "." + fileExtension;
              String filePath = uploadPath + "/" + storedFileName;

              File dest = new File(filePath);
              blogFile.transferTo(dest);

              String saveFileName = "http://c2d2303t2.itwillbs.com/FarmProject/resources/upload/" + storedFileName;
              storedFileNames.add(saveFileName);

			} else {
		      // 첨부파일 수정 안하고 수정하면
			  if (blogImgURLs != null && blogImgURLs.length > 0) {
			      String oldFileURL = blogImgURLs[0];
			      storedFileNames.add(oldFileURL);
			  }
			} 
        }

        adminService.blogUpdatePro(admin_blog_num, admin_blog_mainTitle, admin_blog_subTitle, admin_blog_content, storedFileNames);

        return "redirect:/blogContent?admin_blog_num=" + admin_blog_num;
    }
	
	// 제철팜 글 삭제
	@RequestMapping(value = "/blogDelete", method = RequestMethod.GET)
	public String blogDelete(@RequestParam("admin_blog_num") int admin_blog_num, HttpSession session) {
		
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
	
	@RequestMapping(value = "/adminItemList", method = RequestMethod.GET)
	public String adminItemList(HttpSession session, Model model) {

			String admin_id = (String) session.getAttribute("admin_id");
			Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
			model.addAttribute("admin", adminInfo);
		
			List<Map<String, Object>> itemList = adminService.getItemList();
			model.addAttribute("itemList", itemList);
			
			List<Map<String, Object>> typeList = adminService.getTypes();
			model.addAttribute("typeList", typeList);
			
			// 등록된 카테고리 목록들도 불러오고 , add 해서 추가도 할 수 있게 
		
		return "/admin/sellerMenu/adminItemList";
	}
	
	
	@RequestMapping(value = "/addRow", method = RequestMethod.GET)
	public String addRow(HttpSession session, Model model) {
		
		String admin_id = (String) session.getAttribute("admin_id");
		Map<String, Object> adminInfo = adminService.getAdminInfo(admin_id); // 관리자 정보를 가져옵니다.
		model.addAttribute("admin", adminInfo);

		return "/admin/sellerMenu/adminItemList";
	}
	
	@RequestMapping(value = "/makeCategory", method = RequestMethod.POST)
	public String makeCategory(@RequestParam("seller_type[]") String[] sellerTypes,
	                           @RequestParam("type_name[]") String[] typeNames,
	                           HttpSession session, Model model) {
		
	    if (sellerTypes.length == typeNames.length) {
	        for (int i = 0; i < sellerTypes.length; i++) {
	            String sellerType = sellerTypes[i];
	            String typeName = typeNames[i];

	            adminService.insertCate(sellerType, typeName);
	        }
	    }

	    return "redirect:/adminItemList";
	}


	
	// 판매중지/판매 변경 버튼 - 상태 조회 후 변경 
		@RequestMapping(value = "/ChangeItemStatus", method = RequestMethod.GET)

		public String ChangeItemStatus(@RequestParam HashMap<String, String> status, Model model, HttpSession session){
			
			adminService.ChangeItemStatus(status);
			return "redirect:/adminItemList";
		}
	
}
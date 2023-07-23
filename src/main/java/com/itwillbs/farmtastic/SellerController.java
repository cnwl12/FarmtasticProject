package com.itwillbs.farmtastic;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.service.MemberService;
import com.itwillbs.service.SellerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SellerController {
	
	@Inject
	private SellerService sellerService;
	
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
	@RequestMapping(value = "/sellerMemb", method = RequestMethod.GET)
	public String sellerMemb(Locale locale, Model model) {
		
		System.out.println("sellerMemb 매핑확인여부");
		
		return "/seller/sellerMemb";
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
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	public String itemRegister(Locale locale, Model model) {
		
		System.out.println("itemRegister 매핑확인여부");
		
		return "/seller/itemRegister";
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
	
	
	@RequestMapping(value = "/itemInsert", method = RequestMethod.GET)
	public String itemInsert(Locale locale, Model model) {
		
		System.out.println("itemInsert 매핑확인여부");
		
		return "/seller/itemInsert";
	}
	
	
	@RequestMapping(value = "/itemInsertPro", method = RequestMethod.POST)
	public String itemInsertList(@RequestParam HashMap<String, String> itemList,
	                             @RequestParam("file") List<MultipartFile> files,
	                             HttpSession session) {
		
		System.out.println(itemList);
		System.out.println(files);
	    sellerService.itemInsert(itemList, files, session);
	    
	    return "/seller/questionMng";
	}
	
//	
//	// 개별 항목 넘어오는지 확인용 (나중에 지워도 됨)
//	@RequestMapping(value = "/itemInsertPro", method = RequestMethod.POST)
//	public String itemInsertList(@RequestParam("category_num") Integer categoryNum,
//	                             @RequestParam("item_name") String itemName,
//	                             @RequestParam("item_price") String itemPrice,
//	                             @RequestParam("item_mainImg") MultipartFile itemMainImg,
//	                             @RequestParam("item_detail") String itemDetail) {
//	    
//		System.out.println("itemInsertPro 매핑확인여부");
//	    System.out.println("카테고리 번호: " + categoryNum);
//	    System.out.println("상품명: " + itemName);
//	    System.out.println("가격: " + itemPrice);
//	    System.out.println("상품 이미지: " + itemMainImg.getOriginalFilename());
//	    System.out.println("상품 설명: " + itemDetail);
//
//	    return "/seller/questionMng";
//	}

}
package com.itwillbs.service;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dao.SellerDAO;
import com.itwillbs.domain.SellerDTO;

@Service
public class SellerService {
	
	 @Autowired
	    private SellerDAO sellerDAO;
	 	//매출관리에 판매자별 총매출 불러오기 위한 구문
	    public List<Map<String, Object>> getSellers() {
	        return sellerDAO.getSellers();
	    }
	    
	    // 가맹점관리 혜원
		public List<Map<String, Object>> getSeller() {
			return sellerDAO.getSeller();
		}
		
		// 선진) 판매자 체크
		// 안쓰는 코드라 삭제 예정
		/*
		 * public Map<String, Object> sellerCheck(Map<String, Object> sellerInfoList) {
		 * System.out.println("SellerService의 sellerCheck 매핑완"); return
		 * sellerDAO.sellerCheck(sellerInfoList); }
		 */
		
		public SellerDTO sellerCheck(String seller_id) {
         System.out.println("SellerService sellerCheck()");
         
         return sellerDAO.sellerCheck(seller_id);
		}
		
		// 선진) 판매자의 모든 정보 가져옴
		public Map<String, Object> getSellerInfo(String seller_num) {
			System.out.println("SellerService의 getSellerInfo 매핑완");
			return sellerDAO.getSellerInfo(seller_num);
		}
		// 선진) 판매자 정보 수정
		public void updateSeller(Map<String, Object> sellerInfo) {
			System.out.println("SellerService의 updateSeller 매핑완");
			sellerDAO.updateSeller(sellerInfo);
		}
		
		// 선진) getDailySales 요일별 매출 가져오는 차트
		public List<Map<String, Object>> getDailySales(String seller_num) {
			System.out.println("SellerService의 getDailySales 매핑완");
			return sellerDAO.getDailySales(seller_num);
		}   

		public void itemInsert(HashMap<String, String> itemList, List<MultipartFile> files,HttpSession session) {
			System.out.println("itemInsert 확인!!!");
	        sellerDAO.itemInsert(itemList); // DB저장 코드 
		}

		// 마켓 전체 페이지
		public List<Map<String, Object>> getItems() {
			
			return sellerDAO.getItems();
		}
		
		//정산 위한 판매자별 월별 매출리스트
		public List<Map<String, Object>> getSales() {
			System.out.println("service:getSales()");
			 return sellerDAO.getSales();
		}
		//정산 확인
		public void updateSettlementYn(String sellerNum, String orderMonth) { 
			System.out.println("서비스 오나요"); 
			List<String> sellerNums = Arrays.asList(sellerNum.split(",")); 
			Map<String, Object> parameters = new HashMap<String, Object>(); parameters.put("sellerNums", sellerNums); 
			parameters.put("order_month", orderMonth); 
			sellerDAO.updateSettlementYn(parameters); 
			System.out.println("service sellerNum: " + sellerNums); 
			System.out.println("service orderMonth: " + orderMonth); } 
		//정산 위한 판매자별 일별 매출리스트
		public List<Map<String, Object>> daySales(String sellerNum, String orderMonth) {
			System.out.println("서비스");
			System.out.println("서비스"+sellerNum);
			System.out.println("서비스"+orderMonth);
			return sellerDAO.daySales(sellerNum, orderMonth);
		}
		//판매자별 연간 매출리스트
		public List<Map<String, Object>> yearSales(String sellerNum) {
			System.out.println("서비스"+sellerNum);
			return sellerDAO.yearSales(sellerNum);
		}

		public void approveSellerStatus(List<String> sellerNum) {
		    System.out.println("SellerService approveSellerStatus 확인!");
		    sellerDAO.approveSellerStatus(sellerNum);
		}

		public void rejectSellerStatus(List<String> sellerNum) {
		    System.out.println("SellerService rejectSellerStatus 확인!");
		    sellerDAO.rejectSellerStatus(sellerNum);
		}
	
		
		public Map<String, Object> getItem(int item_num) {
			System.out.println("서비스 아이템넘");
			return sellerDAO.getItem(item_num);
		}

		public void insertSeller(SellerDTO sellerDTO) {
         System.out.println("SellerService insertSeller() 확인!!!");
         
         // 날짜 저장 (테스트 dto에서는 date 지웠음)
         // sellerDTO.setDate(new Timestamp(System.currentTimeMillis()));
         
         // insertSeller 메서드 호출  
         sellerDAO.insertSeller(sellerDTO);
		}

		public void itemUpdate(HashMap<String, String> itemList, List<MultipartFile> files, HttpSession session) {
			
			System.out.println("업데이트 서비스 오는지");
			sellerDAO.itemUpdate(itemList);
		}




		
		
}

package com.itwillbs.service;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dao.SellerDAO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;

@Service
public class SellerService {
	
	 @Autowired
	    private SellerDAO sellerDAO;
	 	//매출관리에 판매자별 총매출 불러오기 위한 구문
	    public List<Map<String, Object>> getSellers(String monthly) {
	    	System.out.println("SellerService의 getSellers 매핑완");
	        return sellerDAO.getSellers(monthly);
	    }
	    public List<Map<String, Object>> totalSales() {
	    	System.out.println("SellerService의 totalSales 매핑완");
	        return sellerDAO.totalSales();
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
		
				
		public Map<String, Object> sellerCheck(String seller_id) {
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

		// 선진) 해당 월의 일자별 매출 차트
		public List<Map<String,Object>> getDailySales(String seller_num) {
			System.out.println("SellerService의 getDailySales 매핑완");
			return sellerDAO.getDailySales(seller_num);
		}
		
		// 선진) 최근 12개월의 월별 매출 차트
		public List<Map<String,Object>> getMonthlySales(String seller_num) {
			System.out.println("SellerService의 getMonthlySales 매핑완");
			return sellerDAO.getMonthlySales(seller_num);
		}
		
		// 선진) 매출관리 - 일자별 매출 리스트
		public List<Map<String,Object>> getDailySalesList(String seller_num) {
			System.out.println("SellerService의 getDailySalesList 매핑완");
			return sellerDAO.getDailySalesList(seller_num);
		}
		
		// 선진) 정산관리
		public List<Map<String,Object>> getSettlementList(String seller_num) {
			System.out.println("SellerService의 getSettlementList 매핑완");
			return sellerDAO.getSettlementList(seller_num);
		}
		
		// 선진) 정산신청
		public void updateSettlementRequest(String seller_num, List<String> checkedSettlements) {
		    System.out.println("SellerService의 updateSettlementRequest 매핑완");
		    
		    Map<String, Object> params = new HashMap<>();
		    params.put("seller_num", seller_num);
		    params.put("checkedSettlements", checkedSettlements);
		    sellerDAO.updateSettlementRequest(params);
		}

		
		public void itemInsert(HashMap<String, String> itemList, List<MultipartFile> files,HttpSession session) {
			System.out.println("itemInsert 확인!!!");
	        sellerDAO.itemInsert(itemList); // DB저장 코드 
		}

		// 마켓 전체 페이지
		public List<Map<String, Object>> getItems() {
			
			return sellerDAO.getItems();
		}
		
		public List<Map<String, Object>> getItemSeller(String seller_num) {
			
			return sellerDAO.getItemSeller(seller_num);
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

		public void itemSold(HashMap<String, String> itemList) {
			
			System.out.println("섭이스 오는지");
			sellerDAO.itemSold(itemList);
		}

		
		/* 판매자 로그인 sungha*/
		public SellerDTO sellerCheck1(SellerDTO sellerDTO) {
		    System.out.println("SellerService sellerCheck1()");
		    
		    return sellerDAO.sellerCheck1(sellerDTO);
	    }
		
		public String idCheck(String seller_num) {
	         System.out.println("SellerService idCheck()");
	       
	         return sellerDAO.idCheck(seller_num);
		}

		public List<Map<String, Object>> MemberMngjoin(java.sql.Date startDate, java.sql.Date endDate) {
		    System.out.println("SellerService의 MemberMngjoin()");
		    return sellerDAO.MemberMngjoin(startDate, endDate);
		}

		public void updateStatus(HashMap<String, String> status) {
			
			System.out.println("updateStatus서비스");
			sellerDAO.updateStatus(status);
		}	
		
		// 판매자 문의글 관리
	    public List<OneBoardDTO> getBySellerque(String seller_num) {
	        return sellerDAO.selectByque(seller_num);
	    }
	    
	    public void updateReply(String seller_num, int one_board_num, String one_board_reply) {
	    	System.out.println("문의글 서비스왔니??");
	        sellerDAO.updateReply(seller_num, one_board_num, one_board_reply);
	    }

		
	    // 판매자 리뷰관리
	    public List<SellerDTO> getReview(String seller_num) {
	    	return sellerDAO.getReview(seller_num);
		}
	    
}

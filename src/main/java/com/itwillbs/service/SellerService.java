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
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;

@Service
public class SellerService {
	
	
	 @Autowired
	    private SellerDAO sellerDAO;
	 	//매출관리에 판매자별 총매출 불러오기 위한 구문
	    public List<Map<String, Object>> getSellers(String monthly) {
	        return sellerDAO.getSellers(monthly);
	    }
	    public List<Map<String, Object>> orderCount(String today) {
	        return sellerDAO.orderCount(today);
	    }
	    public List<Map<String, Object>> totalSales() {
	        return sellerDAO.totalSales();
	    }
	    public List<Map<String, Object>> selectSalesData() {
	        return sellerDAO.selectSalesData();
	    }
	    public List<Map<String, Object>> pieChart() {
	        return sellerDAO.pieChart();
	    }
	 
	 
	    // 가맹점관리 혜원
		public List<Map<String, Object>> getSeller() {
			return sellerDAO.getSeller();
		}

		public Map<String, Object> sellerCheck(String seller_id) {
			return sellerDAO.sellerCheck(seller_id);
		}
		
		// 선진) 판매자의 모든 정보 가져옴
		public Map<String, Object> getSellerInfo(String seller_num) {
			return sellerDAO.getSellerInfo(seller_num);
		}
		
		// 선진) 판매자 정보 수정
		public void updateSeller(SellerDTO sellerDTO) {
			sellerDAO.updateSeller(sellerDTO);
		}

		// 선진) 해당 월의 일자별 매출 차트
		public List<Map<String,Object>> getDailySales(String seller_num) {
			return sellerDAO.getDailySales(seller_num);
		}
		
		// 선진) 최근 12개월의 월별 매출 차트
		public List<Map<String,Object>> getMonthlySales(String seller_num) {
			return sellerDAO.getMonthlySales(seller_num);
		}
		
		// 선진) 품목별 월 매출 차트
		public List<Map<String,Object>> getMonthlyItems(String seller_num) {

			return sellerDAO.getMonthlyItems(seller_num);
		}
		
		// 당일 주문건수
		public int getTodayOrders(String seller_num) {

			return sellerDAO.getTodayOrders(seller_num);
		}
				
		// 선진) 매출관리 - 검색바
		public List<Map<String,Object>> getDailySalesList(String seller_num, String startDate, String endDate) {
			
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("startDate", startDate);
		    params.put("endDate", endDate);
			return sellerDAO.getDailySalesList(params);
		}
		
		// 선진) 매출관리 - 일자별 매출 리스트
		public List<Map<String,Object>> dailySales(String seller_num) {
			return sellerDAO.dailySales(seller_num);
		}
		
		// 선진) 정산관리
		public List<Map<String,Object>> getSettlementList(String seller_num) {
			return sellerDAO.getSettlementList(seller_num);
		}
		
		// 선진) 정산신청
		public void insertSettlementRequest(String seller_num, List<String> checkedSettlements) {
		    
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("checkedSettlements", checkedSettlements);
		    sellerDAO.insertSettlementRequest(params);
		}

	    // 선진) 정산신청 여부 알아오기
		public boolean isSettlementRequested(String seller_num, List<String> checkedSettlements) {
		    
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("checkedSettlements", checkedSettlements);
		    
		    int count = sellerDAO.isSettlementRequested(params);
			return count > 0;
		}
		
	    // 선진) 정산완료 여부 알아오기
		public boolean isSettlementCompleted(String seller_num, List<String> checkedSettlements) {
		    
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("checkedSettlements", checkedSettlements);
		    
		    int count = sellerDAO.isSettlementCompleted(params);
			return count > 0;
		} 
		
		// 선진) 정산취소
		public void deleteSettlementRequest(String seller_num, List<String> checkedSettlements) {
		    
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("checkedSettlements", checkedSettlements);
		    sellerDAO.deleteSettlementRequest(params);
		}
		
		public void itemInsert(HashMap<String, String> itemList, List<MultipartFile> files,HttpSession session) {
	        sellerDAO.itemInsert(itemList); // DB저장 코드 
		}

		// 마켓 전체 페이지
		public List<Map<String, Object>> getItems() {
			return sellerDAO.getItems();
		}
		
		public List<Map<String, Object>> getItemsSortedByRegistration(Map<String, String> sortOption) {
			return sellerDAO.getItemsSortedByRegistration(sortOption);
		}
		
		public List<Map<String, Object>> getItemsSortedByPrice(Map<String, String> sortOption) {
		    return sellerDAO.getItemsSortedByPrice(sortOption);
		}
		
		public List<Map<String, Object>> getItemsSortedByName(Map<String, String> sortOption) {
		    return sellerDAO.getItemsSortedByName(sortOption);
		}
		
		public List<Map<String, Object>> getItemSeller(String seller_num) {
			return sellerDAO.getItemSeller(seller_num);
		}
		
		//정산 위한 판매자별 월별 매출리스트
		public List<Map<String, Object>> getSales() {
			 return sellerDAO.getSales();
		}
		
		//정산 확인
		public void updateSettlementYn(String sellerNum, String orderMonth) {
		    List<String> sellerNums = Arrays.asList(sellerNum.split(","));
		    List<String> orderMonths = Arrays.asList(orderMonth.split(","));

		    Map<String, Object> parameters = new HashMap<String, Object>();
		    parameters.put("sellerNums", sellerNums);
		    parameters.put("orderMonths", orderMonths);

		    sellerDAO.updateSettlementYn(parameters);
		}

		//정산 위한 판매자별 일별 매출리스트
		public List<Map<String, Object>> daySales(String sellerNum, String orderMonth) {
			return sellerDAO.daySales(sellerNum, orderMonth);
		}
		
		//판매자별 연간 매출리스트
		public List<Map<String, Object>> yearSales(String sellerNum) {
			return sellerDAO.yearSales(sellerNum);
		}
		
		// 관리자 업체관리
		public void approveSellerStatus(List<String> sellerNum) {
		    sellerDAO.approveSellerStatus(sellerNum);
		}

		public void rejectSellerStatus(List<String> sellerNum) {
		    sellerDAO.rejectSellerStatus(sellerNum);
		}
	
		
		public Map<String, Object> getItem(int item_num) {
			return sellerDAO.getItem(item_num);
		}

		public void insertSeller(SellerDTO sellerDTO) {
         sellerDAO.insertSeller(sellerDTO);
		}

		public void itemUpdate(HashMap<String, String> itemList, List<MultipartFile> files, HttpSession session) {
			sellerDAO.itemUpdate(itemList);
		}

		public void itemSold(HashMap<String, String> itemList) {
			sellerDAO.itemSold(itemList);
		}

		
		/* 판매자 로그인 sungha*/
		public SellerDTO sellerCheck1(SellerDTO sellerDTO) {
		    
		    return sellerDAO.sellerCheck1(sellerDTO);
	    }
		
		public SellerDTO sellerCheck2(SellerDTO sellerDTO) {
		    
		    return sellerDAO.sellerCheck2(sellerDTO);
	    }
	
		public String idCheck(String seller_num) {
	       
	         return sellerDAO.idCheck(seller_num);
		}
		
		public SellerDTO idCheck2(String seller_id) {
			return sellerDAO.idCheck2(seller_id);
		}

		public List<Map<String, Object>> MemberMngjoin(String seller_num, Date startDate, Date endDate) {
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("startDate", startDate);
		    params.put("endDate", endDate);
		    return sellerDAO.MemberMngjoin(params);
		}

		public void updateStatus(HashMap<String, String> status) {
			
			sellerDAO.updateStatus(status);
		}	
		
	    public List<OneBoardDTO> getBySellerque(String seller_num) {
	        return sellerDAO.selectByque(seller_num);
	    }
	    
	    public void updateReply(String seller_num, int one_board_num, String one_board_reply) {
	        sellerDAO.updateReply(seller_num, one_board_num, one_board_reply);
	    }
	    
	    public List<String> getItemNames(String seller_num) {
	        return sellerDAO.getItemNames(seller_num);
	    }
		
	    // 판매자 리뷰관리
	    public List<SellerDTO> getReview(String seller_num) {
	    	return sellerDAO.getReview(seller_num);
		}
	    
	    public boolean deleteSellerReview(int review_num, int member_num) {
	        return sellerDAO.deleteSellerReview(review_num, member_num) > 0;
	    }
	    
	    public void withdrawSeller(SellerDTO sellerDTO) {
			
			
			sellerDAO.withdrawSeller(sellerDTO);
			
		}
		public void withderawSellerstopselling(SellerDTO sellerDTO) {
			
			sellerDAO.withderawSellerstopselling(sellerDTO);
		}
		 
		public Map<String, Object> getSellerDetails(String sellerNum) {
			
			return sellerDAO.getSellerDetails(sellerNum);
		}
		
		public void updateSellerInfo(String seller_num, String seller_storeName, String seller_name, String seller_licenseNum,
				String seller_file) {
			sellerDAO.updateSellerInfo(seller_num, seller_storeName, seller_name, seller_licenseNum, seller_file);
		}
		
		public SellerDTO getSellerEmail(String seller_email) {
			return sellerDAO.getSellerEmail(seller_email);
		}
		
		// 선진) 판매자 메인 - 리뷰관리 팝업
		public SellerDTO reviewDetail(String seller_num, int review_num) {
		    Map<String, Object> params = new HashMap<>();
		    params.put("seller_num", seller_num);
		    params.put("review_num", review_num);
		    return sellerDAO.reviewDetail(params);
		}
		
		// 선진) 판매자 메인 - 문의관리 팝업
		public OneBoardDTO questionDetail(String seller_num, int one_board_num) {
		    Map<String, Object> params = new HashMap<>();
		    params.put("seller_num", seller_num);
		    params.put("one_board_num", one_board_num);
		    return sellerDAO.questionDetail(params);
		}
}
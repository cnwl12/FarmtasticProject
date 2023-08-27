package com.itwillbs.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;


@Repository
public class SellerDAO {
	
	//mapper파일 이름 => 변수 정의
	private static final String namespace = "SellerMapper";
	
	@Autowired
	   private SqlSession sqlSession;

	    public List<Map<String, Object>> getSellers(String monthly) {
	        return sqlSession.selectList(namespace + ".getSellers",monthly);
	    }
	    public List<Map<String, Object>> orderCount(String today) {
	        return sqlSession.selectList(namespace + ".orderCount",today);
	    }
	    
	    public List<Map<String, Object>> totalSales() {
			// TODO Auto-generated method stub
			return sqlSession.selectList(namespace + ".totalSales");
		}
	    public List<Map<String, Object>> selectSalesData() {
			// TODO Auto-generated method stub
			return sqlSession.selectList(namespace + ".selectSalesData");
		}
	    public List<Map<String, Object>> pieChart() {
			// TODO Auto-generated method stub
			return sqlSession.selectList(namespace + ".pieChart");
		}
	    // 가맹점관리
		public List<Map<String, Object>> getSeller() {
			return sqlSession.selectList(namespace+".getSeller");
		}
		
		// 판매자 ID 중복체크
		public Map<String, Object> sellerCheck(String seller_id) {
			return sqlSession.selectOne(namespace+".sellerCheck", seller_id);
		}
		
		// 선진) 판매자 모든 정보 가져옴
		public Map<String, Object> getSellerInfo(String seller_num) {

			return sqlSession.selectOne(namespace+".getSellerInfo", seller_num);
		}
		
		// 선진) 판매자 정보 수정
		public void updateSeller(SellerDTO sellerDTO) {
			
			sqlSession.update(namespace + ".updateSeller", sellerDTO);
		}

		// 선진) 해당 월의 일자별 매출 차트
		public List<Map<String,Object>> getDailySales(String seller_num) {

			return sqlSession.selectList(namespace + ".getDailySales", seller_num);
		}
		
		// 선진) 최근 12개월의 월별 매출 차트
		public List<Map<String,Object>> getMonthlySales(String seller_num) {

			return sqlSession.selectList(namespace + ".getMonthlySales", seller_num);
		}
		
		// 선진) 품목별 월 매출 차트
		public List<Map<String,Object>> getMonthlyItems(String seller_num) {
			return sqlSession.selectList(namespace + ".getMonthlyItems", seller_num);
		}
		
		// 선진) 매출관리 - 검색바
		public List<Map<String,Object>> getDailySalesList(Map<String, Object> params) {
		    String seller_num = (String) params.get("seller_num");
		    String startDate = (String)params.get("startDate");
		    String endDate = (String)params.get("endDate");
		    params.put("startDate", startDate);
		    params.put("endDate", endDate);
			return sqlSession.selectList(namespace + ".getDailySalesList", params);
		}
		
		public List<Map<String,Object>> dailySales(String seller_num) {
			
			return sqlSession.selectList(namespace + ".dailySales", seller_num);
		}
		
		// 선진) 정산관리
		public List<Map<String,Object>> getSettlementList(String seller_num) {

			return sqlSession.selectList(namespace + ".getSettlementList", seller_num);
		}
		
		// 선진) 정산신청
		public void insertSettlementRequest(Map<String, Object> params) {

		    sqlSession.update(namespace + ".insertSettlementRequest", params);
		}
		
		// 선진) 정산신청 여부 알아오기
		public int isSettlementRequested(Map<String, Object> params) {

		    return sqlSession.selectOne(namespace + ".isSettlementRequested", params);
		}		
		
		// 선진) 정산완료 여부 알아오기
		public int isSettlementCompleted(Map<String, Object> params) {

		    return sqlSession.selectOne(namespace + ".isSettlementCompleted", params);
		}
		
		// 선진) 정산취소
		public void deleteSettlementRequest(Map<String, Object> params) {

		    sqlSession.update(namespace + ".deleteSettlementRequest", params);
		    
		}
		
		public void itemInsert(Map<String, String> itemList) {
	        sqlSession.insert(namespace + ".itemInsert", itemList);
			
		}

		public List<Map<String, Object>> getItems() {
			return sqlSession.selectList(namespace + ".getItems"); //기존 
		}
		
		public List<Map<String, Object>> getItemsSortedByRegistration(Map<String, String> sortOption) {
			return sqlSession.selectList(namespace + ".getItems", sortOption);
		}
		
		public List<Map<String, Object>> getItemsSortedByPrice(Map<String, String> sortOption) {
			System.out.println("price 요거");
		    return sqlSession.selectList(namespace + ".getItems", sortOption);
		}

		public List<Map<String, Object>> getItemsSortedByName(Map<String, String> sortOption) {
		    return sqlSession.selectList(namespace + ".getItems", sortOption);
		}
		
		public List<Map<String, Object>> getItemSeller(String seller_num) {
			return sqlSession.selectList(namespace + ".getItemSeller",seller_num);
		}
		
		// 정산용 매출내역
		public List<Map<String, Object>> getSales() {
			return sqlSession.selectList(namespace + ".getSales");
		}
		
		//정산 일별매출
		public List<Map<String, Object>> daySales(String sellerNum, String orderMonth) {
			Map<String, String> param = new HashMap<String, String>();
		    param.put("sellerNum", sellerNum);
		    param.put("orderMonth", orderMonth);
		    return sqlSession.selectList(namespace + ".daySales", param);
		}
		
		// 정산 'Y'로 바꾸기
		public void updateSettlementYn(Map<String, Object> parameters) { 
			sqlSession.update("SellerMapper.updateSettlementYn", parameters); }
		
		//관리자 업체관리
		public void approveSellerStatus(List<String> sellerNum) {
		    sqlSession.update(namespace+".approveSellerStatus", sellerNum);
		}

		public void rejectSellerStatus(List<String> sellerNum) {
		    sqlSession.update(namespace+".rejectSellerStatus", sellerNum);
		}
		
		public Map<String, Object> getItem(int item_num) {
			return sqlSession.selectOne(namespace+".getItem", item_num);
		}

		//판매자별 연간
		public List<Map<String, Object>> yearSales(String sellerNum) {
			return sqlSession.selectList(namespace+".yearSales", sellerNum);
		}

		// 판매자 회원 가입
		public void insertSeller(SellerDTO sellerDTO) {
	         sqlSession.insert(namespace+".insertSeller", sellerDTO); 
		}

		public void itemUpdate(HashMap<String, String> itemList) {
			sqlSession.update(namespace+".itemUpdate", itemList);
		}

		// 판매상태 변경
		public void itemSold(HashMap<String, String> itemList) {
			sqlSession.update(namespace+".itemUpdateY", itemList);
		}

		// 판매자 ID 로그인-성하
		public SellerDTO sellerCheck1(SellerDTO sellerDTO) {
			return sqlSession.selectOne(namespace+".sellerCheck1", sellerDTO);
		}
		
		public SellerDTO sellerCheck2(SellerDTO sellerDTO) {
			return sqlSession.selectOne(namespace+".sellerCheck2", sellerDTO);
		}

		// 판매자 ID 중복체크
		public String idCheck(String seller_id) {
			return sqlSession.selectOne(namespace+".idCheck", seller_id);
		}
		
		public SellerDTO idCheck2(String seller_id) {
			return sqlSession.selectOne(namespace + ".idCheck2", seller_id);
		}
		
		public List<Map<String, Object>> MemberMngjoin(Map<String, Object> params) {
		    String seller_num = (String) params.get("seller_num");
		    Date startDate = (Date) params.get("startDate");
		    Date endDate = (Date) params.get("endDate");
		    params.put("startDate", startDate);
		    params.put("endDate", endDate);
		    return sqlSession.selectList(namespace + ".MemberMngjoin", params);
		}

		// 상태 조회 후 변경 
		public void updateStatus(HashMap<String, String> status) {
			sqlSession.update(namespace+".updateStatus", status);
		}
		
		public List<OneBoardDTO> selectByque(String seller_num) {
			return sqlSession.selectList(namespace+".selectByque", seller_num);
	    }
		
		public List<String> getItemNames(String seller_num) {
			return sqlSession.selectList(namespace+".getItemNames", seller_num);
	    }
		
		public void updateReply(String seller_num, int one_board_num, String one_board_reply) {
		    Map<String, Object> params = new HashMap<String, Object>();
		    params.put("seller_num", seller_num);
		    params.put("one_board_num", one_board_num);
		    params.put("one_board_reply", one_board_reply);

		    sqlSession.update(namespace + ".updateReply", params);
		}

		// 판매자 리뷰관리
		public List<SellerDTO> getReview(String seller_num) {
			return sqlSession.selectList(namespace+".getReview", seller_num);
		}
		
		public int deleteSellerReview(int review_num, int member_num) {
		    Map<String, Integer> params = new HashMap<>();
		    params.put("review_num", review_num);
		    params.put("member_num", member_num);
		    return sqlSession.delete(namespace + ".deleteSellerReview", params);
		}

		public void withdrawSeller(SellerDTO sellerDTO) {
			sqlSession.insert(namespace+".withdrawSeller", sellerDTO);
		}

		public void withderawSellerstopselling(SellerDTO sellerDTO) {
			sqlSession.insert(namespace+".withderawSellerstopselling", sellerDTO);
		}

		public Map<String, Object> getSellerDetails(String sellerNum) {
			return sqlSession.selectOne(namespace + ".sellerDetail", sellerNum);
		}

		public void updateSellerInfo(String seller_num, String seller_storeName, String seller_name, String seller_licenseNum,
				String seller_file) {
			Map<String, Object> params = new HashMap<>();
	        params.put("seller_num", seller_num);
	        params.put("seller_storeName", seller_storeName);
	        params.put("seller_licenseNum", seller_licenseNum);
	        params.put("seller_name", seller_name);
			params.put("seller_file", seller_file);
			sqlSession.update(namespace+".updateSellerInfo", params);
		}
		
		public SellerDTO getSellerEmail(String seller_email) {
			return sqlSession.selectOne(namespace + ".getSellerEmail", seller_email);
		}

		public SellerDTO reviewDetail(Map<String,Object> params) {
		     return sqlSession.selectOne(namespace + ".reviewDetail", params);
		}

		public OneBoardDTO questionDetail(Map<String,Object> params) {
		     return sqlSession.selectOne(namespace + ".questionDetail", params);
		}
}
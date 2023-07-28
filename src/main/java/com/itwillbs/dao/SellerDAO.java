package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SellerDAO {
	
	//mapper파일 이름 => 변수 정의
	private static final String namespace = "SellerMapper";
	@Autowired
	   private SqlSession sqlSession;

	    public List<Map<String, Object>> getSellers() {
	        return sqlSession.selectList(namespace + ".getSellers");
	    }

	    
	    // 가맹점관리
		public List<Map<String, Object>> getSeller() {
			return sqlSession.selectList(namespace+".getSeller");
		}
		
		// 판매자 ID 중복체크
		public SellerDTO sellerCheck(String seller_id) {
			System.out.println("SellerDAO sellerCheck");
			return sqlSession.selectOne(namespace+".sellerCheck", seller_id);
			return sqlSession.selectList(namespace+".getSeller");
		}
		
		// 판매자 정보 수정
	      public Map<String, Object> sellerCheck(Map<String, Object> sellerInfoList) {
	         System.out.println("SellerDAO sellerCheck 확인");
	         return sqlSession.selectOne(namespace + ".sellerCheck", sellerInfoList);
	      }
	      
		public Map<String, Object> sellerCheck(Map<String, Object> sellerInfo) {
			System.out.println("SellerDAO의 sellerCheck 매핑완");
			return sqlSession.selectOne(namespace + ".sellerCheck", sellerInfo);
		}
		
		public Map<String, Object> getSellerInfo(String seller_num) {
			System.out.println("SellerDAO getSellerInfo 확인");
			return sqlSession.selectOne(namespace+".getSellerInfo", seller_num);
		}
		
		public void updateSeller(Map<String, Object> sellerInfo) {
			System.out.println("SellerDAO의 updateSeller 매핑완");
			sqlSession.update(namespace + ".updateSeller", sellerInfo);
		}
		
		
		public void itemInsert(Map<String, String> itemList) {
	        sqlSession.insert(namespace + ".itemInsert", itemList);
			
		}

		public List<Map<String, Object>> getItems() {
			System.out.println("List 오나요");
			return sqlSession.selectList(namespace + ".getItems");
		}
		// 정산용 매출내역
		public List<Map<String, Object>> getSales() {
			System.out.println("getSales 오나요");
			return sqlSession.selectList(namespace + ".getSales");
		}
		//정산 일별매출
		public List<Map<String, Object>> daySales(String sellerNum, String orderMonth) {
			System.out.println("daySales 오나요");
			Map<String, String> param = new HashMap<String, String>();
		    param.put("sellerNum", sellerNum);
		    param.put("orderMonth", orderMonth);
		    System.out.println(param);
		    return sqlSession.selectList(namespace + ".daySales", param);
		}
		// 정산 'Y'로 바꾸기
		public void updateSettlementYn(Map<String, Object> parameters) { 
			System.out.println("dao 오나요"); 
			System.out.println(parameters); 
			sqlSession.update("SellerMapper.updateSettlementYn", parameters); }
		
		public void approveSellerStatus(List<String> sellerNum) {
		    System.out.println("SellerDAO approveSellerStatus 확인");
		    sqlSession.update(namespace+".approveSellerStatus", sellerNum);
		}

		public void rejectSellerStatus(List<String> sellerNum) {
		    System.out.println("SellerDAO rejectSellerStatus 확인");
		    sqlSession.update(namespace+".rejectSellerStatus", sellerNum);
		}
		
		
		public Map<String, Object> getItem(int item_num) {
			// System.out.println("dao itemNum : !! " + item_num );
			return sqlSession.selectOne(namespace+".getItem", item_num);
		}

		//판매자별 연간
		public List<Map<String, Object>> yearSales(String sellerNum) {
			System.out.println("dao itemNum : !! " + sellerNum );
			return sqlSession.selectList(namespace+".yearSales", sellerNum);
		}






		
			
		


		
}

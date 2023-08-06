package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.SellerDTO;



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
		public Map<String, Object> sellerCheck(String seller_id) {
			System.out.println("SellerDAO sellerCheck");
			return sqlSession.selectOne(namespace+".sellerCheck", seller_id);
		}
		
		/*
		 * // 선진) 판매자 체크, 안쓰는 코드라 삭제예정 public Map<String, Object>
		 * sellerCheck(Map<String, Object> sellerInfoList) {
		 * System.out.println("SellerDAO sellerCheck 확인"); return
		 * sqlSession.selectOne(namespace + ".sellerCheck", sellerInfoList); }
		 */
		
		// 선진) 판매자 모든 정보 가져옴
		public Map<String, Object> getSellerInfo(String seller_num) {
			
			System.out.println("SellerDAO getSellerInfo 매핑완");
			return sqlSession.selectOne(namespace+".getSellerInfo", seller_num);
		}
		
		// 선진) 판매자 정보 수정
		public void updateSeller(Map<String, Object> sellerInfo) {
			
			System.out.println("SellerDAO의 updateSeller 매핑완");
			sqlSession.update(namespace + ".updateSeller", sellerInfo);
		}

		// 선진) 한달간 매일 총 매출 가져오는 차트	
		public List<Map<String,Object>> getDailySales() {
			
			System.out.println("SellerDAO의 getDailySales 매핑완");
			return sqlSession.selectList(namespace + ".getDailySales");
		}

		public void itemInsert(Map<String, String> itemList) {
	        sqlSession.insert(namespace + ".itemInsert", itemList);
			
		}

		public List<Map<String, Object>> getItems() {
			System.out.println("List 오나요");
			return sqlSession.selectList(namespace + ".getItems");
		}
		
		public List<Map<String, Object>> getItemSeller(String seller_num) {
			System.out.println("getItemSeller 확인");
			return sqlSession.selectList(namespace + ".getItemSeller",seller_num);
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


		// 판매자 회원 가입
		public void insertSeller(SellerDTO sellerDTO) {
	         System.out.println("SellerDAO insertSeller() 확인");
	         System.out.println(sellerDTO);
	         sqlSession.insert(namespace+".insertSeller", sellerDTO); 
		}


		public void itemUpdate(HashMap<String, String> itemList) {
			sqlSession.update(namespace+".itemUpdate", itemList);
		}

		// 판매상태 변경
		public void itemSold(HashMap<String, String> itemList) {
			System.out.println("디에오");
			sqlSession.update(namespace+".itemUpdateY", itemList);
		}

		// 판매자 ID 로그인-성하
		public SellerDTO sellerCheck1(SellerDTO sellerDTO) {
			System.out.println("SellerDAO sellerCheck1()");
			return sqlSession.selectOne(namespace+".sellerCheck1", sellerDTO);
		}
		
		// 판매자 ID 중복체크
		public String idCheck(String seller_id) {
			System.out.println("SellerDAO idCheck");
			return sqlSession.selectOne(namespace+".idCheck", seller_id);
		}
		
		public List<Map<String, Object>> MemberMngjoin() {
			System.out.println("SellerDAO MemberMngjoin()");
			return sqlSession.selectList(namespace + ".MemberMngjoin");
		}
		
		// 상태 조회 후 변경 
		public void updateStatus(HashMap<String, String> status) {
			System.out.println("updateStatus dao");
			sqlSession.update(namespace+".updateStatus", status);
		}
		
		// 판매자 문의 관리
		public List<OneBoardDTO> selectByque(String seller_num) {
			return sqlSession.selectList(namespace+".selectByque", seller_num);
	    }
		
		public void updateReply(String seller_num, int one_board_num, String one_board_reply) {
		    System.out.println("문의글 업데이트 DAO");

		    Map<String, Object> params = new HashMap<>();
		    params.put("seller_num", seller_num);
		    params.put("one_board_num", one_board_num);
		    params.put("one_board_reply", one_board_reply);

		    sqlSession.update(namespace + ".updateReply", params);
		}





}

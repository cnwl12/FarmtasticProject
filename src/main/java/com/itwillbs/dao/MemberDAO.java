package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatBotDTO;
import com.itwillbs.domain.DetailChatBotDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.WishlistDTO;

@Repository
public class MemberDAO {
	
	// 마이바티스 객체생성 => 멤버변수 root-context.xml -> 자동 주입(전달)
	@Inject
	private SqlSession sqlSession;
	
	//mapper파일 이름 => 변수 정의
	private static final String namespace = "MemberMapper";

	public void insertMember(MemberDTO memberDTO) {
		
		sqlSession.insert(namespace+".insertMember", memberDTO); 
	}

	
	 public MemberDTO nuserCheck(MemberDTO memberDTO) {
	     return sqlSession.selectOne(namespace+".nuserCheck", memberDTO);
	    }

	 public void ninsertMember(MemberDTO memberDTO) {
		 if (sqlSession == null) {
		        System.err.println("sqlSession is null!");
		        return;
		    }
		 sqlSession.insert(namespace+".ninsertMember", memberDTO); 
	 }
	 
	 public MemberDTO idCheck0(String member_id) {
			return sqlSession.selectOne(namespace + ".idCheck0", member_id);
		}

	public List<Map<String, Object>> getMembers() {
		return sqlSession.selectList("MemberMapper.getMembers");
	}
	
	public void changeMemberStatus(List<String> memberNums) {
	    sqlSession.update("MemberMapper.changeMemberStatus", memberNums);
	}
	
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}
	
	public MemberDTO userCheck0(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".userCheck0", memberDTO);
	}
	
	public MemberDTO getMember(String member_id) {
		return sqlSession.selectOne(namespace+".getMember", member_id);
	}
	

		
	public void insertCart(HashMap<String, Object> cart) {
		sqlSession.insert(namespace+".insertCart",cart);
	}

	public Boolean getCart(HashMap<String, Object> cart) {
		return sqlSession.selectOne(namespace+".getCart", cart);
	}

	public List<Map<String, Object>> getCartList(int member_num) {
		return sqlSession.selectList(namespace+".getCartList", member_num);
	}

	public void updateCart(HashMap<String, Object> cart) {
		sqlSession.update(namespace + ".updateCart", cart);
	}

	public void insertOrderDetail(HashMap<String, Object> orderDetail) {
		sqlSession.insert(namespace + ".insertOrderDetail", orderDetail);
	}
	
	public void insertOrderDetail(int member_num) {
		sqlSession.insert(namespace + ".insertOrderDetail", member_num);
	}
	
	
	
	/* sungha07.29 마이페이지*/
	public MemberDTO getMember1(Integer member_num) {
		return sqlSession.selectOne(namespace+".getMember1", member_num);
	}
	
	public MemberDTO userCheck1(MemberDTO memberDTO) {
		
		return sqlSession.selectOne(namespace+".userCheck1", memberDTO);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		
		sqlSession.update(namespace+".updateMember", memberDTO);
	}
	
	
	
	public List<Map<String, Object>> getItemsearch(String query) {

        return sqlSession.selectList(namespace+".getItemsearch", query);
    }

	
	
	// end sungha

	//리뷰용도 - 막내
	public void insertReview(MemberDTO memberDTO) {
        sqlSession.insert(namespace+".insertReview", memberDTO);
    }
	
	//구매내역 불러오기
	public List<MemberDTO> getItemOrder(int member_num, int item_num) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("member_num", member_num);
	    params.put("item_num", item_num);
	    return sqlSession.selectList(namespace + ".getItemOrder", params);
	}
	
	//리뷰 목록
	public List<MemberDTO> getItemReviews(int item_num) {
	    return sqlSession.selectList(namespace+".getItemReviews", item_num);
	}
	
	// 막냉이 리뷰별점 갯수 기능
	public int getReviewCountByItemNum(int item_num) {
		return sqlSession.selectOne(namespace + ".getReviewCountByItemNum", item_num);
	}

			
	public double getAverageReviewStarByItemNum(int item_num) { 
		Double averageReviewStar = null; 
			 try { averageReviewStar = sqlSession.selectOne(namespace+ ".getAverageReviewStarByItemNum", item_num);
			 	} catch (NullPointerException e) {
			 	} catch (EmptyResultDataAccessException e) {
			 	}
		return averageReviewStar == null ? 0.0 : averageReviewStar; 
	}


	public void updateInCart(HashMap<String, Object> cart) {
		sqlSession.update(namespace+".updateInCart", cart);
	}

	//막내 마이페이지 리뷰관리
	public List<MemberDTO> getItemMyReview(int member_num) {
		return sqlSession.selectList(namespace+".getItemMyReview", member_num);
	}

	public void updateReview(int review_num, int review_star, String review_title, String review_content, String review_img) {
		Map<String, Object> params = new HashMap<>();
	    params.put("review_num", review_num);
	    params.put("review_star", review_star);
	    params.put("review_title", review_title);
	    params.put("review_content", review_content);
	    params.put("review_img", review_img);
		sqlSession.update(namespace+".updateReview", params);
	}
	
	public void updateReview2(int review_num, int review_star, String review_title, String review_content) {
		Map<String, Object> params = new HashMap<>();
	    params.put("review_num", review_num);
	    params.put("review_star", review_star);
	    params.put("review_title", review_title);
	    params.put("review_content", review_content);
		sqlSession.update(namespace+".updateReview2", params);
	}
	
	public int deleteReview(int review_num, int member_num) {
		Map<String, Integer> params = new HashMap<>();
	    params.put("review_num", review_num);
	    params.put("member_num", member_num);
	    return sqlSession.delete(namespace + ".deleteReview", params);
	}

	
	 public void insertOneBoard(OneBoardDTO oneboardDTO) {
        sqlSession.insert(namespace + ".insertOneBoard", oneboardDTO);
    }

	 public List<OneBoardDTO> findByItemNum(int item_num) {
			return sqlSession.selectList(namespace+".findByItemNum", item_num);
	    }

	 public List<OneBoardDTO> findByItemNum2(int member_num) {
			return sqlSession.selectList(namespace+".findByItemNum2", member_num);
	    }
	 public List<OneBoardDTO> findByOneBoardNum(int one_board_num) {
			return sqlSession.selectList(namespace+".findByOneBoardNum", one_board_num);
	    }
	 
	 public OneBoardDTO getOneBoard(int one_board_num) {
         return sqlSession.selectOne(namespace + ".getOneBoard", one_board_num);
    }
	 public void updateOneBoard(OneBoardDTO OneBoard) {
         sqlSession.update(namespace + ".updateOneBoard", OneBoard);
    }
	 
	 public void deleteBoard(int BoardNum) {
			sqlSession.delete(namespace + ".deleteBoard", BoardNum);
		}

	public void deleteCart(HashMap<String, Object> cart) {
		sqlSession.delete(namespace + ".deleteCart", cart);
	}

	public void insertWishlistItem(WishlistDTO wishlistDTO) {
		sqlSession.insert(namespace + ".insertWishlistItem", wishlistDTO);
	}
	
	public WishlistDTO selectWishlist(WishlistDTO wishlistDTO) {
		return sqlSession.selectOne(namespace + ".selectWishlist", wishlistDTO);
	}	
	
	public void deleteWishlist(WishlistDTO wishlistDTO) {
		sqlSession.delete(namespace + ".deleteWishlist", wishlistDTO);
	}
	
	public List<WishlistDTO> selectWishlistget (int member_num) {
		return sqlSession.selectList(namespace+".selectWishlistget", member_num);
	}
	
	public List<WishlistDTO> getzzimlist (int member_num) {
		return sqlSession.selectList(namespace+".getzzimlist", member_num);
	}
	
	public void insertOrders(HashMap<String, Object> payInfo) {
		sqlSession.insert(namespace + ".insertOrders", payInfo);
	}
		
	public Map<String, Object> getMemberDetails(int memberNum) {
	    return sqlSession.selectOne(namespace + ".memberDetail", memberNum);
	}

	public int countCart(int member_num) {
	    return sqlSession.selectOne(namespace + ".countCart", member_num);
	}


	public void deleteAllCart(HashMap<String, Object> cart) {
		sqlSession.delete(namespace+".deleteAllCart", cart);
	}


	public List<Map<String, Object>> getOrderList(int member_num) {
		return sqlSession.selectList(namespace+".getOrderList",member_num);
	}


	public List<Map<String, Object>> getOrderPay(int member_num) {
		return sqlSession.selectList(namespace+".getOrderPay",member_num);
	}


	public List<Map<String, Object>> getOrderDetail(int member_num, String order_num) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("member_num", member_num);
	    paramMap.put("order_num", order_num);

	    return sqlSession.selectList(namespace + ".getOrderDetail", paramMap);
	}

	public void cancelOrder(HashMap<String, Object> cancel) {
		sqlSession.update(namespace + ".cancelOrder", cancel);
	}

	public void cancelInsert(HashMap<String, Object> cancel) {
		sqlSession.insert(namespace + ".cancelInsert", cancel);
	}

	public void updateItemLeft(Map<String, Object> orderDetail) {
	    sqlSession.update(namespace + ".updateItemLeft", orderDetail);
	}

	public void clearCart(int member_num) {
		sqlSession.delete(namespace+".deleteAllCart", member_num);
	}

	public List<Map<String, Object>> getCancelList(String orderNum) {
		return sqlSession.selectList(namespace+".getCancelList", orderNum);
	}

	public void cancelUpdate(HashMap<String, Object> cancel) {
		sqlSession.update(namespace + ".cancelOrder", cancel);
	}

	public void cancelDelete(HashMap<String, Object> cancel) {
		sqlSession.delete(namespace + ".cancelDelete", cancel);
	}
	
	public List<HashMap> searchId(String email) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("member_email", email);
	    return sqlSession.selectList(namespace + ".searchId", params);
	}
	
	public List<HashMap> searchPwd(String email, String id) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("member_email", email);
	    params.put("member_id", id);
	    return sqlSession.selectList(namespace + ".searchPwd", params);
	}
	
	public List<HashMap> updatePwd(String email, String id) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("member_email", email);
	    params.put("member_id", id);
	    return sqlSession.selectList(namespace + ".updatePwd", params);
	}

    
	public void withderawMember(MemberDTO memberDTO) {
		
		sqlSession.insert(namespace+".withderawMember", memberDTO);
	}

	public MemberDTO getMemberEmail(String member_email) {
		return sqlSession.selectOne(namespace + ".getMemberEmail", member_email);
	}
	
    public List<ChatBotDTO> getChatBot() {
        return sqlSession.selectList(namespace + ".getChatBot");
    }
    
    public List<DetailChatBotDTO> getChatBot2(int chatbotId) {
        return sqlSession.selectList(namespace + ".getChatBot2", chatbotId);
    }

}

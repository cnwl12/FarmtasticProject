package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

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
		System.out.println("MemberDAO insertMember() 확인");
		
		sqlSession.insert(namespace+".insertMember", memberDTO); 
	}

	
	 public MemberDTO nuserCheck(MemberDTO memberDTO) {
		 System.out.println("MemberDAO nuserCheck() 확인");
	     return sqlSession.selectOne(namespace+".nuserCheck", memberDTO);
	    }

	 public void ninsertMember(MemberDTO memberDTO) {
		 System.out.println("MemberDAO ninsertMember() 확인");
		 if (sqlSession == null) {
		        System.err.println("sqlSession is null!");
		        return;
		    }
		 sqlSession.insert(namespace+".ninsertMember", memberDTO); 
	 }
	 

	public List<Map<String, Object>> getMembers() {
		return sqlSession.selectList("MemberMapper.getMembers");
	}
	
	public void changeMemberStatus(List<String> memberNums) {
		System.out.println("MemberDAO changeMemberStatus 확인");
	    sqlSession.update("MemberMapper.changeMemberStatus", memberNums);
	}
	
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}
	
	public MemberDTO userCheck0(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck0()");
		
		return sqlSession.selectOne(namespace+".userCheck0", memberDTO);
	}
	
	public MemberDTO getMember(String member_id) {
		System.out.println("MemberDAO getMember");
		return sqlSession.selectOne(namespace+".getMember", member_id);
	}
	

		
	public void insertCart(HashMap<String, Object> cart) {
		System.out.println("MemberDAO insertCart : " + cart);
		sqlSession.insert(namespace+".insertCart",cart);
	}

	public Boolean getCart(HashMap<String, Object> cart) {
		System.out.println("getCart 확인"+ cart);
		return sqlSession.selectOne(namespace+".getCart", cart);
	}

	public List<Map<String, Object>> getCartList(int member_num) {
		System.out.println("getCartList 확인");
		return sqlSession.selectList(namespace+".getCartList", member_num);
	}

	public void updateCart(HashMap<String, Object> cart) {
		System.out.println("update 카트 (수량 변경)");
		sqlSession.update(namespace + ".updateCart", cart);
	}

	public void insertOrderDetail(HashMap<String, Object> orderDetail) {
		System.out.println("membetDAO insertOrderDetail까지 오는지");
		sqlSession.insert(namespace + ".insertOrderDetail", orderDetail);
	}
	
	public void insertOrderDetail(int member_num) {
		System.out.println("membetDAO insertOrderDetail까지 오는지");
		sqlSession.insert(namespace + ".insertOrderDetail", member_num);
	}
	
	
	
	/* sungha07.29 마이페이지*/
	public MemberDTO getMember1(Integer member_num) {
		System.out.println("MemberDAO getMember1");
		return sqlSession.selectOne(namespace+".getMember1", member_num);
	}
	
	public MemberDTO userCheck1(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck1()");
		
		return sqlSession.selectOne(namespace+".userCheck1", memberDTO);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberDAO updateMember()");
		
		sqlSession.update(namespace+".updateMember", memberDTO);
	}
	
	
	
	public List<Map<String, Object>> getItemsearch(String query) {
		System.out.println("MemberDAO getItemsearch()");

        return sqlSession.selectList(namespace+".getItemsearch", query);
    }

	
	
	// end sungha

	//리뷰용도 - 막내
	public void insertReview(MemberDTO memberDTO) {
        System.out.println("DAO 리뷰작성");
        sqlSession.insert(namespace+".insertReview", memberDTO);
    }

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

		public void updateReview(int review_num, int review_star, String review_title, String review_content) {
			Map<String, Object> params = new HashMap<>();
	        params.put("review_num", review_num);
	        params.put("review_star", review_star);
	        params.put("review_title", review_title);
	        params.put("review_content", review_content);
			
			sqlSession.update(namespace+".updateReview", params);
		}
	
		public int deleteReview(int review_num, int member_num) {
	        Map<String, Integer> params = new HashMap<>();
	        params.put("review_num", review_num);
	        params.put("member_num", member_num);
	        return sqlSession.delete(namespace + ".deleteReview", params);
	    }

	
	//서영 작업 1대1문의
	 public void insertOneBoard(OneBoardDTO oneboardDTO) {
		 System.out.println("MemberDAO insertOneBoard ()!!");
        sqlSession.insert(namespace + ".insertOneBoard", oneboardDTO);
    }

	 public List<OneBoardDTO> findByItemNum(int item_num) {
			return sqlSession.selectList(namespace+".findByItemNum", item_num);
	    }
//	 public List<MemberDTO> getOneBoardList() {
//	        return sqlSession.selectList(namespace + ".getOneBoardList");
//	    }


	public void deleteCart(HashMap<String, Object> cart) {
		sqlSession.delete(namespace + ".deleteCart", cart);
	}

	public void insertWishlistItem(WishlistDTO wishlistDTO) {
		System.out.println("찜바구니 넣기!!!!!!!!!!!!");
		sqlSession.insert(namespace + ".insertWishlistItem", wishlistDTO);
	}
	
	public WishlistDTO selectWishlist(WishlistDTO wishlistDTO) {
		return sqlSession.selectOne(namespace + ".selectWishlist", wishlistDTO);
	}	
	
	public void deleteWishlist(WishlistDTO wishlistDTO) {
		sqlSession.delete(namespace + ".deleteWishlist", wishlistDTO);
	}
	
	public void insertOrders(HashMap<String, Object> payInfo) {
		sqlSession.insert(namespace + ".insertOrders", payInfo);
		System.out.println("MemberDAO insertOrders");
	}	
		
	public Map<String, Object> getMemberDetails(int memberNum) {
		System.out.println("다오:"+memberNum);
	    return sqlSession.selectOne(namespace + ".memberDetail", memberNum);
	}
		 
}

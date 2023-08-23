package com.itwillbs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.WishlistDTO;

@Service
public class MemberService {
	@Autowired 
	@Inject
	private MemberDAO memberDAO;

	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember() 확인!!!");
		
		// 날짜 저장 (테스트 dto에서는 date 지웠음)
		// memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		// insertMember 메서드 호출  
		memberDAO.insertMember(memberDTO);
	}	
	
	public MemberDTO nuserCheck(MemberDTO memberDTO) {
		 if (memberDAO.nuserCheck(memberDTO) == null) {
		        return null;
		    }
	     return memberDAO.nuserCheck(memberDTO);
	    }
	
	public void ninsertMember(MemberDTO memberDTO) {
	    memberDAO.ninsertMember(memberDTO);
	}
	
	 public List<Map<String, Object>> getMembers() {
		 System.out.println("MemberService getMembers() 확인!");
	        return memberDAO.getMembers();
	}
		
	 public void changeMemberStatus(List<String> memberNums) {
		 System.out.println("MemberService changeMemberStatus 확인!");
	        memberDAO.changeMemberStatus(memberNums);
	 }	
	 
	 
	 public MemberDTO userCheck(MemberDTO memberDTO) {
		 return memberDAO.userCheck(memberDTO);
	 }


	public MemberDTO getMember(String member_id) {
		System.out.println("MemberService getMember()");
		
		return memberDAO.getMember(member_id);
	}
	
	public MemberDTO userCheck0(MemberDTO memberDTO) {
		 return memberDAO.userCheck0(memberDTO);
	 }
	
	
	/* sungha 07.29 마이페이지*/
	public MemberDTO getMember1(Integer member_num) {
		
		System.out.println("MemberService getMember1()");
		
		return memberDAO.getMember1(member_num);
	}
	
	/* 검색기능 ha*/

	

    public List<Map<String, Object>> getItemsearch(String query) {
        return memberDAO.getItemsearch(query);
    }

	
	// 카트 조지는중 ... 
	public void insertCart(HashMap<String, Object> cart) {
		// 카트 조회했을 때 제품이 있는지 없는지 조회
		Boolean result = memberDAO.getCart(cart); 
		// result = null - insert // true -update 진행
		if(result != null) {// 기존 카트목록 getCart했을때 item에 들어있으면 update(수량변경)
			memberDAO.updateCart(cart);
			System.out.println("true update");	
		}else { // getCart했을 때 item 없으면 insert
			System.out.println("null 인서트");
			memberDAO.insertCart(cart);
		}
	}
	
	// 카트 전체 목록
	public List<Map<String, Object>> getCartList(int member_num) {
		 System.out.println("MemberService getCart() 확인!");
		return memberDAO.getCartList(member_num);
	}
	
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberService updateMember()");
		
		memberDAO.updateMember(memberDTO);
	}
		 
	// 리뷰작성 - 막내
    public void insertReview(MemberDTO memberDTO) {
        memberDAO.insertReview(memberDTO);
    }

    public List<MemberDTO> getItemReviews(int item_num) {
        return memberDAO.getItemReviews(item_num);
    }

	public void insertOrderDetail(HashMap<String, Object> orderDetail) {
		System.out.println("서비스 오더디테일 까지 오는징");
		memberDAO.insertOrderDetail(orderDetail);
	}
	
	// 오버로딩
	public void insertOrderDetail(int member_num) {
		System.out.println("서비스 오더디테일 까지 오는징");
		memberDAO.insertOrderDetail(member_num);
	}
	
	public void deleteCart(HashMap<String, Object> cart) {
		System.out.println("서비스 오는지 딜리트카트 ");
		memberDAO.deleteCart(cart);
	}


	public MemberDTO userCheck1(MemberDTO memberDTO) {
		System.out.println("MemberService userCheck1()");
		 
		 return memberDAO.userCheck1(memberDTO);
	}

	
	public void insertOneBoard(OneBoardDTO oneboardDTO) {
        memberDAO.insertOneBoard(oneboardDTO);
    }

	  public List<OneBoardDTO> findByItemNum(int item_num) {
	       return memberDAO.findByItemNum(item_num);
	  }
 
	  public List<OneBoardDTO> findByItemNum2(int member_num) {
	       return memberDAO.findByItemNum2(member_num);
	  }
	  
	  public List<OneBoardDTO> findByOneBoardNum(int one_board_num) {
	       return memberDAO.findByOneBoardNum(one_board_num);
	  }
	  
	  public OneBoardDTO getOneBoard(int one_board_num) {
	        return memberDAO.getOneBoard(one_board_num);
	    }
	  
	  public void updateOneBoard(OneBoardDTO OneBoard) {
	        memberDAO.updateOneBoard(OneBoard);
	    }
	
	// 막내 리뷰별점 갯수기능
	 public int getReviewCountByItemNum(int item_num) {
	     return memberDAO.getReviewCountByItemNum(item_num);
	 }

	 public double getAverageReviewStarByItemNum(int item_num) {
		  Double averageReviewStar = memberDAO.getAverageReviewStarByItemNum(item_num);
		  return averageReviewStar == null ? 0.0 : averageReviewStar;
	 }

	 // 마이페이지 리뷰 -막내
	 public List<MemberDTO> getItemMyReview(int member_num) {
	        return memberDAO.getItemMyReview(member_num);
	    }
	 
	 // 구매내역 불러오기  
	 public List<MemberDTO> getItemOrder(int member_num, int item_num) {
		    // MemberDTO 객체를 포함하는 원래의 리스트
		    return memberDAO.getItemOrder(member_num, item_num);
		}  
	 
	 // 마이페이지 리뷰 수정 기능   
	 public void updateReview(int review_num, int review_star, String review_title, String review_content, String review_img) {
		 memberDAO.updateReview(review_num, review_star, review_title, review_content, review_img);
	}
	
	 // 마이페이지 리뷰 삭제 기능 
	 public boolean deleteReview(int review_num, int member_num) {
		 return memberDAO.deleteReview(review_num, member_num) > 0;
	 }
	
	 
	public void updateInCart(HashMap<String, Object> cart) {
		memberDAO.updateInCart(cart);
	}
	
	public void insertWishlist(WishlistDTO wishlistDTO) {
	    memberDAO.insertWishlistItem(wishlistDTO);
	  }
	
	public WishlistDTO selectWishlist(WishlistDTO wishlistDTO) {
		return memberDAO.selectWishlist(wishlistDTO);
	}

	public List<WishlistDTO> selectWishlistget(int member_num) {
		return memberDAO.selectWishlistget(member_num);
	}
	
	public List<WishlistDTO> getzzimlist(int member_num) {
		return memberDAO.getzzimlist(member_num);
	}
	
	public void deleteWishlist(WishlistDTO wishlistDTO) {
		memberDAO.deleteWishlist(wishlistDTO);
	}
	
	public String insertOrders(HashMap<String, Object> payInfo) {
		System.out.println("MemberService insertOrders" + payInfo );
		memberDAO.insertOrders(payInfo);
		String order_num = (String) payInfo.get("order_num");
		System.out.println(order_num);
		
		return order_num;
	}


	
    public Map<String, Object> getMemberDetails(int memberNum) {
    	System.out.println("서비스");
		System.out.println("서비스"+memberNum);
        return memberDAO.getMemberDetails(memberNum);
    }
    
    // 카트 안 수량조회 
    public int countCart(int member_num) {
        return memberDAO.countCart(member_num);
    }
    
	
	// 주문완료 후 카트 다 지우기 
	public void deleteAllCart(HashMap<String, Object> cart) {
		memberDAO.deleteAllCart(cart);
	}

	public List<Map<String, Object>> getOrderList(int member_num) {
		return memberDAO.getOrderList(member_num);
	}

	public List<Map<String, Object>> getOrderPay(int member_num) {
		return memberDAO.getOrderPay(member_num);
	}

	public List<Map<String, Object>> getOrderDetail(int member_num, String order_num) {
	    return memberDAO.getOrderDetail(member_num, order_num);
	}

	public void cancelOrder(HashMap<String, Object> cancel) {
		memberDAO.cancelOrder(cancel);
	}

	public void cancelInsert(HashMap<String, Object> cancel) {
		memberDAO.cancelInsert(cancel);
	}

	public void updateItemLeft(Map<String, Object> orderDetail) {
		memberDAO.updateItemLeft(orderDetail);
	}

	public void clearCart(int member_num) {
		memberDAO.clearCart(member_num);
	}
	public List<Map<String, Object>> getCancelList(String orderNum) {
		return memberDAO.getCancelList(orderNum);
	}

	public void cancelUpdate(HashMap<String, Object> cancel) {
		 memberDAO.cancelUpdate(cancel);
	}

	public void cancelDelete(HashMap<String, Object> cancel) {
		 memberDAO.cancelDelete(cancel);
	}
	
    public List<HashMap> searchId(String email) {
        return memberDAO.searchId(email);
    }
    
    public List<HashMap> searchPwd(String email, String id) {
        return memberDAO.searchPwd(email, id);
    }
    
    public List<HashMap> updatePwd(String email, String id) {
        return memberDAO.updatePwd(email, id);
    }


	public void withdrawMember(MemberDTO memberDTO) {
		
		System.out.println("MemberService withdrawMember()");
		
		memberDAO.withderawMember(memberDTO);
		
	}
	
	public MemberDTO getMemberEmail(String member_email) {
		System.out.println("MemberService getMemberEmail()");
		return memberDAO.getMemberEmail(member_email);
	}

}
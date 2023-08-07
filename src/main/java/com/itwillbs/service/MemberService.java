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
		 System.out.println("MemberDAO nuserCheck() 확인");
		 if (memberDAO.nuserCheck(memberDTO) == null) {
		        System.err.println("sqlSession is null!");
		        return null;
		    }
	     return memberDAO.nuserCheck(memberDTO);
	    }
	
	public void ninsertMember(MemberDTO memberDTO) {
	    System.out.println("MemberService ninsertMemberk() 확인!!!");

	    // ninsertMember 메서드 호출
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
		 System.out.println("MemberService userCheck()");
		 
		 return memberDAO.userCheck(memberDTO);
	 }


	public MemberDTO getMember(String member_id) {
		System.out.println("MemberService getMember()");
		
		return memberDAO.getMember(member_id);
	}
	
	public MemberDTO userCheck0(MemberDTO memberDTO) {
		 System.out.println("MemberService userCheck0()");
		 
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
        System.out.println("service 리뷰작성");
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
		System.out.println("MemberService insertOneBoard()");
        memberDAO.insertOneBoard(oneboardDTO);
    }

//    public List<MemberDTO> getOneBoardList() {
//        return memberDAO.getOneBoardList();
//    }
	
	
	  public List<OneBoardDTO> findByItemNum(int item_num) {
		  System.out.println("1대1문의 노출");
	       return memberDAO.findByItemNum(item_num);
	  }
 
	  // 서영 :  마이페이지에서 1대1문의 표시하기(member_num) 기준이라서 상품디테일이랑 불러오는게 좀다름
	  public List<OneBoardDTO> findByItemNum2(int member_num) {
		  System.out.println("1대1문의 노출");
	       return memberDAO.findByItemNum2(member_num);
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

//		    // MemberDTO 객체를 문자열로 변환하여 새 리스트에 추가
//		    List<String> stringList = new ArrayList<>();
//		    for (MemberDTO dto : originalList) {
//		        stringList.add(dto.toString());
//		    }
//
//		    return stringList;
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

	
	    
//	  public int removeFromWishlist(int item_num) {
//	    return memberDAO.deleteWishlistItem(item_num);
//	  }

	public void deleteWishlist(WishlistDTO wishlistDTO) {
		memberDAO.deleteWishlist(wishlistDTO);
	}
	
	public void insertOrders(HashMap<String, Object> payInfo) {
		memberDAO.insertOrders(payInfo);
		System.out.println("MemberService insertOrders");

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
	
}

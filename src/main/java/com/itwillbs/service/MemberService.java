package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OneBoardDTO;

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
	
	/* sungha 07.29 마이페이지*/
	public MemberDTO getMember1(Integer member_num) {
		
		System.out.println("MemberService getMember1()");
		
		return memberDAO.getMember1(member_num);
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
 
	
	// 막내 리뷰별점 갯수기능
	 public int getReviewCountByItemNum(int item_num) {
	     return memberDAO.getReviewCountByItemNum(item_num);
	 }

	 public double getAverageReviewStarByItemNum(int item_num) {
		  Double averageReviewStar = memberDAO.getAverageReviewStarByItemNum(item_num);
		  return averageReviewStar == null ? 0.0 : averageReviewStar;
	 }
	
	
	
	
}

package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

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
	
	
	// 카트 조지는중 ... 
	public void insertCart(HashMap<String, String> cartProduct) {
		System.out.println("insertCart 확인!!!");
		System.out.println(cartProduct);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		memberDAO.insertCart(cartProduct);
	}
	

	
	 
}

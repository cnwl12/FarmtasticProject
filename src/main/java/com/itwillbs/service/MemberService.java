package com.itwillbs.service;

import java.sql.Timestamp;
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
		System.out.println("MemberService nuserCheck() 확인!!!");
		
		    MemberDTO existingMember = memberDAO.nuserCheck(memberDTO);
		    return existingMember;
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
	 
	 
	 // 아이디 중복검사 - 해결안됌
//		public boolean checkIdDuplicate(String memberId) {
//	  // DAO에서 반환된 중복 개수를 확인하여 결과 반환
//		return memberDAO.checkIdDuplicate(memberId) > 0;
//	}
	 
	 public MemberDTO userCheck(MemberDTO memberDTO) {
		 System.out.println("MemberService userCheck()");
		 
		 return memberDAO.userCheck(memberDTO);
	 }
	 
}

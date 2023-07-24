package com.itwillbs.service;

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
	
	public void nuserCheck(MemberDTO memberDTO) {
		System.out.println("MemberService nuserCheck() 확인!!!");
		
		// insertMember 메서드 호출
		memberDAO.nuserCheck(memberDTO);
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
	

	
	 
}

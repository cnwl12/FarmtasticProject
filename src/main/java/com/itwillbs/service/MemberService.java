package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberService {
	
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
		
		

}

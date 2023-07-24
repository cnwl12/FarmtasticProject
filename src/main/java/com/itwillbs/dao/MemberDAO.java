package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO; 

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

	public void nuserCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO nuserCheck() 확인");
		
		sqlSession.insert(namespace+".nuserCheck", memberDTO); 
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

	public MemberDTO getMember(String member_id) {
		System.out.println("MemberDAO getMember");
		return sqlSession.selectOne(namespace+".getMember", member_id);
	}

}

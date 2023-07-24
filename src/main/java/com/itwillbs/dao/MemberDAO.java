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

//	public MemberDTO nuserCheck(MemberDTO memberDTO) {
//		System.out.println("MemberDAO nuserCheck() 확인");
//
//	    // sqlSession.selectOne을 사용해서 멤버를 조회하고 결과를 반환
//	    MemberDTO existingMember = sqlSession.selectOne(namespace + ".nuserCheck", memberDTO);
//
//	    // 사용자를 찾았다면
//	    if (existingMember != null) {
//	        // MemberDTO 객체를 반환합니다.
//	        return existingMember;
//	    } else return null;
//	}
//	
//	public void ninsertMember(MemberDTO memberDTO) {
//		System.out.println("MemberDAO ninsertMember() 확인");
//		
//		sqlSession.insert(namespace+".ninsertMember", memberDTO); 
//	}
	
	 public MemberDTO nuserCheck(MemberDTO memberDTO) {
		 System.out.println("MemberDAO nuserCheck() 확인");
	     return sqlSession.selectOne(namespace+".nuserCheck", memberDTO);
	    }

	 public void ninsertMember(MemberDTO memberDTO) {
		 System.out.println("MemberDAO ninsertMember() 확인");
	    sqlSession.insert(namespace+".ninsertMember", memberDTO); 
	 }
	 
//	 public MemberDTO getMemberByNaverId(String naver_id) {
//	        System.out.println("MemberDAO getMemberByNaverId() 확인");
//
//	        // sqlSession.selectOne() 메소드를 사용하여 멤버를 조회하고 결과를 반환
//	        MemberDTO existingMember = sqlSession.selectOne(namespace + ".getMemberByNaverId", naver_id);
//
//	        return existingMember;
//	 }

	public List<Map<String, Object>> getMembers() {
		return sqlSession.selectList("MemberMapper.getMembers");
	}
	
	public void changeMemberStatus(List<String> memberNums) {
		System.out.println("MemberDAO changeMemberStatus 확인");
	    sqlSession.update("MemberMapper.changeMemberStatus", memberNums);
	}
	
//	아이디 중복검사 - 해결안됌
//	 public int checkIdDuplicate(String memberId) {
//    return sqlSession.selectOne("checkIdDuplicate", memberId);
//}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAO userCheck()");
		
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

}

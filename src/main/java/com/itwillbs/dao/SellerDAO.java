package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.MemberDTO;



@Repository
public class SellerDAO {
	
	//mapper파일 이름 => 변수 정의
	private static final String namespace = "SellerMapper";
	@Autowired
	   private SqlSession sqlSession;

	    public List<Map<String, Object>> getSellers() {
	        return sqlSession.selectList("SellerMapper.getSellers");
	    }
	
	    public void itemInsert(HashMap<String, String> itemList,  List<MultipartFile> files) {
	    	System.out.println("오나요");
	        sqlSession.insert(namespace + ".itemInsert", itemList);
	    }

		
	
}

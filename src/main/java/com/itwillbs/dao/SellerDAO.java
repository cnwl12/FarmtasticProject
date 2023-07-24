package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SellerDAO {
	
	//mapper파일 이름 => 변수 정의
	private static final String namespace = "SellerMapper";
	@Autowired
	   private SqlSession sqlSession;

	    public List<Map<String, Object>> getSellers() {
	        return sqlSession.selectList("SellerMapper.getSellers");
	    }


		public void itemInsert(HashMap<String, String> itemList) {
	        sqlSession.insert(namespace + ".itemInsert", itemList);
			
		}


		public List<Map<String, Object>> getItems() {
			System.out.println("List 오나요");
			return sqlSession.selectList(namespace + ".getItems");
		}

		public List<Map<String, Object>> getSales() {
			return sqlSession.selectList(namespace + ".getSales");
		}

	
}

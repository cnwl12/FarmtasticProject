package com.itwillbs.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AdminDTO;

@Repository
public class AdminDAO {
	/*map 사용할때 로그인
	 * @Autowired private SqlSession sqlSession;
	 * 
	 * private static final String NAMESPACE = "adminMapper.";
	 * 
	 * public Map<String, Object> adminCheck(String admin_id) { return
	 * sqlSession.selectOne(NAMESPACE + "adminCheck", admin_id); }
	 * 
	 */
	
    @Autowired
    private SqlSession sqlSession;
    private static final String NAMESPACE = "adminMapper.";

    public AdminDTO adminCheck(String admin_id) {
    	System.out.println("dao");
        return sqlSession.selectOne(NAMESPACE + "adminCheck", admin_id);
    }

	public List<Map<String, Object>> getCnotice() {
		System.out.println("dao");
		return sqlSession.selectList(NAMESPACE+"getCnotice");
	}  
	/*
	public void insertNotice(Map<String, Object> params) {
	     sqlSession.insert(NAMESPACE + "insertNotice", params);
	}
	 */
	public void insertNotice(HashMap<String, String> noticeList) {
		sqlSession.insert(NAMESPACE + "insertNotice",noticeList);
		
	}

	public Map<String, Object> getNotice(String admin_cs_num) {
	    return sqlSession.selectOne(NAMESPACE + "getNotice", admin_cs_num);
	}

}
	
	
    

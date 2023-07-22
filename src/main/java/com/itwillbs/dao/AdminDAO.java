package com.itwillbs.dao;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "adminMapper.";

    public Map<String, Object> adminCheck(String admin_id) {
        return sqlSession.selectOne(NAMESPACE + "adminCheck", admin_id);
    }
}
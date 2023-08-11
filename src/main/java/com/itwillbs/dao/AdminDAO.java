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
    //관리자 정보
	 public Map<String, Object> getAdminInfo(String admin_id) {
			
			System.out.println("AdminDAO getAdminInfo 매핑완");
			return sqlSession.selectOne(NAMESPACE+"getAdminInfo", admin_id);
		}
		
// 글 목록
	public List<Map<String, Object>> getCnotice() {
		System.out.println("dao");
		return sqlSession.selectList(NAMESPACE+"getCnotice");
	}  
	/*
	public void insertNotice(Map<String, Object> params) {
	     sqlSession.insert(NAMESPACE + "insertNotice", params);
	}
	 */
//	글 작성
	public void insertNotice(HashMap<String, String> noticeList) {
		sqlSession.insert(NAMESPACE + "insertNotice",noticeList);
		
	}
//  글 내용
	public Map<String, Object> getNotice(int admin_cs_num) {
	    return sqlSession.selectOne(NAMESPACE + "getNotice", admin_cs_num);
	}
//	글 수정
	public void updateContent(int admin_cs_num, String admin_csnotice_sub, String admin_cs_view) {
	        HashMap<String, Object> params = new HashMap<String, Object>();
	        params.put("admin_cs_num", admin_cs_num);
	        params.put("admin_csnotice_sub", admin_csnotice_sub);
	        params.put("admin_cs_view", admin_cs_view);

	        sqlSession.update(NAMESPACE+"updateContent", params);
	}
//	글 삭제
	 public void deleteContent(int admin_cs_num) {
		    sqlSession.delete(NAMESPACE+"deleteContent", admin_cs_num);
	 }
	 
	// 제철팜 글목록 가져오기
	public List<Map<String, Object>> getBlog() {
		System.out.println("AdminDAO getBlog 매핑완");
		return sqlSession.selectList(NAMESPACE + "getBlog");
	}
	
	// 제철팜 글내용 가져오기
	public Map<String, Object> getblogContent(int admin_blog_num) {
		System.out.println("AdminDAO getblogContent 매핑완");
		return sqlSession.selectOne(NAMESPACE + "getblogContent", admin_blog_num);
	}
	
	// 제철팜 글쓰기
	public void insertBlog(HashMap<String, String> blognoticeList) {
		System.out.println("AdminDAO insertBlog 매핑완");
		sqlSession.insert(NAMESPACE + "insertBlog", blognoticeList);
	}  
	
	// 제철팜 글수정
	public void blogUpdatePro(int admin_blog_num, String admin_blog_sub, String admin_blog_content) {
		System.out.println("AdminDAO getblogContent 매핑완");
		
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("admin_blog_num", admin_blog_num);
        params.put("admin_blog_sub", admin_blog_sub);
        params.put("admin_blog_content", admin_blog_content);

        sqlSession.update(NAMESPACE + "blogUpdate", params);
	}
	
	// 제철팜 글삭제
	public void blogDelete(int admin_blog_num) {
		System.out.println("AdminDAO blogDelete 매핑완");
		
		sqlSession.delete(NAMESPACE + "blogDelete", admin_blog_num);
	}

	
}
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
	 public void updateAdmin(Map<String, Object> params) {
		    sqlSession.update(NAMESPACE + "updateAdmin", params);
	}
	 public void updateNicknameAndBirth(Map<String, Object> params) {
		    sqlSession.update(NAMESPACE + "updateNicknameAndBirth", params);
	}
	
// 글 목록
	public List<Map<String, Object>> getCnotice() {
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
	 
	// 제철팜 소비자 화면
	public List<Map<String, Object>> getBlog(Map<String, Integer> bMap) {

		return sqlSession.selectList(NAMESPACE + "getBlog", bMap);
	}
	
    // 제철팜 관리자 화면
	public List<Map<String, Object>> getBlogMng() {

        return sqlSession.selectList(NAMESPACE + "getBlogMng");
	}
	
	// 제철팜 글내용 가져오기
	public Map<String, Object> getblogContent(int admin_blog_num) {

		return sqlSession.selectOne(NAMESPACE + "getblogContent", admin_blog_num);
	}
	
	// 제철팜 글쓰기
	public void insertBlog(HashMap<String, String> blognoticeList) {

		sqlSession.insert(NAMESPACE + "insertBlog", blognoticeList);
	}  
	
	// 제철팜 글수정
	public void blogUpdatePro(int admin_blog_num, String admin_blog_mainTitle, String admin_blog_subTitle, String admin_blog_content, List<String> storedFileNames) {
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("admin_blog_num", admin_blog_num);
	    params.put("admin_blog_mainTitle", admin_blog_mainTitle);
	    params.put("admin_blog_subTitle", admin_blog_subTitle);
	    params.put("admin_blog_content", admin_blog_content);
	    params.put("admin_blog_files", storedFileNames);

	    sqlSession.update(NAMESPACE + "blogUpdate", params);
	}
	
	// 제철팜 글삭제
	public void blogDelete(int admin_blog_num) {
		
		sqlSession.delete(NAMESPACE + "blogDelete", admin_blog_num);
	}

	// 제철팜 디테일 이런 레시피는 어떠세요?
	public List<Map<String, Object>> getAllPosts() {

	    return sqlSession.selectList(NAMESPACE + "getAllPosts");
	}
	
	// 제철팜 페이징 처리
	public int getBlogCount() {

		return sqlSession.selectOne(NAMESPACE + "getBlogCount");
	}
	
	// 관리자 -> 판매자 상품전체목록
	public List<Map<String, Object>> getItemList() {
		return sqlSession.selectList(NAMESPACE+"getItemList");
	}
	
	// 관리자 -> 판매 상태 변경 
	public void ChangeItemStatus(HashMap<String, String> status) {
		sqlSession.update(NAMESPACE+"ChangeItemStatus", status);
	}
	public void insertCate(HashMap<String, String> category) {
		sqlSession.insert(NAMESPACE+"insertCate", category);
	}
}
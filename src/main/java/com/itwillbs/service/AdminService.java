package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdminDTO;

@Service
public class AdminService {
	
	  @Autowired private AdminDAO adminDAO;
	  /*map사용시 
	 * public Map<String, Object> adminCheck(String admin_id) { return
	 * adminDAO.adminCheck(admin_id); }
	 */
	
	public AdminDTO adminCheck(String admin_id) {
	    return adminDAO.adminCheck(admin_id);
	    }
	public Map<String, Object> getAdminInfo(String admin_id) {
		return adminDAO.getAdminInfo(admin_id);
	}
	// AdminService.java
	public void updateNicknameAndBirth(String admin_id, String admin_nickname, String admin_birth) {
		HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("admin_id", admin_id);
        params.put("admin_nickname", admin_nickname);
        params.put("admin_birth", admin_birth);
        adminDAO.updateNicknameAndBirth(params);
	}

    public void updateAdmin(String admin_id, String newPass, String admin_nickname, String admin_birth) {
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("admin_id", admin_id);
        params.put("newPass", newPass);
        params.put("admin_nickname", admin_nickname);
        params.put("admin_birth", admin_birth);
        adminDAO.updateAdmin(params);
    }

    
	public List<Map<String, Object>> getCnotice() {
        return adminDAO.getCnotice();
	}
	
	public void insertNotice(HashMap<String, String> noticeList, List<MultipartFile> files,HttpSession session) {
        adminDAO.insertNotice(noticeList); // DB저장 코드 
	}

	public Map<String, Object> getNotice(int admin_cs_num) {
	    return adminDAO.getNotice(admin_cs_num);
	}

    public void updateContent(int admin_cs_num, String admin_csnotice_sub, String admin_cs_view) {
        adminDAO.updateContent(admin_cs_num, admin_csnotice_sub, admin_cs_view);
    }

    public void deleteContent(int admin_cs_num) {
        adminDAO.deleteContent(admin_cs_num);
    }
 
    // 제철팜 소비자 화면
	public List<Map<String, Object>> getBlog(Map<String, Integer> bMap) {
		//시작하는 행번호 구하기
		int startRow = (bMap.get("currentPage")-1)*bMap.get("pageSize")+1;
		//끝나는 행번호 구하기
		int endRow = startRow + (bMap.get("pageSize") -1);
        bMap.put("startRow", startRow - 1);
        bMap.put("endRow", endRow);
        return adminDAO.getBlog(bMap);
	}

    // 제철팜 관리자 화면
	public List<Map<String, Object>> getBlogMng() {

        return adminDAO.getBlogMng();
	}
	
	// 제철팜 글내용 가져오기
	public Map<String, Object> getblogContent(int admin_blog_num) {

	    return adminDAO.getblogContent(admin_blog_num);
	}

	// 제철팜 글쓰기
	public void insertBlog(HashMap<String, String> blognoticeList, List<MultipartFile> blogFiles, HttpSession session) {

		adminDAO.insertBlog(blognoticeList); // DB저장 코드 
	}
    
	// 제철팜 글수정
	public void blogUpdatePro(int admin_blog_num, String admin_blog_mainTitle, String admin_blog_subTitle, String admin_blog_content, List<String> storedFileNames) {
	    
		adminDAO.blogUpdatePro(admin_blog_num, admin_blog_mainTitle, admin_blog_subTitle, admin_blog_content, storedFileNames);
	}

    // 제철팜 글삭제
	public void blogDelete(int admin_blog_num) {

		adminDAO.blogDelete(admin_blog_num);
	}
	
	// 제철팜 디테일 이런 레시피는 어떠세요?
	public List<Map<String, Object>> getAllPosts() {

	    return adminDAO.getAllPosts();
	}
	
	// 제철팜 페이징 처리
	public int getBlogCount() {

		return adminDAO.getBlogCount();
	}
	public List<Map<String, Object>> getItemList() {
		return adminDAO.getItemList();
	}
	public void ChangeItemStatus(HashMap<String, String> status) {
		adminDAO.ChangeItemStatus(status);
	}
	
	public void insertCate(String sellerType, String typeName) {
	    adminDAO.insertCate(sellerType, typeName);
	}
	
	public List<Map<String, Object>> getTypes() {
		return adminDAO.getTypes();
	}
	public void deleteCate(List<String> selectedTypes) {
		adminDAO.deleteCate(selectedTypes);
	}


}
package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		System.out.println("adminService의 getAdminInfo 매핑완");
		return adminDAO.getAdminInfo(admin_id);
	}

	public List<Map<String, Object>> getCnotice() {
		System.out.println("서비스 Cnotice() 확인!");
        return adminDAO.getCnotice();
	}
	/*
	 public void insertBoard(String writer, String title, String content) {
	     Map<String, Object> params = new HashMap<String, Object>();
	     params.put("writer", writer);
	     params.put("title", title);
	     params.put("content", content);
	     adminDAO.insertNotice(params);
	}	
	 */
	public void insertNotice(HashMap<String, String> noticeList, List<MultipartFile> files,HttpSession session) {
		System.out.println("insertBoard 확인!!!");
        adminDAO.insertNotice(noticeList); // DB저장 코드 
	}

	public Map<String, Object> getNotice(int admin_cs_num) {
	    System.out.println("서비스 getNoticeNum() 확인!");
	    return adminDAO.getNotice(admin_cs_num);
	}

    public void updateContent(int admin_cs_num, String admin_csnotice_sub, String admin_cs_view) {
        adminDAO.updateContent(admin_cs_num, admin_csnotice_sub, admin_cs_view);
    }

    public void deleteContent(int admin_cs_num) {
        adminDAO.deleteContent(admin_cs_num);
    }
 
    // 제철팜 글목록 가져오기
	public List<Map<String, Object>> getBlog() {
		System.out.println("AdminService getBlog 매핑완");
        return adminDAO.getBlog();
	}
	
	// 제철팜 글내용 가져오기
	public Map<String, Object> getblogContent(int admin_blog_num) {
	    System.out.println("AdminService getblogContent 매핑완");
	    return adminDAO.getblogContent(admin_blog_num);
	}

	// 제철팜 글쓰기
	public void insertBlog(HashMap<String, String> blognoticeList, List<MultipartFile> blogFiles, HttpSession session) {
		System.out.println("AdminService insertBlog 매핑완");
		adminDAO.insertBlog(blognoticeList); // DB저장 코드 
	}
	
	// 제철팜 글수정
    public void blogUpdatePro(int admin_blog_num, String admin_blog_mainTitle, String admin_blog_subTitle, String admin_blog_content) {
    	System.out.println("AdminService blogUpdatePro 매핑완");
        adminDAO.blogUpdatePro(admin_blog_num, admin_blog_mainTitle, admin_blog_subTitle, admin_blog_content);
    }
    
    // 제철팜 글삭제
	public void blogDelete(int admin_blog_num) {
		System.out.println("AdminService blogDelete 매핑완");
		adminDAO.blogDelete(admin_blog_num);
	}
	
	// 제철팜 디테일 이런 레시피는 어떠세요?
	public List<Map<String, Object>> getAllPosts() {
	    System.out.println("AdminService getAllPosts 매핑완");
	    return adminDAO.getAllPosts();
	}
}
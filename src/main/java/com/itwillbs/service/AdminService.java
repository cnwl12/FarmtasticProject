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

	public Map<String, Object> getNotice(String admin_cs_num) {
	    System.out.println("서비스 getNoticeNum() 확인!");
	    return adminDAO.getNotice(admin_cs_num);
	}

    public void updateContent(int admin_cs_num, String admin_csnotice_sub, String admin_cs_view) {
        adminDAO.updateContent(admin_cs_num, admin_csnotice_sub, admin_cs_view);
    }

    public void deleteContent(int admin_cs_num) {
        adminDAO.deleteContent(admin_cs_num);
    }
	
  

}
package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	 public void insertBoard(String writer, String title, String content) {
	     Map<String, Object> params = new HashMap<>();
	     params.put("writer", writer);
	     params.put("title", title);
	     params.put("content", content);
	     adminDAO.insertNotice(params);
	}

}
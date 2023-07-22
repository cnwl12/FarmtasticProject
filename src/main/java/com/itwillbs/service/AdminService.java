package com.itwillbs.service;

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
}
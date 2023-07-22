package com.itwillbs.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;

@Service
public class AdminService {

    @Autowired
    private AdminDAO adminDAO;

    public Map<String, Object> adminCheck(String admin_id) {
        return adminDAO.adminCheck(admin_id);
    }
}
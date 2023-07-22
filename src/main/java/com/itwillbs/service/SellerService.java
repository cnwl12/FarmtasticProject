package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.SellerDAO;

@Service
public class SellerService {
	
	 @Autowired
	    private SellerDAO sellerDAO;

	    public List<Map<String, Object>> getSellers() {
	        return sellerDAO.getSellers();
	    }
		

}

package com.itwillbs.domain;

public class AdminDTO {
	
	private String admin_id;
    private String admin_pass;
    
    
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	@Override
	public String toString() {
		return "AdminDTO [admin_id=" + admin_id + ", admin_pass=" + admin_pass + "]";
	}
    
    
    


}

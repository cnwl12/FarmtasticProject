package com.itwillbs.domain;

import java.sql.Date;

public class MemberDTO {
	
	private int member_num;
	private String member_id;
	private String member_pass;
	private	String member_name;
	private	String member_phone;
	private	String member_email;
	private	String member_nid;
	private String member_post;
	private String member_addMain;
	private String member_addSub;
	private Date member_joinDay;
	
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMember_nid() {
		return member_nid;
	}
	public void setMember_nid(String member_nid) {
		this.member_nid = member_nid;
	}
	public String getMember_post() {
		return member_post;
	}
	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}
	public String getMember_addMain() {
		return member_addMain;
	}
	public void setMember_addMain(String member_addMain) {
		this.member_addMain = member_addMain;
	}
	public String getMember_addSub() {
		return member_addSub;
	}
	public void setMember_addSub(String member_addSub) {
		this.member_addSub = member_addSub;
	}
	public Date getMember_joinDay() {
		return member_joinDay;
	}
	public void setMember_joinDay(Date member_joinDay) {
		this.member_joinDay = member_joinDay;
	}
	
	


}

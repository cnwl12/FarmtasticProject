package com.itwillbs.domain;

import java.sql.Date;

public class PayDTO {
	
	private String order_num;
	private int member_num;
	private String order_pay;
	private String order_post;
	private String order_addMain;
	private String order_addSub;
	private String order_phone;
	private String order_msg;
	private String order_name;
	private Date order_day;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getOrder_pay() {
		return order_pay;
	}
	public void setOrder_pay(String order_pay) {
		this.order_pay = order_pay;
	}
	public String getOrder_post() {
		return order_post;
	}
	public void setOrder_post(String order_post) {
		this.order_post = order_post;
	}
	public String getOrder_addMain() {
		return order_addMain;
	}
	public void setOrder_addMain(String order_addMain) {
		this.order_addMain = order_addMain;
	}
	public String getOrder_addSub() {
		return order_addSub;
	}
	public void setOrder_addSub(String order_addSub) {
		this.order_addSub = order_addSub;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_msg() {
		return order_msg;
	}
	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public Date getOrder_day() {
		return order_day;
	}
	public void setOrder_day(Date order_day) {
		this.order_day = order_day;
	}
	
	
	
	
}

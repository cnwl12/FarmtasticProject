package com.itwillbs.domain;

import java.sql.Date;

public class PayDTO {
	
	private int pay_num;
	private int order_num;
	private Date pay_day;
	private String pay_yn;
	private String pay_pay;
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public Date getPay_day() {
		return pay_day;
	}
	public void setPay_day(Date pay_day) {
		this.pay_day = pay_day;
	}
	public String getPay_yn() {
		return pay_yn;
	}
	public void setPay_yn(String pay_yn) {
		this.pay_yn = pay_yn;
	}
	public String getPay_pay() {
		return pay_pay;
	}
	public void setPay_pay(String pay_pay) {
		this.pay_pay = pay_pay;
	}
	
	
	
	
}

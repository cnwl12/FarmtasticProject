package com.itwillbs.domain;

import java.sql.Date;

public class SellerDTO {

	private String seller_num;
	private String seller_type;
	private String seller_licenseNum;
	private String seller_id;
	private String seller_pass;
	private String seller_pass2;
	private	String seller_name;
	private String seller_storeName;
	private String seller_mobile;
	private	String seller_phone;
	private String seller_bank;
	private String seller_accountNum;
	private String seller_accountHolder;
	private	String seller_email;
	private	String seller_file;
	private String seller_post;
	private String seller_addMain;
	private String seller_addSub;
	private Date seller_joinDay;
	
	
	public String getSeller_num() {
		return seller_num;
	}
	public void setSeller_num(String seller_num) {
		this.seller_num = seller_num;
	}
	public String getSeller_type() {
		return seller_type;
	}
	public void setSeller_type(String seller_type) {
		this.seller_type = seller_type;
	}
	public String getSeller_licenseNum() {
		return seller_licenseNum;
	}
	public void setSeller_licenseNum(String seller_licenseNum) {
		this.seller_licenseNum = seller_licenseNum;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_pass() {
		return seller_pass;
	}
	public void setSeller_pass(String seller_pass) {
		this.seller_pass = seller_pass;
	}
	public String getSeller_pass2() {
		return seller_pass2;
	}
	public void setSeller_pass2(String seller_pass2) {
		this.seller_pass2 = seller_pass2;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_storeName() {
		return seller_storeName;
	}
	public void setSeller_storeName(String seller_storeName) {
		this.seller_storeName = seller_storeName;
	}
	public String getSeller_mobile() {
		return seller_mobile;
	}
	public void setSeller_mobile(String seller_mobile) {
		this.seller_mobile = seller_mobile;
	}
	public String getSeller_phone() {
		return seller_phone;
	}
	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}
	public String getSeller_bank() {
		return seller_bank;
	}
	public void setSeller_bank(String seller_bank) {
		this.seller_bank = seller_bank;
	}
	public String getSeller_accountNum() {
		return seller_accountNum;
	}
	public void setSeller_accountNum(String seller_accountNum) {
		this.seller_accountNum = seller_accountNum;
	}
	public String getSeller_accountHolder() {
		return seller_accountHolder;
	}
	public void setSeller_accountHolder(String seller_accountHolder) {
		this.seller_accountHolder = seller_accountHolder;
	}
	public String getSeller_email() {
		return seller_email;
	}
	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}
	public String getSeller_file() {
		return seller_file;
	}
	public void setSeller_file(String seller_file) {
		this.seller_file = seller_file;
	}
	public String getSeller_post() {
		return seller_post;
	}
	public void setSeller_post(String seller_post) {
		this.seller_post = seller_post;
	}
	public String getSeller_addMain() {
		return seller_addMain;
	}
	public void setSeller_addMain(String seller_addMain) {
		this.seller_addMain = seller_addMain;
	}
	public String getSeller_addSub() {
		return seller_addSub;
	}
	public void setSeller_addSub(String seller_addSub) {
		this.seller_addSub = seller_addSub;
	}
	public Date getSeller_joinDay() {
		return seller_joinDay;
	}
	public void setSeller_joinDay(Date seller_joinDay) {
		this.seller_joinDay = seller_joinDay;
	}
	@Override
	public String toString() {
		return "SellerDTO [seller_num=" + seller_num + ", seller_type=" + seller_type + ", seller_licenseNum="
				+ seller_licenseNum + ", seller_id=" + seller_id + ", seller_pass=" + seller_pass + ", seller_pass2="
				+ seller_pass2 + ", seller_name=" + seller_name + ", seller_storeName=" + seller_storeName
				+ ", seller_mobile=" + seller_mobile + ", seller_phone=" + seller_phone + ", seller_bank=" + seller_bank
				+ ", seller_accountNum=" + seller_accountNum + ", seller_accountHolder=" + seller_accountHolder
				+ ", seller_email=" + seller_email + ", seller_file=" + seller_file + ", seller_post=" + seller_post
				+ ", seller_addMain=" + seller_addMain + ", seller_addSub=" + seller_addSub + ", seller_joinDay="
				+ seller_joinDay + "]";
	}
	
}

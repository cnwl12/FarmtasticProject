package com.itwillbs.domain;

import java.sql.Date;

public class WishlistDTO {
	private int like_farm_num;
	private int item_num;
	private int member_num;
	private Date like_farm_day;
	private String item_name;
	private String item_mainImg;
	private String item_price;
	private String seller_storeName;
	
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_mainImg() {
		return item_mainImg;
	}
	public void setItem_mainImg(String item_mainImg) {
		this.item_mainImg = item_mainImg;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getSeller_storeName() {
		return seller_storeName;
	}
	public void setSeller_storeName(String seller_storeName) {
		this.seller_storeName = seller_storeName;
	}
	public int getLike_farm_num() {
		return like_farm_num;
	}
	public void setLike_farm_num(int like_farm_num) {
		this.like_farm_num = like_farm_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public Date getLike_farm_day() {
		return like_farm_day;
	}
	public void setLike_farm_day(Date like_farm_day) {
		this.like_farm_day = like_farm_day;
	}
}

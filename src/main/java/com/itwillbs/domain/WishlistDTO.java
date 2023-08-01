package com.itwillbs.domain;

import java.sql.Date;

public class WishlistDTO {
	private int like_farm_num;
	private int item_num;
	private int member_num;
	private Date like_farm_day;
	
	
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

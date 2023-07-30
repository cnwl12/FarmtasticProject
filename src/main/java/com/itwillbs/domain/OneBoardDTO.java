package com.itwillbs.domain;

import java.sql.Date;

public class OneBoardDTO {
	private int one_board_num;
	private String one_board_type;
	private String one_board_title;
	private String one_board_content;
	private String one_board_file;
	private String one_board_pass;
	private Date one_board_day;
	private String one_board_repYn;
	private String one_board_private;
	private int item_num;
	private int member_num;
	
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getOne_board_num() {
		return one_board_num;
	}
	public void setOne_board_num(int one_board_num) {
		this.one_board_num = one_board_num;
	}
	public String getOne_board_type() {
		return one_board_type;
	}
	public void setOne_board_type(String one_board_type) {
		this.one_board_type = one_board_type;
	}
	public String getOne_board_title() {
		return one_board_title;
	}
	public void setOne_board_title(String one_board_title) {
		this.one_board_title = one_board_title;
	}
	public String getOne_board_content() {
		return one_board_content;
	}
	public void setOne_board_content(String one_board_content) {
		this.one_board_content = one_board_content;
	}
	public String getOne_board_file() {
		return one_board_file;
	}
	public void setOne_board_file(String one_board_file) {
		this.one_board_file = one_board_file;
	}
	public String getOne_board_pass() {
		return one_board_pass;
	}
	public void setOne_board_pass(String one_board_pass) {
		this.one_board_pass = one_board_pass;
	}
	public Date getOne_board_day() {
		return one_board_day;
	}
	public void setOne_board_day(Date one_board_day) {
		this.one_board_day = one_board_day;
	}
	public String getOne_board_repYn() {
		return one_board_repYn;
	}
	public void setOne_board_repYn(String one_board_repYn) {
		this.one_board_repYn = one_board_repYn;
	}
	public String getOne_board_private() {
		return one_board_private;
	}
	public void setOne_board_private(String one_board_private) {
		this.one_board_private = one_board_private;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

}
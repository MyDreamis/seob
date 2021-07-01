package com.camp.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pwd;
	private String name;
	private int year;
	private int month;
	private int day;
	private String gender;
	private String zip;
	private String addr;
	private String addr1;
	private String addr2;
	private String phone01;
	private String phone02;
	private String phone03;
	private String mail_id;
	private String mail_domain;
	private String c_date;
	private int c_state;
	private String c_delcont;
	private String c_delete;
	
	private int startrow;
	private int endrow;
	
	private String find_field;
	private String find_name;

}

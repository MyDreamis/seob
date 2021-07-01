package com.camp.vo;

import lombok.Data;

@Data
public class CommunityVO {
	
	private int c_no;
	private String c_id;
	private String c_title;
	private String c_cont;
	private String c_file;
	private int c_hit;
	private int c_ref;
	private int c_step;
	private int c_level;
	private String c_date;
	private int r_count;
	
	private int startrow;
	private int endrow;
	
	private String find_name;
	private String find_field;

}

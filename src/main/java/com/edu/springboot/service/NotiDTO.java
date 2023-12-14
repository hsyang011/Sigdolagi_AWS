package com.edu.springboot.service;

import lombok.Data;

@Data
public class NotiDTO {
	private String noticeboard_idx;
	private String nickname;
	private String email;
	private String title;
	private String content;
	private java.sql.Date postdate;
	private int visitcount;
}

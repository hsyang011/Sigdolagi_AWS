package com.edu.springboot.service;

import lombok.Data;

@Data
public class NotiDTO {
	private String NOTICEBOARD_IDX;
	private String ADMIN_NAME;
	private String TITLE;
	private String CONTENT;
	private java.sql.Date REGIDATE;
}

package com.edu.springboot.community;

import lombok.Data;

@Data
public class BoardDTO {
	private String freeboard_idx;
	private String nickname;
	private String title;
	private String content;
	private int visitcount;
	private java.sql.Date postdate;
}

package com.edu.springboot.community;

import lombok.Data;

@Data
public class PhotoBoardDTO {

	private String photoboard_idx;
	private String email; 
	private String title;
	private String content;
	private int visitcount;
	
	private Object ofile;
	private String sfile;
	private java.sql.Date regidate;
	
	
	
	
	
	
	
	
	
	
}

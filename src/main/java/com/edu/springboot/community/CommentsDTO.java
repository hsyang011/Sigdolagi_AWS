package com.edu.springboot.community;

import lombok.Data;

@Data
public class CommentsDTO {
	
	private int comments_idx;
	private String nickname;
	private String content;
	private String postdate;
	private int idx;
	private String email;
	private String tname; 
	private String starRating;


	
	
}

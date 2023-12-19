package com.edu.springboot.firebase;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
/* 3개만 사용하기때문에 지워준다.
 * @AllArgsConstructor
 * 
 * @NoArgsConstructor
 */
public class MessageDTO {
	private String token;
	private String title;
	private String body;
	private String image;
	private String add_data;
//	private Map<String, String> data;
}

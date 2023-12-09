package com.edu.springboot.restaurant;

import lombok.Data;

@Data
public class ParameterDTO {
	
	private String searchField;
	private String searchKeyword;
	private int start;
	private int end;
	
}

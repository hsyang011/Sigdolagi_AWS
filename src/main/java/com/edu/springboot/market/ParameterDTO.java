package com.edu.springboot.market;

import lombok.Data;

@Data
public class ParameterDTO {
	
	private String searchField;
	private String searchKeyword;
	private int start;
	private int end;
	
}

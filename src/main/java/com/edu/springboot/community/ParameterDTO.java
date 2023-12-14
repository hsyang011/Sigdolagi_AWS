package com.edu.springboot.community;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParameterDTO {
	private String searchField;
	private String searchKeyword;
	private String email;
	private int start;
	private int end;
}

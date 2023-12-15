package com.edu.springboot.market;

import lombok.Data;

@Data
public class OrderDTO {
	
	private String order_idx;
	private String email;
	private String name;
	private String phone;
	private String addr1;
	private String addr2;
	private String message;
	private String payment_method;
	private String payment;
	private String point;
	private String payment_date;
	private String zipcode;
	private String nickname;
	private String state;
	
}

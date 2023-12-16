package com.edu.springboot.market;

import lombok.Data;

@Data
public class CartDTO {
	
	private String cart_idx;
	private String prod_idx;
	private String email;
	private String prod_count;
	private String prod_totprice;
	private String prod_name;
	
}

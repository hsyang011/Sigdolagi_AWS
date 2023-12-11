package com.edu.springboot.market;

import lombok.Data;

@Data
public class ProductDTO {
	
	private String prod_idx;
	private String category;
	private String prod_name;
	private String prod_price;
	private String prod_sale;
	private Object prod_thumbnail;
	private String prod_detail;
	private String seller;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private String sub_cate;
	private String inventory;
	private java.sql.Date regidate;
	private String img1_o;
	private String img2_o;
	private String img3_o;
	private String img4_o;
	private String img5_o;
	private String prod_detail_o;
	// 장바구니에 담긴 상품 수량을 저장할 변수
//	private String prod_count;
	
}

package com.edu.springboot.market;

import lombok.Data;

@Data
public class ProductDTO {
	
	private String prod_idx;
	private String category;
	private String prod_name;
	private String prod_price;
	private String prod_sale;
	private String prod_thumbnail;
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
	private Object img1_o;
	private Object img2_o;
	private Object img3_o;
	private Object img4_o;
	private Object img5_o;
	private Object prod_detail_o;
	private Object prod_thumbnail_o;
	// 장바구니에 담긴 상품 수량을 저장할 변수
//	private String prod_count;
	
}

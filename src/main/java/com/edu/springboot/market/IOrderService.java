package com.edu.springboot.market;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderService {
	
	// 결제 테이블에 결제 정보 담기
	public int orderProcess(OrderDTO orderDTO);
	// 결제 완료 후, 장바구니에 담긴 모든 품목 제거
	public int deleteAll(OrderDTO orderDTO);
	
}

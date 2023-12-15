package com.edu.springboot.market;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderService {
	
	// 결제 테이블에 결제 정보 담기
	public int orderProcess(OrderDTO orderDTO);
	// orderDTO로 order_idx를 얻어옵니다.
	public String getOrderIdx(OrderDTO orderDTO);
	// 결제 완료 후, 장바구니에 담긴 모든 품목 제거
	public int updateAll(OrderDTO orderDTO);
	
	//관리자 주문현황목록
	public List<OrderDTO> adminOrderSelect();
	
}

package com.edu.springboot.market;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IOrderService {
	
	// 결제 테이블에 결제 정보 담기
	public int orderProcess(OrderDTO orderDTO);
	// orderDTO로 order_idx를 얻어옵니다.
	public String getOrderIdx(OrderDTO orderDTO);
	// 결제 완료 후, 장바구니에 담긴 모든 품목 제거
	public int updateAll(OrderDTO orderDTO);
	// 나의 주문내역을 가져옵니다.
	public List<OrderDTO> getAllMyOrder(String email);
	// 주문번호로 결제했던 모든 상품을 가져옵니다.
	public List<CartDTO> getCartList(String order_idx);
	
	//관리자 주문현황목록
	public List<OrderDTO> adminOrderSelect();
	//주문내역 가져오기
	public OrderDTO orderView(String idx);
	//주문내역 상품가져오기
	public List<OrderDTO> orderViewList(String idx);
	//주문내역 취소처리
	public int adminOrderDelete(String idx);
	
	
}

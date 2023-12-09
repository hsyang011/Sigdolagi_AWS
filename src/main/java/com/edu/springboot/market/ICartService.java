package com.edu.springboot.market;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.member.MemberDTO;

@Mapper
public interface ICartService {
	
	// 상품이 장바구니에 담겨있는지 확인
	public int getProdIdx(CartDTO cartDTO);
	// 장바구니에 상품을 추가
	public int addToCart1(CartDTO cartDTO);
	public int addToCart2(CartDTO cartDTO);
	// 장바구니에 담긴 상품의 갯수를 증가
	public int updateToCart(CartDTO cartDTO);
	// 장바구니에 담긴 모든 품목의 행을 가져오기
	public List<CartDTO> cartInfo(MemberDTO memberDTO);
	// 장바구니에 담긴 모든 품목의 정보를 가져오기
	public List<ProductDTO> allProductInfo(CartDTO cartDTO);
	// 장바구니에 담긴 상품*수량의 값을 구하기
	public String prodTotPrice(CartDTO cartDTO);
	// 카트 일련번호 가져오기
	public String getCartIdx(CartDTO cartDTO);
	// 상품의 총 가격을 업데이트
	public int updateTotPrice(CartDTO cartDTO);
	// 장바구니 상품 제거
	public int deleteToCart(CartDTO cartDTO);
	
}

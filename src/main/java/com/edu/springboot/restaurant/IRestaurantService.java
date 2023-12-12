package com.edu.springboot.restaurant;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.market.CartDTO;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.member.MemberDTO;


@Mapper
public interface IRestaurantService  {
	
	// 페이징 처리를 위해 게시물의 갯수를 카운트
	public int getTotalCount(ParameterDTO parameterDTO);
	// 상품 목록 (페이징 기능 추가)
	
	// 모든 식당  정보를 가져오기
	public List<RestaurantDTO> allrestaurant(RestaurantDTO restaurantDTO);
	
	
}

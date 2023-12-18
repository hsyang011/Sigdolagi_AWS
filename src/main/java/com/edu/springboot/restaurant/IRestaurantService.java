package com.edu.springboot.restaurant;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.community.CommentsDTO;
import com.edu.springboot.market.CartDTO;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.member.MemberDTO;


@Mapper
public interface IRestaurantService  {
	
	// 페이징 처리를 위해 게시물의 갯수를 카운트
	public int getTotalCount(ParameterDTO parameterDTO);
	// 상품 목록 (페이징 기능 추가)
	
	// 모든 식당  정보를 가져오기
	public List<RestaurantDTO> allrestaurant();
	
	// 식당 10개만 가져오기
	public List<RestaurantDTO> getRestaurant();
	
	//닉네임 가져오기 
	public String getnickname(String email);
	
	//리뷰 쓰기 
	public int writeReview(
		@Param("idx") int idx,
		@Param("content") String content,
		@Param("nickname") String nickname,
		@Param("email") String email
	);
	   
	
	//커멘트테이블 받아오기
	public ArrayList<CommentsDTO> CommentsPage(CommentsDTO commentsDTO);
}

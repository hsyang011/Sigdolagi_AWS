package com.edu.springboot.market;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IProductService {
	
	// 페이징 처리를 위해 게시물의 갯수를 카운트
	public int getTotalCount(ParameterDTO parameterDTO);
	// 상품 목록 (페이징 기능 추가)
	public List<ProductDTO> list(ParameterDTO parameterDTO);
	// 내용보기
	public ProductDTO view(ProductDTO productDTO);
	// 추천상품
	public List<ProductDTO> recommendList(ProductDTO productDTO);
	
	// 관리자 상품 목록
	public List<ProductDTO> adminMaketSelect();
	// 관리자 상품 등록
	public int adminMaketInsert(ProductDTO productDTO);
	// 관리자 상품 삭제
	public int adminMaketDelete(ProductDTO productDTO);
	
}

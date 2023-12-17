package com.edu.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.ParameterDTO;

@Mapper

public interface InquiryBoardService {
	public int write(@Param("email") String email, @Param("category") String category,
	         @Param("title") String title,
	         @Param("content") String content, 
	         @Param("nickname") String nickname
	);
	public int inquiryGetTotalCount(ParameterDTO parameterDTO);
	
	
	//리스트 
	public ArrayList<InquiryDTO> MyInquiryListPage(ParameterDTO parameterDTO);
	
	//인쿼리보드 뷰페이지 
	public InquiryDTO view(InquiryDTO inquiryDTO);
	//관리자 1:1문의 목록
	public List<InquiryDTO> adminInquirySelect();
}


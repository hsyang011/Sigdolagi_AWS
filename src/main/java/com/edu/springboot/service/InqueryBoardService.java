package com.edu.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.community.ParameterDTO;

@Mapper

public interface InqueryBoardService {
	public int write(@Param("email") String email, @Param("category") String category,
	         @Param("title") String title,
	         @Param("content") String content, 
	         @Param("nickname") String nickname
	);
	public int inqueryGetTotalCount(ParameterDTO parameterDTO);
	
	
	//리스트 
	public ArrayList<InqueryDTO> MyInquiryListPage(ParameterDTO parameterDTO);
	
	//관리자 1:1문의 목록
	public List<InqueryDTO> adminInquirySelect();
}


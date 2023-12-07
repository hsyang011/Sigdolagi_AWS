package com.edu.springboot.community;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface IBoardService {
	//paging처리를 위해 게시물의 갯수를 카운트
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<BoardDTO> listPage(ParameterDTO parameterDTO);
	public int write(@Param("_email") String email,
			@Param("_title") String title,
			@Param("_content") String content);
}

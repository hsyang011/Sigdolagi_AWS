package com.edu.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.community.ParameterDTO;

@Mapper
public interface INotiboardService {
	
	 	public int getTotalCount(ParameterDTO parameterDTO);
	 	public ArrayList<NotiDTO> listPage(ParameterDTO parameterDTO);
	 	public int write(
	         @Param("_title") String title,
	         @Param("_content") String content);
	 	public NotiDTO view(NotiDTO notiDTO);
	 	public int edit(NotiDTO notiDTO);
	 	public int delete(String NOTICEBOARD_IDX);
	 	public int update(NotiDTO notiDTO);
	 	
	 	//관리자 공지사항 불러오기
		public List<NotiDTO> adminNoticeSelect();
		//관리자 공지사항 삭제
		public int adminNoticeDelete(String idx);

}

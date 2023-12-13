package com.edu.springboot.community;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IPhotoboardService {
	
	public int photoGetTotalCount(ParameterDTO parameterDTO);
	public ArrayList<PhotoBoardDTO> PhotoListPage(ParameterDTO parameterDTO);
	
	public PhotoBoardDTO photoview(PhotoBoardDTO photoBoardDTO);
	public int photoedit(PhotoBoardDTO photoBoardDTO);
	public int photodelete(String idx);
	public int writeConmments(
			@Param("photoboard_idx") int photoboard_idx,
			@Param("content") String content,
			@Param("nickname") String nickname
			);
	
	
	//커멘트테이블 받아오기
	public ArrayList<CommentsDTO> CommentsPage(CommentsDTO commentsDTO);
	

	//관리자 포토게시판목록
	public List<PhotoBoardDTO> adminPhotoSelect();
	
	
}

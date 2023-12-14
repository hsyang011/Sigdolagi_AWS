package com.edu.springboot.community;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IBoardService {
   //paging처리를 위해 게시물의 갯수를 카운트
   public int getTotalCount(ParameterDTO parameterDTO);
   public ArrayList<BoardDTO> listPage(ParameterDTO parameterDTO);
   public int write(@Param("_email") String email, @Param("_nickname") String nickname,
         @Param("_title") String title,
         @Param("_content") String content);
   
   public BoardDTO view(BoardDTO boardDTO);
   public int edit(BoardDTO boardDTO);
   public int delete(String idx);
   public int update(BoardDTO boardDTO);
   public String getnickname(String email);
   
	public int writeConmments(
			@Param("idx") int idx,
			@Param("content") String content,
			@Param("nickname") String nickname,
			@Param("email") String email
			);
	
	//커멘트테이블 받아오기
	public ArrayList<CommentsDTO> CommentsPage(CommentsDTO commentsDTO);
	
   
   //관리자 자유게시판목록
   public List<BoardDTO> adminFreeSelect();
   //관리자 자유게시판삭제
   public int adminFreeDelete(String idx);
   }
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
   //자유게시판 리스트 
   public ArrayList<BoardDTO> listPage(ParameterDTO parameterDTO);
   //마이페이지에서 내가 쓴 자유게시판 보기  
   public ArrayList<BoardDTO> mylistPage(ParameterDTO parameterDTO);
	
   //자유게시판 글 작성 
   public int write(@Param("_email") String email, @Param("_nickname") String nickname,
         @Param("_title") String title,
         @Param("_content") String content);
   
   //자유게시판 글 보기 
   public BoardDTO view(BoardDTO boardDTO);
   //자유게시판 수정 
   public int edit(BoardDTO boardDTO);
   //자유게시판 삭제 
   public int delete(String idx);
   //자유게시판 조회수 업데이트 
   public int update(BoardDTO boardDTO);
   //자유게시판 닉네임 가져오기 
   public String getnickname(String email);
   //자유게시판 댓글 쓰기 
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
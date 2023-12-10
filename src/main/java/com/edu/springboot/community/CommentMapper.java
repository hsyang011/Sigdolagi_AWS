package com.edu.springboot.community;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	/**
     * 댓글 저장
     * @param params - 댓글 정보
     */
    void save(CommentDTO params);

    /**
     * 댓글 상세정보 조회
     * @param id - PK
     * @return 댓글 상세정보
     */
    CommentDTO findById(String comment_id);

    /**
     * 댓글 수정
     * @param params - 댓글 정보
     */
    void update(CommentDTO params);

    /**
     * 댓글 삭제
     * @param id - PK
     */
    void deleteById(String comment_id);

    /**
     * 댓글 리스트 조회
     * @param postId - 게시글 번호 (FK)
     * @return 댓글 리스트
     */
    List<CommentDTO> findAll(String freeboard_idx);

    /**
     * 댓글 수 카운팅
     * @param postId - 게시글 번호 (FK)
     * @return 댓글 수
     */
    int count(String freeboard_idx);

}

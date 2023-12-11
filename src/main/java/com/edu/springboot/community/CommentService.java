package com.edu.springboot.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentService {


		@Autowired
		CommentMapper commentMapper;
		
	    /**
	     * 댓글 저장
	     * @param params - 댓글 정보
	     * @return Generated PK
	     */
	    @Transactional
	    public String saveComment(CommentDTO params) {
	        commentMapper.save(params);
	        return params.getComment_idx();
	    }

	    /**
	     * 댓글 상세정보 조회
	     * @param id - PK
	     * @return 댓글 상세정보
	     */
	    public CommentDTO findCommentById(final String Comment_id) {
	        return commentMapper.findById(Comment_id);
	    }

	    /**
	     * 댓글 수정
	     * @param params - 댓글 정보
	     * @return PK
	     */
	    @Transactional
	    public String updateComment(final CommentDTO params) {
	        commentMapper.update(params);
	        return params.getComment_idx();
	    }

	    /**
	     * 댓글 삭제
	     * @param id - PK
	     * @return PK
	     */
	    @Transactional
	    public String deleteComment(final String Comment_id) {
	        commentMapper.deleteById(Comment_id);
	        return Comment_id;
	    }

	    /**
	     * 댓글 리스트 조회
	     * @param postId - 게시글 번호 (FK)
	     * @return 특정 게시글에 등록된 댓글 리스트
	     */
	    public List<CommentDTO> findAllComment(final String freeboard_idx) {
	        return commentMapper.findAll(freeboard_idx);
	    }

	}


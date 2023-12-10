package com.edu.springboot.community;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class CommentController {
	

	    private final CommentService commentService;

	    // 신규 댓글 생성
	    @PostMapping("/posts/{postId}/comments")
	    public CommentDTO saveComment(@PathVariable final String Comment_idx, @RequestBody final CommentDTO params) {
	        String comment_id = commentService.saveComment(params);
	        return commentService.findCommentById(comment_id);
	    }

	}


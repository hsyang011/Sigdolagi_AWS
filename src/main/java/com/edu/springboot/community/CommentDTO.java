package com.edu.springboot.community;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CommentDTO {
    private String comment_idx;           // 댓글 번호 (PK)
	private String freeboard_idx;    // 게시글 번호 (FK)
    private String content;    // 내용
    private String nickname;     // 작성자
	private java.sql.Date replydate; // 생성일
	private java.sql.Date modified_date; //최종 수정일시 

}

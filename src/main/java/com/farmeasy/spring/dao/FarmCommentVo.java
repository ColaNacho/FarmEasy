package com.farmeasy.spring.dao;

import lombok.Data;

@Data
public class FarmCommentVo {

	   private int reply_id;         //댓글 번호
	   private int board_id;         //게시판 번호
	   private String m_id;      //회원 ID
	   private int reply_bundle;      //댓글 큰 묶음
	   private int reply_order;      //댓글 순서
	   private int reply_level;      //댓글 층계
	   private String reply_content;   //댓글 내용
	   private String insert_date;      //댓글 작성 날짜
	   private String update_date;      //댓글 수정 날짜
}

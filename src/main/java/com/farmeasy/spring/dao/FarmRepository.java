package com.farmeasy.spring.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public interface FarmRepository {
	
	ArrayList<FarmVO> getBoardList(int p);
	int getTotal();
	
	FarmVO contentView(int board_id);
	void write(FarmVO fvo);
	void replyWrite(FarmVO fvo);
	void boardDelete(int board_id);
	void boardUpdate(FarmVO fvo);
	FarmVO contentViewUpdate(int board_id);
	void insertTest();
	FarmVO replyView(int board_id);
	void insertComment(FarmCommentVo commentVo);
	ArrayList<FarmCommentVo> listComment(int board_id);

	
}

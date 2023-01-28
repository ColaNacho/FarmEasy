package com.farmeasy.spring.dao;

import lombok.Data;

@Data
public class FarmVO {

	//멤버 변수 선언 
	private int board_id;			//게시판 번호 	int bId;
	private String m_id;		//게시글에 올라가는 회원의 ID ;
	private String fe_type;			//회원 유형('N'ormal, 'M'anager)
	private String board_title;		//글 제목 	String bTitle
	private String board_content;	//글 내용	String bContent;
	private String insert_date;		//글 작성 날짜 
	private String update_date;		//글 수정 날짜 	Timestamp bDate;
	private int board_hits;			//조회수 	int bHit;
	private int bGroup;
	private int bStep;
	private int bIndent;
	
	
	
}

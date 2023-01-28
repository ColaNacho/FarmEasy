package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.FarmCommentVo;
import com.farmeasy.spring.dao.FarmRepository;

@Service
public class BCommentInsertService implements BCommentInsertServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(FarmCommentVo commentVo) {
		int board_id = commentVo.getBoard_id();
		System.out.println("서비스에서 보드 아이디 : "+board_id);
		System.out.println("서비스에서 아이디 : "+commentVo.getM_id());
		farmRepository.insertComment(commentVo);
	}
}

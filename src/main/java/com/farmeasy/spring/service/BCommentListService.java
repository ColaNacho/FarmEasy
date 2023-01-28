package com.farmeasy.spring.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.FarmCommentVo;
import com.farmeasy.spring.dao.FarmRepository;
import com.farmeasy.spring.dao.FarmVO;

@Service
public class BCommentListService implements BCommentListServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(int board_id, Model model) {
		ArrayList<FarmCommentVo> comentVo = farmRepository.listComment(board_id);
		System.out.println("서비스 : "+comentVo);
		model.addAttribute("comentVo", comentVo);
	}

}

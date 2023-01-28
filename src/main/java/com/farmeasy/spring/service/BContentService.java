package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.FarmRepository;
import com.farmeasy.spring.dao.FarmVO;

@Service
public class BContentService implements BContentServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(int board_id, Model model) {
		FarmVO farmVO = farmRepository.contentView(board_id);
		System.out.println(farmVO.getBGroup() + "컨텐츠뷰");
		model.addAttribute("content_view", farmVO);
		model.addAttribute("bGroup", farmVO.getBGroup());
	}
}

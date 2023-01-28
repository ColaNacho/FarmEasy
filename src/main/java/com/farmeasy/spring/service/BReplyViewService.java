package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.FarmRepository;
import com.farmeasy.spring.dao.FarmVO;

@Service
public class BReplyViewService implements BContentServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(int board_id, Model model) {
		FarmVO farmVO = farmRepository.replyView(board_id);
		System.out.println(farmVO.getBGroup() + "컨텐츠뷰");
		model.addAttribute("reply_view", farmVO);
	}
}

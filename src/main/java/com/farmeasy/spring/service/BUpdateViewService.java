package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.FarmRepository;
import com.farmeasy.spring.dao.FarmVO;

@Service
public class BUpdateViewService implements BUpdateViewServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(int board_id, Model model) {
		
		FarmVO dto = farmRepository.contentViewUpdate(board_id);
		model.addAttribute("content_view", dto);		
	}

}

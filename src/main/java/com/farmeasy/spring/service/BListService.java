package com.farmeasy.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.FarmRepository;
import com.farmeasy.spring.dao.FarmVO;

@Service
public class BListService implements BListServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(Model model, int p) {
		
		ArrayList<FarmVO> fVo = farmRepository.getBoardList(p);
		int total=0;
		total = farmRepository.getTotal();
		System.out.println(fVo);
		model.addAttribute("list", fVo);
		model.addAttribute("total", total);
	}
}

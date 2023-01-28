package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farmeasy.spring.dao.FarmRepository;

@Service
public class BDeleteService implements BDeleteServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute(int board_id) {
		farmRepository.boardDelete(board_id);
	}
}

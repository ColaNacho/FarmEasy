package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.farmeasy.spring.dao.FarmRepository;

@Service
public class BInsertTestService implements BInsertTestServiceInter{

	@Autowired
	FarmRepository farmRepository;
	
	@Override
	public void execute() {
		farmRepository.insertTest();
	}
}

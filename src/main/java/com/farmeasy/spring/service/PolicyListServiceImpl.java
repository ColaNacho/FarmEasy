package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IPolicyRepository;

@Service
public class PolicyListServiceImpl implements IPolicyService {

	@Autowired
	IPolicyRepository policyRepository;
	
	@Override
	public void execute(Model model) {
		
		model.addAttribute("policyList", policyRepository.getAllPolicyList());
	}

}

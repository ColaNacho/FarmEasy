package com.farmeasy.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IPolicyRepository;

@Service
public class PolicyDetailServiceImpl implements IPolicyService {

	@Autowired
	IPolicyRepository policyRepository;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int policy_id = (int)map.get("policy_id");
		
		model.addAttribute("policy", policyRepository.getPolicy(policy_id));
	}

}

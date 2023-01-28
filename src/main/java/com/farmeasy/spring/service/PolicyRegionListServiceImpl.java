package com.farmeasy.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IPolicyRepository;

@Service
public class PolicyRegionListServiceImpl implements IPolicyService {

	@Autowired
	IPolicyRepository policyRepository;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		String sido = (String)map.get("sido");
		
		model.addAttribute("policyList", policyRepository.getRegionPolicy(sido));
	}

}

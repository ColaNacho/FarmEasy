package com.farmeasy.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmeasy.spring.service.IPolicyService;

@Controller
public class PolicyController {

	@Autowired
	@Qualifier("policyListServiceImpl")
	IPolicyService policyListServiceImpl;
	
	@Autowired
	@Qualifier("policyDetailServiceImpl")
	IPolicyService policyDetailServiceImpl;
	
	@Autowired
	@Qualifier("policyRegionListServiceImpl")
	IPolicyService policyRegionListServiceImpl;
	
	@RequestMapping(value="/b_all_info")
	public String policyAllList(Model model) {
		System.out.println("b_all_info()");
		policyListServiceImpl.execute(model);
		
		return "b_all_info";
	}

	@RequestMapping(value="/b_all_info/{sido}")
	public String policyRegionList(@PathVariable String sido, Model model) {
		System.out.println("b_region_list()");
		model.addAttribute("sido", sido);
		policyRegionListServiceImpl.execute(model);
		
		return "/b_all_info";
	}
	
	@RequestMapping(value="/b_pop_info/{policy_id}")
	public String policyDetail(@PathVariable int policy_id, Model model) {
		System.out.println("b_pop_info()");
		model.addAttribute("policy_id", policy_id);
		policyDetailServiceImpl.execute(model);
		
		return "/b_pop_info";		
	}
	
	
}

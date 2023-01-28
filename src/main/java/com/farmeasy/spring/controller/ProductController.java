package com.farmeasy.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmeasy.spring.service.IProductService;

@Controller
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	IProductService productService;
	
	@RequestMapping(value="/c_bigData/{productName}")
	public String content_view(@PathVariable String productName, Model model) {
		System.out.println("product_view()");
		model.addAttribute("productName", productName);
		productService.execute(model);
		
		return "/c_bigData";
	}
	
}

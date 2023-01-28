package com.farmeasy.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IProductRepository;
import com.farmeasy.spring.model.ProductVO;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	IProductRepository productRepository;
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		String productName = String.valueOf(map.get("productName"));
		//객체 넘기기
		model.addAttribute("product", productRepository.getProduct(productName));
		//그래프 데이터 넘기기
		model.addAttribute("graphDataList", productRepository.getGraphData(productName));
	}

}

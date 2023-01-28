package com.farmeasy.spring.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.farmeasy.spring.model.ProductVO;

@Repository
public interface IProductRepository {

	ProductVO getProduct(String product_name);
	List<Integer> getGraphData(String product_name);
}

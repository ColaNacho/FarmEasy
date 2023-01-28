package com.farmeasy.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.farmeasy.spring.model.ProductVO;

@Repository
public class ProductRepository implements IProductRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class ProductMapper implements RowMapper<ProductVO> {
		@Override
		public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductVO product = new ProductVO();
			product.setProduct_num(rs.getInt("product_num"));
			product.setProduct_year(rs.getInt("product_year"));
			product.setProduct_name(rs.getString("product_name"));
			product.setProduct_month(rs.getInt("product_month"));
			product.setProduct_price(rs.getInt("product_price"));
			product.setPredict_price(rs.getInt("predict_price"));
			product.setCrop_area(rs.getInt("crop_area"));
			product.setCrop_output(rs.getInt("crop_output"));
			product.setOperation_cost(rs.getInt("operation_cost"));
			product.setTemp(rs.getInt("temp"));
			product.setHum(rs.getInt("hum"));
			return product;
		}		
	}
	
	@Override
	public ProductVO getProduct(String product_name) {
		String query = "select * from fe_product where product_year=2022 and product_name like ?";
		return jdbcTemplate.queryForObject(query, new ProductMapper(), product_name);			
	}
	
	@Override
	public List<Integer> getGraphData(String product_name) {
		String query = "select predict_price from fe_product where product_year between 2018 and 2022"
				+ " and product_name like ? order by product_num";
		return jdbcTemplate.query(query, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				int graphData = 0;
				graphData = rs.getInt("predict_price");
				return graphData;
			}
		}, product_name);
	}

}

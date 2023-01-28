package com.farmeasy.spring.model;

import lombok.Data;

@Data
public class ProductVO {

	private int product_num;
	private int product_year;
	private String product_name;
	private int product_month;
	private int product_price;
	private int predict_price;
	private int crop_area;
	private int crop_output;
	private int operation_cost;
	private int temp;
	private int hum;

}

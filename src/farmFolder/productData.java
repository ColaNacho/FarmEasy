package com.farmeasy.toOracle;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import java.sql.*;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class productData {

	public static void main(String[] args) {
		java.sql.Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String filePath ="C:\\workspace\\springFarmEasy\\src\\main\\webapp\\resources\\json\\productData.json"

		long productNum = 0;
		long productYear = 0;
		String productName = "";
		long productMonth = 0;
		long productPrice = 0;
		long predictPrice = 0;
		long cropArea = 0;
		long cropOutput = 0;
		long operationCost = 0;
		double temp = 0;
		double hum = 0;
				
		//insert into JDBC 로직
			
		try {
			String driverClassName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "feDB";
			String password = "1234";
			
			//JDBC Driver Loading
			Class.forName(driverClassName);
			
			//JDBC Connection getting
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB 연결 성공");
			System.out.println("** Driver:" + driverClassName + ", Connection:" + conn);
			
			//JSON 읽어와서 쿼리에 담기위한 사전작업
			Reader reader = new FileReader(filePath);
		    
		    JSONParser parser = new JSONParser();
		    
		    Object obj = parser.parse(reader);
		    JSONArray jsonArr = (JSONArray) obj;
		    
			//SQL문 작성
			String SQL = "insert into product_table(product_num, product_year, product_name, product_month, product_price, predict_price, crop_area, crop_output, operation_cost, temp, hum) values(?,?,?,?,?,?,?,?,?,?,?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			pstmt = conn.prepareStatement(SQL);
			
			//psmt.set<데이터타입><? 순서, 값)
			//다건 JSON객체 (JSONArray)
			if(jsonArr.size()>0) {
				for(int i=0; i<jsonArr.size(); i++) {
					JSONObject jsonObj = (JSONObject)jsonArr.get(i);
					
					productNum = (long)jsonObj.get("product_num");
					productYear = (long)jsonObj.get("product_year");
					productName = (String)jsonObj.get("product_name");
					productMonth = (long)jsonObj.get("product_month");
					productPrice = (long)jsonObj.get("product_price");
					predictPrice = (long)jsonObj.get("predict_price");
					cropArea = (long)jsonObj.get("crop_area");
					cropOutput = (long)jsonObj.get("crop_output");
					operationCost = (long)jsonObj.get("operation_cost");
					temp = (double)jsonObj.get("temp");
					hum = (double)jsonObj.get("hum");
					
					pstmt.setLong(1, productNum);
					pstmt.setLong(2, productYear);
					pstmt.setString(3, productName);
					pstmt.setLong(4, productMonth);
					pstmt.setLong(5, productPrice);
					pstmt.setLong(6, predictPrice);
					pstmt.setLong(7, cropArea);
					pstmt.setLong(8, cropOutput);
					pstmt.setLong(9, operationCost);
					pstmt.setDouble(10, temp);
					pstmt.setDouble(11, hum);
					
					pstmt.executeUpdate();
					
				}
			}

//			//SQL문 작성
//			String SQL2 = "insert into test(no, name, soldAmount, price) values(?,?,?,?)";
//			
//			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
//			pstmt = conn.prepareStatement(SQL2);
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			CloseUtil.close(null, stmt, conn);
		}
		
	}


}
package com.farmeasy.toOracle;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import java.sql.*;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class JsonPolicy {

	public static void main(String[] args) {
		java.sql.Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String filePath = "C:\\workspace\\springFarmEasy\\src\\main\\webapp\\resources\\json\\productData.json";
		

		String sido = "";
		String sigungu = "";
		String policyName = "";
		String targetRepuirement = "";
		String policyContent = "";
		String subsidy = "";
		String departmentTel = "";
				
		//insert into JDBC 로직
			
		try {
			String driverClassName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "farm_easy";
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
			String SQL = "insert into policy_table(policy_id, sido, sigungu, policy_name, target_requirement, policy_content, subsidy, department_tel) values(policy_seq.nextval,?,?,?,?,?,?,?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			pstmt = conn.prepareStatement(SQL);
			
			//psmt.set<데이터타입><? 순서, 값)
			//다건 JSON객체 (JSONArray)
			if(jsonArr.size()>0) {
				for(int i=0; i<jsonArr.size(); i++) {
					JSONObject jsonObj = (JSONObject)jsonArr.get(i);
					
					sido = (String)jsonObj.get("sido");
					sigungu = (String)jsonObj.get("sigungu");
					policyName = (String)jsonObj.get("policy_name");
					targetRepuirement = (String)jsonObj.get("target_requirement");
					policyContent = (String)jsonObj.get("policy_content");
					subsidy = (String)jsonObj.get("subsidy");
					departmentTel = (String)jsonObj.get("department_tel");
					
					pstmt.setString(1, sido);
					pstmt.setString(2, sigungu);
					pstmt.setString(3, policyName);
					pstmt.setString(4, targetRepuirement);
					pstmt.setString(5, policyContent);
					pstmt.setString(6, subsidy);
					pstmt.setString(7, departmentTel);
					
					pstmt.executeUpdate();
					
				}
			}
			
			
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
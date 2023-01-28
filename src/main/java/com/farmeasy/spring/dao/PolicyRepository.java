package com.farmeasy.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.farmeasy.spring.model.PolicyVO;

@Repository
public class PolicyRepository implements IPolicyRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private class PolicyMapper implements RowMapper<PolicyVO> {
		@Override
		public PolicyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			PolicyVO policy = new PolicyVO();
			policy.setPolicy_id(rs.getInt("policy_id"));
			policy.setSido(rs.getString("sido"));
			policy.setSigungu(rs.getString("sigungu"));
			policy.setPolicy_name(rs.getString("policy_name"));
			policy.setTarget_requirement(rs.getString("target_requirement"));
			policy.setPolicy_content(rs.getString("policy_content"));
			policy.setSubsidy(rs.getString("subsidy"));
			policy.setDepartment_tel(rs.getString("department_tel"));
			return policy;
		}
	}
	
	@Override
	public List<PolicyVO> getAllPolicyList() {
		String query = "select * from fe_policy where policy_id between 1 and 10 order by policy_id asc";
		return jdbcTemplate.query(query, new PolicyMapper());
	}

	@Override
	public PolicyVO getPolicy(int policy_id) {
		String query = "select * from fe_policy where policy_id = ?";
		return jdbcTemplate.queryForObject(query, new PolicyMapper(), policy_id);
	}

	@Override
	public List<PolicyVO> getRegionPolicy(String sido) {
		String query = "select * from fe_policy where sido like '%"+sido+"%' and rownum <= 10 order by policy_id asc";
		return jdbcTemplate.query(query, new PolicyMapper());
	}

	

}

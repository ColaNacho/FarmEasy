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
public class WishRepository implements IWishRepository {

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
	public List<PolicyVO> getWishList(int m_seq) {
		String query = "select * from fe_policy where policy_id in(select distinct policy_id from fe_wish fw, tb_member fm where fw.m_seq = fm.m_seq and fw.m_seq = ?)";
		return jdbcTemplate.query(query, new PolicyMapper(), m_seq);
	}

	@Override
	public int getWishCount(int m_seq) {
		String query = "select count(*) from fe_wish where m_seq=?";
		return jdbcTemplate.queryForObject(query, Integer.class, m_seq);
	}

	@Override
	public void insertWish(int m_seq, int policy_id) {
		String query = "insert into fe_wish(wish_id, m_seq, policy_id) values(fe_wish_seq.nextval, ?, ?)";
		jdbcTemplate.update(query, m_seq, policy_id);
	}

}

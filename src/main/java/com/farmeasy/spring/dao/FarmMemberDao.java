package com.farmeasy.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository
public class FarmMemberDao implements MemberRepository{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private class MemberMapper implements RowMapper<FarmMemberVO>{

		@Override
		public FarmMemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			FarmMemberVO membermp = new FarmMemberVO();
			membermp.setM_seq(rs.getInt("m_seq"));
			membermp.setM_name(rs.getString("m_name"));
			membermp.setM_id(rs.getString("m_id"));
			membermp.setM_pw(rs.getString("m_pw"));
			membermp.setM_email(rs.getString("m_email"));
			membermp.setM_mobile(rs.getString("m_mobile"));
			membermp.setM_authority(rs.getString("m_authority"));
			membermp.setM_date(rs.getString("m_date"));
			membermp.setM_score(rs.getString("m_score"));
			return membermp;
		}
	}
	
	@Override
	public ArrayList<FarmMemberVO> getMemberList() {
		String query = "select * from TB_MEMBER order by m_seq desc";
		System.out.println(jdbcTemplate);
		return (ArrayList<FarmMemberVO>)jdbcTemplate.query(query, new MemberMapper());
	}
	
	@Override
	public void insertMember(FarmMemberVO mvo) {
		String query = "INSERT INTO TB_MEMBER(m_seq, m_name, m_id, "
				+ "m_pw, m_email, m_mobile, m_score) "
				+ "VALUES(m_seq.nextval,?,?,?,?,?,null)";
		jdbcTemplate.update(query, mvo.getM_name(), mvo.getM_id(), mvo.getM_pw(),
				mvo.getM_email(),mvo.getM_mobile());
	}

	@Override
	public FarmMemberVO login(String m_id, String m_pw) {
		String query = "SELECT * FROM TB_MEMBER WHERE M_ID=? and M_PW=?";
		try {
			System.out.println("로그인 쿼리문 실행");
			System.out.println(m_id + m_pw );
			return jdbcTemplate.queryForObject(query, new MemberMapper(), m_id, m_pw);
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public FarmMemberVO findId(String m_name, String m_email) {
		String query = "SELECT * FROM TB_MEMBER WHERE m_name=? and m_email=?";
		try {
			return jdbcTemplate.queryForObject(query, new MemberMapper(), m_name, m_email);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public FarmMemberVO findPw(String m_name, String m_email, String m_id) {
		String query = "SELECT * FROM TB_MEMBER WHERE m_name=? and m_email=? and m_id=?";
		try {
			return jdbcTemplate.queryForObject(query, new MemberMapper(), m_name, m_email, m_id);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updatePw(String m_pw, String m_id, String m_email) {
		String query = "update TB_MEMBER set m_pw=? WHERE m_id=? and m_email=?";
		jdbcTemplate.update(query, m_pw, m_id, m_email);
	}

	@Override
	public void memberUpdate(FarmMemberVO mvo) {
		String query = "update TB_MEMBER set m_pw=?, m_email=? WHERE m_name=? and m_id=?";
		System.out.println("쿼리문 - m_pw: " +mvo.getM_pw() + " m_email: " + mvo.getM_email() 
		+ " m_name: " + mvo.getM_name() + " m_id: " + mvo.getM_id());
		jdbcTemplate.update(query, mvo.getM_pw(), mvo.getM_email(), mvo.getM_name(), mvo.getM_id());
	}

	@Override
	public int idCheck(String id) {
		String query = "select count(*) from TB_MEMBER where m_id=?";
		int cnt = jdbcTemplate.queryForObject(query, Integer.class , id);
		return cnt;
	}

	



	


	
}

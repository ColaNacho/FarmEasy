package com.farmeasy.spring.dao;

import java.util.ArrayList;

public interface MemberRepository {
	
	 ArrayList<FarmMemberVO> getMemberList();
//	public void insertMember(String m_name, String m_id, String m_pw, 
//			String m_email, String m_mobile, String m_authority, String m_date, String m_score);
	 void insertMember(FarmMemberVO mvo);
	 FarmMemberVO login(String m_id, String m_pw);
	 FarmMemberVO findId(String m_name, String m_email);
	 FarmMemberVO findPw(String m_name, String m_email, String m_id);
	 void updatePw(String m_pw, String m_id, String m_email);
	 void memberUpdate(FarmMemberVO mvo);
}

package com.farmeasy.spring.service;

import com.farmeasy.spring.dao.FarmMemberVO;

public interface MemberFindPwInter {
	FarmMemberVO execute(String m_name, String m_email, String m_id);
}

package com.farmeasy.spring.service;

import com.farmeasy.spring.dao.FarmMemberVO;

public interface InterMemberInt {
	FarmMemberVO execute(String m_id, String m_pw);
}

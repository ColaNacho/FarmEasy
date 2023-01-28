package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberUpdatePw implements MemberUpdatePwInter{
	
	@Autowired
	MemberRepository memberRepository;

	@Override
	public void execute(String m_pw, String m_id, String m_email) {
		memberRepository.updatePw(m_pw, m_id, m_email);
	}
	
}

package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.FarmMemberVO;
import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberFindPw implements MemberFindPwInter{
	
	@Autowired
	MemberRepository memberRepository;

	@Override
	public FarmMemberVO execute(String m_name, String m_email, String m_id) {
		FarmMemberVO mvo=memberRepository.findPw(m_name, m_email, m_id);
		System.out.println(mvo);
		return mvo;
	}
	
}

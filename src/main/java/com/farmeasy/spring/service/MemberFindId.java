package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.FarmMemberVO;
import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberFindId implements InterMemberFindId{
	
	@Autowired
	MemberRepository memberRepository;

	@Override
	public FarmMemberVO execute(String m_name, String m_email) {
		FarmMemberVO mvo=memberRepository.findId(m_name, m_email);
		System.out.println(mvo);
		return mvo;
	}
	
}

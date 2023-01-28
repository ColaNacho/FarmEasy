package com.farmeasy.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.FarmMemberVO;
import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberSignUpService implements InterMemberMvo{

	@Autowired
	MemberRepository memberRepository;

	@Override
	public void execute(FarmMemberVO mvo) {
		memberRepository.insertMember(mvo);
	}
}

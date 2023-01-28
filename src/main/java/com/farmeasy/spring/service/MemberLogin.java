package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.FarmMemberVO;
import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberLogin implements InterMemberInt{
	
	@Autowired
	MemberRepository memberRepository;

	@Override
	public FarmMemberVO execute(String id, String pw) {
		FarmMemberVO mvo=memberRepository.login(id, pw);
		System.out.println(mvo);
		return mvo;
	}
	
}

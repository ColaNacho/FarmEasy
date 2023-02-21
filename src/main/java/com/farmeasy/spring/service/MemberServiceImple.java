package com.farmeasy.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmeasy.spring.dao.MemberRepository;

@Service
public class MemberServiceImple implements MemberService{
	
	 @Autowired
	 MemberRepository farmRepository;
	 
		//아이디 중복체크 mapper 접근
		@Override
		public int idCheck(String id) {
			int cnt=0;
			cnt = farmRepository.idCheck(id);
			System.out.println("cnt: " + cnt);
			return cnt;
		}	
}

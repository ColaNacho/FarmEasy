package com.farmeasy.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IWishRepository;

@Service
public class MemberInsertWishServiceImpl implements IMemberService {

	@Autowired
	IWishRepository wishRepository;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int m_seq = (int)map.get("m_seq");
		int policy_id = (int)map.get("policy_id");
		
		wishRepository.insertWish(m_seq, policy_id);
		
	}

}

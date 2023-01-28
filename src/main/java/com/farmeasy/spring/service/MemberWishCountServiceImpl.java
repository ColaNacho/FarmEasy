package com.farmeasy.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IWishRepository;

@Service
public class MemberWishCountServiceImpl implements IMemberService {

	@Autowired
	IWishRepository wishRepository;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int m_seq = (int)map.get("m_seq");
		System.out.println(wishRepository.getWishCount(m_seq));
		model.addAttribute("listCount", wishRepository.getWishCount(m_seq));
	}

}

package com.farmeasy.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.farmeasy.spring.dao.IWishRepository;
import com.farmeasy.spring.model.PolicyVO;

@Service
public class MemberWishServiceImpl implements IMemberService {

	@Autowired
	IWishRepository wishRepository;
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int m_seq = (int)map.get("m_seq");
		List<PolicyVO> wishList = wishRepository.getWishList(m_seq);
		model.addAttribute("wishList", wishList);
	}

}

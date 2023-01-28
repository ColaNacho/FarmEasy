package com.farmeasy.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmeasy.spring.service.IMemberService;

@Controller
public class WishController {

	@Autowired
	@Qualifier("memberWishServiceImpl")
	IMemberService memberWishServiceImpl;
	
	@Autowired
	@Qualifier("memberWishCountServiceImpl")
	IMemberService memberWishCountServiceImpl;
	
	@Autowired
	@Qualifier("memberInsertWishServiceImpl")
	IMemberService memberInsertWishServiceImpl;	
	
	//마이페이지 정책 리스트 + 리스트 수
	@RequestMapping("/f_myPage/{m_seq}")
	public String memberWishList(@PathVariable int m_seq, Model model) {
		System.out.println("memberWishList()");
		model.addAttribute("m_seq", m_seq);
		memberWishServiceImpl.execute(model);
		memberWishCountServiceImpl.execute(model);
		
		return "/f_myPage";
	}
	
	//찜하기
	@RequestMapping("/b_pop_info/{m_seq}/{policy_id}")
	public String memberInsertWish(@PathVariable int m_seq, @PathVariable int policy_id, Model model) {
		System.out.println("memberInsertWish()");
		model.addAttribute("m_seq", m_seq);
		model.addAttribute("policy_id", policy_id);
		memberInsertWishServiceImpl.execute(model);
		
		return "redirect:/f_myPage/"+m_seq;
	}
	
	
}

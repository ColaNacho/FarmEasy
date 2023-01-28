package com.farmeasy.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.farmeasy.spring.model.PolicyVO;

@Repository
public interface IWishRepository {
	
	 List<PolicyVO> getWishList(int m_seq);
	 int getWishCount(int m_seq);
	 void insertWish(int m_seq, int policy_id);
}

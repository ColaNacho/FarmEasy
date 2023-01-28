package com.farmeasy.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.farmeasy.spring.model.PolicyVO;

@Repository
public interface IPolicyRepository {

	List<PolicyVO> getAllPolicyList();
	PolicyVO getPolicy(int policy_id);
	List<PolicyVO> getRegionPolicy(String sido);
	
}

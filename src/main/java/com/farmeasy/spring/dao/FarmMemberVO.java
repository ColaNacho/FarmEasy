package com.farmeasy.spring.dao;

import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class FarmMemberVO {

	//멤버 변수 선언 
	 private int m_seq;
	 
	 @Pattern(regexp="[a-zA-Z가-힣]{1,}",message="영문이나 한글로 시작해야 합니다.")
	 private String m_name;
	 
	 @Pattern(regexp="[a-zA-Z0-9]{4,12}", message="아이디는 4~12자의 영문 대소문자와 숫자로만 입력")
	 private String m_id;
	 
	 @Pattern(regexp="[a-zA-Z0-9]{4,12}", message="패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")
	 private String m_pw;
	 
	 @Pattern(regexp="[A-Z0-9]{2,}",message="영문 대문자와 숫자를 이용해 두 자리 이상")
	 private String m_email;
	 
	 @Pattern(regexp="^[0-9] {2,3}[-\\.]?[0-9] {3,4}[-\\.]?[0-9] {4}$",message="유효한 전화번호가 아님")
	 private String m_mobile;
	 private String m_authority;
	 private String m_date;
	 private String m_score;
	
}

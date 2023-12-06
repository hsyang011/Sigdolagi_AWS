package com.edu.springboot.member;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface IMemberService {

	public int getMemberDTO(MemberDTO memberDTO);
	public MemberDTO getoneMemberDTO(MemberDTO memberDTO);
}

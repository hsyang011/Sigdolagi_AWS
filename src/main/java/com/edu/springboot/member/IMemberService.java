package com.edu.springboot.member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;





@Mapper
public interface IMemberService {

	public int getMemberDTO(MemberDTO memberDTO);
	public MemberDTO getoneMemberDTO(MemberDTO memberDTO);
	
	
	
	public int insertMember(@Param("email") String email,
			@Param("name") String name, @Param("password") String password,
			@Param("nickname") String nickname, @Param("phone") String phone,
			@Param("zipcode") String zipcode,
			@Param("addr1") String addr1, @Param("addr2") String addr2,
			@Param("mailing")  String mailing, @Param("sms") String sms);
	
}



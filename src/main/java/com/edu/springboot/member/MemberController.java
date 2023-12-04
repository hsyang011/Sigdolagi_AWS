package com.edu.springboot.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/findIdpw.do")
	public String findIdpw() {
		return "member/find_idpw";
	}
	
	@RequestMapping("/member/regist.do")
	public String regist() {
		return "member/regist";
	}
	
}

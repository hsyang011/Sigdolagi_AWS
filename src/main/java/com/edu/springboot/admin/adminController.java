package com.edu.springboot.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {

	
	@RequestMapping("/administrator/admin_main.do") 
	public String adminMain() {
		
		return "administrator/admin_main"; 
	 }
	 
	@RequestMapping("/administrator/adminMemberList.do")
	public String adminMemberList() {
		return "administrator/admin_member_list";
	}
	
	@RequestMapping("/administrator/admin_community_list.do")
	public String adminCommunity() {
		return "administrator/admin_community_list";
	}
	
	@RequestMapping("/administrator/admin_maket_list.do")
	public String adminMaketList() {
		return "administrator/admin_maket_list";
	}
	
	@RequestMapping("/administrator/admin_maket_write.do")
	public String adminMaketWrite() {
		return "administrator/admin_maket_write";
	}
	
}

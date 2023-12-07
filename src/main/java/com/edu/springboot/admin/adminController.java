package com.edu.springboot.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {

	
	@RequestMapping("/administrator/admin_main.do") public String adminMain() {
		
		return "administrator/admin_main"; 
	 }
	 
	
	@RequestMapping("/administrator/admin_community_list.do")
	public String adminCommunity() {
		return "administrator/admin_community_list";
	}
	
}

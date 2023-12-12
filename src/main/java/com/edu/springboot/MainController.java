package com.edu.springboot;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	
	@RequestMapping("/main/main.do")
	public String main(Principal principal) {
		
		try {
			String userid = principal.getName();
			System.out.println("아이디="+  userid);
		}
		catch (Exception e) {
			System.out.println("로그인암됨.");
			//e.printStackTrace();
		}
		
		return "main/main";
	}	
}

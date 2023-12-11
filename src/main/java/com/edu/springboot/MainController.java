package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	
	@RequestMapping("/main/main.do")
	public String main() {
		return "main/main";
	}
	
	@Autowired
	EmailSending email;
	
	
	@PostMapping("/main/emailSendProcess.do")
	public void emailSendProcess(InfoDTO infoDTO) {
		email.myEmailSender(infoDTO);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

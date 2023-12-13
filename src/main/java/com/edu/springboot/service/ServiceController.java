package com.edu.springboot.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceController {
	
	@RequestMapping("/service/notiboard.do")
	public String notiboard() {
		return "service/notiboard";
	}
	
	@RequestMapping("/service/inquiryboard.do")
	public String inquiryboard() {
		return "service/inquiryboard";
	}
	
	@RequestMapping("/service/faq.do")
	public String faq() {
		return "service/faq";
	}
	
}

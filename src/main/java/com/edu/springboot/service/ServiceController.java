package com.edu.springboot.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class ServiceController {
	
	@Autowired
	INotiboardService notidao;

	
	@RequestMapping("/service/notiboard.do")
	public String notiboard() {
		return "service/notiboard";
	}
	
	   
	//글쓰기 페이지 로딩
	@GetMapping("/community/notiboard_write.do")
	public String notiboardWriteGet(Model model) {
		return "community/notiboard_write";
	}
	
	@PostMapping("/community/notiboard_write.do")
   	public String notiboardWrite(Model model, HttpServletRequest req, Principal principal) {
      String title= req.getParameter("title");
      String content= req.getParameter("content");
      //폼값을 개별적으로 전달한다.
      int result = notidao.write(title, content);
      System.out.println("글쓰기 결과:" +result);
//      String nickname = dao.getnickname(email);
//      System.out.println("nickname:결과"+nickname);
//      model.addAttribute("nickname",nickname); 

      return "redirect:notiboard.do";
   }
	   

	@RequestMapping("/community/notiboard_view.do")
   	public String freeboardView(Model model,NotiDTO notiDTO,HttpServletRequest req,ParameterDTO parameterDTO) {
		notidao.update(notiDTO);
		notiDTO = notidao.view(notiDTO);
		notiDTO.setCONTENT(notiDTO.getCONTENT().replace("\r\n", "<br>"));
		model.addAttribute("notiDTO", notiDTO);
		
		return "community/notiboard_view";
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

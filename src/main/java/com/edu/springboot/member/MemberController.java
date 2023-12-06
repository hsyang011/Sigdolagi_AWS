package com.edu.springboot.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;





@Controller
public class MemberController {
	
	@Autowired
	IMemberService  memberdao;
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/find_idpw.do")
	public String findIdpw() {
		return "member/find_idpw";
	}
	
	@RequestMapping("/member/regist.do")
	public String regist() {
		return "member/regist";
	}
	
	
	
	@PostMapping("/member/loginprocess.do")
	public String loginProcess(MemberDTO memberDTO, jakarta.servlet.http.HttpServletRequest req, jakarta.servlet.http.HttpSession session, org.springframework.ui.Model model) {
	
		
		memberDTO.setEmail(req.getParameter("email"));
		memberDTO.setPassword(req.getParameter("password"));
	
	int result = memberdao.getMemberDTO(memberDTO);
	
	System.out.println(result);
	if(result ==1) {
		memberDTO = memberdao.getoneMemberDTO(memberDTO);
		
		 session.setAttribute("sessionEmail", memberDTO.getEmail());
		 System.out.println("세션에 저장된 이메일 "+memberDTO.getEmail());
		 session.setAttribute("sessionName", memberDTO.getName());
		 System.out.println("세션에 저장된 이름"+memberDTO.getName());
		 session.setAttribute("sessionPassword", memberDTO.getPassword());
		 System.out.println("로그인 성공");
		    //return "main.do";
		 return "main/main";
	}
	else {
		System.out.println("로그인 실패");
		//메세지 추가
		model.addAttribute("loginErrorMessage", "로그인 실패");
		return "member/login";
	}
	
	
	}
	
	//로그아
		@GetMapping("/member/logout.do")
	    public String logoutprocess(HttpSession session) {
	        // 세션에 저장된 정보 삭제
	        session.removeAttribute("sessionEmail");
	        session.removeAttribute("sessionPassword");
	        session.removeAttribute("sessionName");

	        // 세션을 완전히 무효화
	        session.invalidate();

	        return "redirect:member/home";
	    }
	
	
	
	
	
}

package com.edu.springboot.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
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
	
	//회원가입처리 
	@PostMapping("/member/registProcess.do")
	public String registProcess(HttpServletRequest req, MemberDTO memberDTO) {
		System.out.println("회원가입처리 시작");
		
		// 폼값 받기
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		
		String phone = req.getParameter("tel1") + "-" + req.getParameter("tel2") + "-" + req.getParameter("tel3");
		String zipcode = req.getParameter("zipcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		
		String mailing = req.getParameter("mailing");
		String sms = req.getParameter("sms");
		//끝  
		
		//DTO 에 저장 
		memberDTO.setEmail(email);
		memberDTO.setPassword(password);
		memberDTO.setPassword(name);
		memberDTO.setNickname(nickname);
		memberDTO.setPhone(phone);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		memberDTO.setMailing(mailing);
		memberDTO.setSms(sms);
		
		System.out.println();
		//insert하기
		
		int result = memberdao.insertMember(email, name, password, nickname, phone, zipcode,
				addr1, addr2, mailing, sms);
		System.out.println("회원가입결과 :" + result);
		
		

		
		
		
		return "main/main";
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
			  System.out.println("세션제거전");
	        // 세션에 저장된 정보 삭제
	        session.removeAttribute("sessionEmail");
	        session.removeAttribute("sessionPassword");
	        session.removeAttribute("sessionName");
	        System.out.println("세션제거 후");

	        // 세션을 완전히 무효화
	        session.invalidate();

	        return "main/main";
	    }
	
	
	
	
	
}

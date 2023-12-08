package com.edu.springboot.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;





@Controller
public class MemberController {
	
	@Autowired
	IMemberService  memberdao;
	
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
	
	@RequestMapping("/member/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/member/myinfo.do")
	public String myinfo() {
		return "member/myinfo";
	}
	
	@RequestMapping("/member/myinfoEdit.do")
	public String myinfoEdit() {
		return "member/myinfoEdit";
	}
	
	@RequestMapping("/member/myordermanage.do")
	public String myordermanage() {
		return "member/myordermanagement";
	}
	
	
	//닉네임 중복확인
	@RequestMapping("/member/doubleckeck.do")
	
	public String doubleckeck(HttpServletRequest req) {
		String nickname = req.getParameter("nickname");
		return "member/joinOverlap";
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
	public String loginProcess(MemberDTO memberDTO, jakarta.servlet.http.HttpServletRequest req, jakarta.servlet.http.HttpSession session, 
			org.springframework.ui.Model model, HttpServletResponse response) {
	
		//쿠키저장과정
		System.out.println("쿠키저장과정");
		String userEmail = req.getParameter("email"); //아이디   
		String userPassword = req.getParameter("password"); //비밀번호
		System.out.println(req.getParameter("savedEmail"));
		String chkVal = req.getParameter("savedEmail"); //입력칸 밸류  
		System.out.println(chkVal);
		// 쿠키 추가
		if (chkVal!=null && chkVal.equals("1")) {
			
			CookieManager.makeCookie(response, "SavedEmail", userEmail, 60*60*24);
			CookieManager.makeCookie(response, "ischecked", "checked", 60*60*24);
			
			
			model.addAttribute("ischecked", "checked");
			model.addAttribute("SavedEmail", userEmail);
			
			System.out.println("쿠키 추가됨");
		// 쿠키 삭제
		} else {
			CookieManager.deleteCookie(response, "SavedEmail");
			CookieManager.deleteCookie(response, "ischecked");
		}
		
		System.out.println("쿠키저장성공?");
		
		
		///
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
		
		//아이디찾기" ../member/findEmail.do"
		@PostMapping("/member/findEmail.do")
		
		public String findEmail(HttpServletRequest req, Model model) {
			System.out.println("컨트롤러로 들어오나?");
			String phone = req.getParameter("tel1")+"-"+req.getParameter("tel2")
			+"-"+req.getParameter("tel3");
			
			String email = memberdao.getoneEmailDTO(phone);
			System.out.println(email);
			
			
			 // 이메일 찾은거 
		    model.addAttribute("foundEmail", email);
		    
		    
		    
		   
		    
			
			
			return "member/find_idpw";
			}
		
		

			//비밀번호 찾" ../member/findPass.do ../member/findPass.do
			@PostMapping("/member/findPass.do")
			public String findPass(HttpServletRequest req, Model model) {
			    System.out.println("q비번찾기 컨트롤러로 들어오나?");
			    String phone = req.getParameter("tel1") + "-" + req.getParameter("tel2") + "-" + req.getParameter("tel3");
			    String email = req.getParameter("email");
	
			    String password = memberdao.getonePasswordDTO(phone, email);
			    System.out.println(password);
	
			    // 이메일 찾은거 
			    model.addAttribute("foundPassword", password);
	
			    return "member/find_idpw";
			}
	
			
	
	
	
}

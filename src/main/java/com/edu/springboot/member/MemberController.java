package com.edu.springboot.member;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.IPhotoboardService;
import com.edu.springboot.community.ParameterDTO;
import com.edu.springboot.community.PhotoBoardDTO;
import com.edu.springboot.service.InqueryBoardService;
import com.edu.springboot.service.InqueryDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;
import utils.MyFunctions;
import utils.PagingUtil;





@Controller
public class MemberController {
	
	
	@Autowired
	 IPhotoboardService photoboarddao;
	
	
	@Autowired
	IMemberService  memberdao;
	
	@Autowired
	InqueryBoardService inquerydao;
	
	
	@RequestMapping("/member/login.do")
	public String login(Principal principal, Model model, HttpServletRequest req) {
		// 에러메시지가 존재하면 model에 저장
		if (req.getAttribute("errorMsg") != null) {
			System.out.println(req.getAttribute("errorMsg"));
			model.addAttribute("errorMsg", req.getAttribute("errorMsg"));
		}
		
		try {
			// 로그인 아이디를 얻어온다.
			String email = principal.getName();
			// 아이디를 Model객체에 저장한다.
			model.addAttribute("email", email);
			System.out.println("로그인 되었습니다.");
		} catch (Exception e) {
			/* 최초로 접근시에는 로그인 정보가 없으므로 NullPointerException예외가 발생된다. 따라서 예외처리 해야
			한다. */
			System.out.println("[login.do]로그인 전입니다.");
		}
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
	public String mypage(Model model, HttpServletRequest req, ParameterDTO parameterDTO, Principal principal) {
		  System.out.println("마이페이지 컨트롤러 들어오나?");
		  
		  //포토게시판 리스트 처리 
	      
	      int totalCount = photoboarddao.photoGetTotalCount(parameterDTO);
	      System.out.println("토탈카운트"+totalCount);
	      
	      final int pageSize = PagingUtil.getPageSize(); 
	      System.out.println(pageSize);
	      final int blockPage = PagingUtil.getBlockPage(); 
	      System.out.println(blockPage);
	      
	      int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals("")) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
	      int start = (pageNum -1 ) * pageSize +1 ;
	      int end = pageNum * pageSize;
	      parameterDTO.setStart(start);
	      parameterDTO.setEnd(end);
	      parameterDTO.setEmail(principal.getName());
	          
	      Map<String, Object> maps = new HashMap<String, Object>();
	      maps.put("totalCount", totalCount);
	      maps.put("pageSize", pageSize);
	      maps.put("pageNum", pageNum);
	      model.addAttribute("maps", maps);
	          
	      //MyPhotoListPage
	      ArrayList<PhotoBoardDTO> photolists = photoboarddao.MyPhotoListPage(parameterDTO);
	      //ArrayList<PhotoBoardDTO> myphotolists = photoboarddao.MyPhotoListPage(parameterDTO);
	      
	      model.addAttribute("photolists", photolists);
	      System.out.println(photolists.size());
      
	      String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./mypage.do?");
	      model.addAttribute("pagingImg", pagingImg);
	      //포토 게시판 리스트 처리 끝 #################################################### 
	      
	      
	      //1:1문의 리스트 띄우기 
	      
		  
		  //1:1 문의 리스트 처리 하기 
	      
	      System.out.println("1:1문의  리스트 들어오나?");
	      
	      
	      int inquirytotalCount = inquerydao.inqueryGetTotalCount(parameterDTO);
	      System.out.println("토탈카운트"+inquirytotalCount);
	      String email = principal.getName();
	      
	      System.out.println(pageSize);
	      System.out.println(blockPage);
	      
	      
	       pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals("")) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
	       start = (pageNum -1 ) * pageSize +1 ;
	       end = pageNum * pageSize;
	      parameterDTO.setStart(start);
	      parameterDTO.setEnd(end);
	      parameterDTO.setEmail(email);
	      //parameterDTO.setEmail(principal.getName());
	      
	      
	      // 이거 바꿔야 된다. 
	      Map<String, Object> inquirymaps = new HashMap<String, Object>();
	      inquirymaps.put("totalCount", inquirytotalCount);
	      inquirymaps.put("pageSize", pageSize);
	      inquirymaps.put("pageNum", pageNum);
	      System.out.println(inquirymaps);
	      model.addAttribute("inquirymaps", inquirymaps);
	      
	      
	      
	      //리스트  띄워주기 
	      
	     //MyinquiryListPage
	      ArrayList<InqueryDTO> inquirylists = inquerydao.MyInquiryListPage(parameterDTO);
	      //ArrayList<PhotoBoardDTO> myphotolists = photoboarddao.MyPhotoListPage(parameterDTO);
	      
	      model.addAttribute("inquirylists", inquirylists);
	      System.out.println(inquirylists);
	      System.out.println(inquirymaps);
	      System.out.println(inquirylists.size());
      
	      
	  //    String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./mypage.do?");
	  //    model.addAttribute("pagingImg", pagingImg);
	      

	      
		
		
		return "member/mypage";
	}
	
	
	
//	@RequestMapping("/member/mypage2.do")
//	public String mypage2(Model model, HttpServletRequest req, ParameterDTO parameterDTO, Principal principal) {
//		  System.out.println("마이페이지 컨트롤러 들어오나?");
//		  
//	
//	      
//	      
//	      //1:1 게시판 리스트 처리 끝 
//		  return "member/mypage";
//		  
//	}
	
	
	
	
	
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
		password = PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(password).replace("{bcrypt}", "");
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
		
		
		System.out.println("쿠키저장성공?");
		///
		memberDTO.setEmail(req.getParameter("email"));
		memberDTO.setPassword(req.getParameter("password"));
		System.out.println(memberDTO.getEmail()+memberDTO.getPassword());
	
		
		
		int result = memberdao.getMemberDTO(memberDTO);
	
		System.out.println(result);
		
		if(result ==1) {
			
			
			///쿠키 
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
			
			
			
			memberDTO = memberdao.getoneMemberDTO(memberDTO);
		
		 session.setAttribute("sessionEmail",memberDTO.getEmail());
		 System.out.println("세션에 저장된 이메일 "+memberDTO.getEmail());
		 session.setAttribute("sessionName",memberDTO.getName());
		 System.out.println("세션에 저장된 이름"+memberDTO.getName());
		 session.setAttribute("sessionPassword", memberDTO.getPassword());
		 session.setAttribute("sessionNickname", memberDTO.getNickname());
		 System.out.println("세션에 저장된 이름"+memberDTO.getNickname());
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
	
	//로그아웃 
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
	
	// 이메일 발송을 위한 빈 주입
	@Autowired
	EmailSending email;
	
	// 이메일 발송 성공까지만 함. 추후에 인증코드 로직 제작해야됩니다.
	@RequestMapping("/member/emailSendProcess.do")
	public ResponseEntity<String> emailSendProcess(HttpServletRequest req) {
		System.out.println("이메일 전송할 곳 : " + req.getParameter("email"));
		InfoDTO infoDTO = new InfoDTO();
		infoDTO.setFrom("식도라기");
		infoDTO.setTo(req.getParameter("email"));
		infoDTO.setSubject("식도라기 회원가입");
		infoDTO.setFormat("html");
		
		//UUID 6자리 
		String uuid = MyFunctions.getUuid();
		System.out.println(uuid);
		uuid = uuid.substring(0, 6);
		System.out.println(uuid);
		
		
		infoDTO.setContent("식도라기 회원 인증을 위한 인증 코드 발송입니다. 아래 코드를 입력해주세요!"+uuid);
		
		
		
		
		
		
		email.myEmailSender(infoDTO);
		System.out.println("이메일 성공?");
		
		
		return ResponseEntity.ok(uuid);
	}
}

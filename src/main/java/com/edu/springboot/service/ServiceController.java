package com.edu.springboot.service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.IBoardService;
import com.edu.springboot.community.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import utils.PagingUtil;



@Controller
public class ServiceController {
	
	@Autowired
	INotiboardService notidao;
	
	@Autowired
	InqueryBoardService inquerydao;

	
	@Autowired
	IBoardService dao;
	
	//공지사항 목록
	@RequestMapping("/service/notiboard.do")
	public String notiboard(Model model, HttpServletRequest req, ParameterDTO parameterDTO, HttpSession httpSession) {
		   
	      int totalCount = dao.getTotalCount(parameterDTO);
	      
	      int pageSize = PagingUtil.getPageSize(); 
	      int blockPage = PagingUtil.getBlockPage();
	      
	      int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals("")) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
	      int start = (pageNum -1 ) * pageSize +1 ;
	      int end = pageNum * pageSize;
	      parameterDTO.setStart(start);
	      parameterDTO.setEnd(end);
	      
	      
	      
	      
	      Map<String, Object> maps = new HashMap<String, Object>();
	      maps.put("totalCount", totalCount);
	      maps.put("pageSize", pageSize);
	      maps.put("pageNum", pageNum);
	      model.addAttribute("maps", maps);
	         
	      ArrayList<NotiDTO> lists = notidao.listPage(parameterDTO);
	      model.addAttribute("lists", lists);
	      System.out.println(lists.size());
	      
	      String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./freeboard_list.do?");
	      model.addAttribute("pagingImg", pagingImg);
	   
		return "service/notiboard";
	}
	
	   
	//글쓰기 페이지로 이동한다. 
	@GetMapping("/service/notiboard_write.do")
	public String notiboardWriteGet(Model model, Principal principal) {
		
		return "service/notiboard_write";
	}
	
	
	@PostMapping("/service/notiboard_write.do")
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
	   

	@RequestMapping("/service/notiboard_view.do")
   	public String freeboardView(Model model,NotiDTO notiDTO,HttpServletRequest req,ParameterDTO parameterDTO) {
		notidao.update(notiDTO);
		notiDTO = notidao.view(notiDTO);
		notiDTO.setContent(notiDTO.getContent().replace("\r\n", "<br>"));
		model.addAttribute("notiDTO", notiDTO);
		
		return "service/notiboard_view";
   }

	
	@RequestMapping("/service/inquiryboard.do")
	public String inquiryboard(Model model, Principal principal) {

		if(principal!=null) {
		 String email = principal.getName();
	     String nickname= dao.getnickname(email);
	      
	      
	      
	      System.out.println(email);
	      model.addAttribute("email", email);
	      model.addAttribute("nickname", nickname);
		}
		return "service/inquiryboard";
	}
	
	
	
	//1:1 문의  게시판 글쓰기
	

	   @PostMapping("/service/inquiryboard_write.do")
	   public String freeboardWrite(Model model, HttpServletRequest req, Principal principal, InqueryDTO inqueryDTO) {
		  System.out.println("문의 게시판 글쓰기 컨트롤러 들어오나? ");
		  System.out.println(inqueryDTO);
	      String email= principal.getName();
	      String nickname= dao.getnickname(email);
	      String title= req.getParameter("title");
	      String content= req.getParameter("content");
	      String category = req.getParameter("category");
	      System.out.println(category);
	      
	      
	      
	      //폼값을 개별적으로 전달한다.
	      int result = inquerydao.write(email,category,title, content, nickname);
	      System.out.println("글쓰기 결과:" +result);
	      System.out.println("nickname:결과"+nickname);
	      model.addAttribute("nickname1",nickname); 
	      
	   
	      return "redirect:/member/mypage.do";

	   }
	
	
	
	@RequestMapping("/service/faq.do")
	public String faq() {
		return "service/faq";
	}
	
}

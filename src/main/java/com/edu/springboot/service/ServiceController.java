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

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import utils.PagingUtil;



@Controller
public class ServiceController {
	
	@Autowired
	INotiboardService notidao;

	
	
 @RequestMapping("/service/notiboard.do")
   public String notiboardList(Model model, HttpServletRequest req, ParameterDTO parameterDTO, HttpSession httpSession) {
      
      int totalCount = notidao.getTotalCount(parameterDTO);
      
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
	
	   
	//글쓰기 페이지 로딩
	@GetMapping("/service/notiboard_write.do")
	public String notiboardWriteGet(Model model) {
		return "community/notiboard_write";
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
	public String inquiryboard() {
		return "service/inquiryboard";
	}
	
	@RequestMapping("/service/faq.do")
	public String faq() {
		return "service/faq";
	}
	
}

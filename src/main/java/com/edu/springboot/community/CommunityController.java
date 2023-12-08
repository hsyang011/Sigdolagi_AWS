package com.edu.springboot.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.BoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import utils.PagingUtil;

@Controller
public class CommunityController {
	
	@Autowired
	IBoardService dao;
	
	@RequestMapping("/community/freeboard_list.do")
	public String freeboardList(Model model, HttpServletRequest req, ParameterDTO parameterDTO, HttpSession httpSession) {
		
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
			
		ArrayList<BoardDTO> lists = dao.listPage(parameterDTO);
		model.addAttribute("lists", lists);
		System.out.println(lists.size());
		
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"/list.do?");
		model.addAttribute("pagingImg", pagingImg);
		return "community/freeboard_list";
	}
	
	//글쓰기 페이지 로딩
	@GetMapping("/community/freeboard_write.do")
	public String boardWriteGet(Model model) {
		return "community/freeboard_write";
	}
	
	@RequestMapping("/community/freeboard_write.do")
	public String freeboardWrite(Model model, HttpServletRequest req) {
		//request 내장객체를 통해 폼값을 받아온다.
		String email= req.getParameter("email");
		String nickname= req.getParameter("nickname");
		String title= req.getParameter("title");
		String content= req.getParameter("content");
		//폼값을 개별적으로 전달한다.
		int result = dao.write(email,nickname, title, content);
		System.out.println("글쓰기 결과:" +result);
		return "redirect:freeboard_list.do";
	}
	
	@RequestMapping("/community/freeboard_view.do")
	public String freeboardView(Model model, BoardDTO boardDTO) {
		boardDTO = dao.view(boardDTO);
		boardDTO.setContent(boardDTO.getContent().replace("\r\n", "<br>"));
		model.addAttribute("boardDTO", boardDTO);
		return "community/freeboard_view";
	}
	
	@RequestMapping("/community/photoboard_list.do")
	public String photoboardList() {
		return "community/photoboard_list";
	}
	
	@RequestMapping("/community/photoboard_write.do")
	public String photoboardWrite() {
		return "community/photoboard_write";
	}
	
}

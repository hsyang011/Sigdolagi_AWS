package com.edu.springboot.community;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.BoardDTO;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import oracle.jdbc.proxy.annotation.Post;
import utils.PagingUtil;

@Controller
public class CommunityController {
	
	
	@Autowired
	IBoardService dao;
	
	@Autowired
	IPhotoboardService photoboarddao;
	
	
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
	
	
	//포토 게시판 글쓰기 페이지 이
		@GetMapping("/community/photoboard_write.do")
		public String photoboardWriteGet(Model model) {
			return "community/photoboard_write";
		}
	
	
	
	
	@PostMapping("/community/freeboard_write.do")

	public String freeboardWrite(Model model, HttpServletRequest req, HttpSession session) {
		String email= req.getParameter("email");

		String nickname= (String)session.getAttribute("sessionNickname");

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
	//  ./photoboard_view.do
	
	@RequestMapping("/community/photoboard_view.do")
	public String photoboardView(Model model, PhotoBoardDTO photoBoardDTO) {
		photoBoardDTO = photoboarddao.photoview(photoBoardDTO);
		photoBoardDTO.setContent(photoBoardDTO.getContent().replace("\r\n", "<br>"));
		model.addAttribute("photoBoardDTO", photoBoardDTO);
		
		return "community/photoboard_view";
	}
	
	
	
	
	
	
	//자유게시판 수정하기
	@GetMapping("/community/freeboard_edit.do")
	public String freeboardEdit(Model model, BoardDTO boardDTO) {
		System.out.println("들어오니?");
		boardDTO = dao.view(boardDTO);
		model.addAttribute("boardDTO", boardDTO);
		return "community/freeboard_edit";
	
	}
	
	@PostMapping("/community/freeboard_edit.do")
	public String boardEditPost(BoardDTO boardDTO) {
		int result = dao.edit(boardDTO);
		System.out.println("result:"+result);
		System.out.println("글수정결과:"+result);
		System.out.println("boardto"+boardDTO+"result"+result);
		return "redirect:freeboard_view.do?freeboard_idx="+boardDTO.getFreeboard_idx();
	}
	
	@RequestMapping("/community/photoboard_list.do")
		//포토  포토보드 리스트
		
	public String photoBoardList(Model model, HttpServletRequest req, ParameterDTO parameterDTO, HttpSession httpSession) {
	
		System.out.println("들어오나?");
		
		int totalCount = photoboarddao.photoGetTotalCount(parameterDTO);
		System.out.println("토탈카운트"+totalCount);
		
		int pageSize = PagingUtil.getPageSize(); 
		System.out.println(pageSize);
		int blockPage = PagingUtil.getBlockPage(); 
		System.out.println(blockPage);
		
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
		
		
		
		
			
		ArrayList<PhotoBoardDTO> photolists = photoboarddao.PhotoListPage(parameterDTO);
		model.addAttribute("photolists", photolists);
		System.out.println(photolists.size());
		
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"/list.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		
		return "community/photoboard_list";
	}
	
	@PostMapping("/community/photoboard_writeProcess.do")
	public String photoboardWrite(HttpServletRequest req, Model model, PhotoBoardDTO photoBoardDTO) {
		
		String title = req.getParameter("title");
		
		
		
		
		
		return "community/photoboard_list";
	}
	
	
	
	//사진 게시판 	쓰기. /community/freeboard_write.do
//	community/photoboard_writeprocess.do     /community/freeboard_write.do
	
	

	
}

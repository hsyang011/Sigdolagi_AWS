package com.edu.springboot.community;

import java.io.File;
import java.util.ArrayList;
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
import utils.MyFunctions;
import utils.PagingUtil;

@Controller
public class CommunityController {
	
	@Autowired
	IBoardService dao;
	
	@Autowired
	IMyFileService filedao;
	
	
	
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
		
		System.out.println("boardDTO="+boardDTO);
		
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
	
	
	//사진 게시판 	쓰기.
	@GetMapping("/community/photooard_writeProcess.do")
	public String uploadProcess(HttpServletRequest req, Model model,
			PhotoBoardDTO photoBoardDTO){
		
		
		System.out.println("photoBoardDTO="+ photoBoardDTO);
		try {			
			//업로드 디렉토리의 물리적경로 얻어오기
			String uploadDir = ResourceUtils
				.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:"+uploadDir);
			
			//전송된 첨부파일을 Part객체를 통해 얻어온다.
			Part part =  req.getPart("ofile");	
			//파일명 확인을 위해 헤더값을 얻어온다.
			String partHeader = ((HttpServletRequest) part).getHeader("content-disposition");
		    System.out.println("partHeader="+ partHeader);
		    //헤더값에서 파일명 추출을 위해 문자열을 split()한다.
		    String[] phArr = partHeader.split("filename=");
		    //따옴표를 제거한 후 원본파일명을 추출한다.
		    String originalFileName = phArr[1].trim().replace("\"", "");
		    //전송된 파일이 있다면 서버에 저장한다.
		    if (!originalFileName.isEmpty()) {				
				 part.write(uploadDir+ File.separator +originalFileName);
			}
		  
		    //서버에 저장된 파일명을 중복되지 않는 이름으로 변경한다.
		    String savedFileName =
		    	MyFunctions.renameFile(uploadDir, originalFileName);
		  
		    //JDBC연동을 하지 않으므로 Model객체에 정보를 저장한다.
		    model.addAttribute("originalFileName", originalFileName);			
		    model.addAttribute("savedFileName", savedFileName);		
		    //파일 외 나머지 폼값도 받아서 저장한다.
		    model.addAttribute("title", req.getParameter("title"));			
		    model.addAttribute("cate", req.getParameterValues("cate"));
		  
		    //JDBC연동
		    photoBoardDTO.setOfile(originalFileName);
		    photoBoardDTO.setSfile(savedFileName);
		    filedao.insertFile(photoBoardDTO);
		}
		catch (Exception e) {			
			System.out.println("업로드 실패");
			e.printStackTrace();
		}
		
		//View로 포워드
		return "main/main";
	}


	
	
	
	
	

	
}

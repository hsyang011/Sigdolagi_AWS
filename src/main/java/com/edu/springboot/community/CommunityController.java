package com.edu.springboot.community;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.JsonObject;
import com.edu.springboot.community.BoardDTO;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.proxy.annotation.Post;
import utils.MyFunctions;
import utils.PagingUtil;

@Controller
public class CommunityController {
	
	@Autowired
	IMyFileService filedao;
	
	
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
		
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./freeboard_list.do?");
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
		dao.update(boardDTO);
		boardDTO = dao.view(boardDTO);
		boardDTO.setContent(boardDTO.getContent().replace("\r\n", "<br>"));
		
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "community/freeboard_view";
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
		return "redirect:freeboard_view.do?freeboard_idx="+boardDTO.getFreeboard_idx();
	}
	
	@PostMapping("/community/freeboard_delete.do")
	public String boardDeletePost(HttpServletRequest req ) {
		int result = dao.delete(req.getParameter("freeboard_idx"));
		System.out.println("글삭제결과:"+result);
		
		return "redirect:freeboard_list.do";
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
	

	
	//포토 게시판 글쓰기 페이지 이
		@GetMapping("/community/photoboard_write.do")
		public String photoboardWriteGet(Model model, Principal principal) {
			String email = principal.getName();
			model.addAttribute("email", email);
			return "community/photoboard_write";
		}
		
		
	
	
	
	
	
	
	@RequestMapping("/community/photoboard_view.do")
	public String photoboardView(Model model, PhotoBoardDTO photoBoardDTO) {
		photoBoardDTO = photoboarddao.photoview(photoBoardDTO);
		photoBoardDTO.setContent(photoBoardDTO.getContent().replace("\r\n", "<br>"));
		model.addAttribute("photoBoardDTO", photoBoardDTO);
		
		
		
		return "community/photoboard_view";
	}
	
	
	@RequestMapping(value="/community/photoboard_writeprocess.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, PhotoBoardDTO photoBoardDTO
			,Model model, Principal principal)  {
		JsonObject jsonObject = new JsonObject();
		
		String email = principal.getName();
		
		model.addAttribute("email", email);
		System.out.println(email);
		
		System.out.println("포토 게시판 들어오나?");
		
		String title = request.getParameter("title");
		System.out.println("타이"+title);
		System.out.println(photoBoardDTO);
		String files = request.getParameter("files");
		System.out.println(files);
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		//String contextRoot = request.getServletContext().getRealPath("/");
		//String newContextRoot = contextRoot.replace("/Users/minseokkang/Desktop/Workplace/Sigdolagi/src/main/webapp/",
		//                                             "/Users/minseokkang/Desktop/Workplace/Sigdolagi/bin/main/static/uploads/");
		String contextRoot = null;
		
		try {
		 contextRoot = ResourceUtils
				.getFile("classpath:static/uploads/").toPath().toString();
		System.out.println("물리적 경로:" +contextRoot);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("물리적 경로:" +contextRoot);
		System.out.println("컨텍스트루트"+contextRoot);
		String fileRoot = contextRoot;
		System.out.println("파일루트"+fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		System.out.println("오리지날파일명"+originalFileName);
		photoBoardDTO.setOfile(originalFileName);
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		System.out.println("저장된 파일명"+savedFileName);
		photoBoardDTO.setSfile(savedFileName);
		System.out.println(photoBoardDTO);
		
		
		
		
		File targetFile = new File(fileRoot +"/"+ savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			
			jsonObject.addProperty("url", contextRoot+"resources/static/uploads/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
			
			System.out.println("저장된파일명"+savedFileName);
			
			Map<String, String> saveFileMaps = new HashMap<>();

			
			
			saveFileMaps.put(originalFileName, savedFileName);

			
			
			//db집어넣기
			
			
			int result2 = filedao.insertMultiFile(photoBoardDTO);
			if(result2 == 1) {
				System.out.println("멀티성공(?)");
				model.addAttribute("originalFileName", request.getParameter("originalFileName"));
				model.addAttribute("saveFileMaps", saveFileMaps);
				model.addAttribute("photolist", photoBoardDTO);
				System.out.println(saveFileMaps);
				model.addAttribute("title", request.getParameter("title"));
				model.addAttribute("cate", request.getParameterValues("cate"));
				
			}
			
			
			
			
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
		
		
		
		 
	}
	
	
	
	
	
	

	
}

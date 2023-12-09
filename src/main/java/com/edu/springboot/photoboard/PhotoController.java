package com.edu.springboot.photoboard;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import jakarta.servlet.http.Part;
import oracle.jdbc.proxy.annotation.Post;
import utils.MyFunctions;
import utils.PagingUtil;

@Controller
public class PhotoController {
	
	@Autowired
	IMyFileService filedao;
	
	
	@Autowired
	IPhotoboardService photoboarddao;
	
	
	
	
	
	//포토 게시판 글쓰기 페이지 이
		@GetMapping("/community/photoboard_write.do")
		public String photoboardWriteGet(Model model) {
			return "community/photoboard_write";
		}
	
	
	
	
	
	
	
	//  ./photoboard_view.do
	
	@RequestMapping("/community/photoboard_view.do")
	public String photoboardView(Model model, PhotoBoardDTO photoBoardDTO) {
		photoBoardDTO = photoboarddao.photoview(photoBoardDTO);
		photoBoardDTO.setContent(photoBoardDTO.getContent().replace("\r\n", "<br>"));
		model.addAttribute("photoBoardDTO", photoBoardDTO);
		
		return "community/photoboard_view";
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
	

	
	
	
	
	
	@RequestMapping(value="/community/photoboard_writeprocess.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		System.out.println("포토 게시판 들어오나?");
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = (String) request.getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/static/uploads/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			//jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			
			jsonObject.addProperty("url", "/resources/static/uploads/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
	

	
}

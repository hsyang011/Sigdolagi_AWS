package com.edu.springboot.admin;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.IBoardService;
import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.ParameterDTO;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class AdminController {

	
	
	@RequestMapping("/administrator/admin_main.do") 
	public String adminMain() {
		
		return "administrator/admin_main"; 
	 }
	
	
	@Autowired
	IMemberService  memberDao;
	
	//관리자 회원목록 
	@RequestMapping("/administrator/adminMemberList.do")
	public String adminMemberList(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<MemberDTO> adminMemberSelect = memberDao.adminMemberSelect();
		model.addAttribute("adminMemberSelect", adminMemberSelect);
//		System.out.println("adminMemberSelect="+adminMemberSelect);
		return "administrator/admin_member_list";
	}
	
	//관리자 회원탈퇴처리
	@PostMapping("/administrator/adminMemberList.do")
	public String adminMemberEnabled(MemberDTO memberDTO) {
		int result = memberDao.adminMemberEnabled(memberDTO);
		if(result==1)System.out.println("탈퇴처리되었습니다.");
		
		return "redirect:adminMemberList.do";
	}
	
	@Autowired
	IBoardService  boardDao;
	
	//관리자 자유게시판목록
	@RequestMapping("/administrator/admin_free_list.do")
	public String adminCommunity(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<BoardDTO> adminFreeSelect = boardDao.adminFreeSelect();
		model.addAttribute("adminFreeSelect", adminFreeSelect);
		
		return "administrator/admin_community_list";
	}
	
	@RequestMapping("/administrator/admin_photo_list.do")
	public String adminPhoto() {
		return "administrator/admin_photo_list";
	}
	
	@RequestMapping("/administrator/admin_planner_list.do")
	public String adminPlanner() {
		return "administrator/admin_planner_list";
	}
	
	@RequestMapping("/administrator/admin_AD_list.do")
	public String adminAd() {
		return "administrator/admin_ad_list";
	}
	
	@RequestMapping("/administrator/admin_notice_list.do")
	public String adminNotice() {
		return "administrator/admin_notice_list";
	}
	
	@RequestMapping("/administrator/admin_inquiry_list.do")
	public String adminInquiry() {
		return "administrator/admin_inquiry_list";
	}
	
	// DAO 호출을 위한 빈 자동 주입.
	@Autowired
	IProductService productDAO;
	
	//관리자 마켓상품리스트
	@RequestMapping("/administrator/admin_maket_list.do")
	public String adminMaketList(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<ProductDTO> adminMaketSelect = productDAO.adminMaketSelect();
		model.addAttribute("adminMaketSelect", adminMaketSelect);
		
		return "administrator/admin_maket_list";
	}
	
	//관리자 마켓상품등록페이지
	@RequestMapping("/administrator/admin_maket_write.do")
	public String adminMaketWrite() {
		return "administrator/admin_maket_write";
	}
	//관리자 마켓상품등록 처리
//	@PostMapping("/administrator/admin_maket_write.do")
//	public String adminMaketListWrite(Model model, ProductDTO productDTO) {
//		int result = productDAO.adminMaketInsert(productDTO);
//		if(result==1)System.out.println("입력되었습니다.");
//		
//		return "redirect:admin_maket_list.do";
//	} admin_maket_write.do
	@PostMapping("/administrator/admin_maket_write.do")
	public String adminMaketWriteProcess(HttpServletRequest req, Model model, ProductDTO productDTO) {
		
		try {
			//업로드 디렉토리의 물리적경로 얻어오기
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:" + uploadDir);
			
			//전송된 첨부파일을 Part객체를 통해 얻어온다. 
			Part part = req.getPart("prod_detail_o");
			//파일명 확인을 위해 헤더값을 얻어온다. 
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader="+ partHeader);
			//헤더값에서 파일명 추출을 위해 문자열을 split()한다. 
			String[] phArr = partHeader.split("filename=");
			//따옴표를 제거한 후 원본파일명을 추출한다.
			String originalFileName = phArr[1].trim().replace("\"", "");
			//전송된 파일이 있다면 서버에 저장한다.
			if(!originalFileName.isEmpty()) {
				part.write(uploadDir+File.separator + originalFileName);
			}
			
			//서버에 저장된 파일명을 중복되지 않는 이름으로 변경한다.
			String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
			
			//JDBC 연동을 하지 않으므로 Model객체에 정보를 저장한다.
			model.addAttribute("originalFileName", originalFileName);
			model.addAttribute("savedFileName", savedFileName);
		} 
		catch (Exception e) {
			System.out.println("업로드 실패");
		}
		
		
		
		return "redirect:admin_maket_list.do";
	}
	
	//관리자 마켓상품삭제
	@PostMapping("/administrator/admin_maket_delete.do")
	public String adminMaketListDelete(ProductDTO productDTO) {
		int result = productDAO.adminMaketDelete(productDTO);
		if(result==1)System.out.println("삭제되었습니다.");
		
		return "redirect:admin_maket_list.do";
	}
	
	@RequestMapping("/administrator/admin_order_list.do")
	public String adminOrderList() {
		return "administrator/admin_order_list";
	}
	
}

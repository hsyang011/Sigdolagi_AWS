package com.edu.springboot.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.ParameterDTO;
import com.edu.springboot.market.ProductDTO;

@Controller
public class AdminController {

	@RequestMapping("/administrator/admin_main.do") 
	public String adminMain() {
		
		return "administrator/admin_main"; 
	 }
	 
	@RequestMapping("/administrator/adminMemberList.do")
	public String adminMemberList() {
		return "administrator/admin_member_list";
	}
	
	@RequestMapping("/administrator/admin_free_list.do")
	public String adminCommunity() {
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
	@PostMapping("/administrator/admin_maket_write.do")
	public String adminMaketListWrite(Model model, ProductDTO productDTO) {
		int result = productDAO.adminMaketInsert(productDTO);
		if(result==1)System.out.println("입력되었습니다.");
		
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

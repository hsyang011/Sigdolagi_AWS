package com.edu.springboot.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.ParameterDTO;
import com.edu.springboot.market.ProductDTO;

@Controller
public class adminController {

	
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
		System.out.println("adminMaketSelect="+adminMaketSelect);
		model.addAttribute("adminMaketSelect", adminMaketSelect);
//		model.addAttribute("adminMaketList", productDAO.adminMaketSelect());
		return "administrator/admin_maket_list";
	}
	
	@RequestMapping("/administrator/admin_maket_write.do")
	public String adminMaketWrite() {
		return "administrator/admin_maket_write";
	}
	
	@RequestMapping("/administrator/admin_order_list.do")
	public String adminOrderList() {
		return "administrator/admin_order_list";
	}
	
}

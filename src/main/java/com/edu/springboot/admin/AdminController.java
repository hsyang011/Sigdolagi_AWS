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
	IMemberService  memberdao;
	
	//관리자 회원목록 
	@RequestMapping("/administrator/adminMemberList.do")
	public String adminMemberList(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		
		List<MemberDTO> adminMemberSelect = memberdao.adminMemberSelect();
		model.addAttribute("adminMemberSelect", adminMemberSelect);
//		System.out.println("adminMemberSelect="+adminMemberSelect);
		return "administrator/admin_member_list";
	}
	
	//관리자 회원탈퇴처리
	@PostMapping("/administrator/adminMemberList.do")
	public String adminMemberEnabled(MemberDTO memberDTO) {
		int result = memberdao.adminMemberEnabled(memberDTO);
		if(result==1)System.out.println("탈퇴처리되었습니다.");
		
		return "redirect:adminMemberList.do";
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
			
			// 파일명 저장을 위한 Map 생성. Key는 원본파일명, value는 서버에 저장된 파일명을 저장한다.
	        Map<String, String> saveFileMaps = new HashMap<>();

	        // 파일 폼의 이름들을 배열로 저장
	        String[] fileFormNames = {"prod_thumbnail_o", "img1_o", "img2_o", "img3_o", "img4_o", "img5_o"};

	        // 폼값의 갯수만큼 반복
	        for (String fileFormName : fileFormNames) {
	            // 해당 이름의 파일 파트를 받아온다.
	            Part part = req.getPart(fileFormName);
	            
	            // 파일 파트가 존재하지 않으면 다음 파일로 넘어감
	            if (part == null) {
	                continue;
	            }
	            
	            // 파일명 추출을 위해 헤더값을 얻어온다.
	            String partHeader = part.getHeader("content-disposition");
	            System.out.println("partHeader=" + partHeader);

	            // 파일명을 추출한 후 따옴표를 제거한다.
	            String[] phArr = partHeader.split("filename=");
	            String originalFileName = phArr[1].trim().replace("\"", "");

	            // 파일을 원본파일명으로 저장한다.
	            if (!originalFileName.isEmpty()) {
	                part.write(uploadDir + File.separator + originalFileName);
	            }

	            // 저장된 파일명을 UUID로 생성한 새로운 파일명으로 저장한다.
	            String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);

	            /* Map 컬렉션에 원본파일명과 저장된파일명을 Key와 value로
	               저장한다. */
	            saveFileMaps.put(originalFileName, savedFileName);
	        }
			
			
	     // View로 전달하기 위해 Model객체에 저장한다.
	        model.addAttribute("saveFileMaps", saveFileMaps);
			
	     // 파일 DTO에 정보 저장
	        for (Map.Entry<String, String> entry : saveFileMaps.entrySet()) {
	            String originalFileName = entry.getKey();
	            String savedFileName = entry.getValue();

	            if (originalFileName.equals("prod_thumbnail_o")) {
	                productDTO.setProd_thumbnail(savedFileName);
	            } 
	            else if(originalFileName.equals("img1_o")){
	            	// 이미지 파일이 여러 개일 경우, 각각의 필드에 저장하거나 리스트에 추가할 수 있음
	            	// 예시: productDTO.setImg1O(savedFileName);
	            	//      productDTO.setImg2O(savedFileName);
	            	//      ...
	            	productDTO.setImg1(savedFileName);
	            }
	            else if(originalFileName.equals("img2_o")){
	            	productDTO.setImg2(savedFileName);
	            }
	            else if(originalFileName.equals("img3_o")){
	            	productDTO.setImg3(savedFileName);
	            }
	            else if(originalFileName.equals("img4_o")){
	            	productDTO.setImg4(savedFileName);
	            }
	            else if(originalFileName.equals("img5_o")){
	            	productDTO.setImg5(savedFileName);
	            }
	            
	        }

	        // JDBC 연동
//	        int result = dao.write(productDTO);
	        int result = productDAO.adminMaketInsert(productDTO);
			if(result==1)System.out.println("입력되었습니다.");
			System.out.println("글쓰기결과:" + result);
			
			
		} 
		catch (Exception e) {
			e.printStackTrace();
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

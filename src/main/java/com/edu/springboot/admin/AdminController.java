package com.edu.springboot.admin;

import java.io.File;
import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.IBoardService;
import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.ParameterDTO;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class AdminController {
	
	@Autowired
   IBoardService dao;
	
	@RequestMapping("/administrator/admin_main.do") 
	public String adminMain(Model model, HttpServletRequest req, HttpSession session, Principal principal) {
		
		try {
			String userid = principal.getName();

			String nickname = dao.getnickname(userid);
	        System.out.println("nickname:결과 "+nickname);
//	        model.addAttribute("nickname",nickname);
	        session.setAttribute("UserNickName", nickname);
	        String userNick = session.getAttribute("UserNickName").toString(); 
	        System.out.println("UserNick = "+userNick);
		}
		catch (Exception e) {
			System.out.println("로그인암됨.");
		}
		
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
			String uploadDir = ResourceUtils.getFile("classpath:static/images/products/").toPath().toString();
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
			
			//멀티관련
			/*파일명 저장을 위한 Map생성. Key는 원본파일명, value는 서버에 저장된 
			파일명을 저장한다.*/
			Map<String, String> saveFileMaps = new HashMap<>();
			
			
			String ofiles = "";
			String sfiles = "";
			
			//2개 이상의 파일이므로 getParts() 메서드를 통해 폼값을 받는다.
			Collection<Part> parts = req.getParts();
			//폼값의 갯수만큼 반복
			for(Part part2 : parts) {
				/* 폼값 중 파일인 경우에만 업로드처리를 위해 continue를 걸어준다.
				즉 파일이 아니라면 for문의 처음으로 돌아간다. */
				if(!part2.getName().equals("imgs")) continue;
				
				//파일명 추출을 위해 헤더값을 얻어온다.
				String partHeader2 = part2.getHeader("content-disposition");
				// System.out.println("partHeader="+partHeader);
				//파일명을 추출한 후 따옴표를 제거한다.
				String[] phArr2 = partHeader2.split("filename=");
				String originalFileName2 = phArr2[1].trim().replace("\"","");
				//파일을 원본파일명으로 저장한다.
				if(!originalFileName2.isEmpty()) {
					part2.write(uploadDir+File.separator+originalFileName2);
				}
				//저장된 파일명을 UUID로 생성한 새로운 파일명으로 저장한다.
				String savedFileName2 = MyFunctions.renameFile(uploadDir, originalFileName2);
				
				/* Map컬렉션에 원본파일명과 저장된파일명을 Key와 value로
				저장한다. */
				saveFileMaps.put(originalFileName2, savedFileName2);
				System.out.println("오리지날:"+originalFileName2 +", 복제본:"+savedFileName2);
			
				ofiles += originalFileName2 + ":";
				sfiles += savedFileName2 + ":";
			}
			//View로 전달하기 위해 Model객체에 저장한다.
			model.addAttribute("saveFileMaps", saveFileMaps);
			
			//JDBC 연동을 하지 않으므로 Model객체에 정보를 저장한다.
			model.addAttribute("originalFileName", originalFileName);
			model.addAttribute("savedFileName", savedFileName);
			
			//JDBC연동
			//싱글파일
			productDTO.setProd_detail_o(originalFileName);
			productDTO.setProd_detail(savedFileName);
			
			System.out.println("productDTO.데이탈="+productDTO.getProd_detail());
			
			System.out.println("ofiles= "+ofiles);
			System.out.println("sfiles= "+sfiles);
			//멀티파일
			String[] oArr = ofiles.split(":");
			String[] sArr = sfiles.split(":");
			
			for (int i=0; i<oArr.length && i<5; i++) {
				if(i == 0) {
					productDTO.setImg1_o(oArr[i]);
					productDTO.setImg1(sArr[i]);
				}
				else if(i == 1) {
						productDTO.setImg2_o(oArr[i]);
						productDTO.setImg2(sArr[i]);
				}
				else if(i == 2) {
						productDTO.setImg3_o(oArr[i]);
						productDTO.setImg3(sArr[i]);
				}
				else if(i == 3) {
						productDTO.setImg4_o(oArr[i]);
						productDTO.setImg4(sArr[i]);
				}
				else if(i == 4) {
						productDTO.setImg5_o(oArr[i]);
						productDTO.setImg5(sArr[i]);
				}
			}
			
			System.out.println("productDTO 1="+productDTO.getImg1());
			System.out.println("productDTO 2="+productDTO.getImg2());
			System.out.println("productDTO 3="+productDTO.getImg3());
			System.out.println("productDTO 4="+productDTO.getImg4());
			System.out.println("productDTO 5="+productDTO.getImg5());
			
			int result = productDAO.adminMaketInsert(productDTO);
			if(result==1)System.out.println("입력되었습니다.");
			
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

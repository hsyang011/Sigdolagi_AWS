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
import com.edu.springboot.community.IPhotoboardService;
import com.edu.springboot.community.PhotoBoardDTO;
import com.edu.springboot.market.IOrderService;
import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.OrderDTO;
import com.edu.springboot.market.ParameterDTO;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDTO;
import com.edu.springboot.planner.IPlannerService;
import com.edu.springboot.planner.PlannerDTO;
import com.edu.springboot.service.INotiboardService;
import com.edu.springboot.service.InquiryBoardService;
import com.edu.springboot.service.InquiryDTO;
import com.edu.springboot.service.NotiDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class AdminController {
	
	@Autowired
	IBoardService dao;

	@Autowired
	IMemberService  memberDAO;
	@Autowired
	IBoardService  boardDAO;
	// DAO 호출을 위한 빈 자동 주입.
	@Autowired
	IProductService productDAO;
	
	@Autowired
	IPhotoboardService photoDAO;
	
	@Autowired
	IPlannerService plannerDAO;
	
	@Autowired
	INotiboardService notiDAO;
	
	@Autowired
	InquiryBoardService inquiryDAO;
	
	@Autowired
	IOrderService orderDAO;
	
	
	
	@RequestMapping("/administrator/admin_main.do") 
	public String adminMain(Model model, HttpServletRequest req, HttpSession session, Principal principal) {
		
		try {
			//시큐리티 principal로 유저이메일(아이디) 불러오기
			String userid = principal.getName();
			//이메일로 닉네임찾기
			String nickname = dao.getnickname(userid);
	        //세션UserNickName에 저장하기
	        session.setAttribute("UserNickName", nickname);
	        String userNick = session.getAttribute("UserNickName").toString(); 
	        System.out.println("UserNick = "+userNick);
		}
		catch (Exception e) {
			System.out.println("로그인암됨.");
		}
		
		return "administrator/admin_main"; 
	 }
	
	
	//관리자 회원목록 
	@RequestMapping("/administrator/adminMemberList.do")
	public String adminMemberList(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<MemberDTO> adminMemberSelect = memberDAO.adminMemberSelect();
		model.addAttribute("adminMemberSelect", adminMemberSelect);
		return "administrator/admin_member_list";
	}
	
	//관리자 회원탈퇴처리
	@PostMapping("/administrator/adminMemberList.do")
	public String adminMemberEnabled(MemberDTO memberDTO) {
		int result = memberDAO.adminMemberEnabled(memberDTO);
		if(result==1)System.out.println("탈퇴처리되었습니다.");
		return "redirect:adminMemberList.do";
	}
	
	//관리자 자유게시판목록
	@RequestMapping("/administrator/admin_free_list.do")
	public String adminCommunity(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<BoardDTO> adminFreeSelect = boardDAO.adminFreeSelect();
		model.addAttribute("adminFreeSelect", adminFreeSelect);
		
		return "administrator/admin_community_list";
	}
	
	//관리자 자유게시판 게시글 삭제
	@PostMapping("/administrator/adminFreeDelete.do")
	public String adminFreeDelete(HttpServletRequest req) {
		int result = boardDAO.adminFreeDelete(req.getParameter("idx"));
		if(result==1)System.out.println("삭제되었습니다.");
		return "redirect:admin_free_list.do";
	}
	
	//관리자 사진게시판목록
	@RequestMapping("/administrator/admin_photo_list.do")
	public String adminPhoto(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<PhotoBoardDTO> adminPhotoSelect = photoDAO.adminPhotoSelect();
		model.addAttribute("adminPhotoSelect", adminPhotoSelect);
		
		return "administrator/admin_photo_list";
	}
	
	//관리자 사진게시판 게시글 삭제
	@PostMapping("/administrator/adminPhotoDelete.do")
	public String adminPhotoDelete(HttpServletRequest req) {
		int result = photoDAO.adminPhotoDelete(req.getParameter("idx"));
		if(result==1)System.out.println("삭제되었습니다.");
		return "redirect:admin_photo_list.do";
	}
	
	//관리자 플래너 목록
	@RequestMapping("/administrator/admin_planner_list.do")
	public String adminPlanner(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		/* List<PlannerDTO> adminPlannerSelect = plannerDAO.adminPlannerSelect(); */
		List<PlannerDTO> adminPlannerSelect = plannerDAO.getPlannerByRecent();
		model.addAttribute("adminPlannerSelect", adminPlannerSelect);
		
		return "administrator/admin_planner_list";
	}
	
	//관리자 플래너 삭제
	@PostMapping("/administrator/admin_planner_delete.do")
	public String adminPlannerDelete(HttpServletRequest req) {
		int result = plannerDAO.adminPlannerDelete(req.getParameter("idx"));
		if(result==1)System.out.println("삭제되었습니다.");
		return "redirect:admin_planner_list.do";
	}
	
	@RequestMapping("/administrator/admin_AD_list.do")
	public String adminAd() {
		return "administrator/admin_ad_list";
	}
	
	//관리자 공지사항 목록
	@RequestMapping("/administrator/admin_notice_list.do")
	public String adminNotice(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<NotiDTO> adminNoticeSelect = notiDAO.adminNoticeSelect();
		model.addAttribute("adminNoticeSelect", adminNoticeSelect);
		
		return "administrator/admin_notice_list";
	}
	
	//관리자 공지사항 작성페이지(진입시 불러오는값필요)
	@GetMapping("/administrator/admin_notice_write.do")
	public String adminNoticeWrite(Model model, Principal principal) {
		
		String email = principal.getName();
        String nickname= dao.getnickname(email);
        model.addAttribute("email", email);
        model.addAttribute("nickname",nickname); 
        
		return "administrator/admin_notice_write";
	}
	
	//관리자 공지사항 작성처리
	@PostMapping("/administrator/admin_notice_write.do")
	public String adminNoticeWriteProcess(Model model, HttpServletRequest req, NotiDTO notiDTO) {
		
		System.out.println("notiDTO="+notiDTO);
       
		notiDAO.adminNoticeWrite(notiDTO);
		
		return "redirect:admin_notice_list.do";
	}
	
	//관리자 공지사항 수정페이지(진입시 불러오는값필요)
	@GetMapping("/administrator/admin_notice_edit.do")
	public String adminNoticeEdit(Model model, NotiDTO notiDTO) {
		
		notiDTO = notiDAO.view(notiDTO);
		model.addAttribute("notiDTO", notiDTO);
		
		return "administrator/admin_notice_edit";
	}
	
	//관리자 공지사항 수정처리
	@PostMapping("/administrator/admin_notice_edit.do")
	public String adminNoticeEditProcess(Model model,NotiDTO notiDTO) {
		int result = notiDAO.edit(notiDTO);
		if(result==1)System.out.println("수정되었습니다.");
		
		//수정후 로케이션 이동 (관리자목록으로)
//		return "redirect:admin_notice_list.do";
		//수정후 로케이션 이동 (사용자뷰로)
		return "redirect:../service/notiboard_view.do?noticeboard_idx="+notiDTO.getNoticeboard_idx();
	}
	
	//관리자 공지사항 삭제
	@PostMapping("/administrator/adminNoticeDelete.do")
	public String adminNoticeDelete(HttpServletRequest req) {
		int result = notiDAO.adminNoticeDelete(req.getParameter("idx"));
		if(result==1)System.out.println("삭제되었습니다.");
		return "redirect:admin_notice_list.do";
	}
	
	//관리자 1:1문의 목록
	@RequestMapping("/administrator/admin_inquiry_list.do")
	public String adminInquiry(Model model) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<InquiryDTO> adminInquirySelect = inquiryDAO.adminInquirySelect();
		model.addAttribute("adminInquirySelect", adminInquirySelect);
		
		return "administrator/admin_inquiry_list";
	}
	
	
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
			
			
			// Model객체에 정보를 저장한다.
			model.addAttribute("originalFileName", originalFileName);
			model.addAttribute("savedFileName", savedFileName);
			
			//JDBC연동
			//싱글파일
			productDTO.setProd_detail_o(originalFileName);
			productDTO.setProd_detail(savedFileName);
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
	
	//관리자 주문현황목록
	@RequestMapping("/administrator/admin_order_list.do")
	public String adminOrderList(Model model,HttpServletRequest req) {
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<OrderDTO> adminOrderSelect = orderDAO.adminOrderSelect();
		model.addAttribute("adminOrderSelect", adminOrderSelect);
		
		return "administrator/admin_order_list";
	}
	
	//관리자 주문현황목록 모달창.
	@ResponseBody
	@RequestMapping("/administrator/order_modal_list.do") 
	public List<OrderDTO> orderModalList(Model model,HttpServletRequest req, OrderDTO orderDTO) {
	 
		//주문내역 상품 불러오기
		List<OrderDTO> orderViewList = orderDAO.orderViewList(req.getParameter("order_idx"));
		model.addAttribute("orderViewList", orderViewList);
		 
		 return orderViewList; 
	 }
	
	//관리자 주문취소처리
	@PostMapping("/administrator/admin_order_list.do")
	public String adminOrderDelete(HttpServletRequest req,OrderDTO orderDTO) {
		int result = orderDAO.adminOrderDelete(req.getParameter("idx"));
		if(result==1)System.out.println("취소처리되었습니다.");
		return "redirect:admin_order_list.do";
	}
	
	//관리자 주문 배송중처리
	@PostMapping("/administrator/admin_order_preUpdate.do")
	public String adminOrderPreUpdate(HttpServletRequest req,OrderDTO orderDTO) {
		int result = orderDAO.adminOrderPreUpdate(req.getParameter("idx"));
		if(result==1)System.out.println("배송중으로 변경되었습니다.");
		return "redirect:admin_order_list.do";
	}
	//관리자 주문 배송완료처리
	@PostMapping("/administrator/admin_order_deliUpdate.do")
	public String adminOrderDeliUpdate(HttpServletRequest req,OrderDTO orderDTO) {
		int result = orderDAO.adminOrderDeliUpdate(req.getParameter("idx"));
		if(result==1)System.out.println("배송완료로 변경되었습니다.");
		return "redirect:admin_order_list.do";
	}
	 
	
}

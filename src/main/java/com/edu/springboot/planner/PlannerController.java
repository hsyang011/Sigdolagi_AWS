package com.edu.springboot.planner;

import java.io.File;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.member.IMemberService;
import com.edu.springboot.member.MemberDAO;
import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class PlannerController {
	
	@Autowired
	IPlannerService plannerDAO;
	
	@Autowired
	IPlaceService placeDAO;
	
	@Autowired
	IMemberService memberDAO;
	
	// 플래너 리스트 페이지
	@RequestMapping("/planner/planner_list.do")
	public String plannerList(Model model) {
		List<PlannerDTO> list = plannerDAO.getPlannerByRecent();
		model.addAttribute("plannerList", list);
		return "planner/planner_list";
	}
	
	// 플래너 정렬
	@RequestMapping("/planner/sortPlannerByCate.do")
	public ResponseEntity<List<PlannerDTO>> sortPlannerByCate(HttpServletRequest req) {
		String cate = req.getParameter("cate");
		List<PlannerDTO> list;
		if (cate.equals("최신")) {
			list = plannerDAO.getPlannerByRecent();
		} else {
			list = plannerDAO.getPlannerByCate(cate);
		}
		
		return ResponseEntity.ok(list);
	}
	
	// 플래너 만들기 페이지 진입 시 즉시 플래너 생성
	@RequestMapping("/planner/planner_map.do")
	public String plannerMap(PlannerDTO plannerDTO, Model model, Principal principal) {
		plannerDTO.setEmail(principal.getName());
		plannerDTO.setNickname(memberDAO.getMemberNickname(principal.getName()));
		// 이전에 만든 플래너가 있는지 확인
		int result = plannerDAO.getPlanner(plannerDTO);
		if (result == 0) {			
			// 플래너 생성
			plannerDAO.createPlanner(plannerDTO);
			String planner_idx = plannerDAO.getPlannerIdx(plannerDTO);
			model.addAttribute("planner_idx", planner_idx);
		} else {			
			// 플래너의 식별변호를 가져온다.
			String planner_idx = plannerDAO.getPlannerIdx(plannerDTO);
			plannerDTO.setPlanner_idx(planner_idx);
			// 플래너에 등록된 모든 장소들을 불러온다. 단, place_idx를 기준으로 오름차순으로 반환한다.
			List<PlaceDTO> allPlaces = plannerDAO.getAllPlaces(plannerDTO);
			
			model.addAttribute("planner_idx", planner_idx);
			model.addAttribute("places", allPlaces);
			System.out.println(allPlaces);
		}
		return "planner/planner_map";
	}
	
	// 플래너에 장소 추가
	@RequestMapping("/planner/addToPlanner.do")
	public ResponseEntity<PlaceDTO> addToPlanner(PlaceDTO placeDTO, Model model) {
		System.out.println("ajax로 들어온 파라미터 : " + placeDTO);
		// 카테고리가 너무 길어서 > 을 기준으로 0번 인덱스만 반영
		placeDTO.setPlace_category(placeDTO.getPlace_category().split(">")[0]);
		// place테이블에 장소 추가
		placeDAO.addPlaceToPlanner(placeDTO);
		
		return ResponseEntity.ok(placeDTO);
	}
	
	// 플래너에서 장소 삭제
	@RequestMapping("/planner/deleteFromPlanner.do")
	public ResponseEntity<String> deleteFromPlanner(PlaceDTO placeDTO) {
		// place_idx를 삭제
		placeDAO.deleteFromPlanner(placeDTO);
		return ResponseEntity.ok("삭제가 완료되었습니다.");
	}
	
	// 플래너 저장, 단 null값을 채워넣는 작업으로 insert가 아닌 update를 해야 한다.
	@RequestMapping("/planner/saveProcess.do")
	public String saveProcess(HttpServletRequest req, HttpServletResponse resp, Model model) {
		// 커맨드객체를 사용하면 오류가 나는 것 같으니 우선 request를 사용한다.
		PlannerDTO plannerDTO = new PlannerDTO();
		plannerDTO.setCate(req.getParameter("cate"));
		plannerDTO.setPlanner_idx(req.getParameter("planner_idx"));
		plannerDTO.setPlan_start(req.getParameter("plan_start"));
		plannerDTO.setPlan_end(req.getParameter("plan_end"));
		
		// 파일 업로드 처리
		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads").toPath().toString();
			System.out.println("물리적 경로:" + uploadDir);
			
			Part part = req.getPart("ofile");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader=" + partHeader);
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", "");
			if (!originalFileName.isEmpty()) {
				part.write(uploadDir + File.separator + originalFileName);
			}
			
			String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
			
			plannerDTO.setOfile(originalFileName);
			plannerDTO.setSfile(savedFileName);
			System.out.println("업로드 성공!");
		} catch (Exception e) {
			System.out.println("업로드 실패");
		}
		
		// 들어온 파라미터를 가지고 DB에 업데이트 하여 모든 컬럼에 값을 채운다.
		plannerDAO.savePlanner(plannerDTO);
		
		return "redirect:/planner/planner_list.do";
	}
	
	// 플래너 뷰 페이지
	@RequestMapping("/planner/planner_view.do")
	public String plannerView(PlannerDTO plannerDTO, Model model) {
		String planner_idx = plannerDTO.getPlanner_idx();
		List<PlaceDTO> allPlaces = plannerDAO.getAllPlaces(plannerDTO);
		
		model.addAttribute("planner_idx", planner_idx);
		model.addAttribute("places", allPlaces);
		System.out.println(allPlaces);
		
		// 멤버의 정보를 얻어오기 위한 객체 생성
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(plannerDAO.getPlannerInfo(plannerDTO).getEmail());
		memberDTO = memberDAO.getoneMemberDTO(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		
		return "planner/planner_view";
	}
	
}

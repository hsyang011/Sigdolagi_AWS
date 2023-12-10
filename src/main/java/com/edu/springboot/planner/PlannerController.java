package com.edu.springboot.planner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
	
	@Autowired
	IPlannerService plannerDAO;
	
	@Autowired
	IPlaceService placeDAO;
	
	@RequestMapping("/planner/planner_list.do")
	public String plannerList() {
		return "planner/planner_list";
	}
	
	// 플래너 만들기 페이지 진입 시 즉시 플래너 생성
	@RequestMapping("/planner/planner_map.do")
	public String plannerMap(PlannerDTO plannerDTO, Model model) {
		plannerDTO.setEmail("foo@gmail.com");
		// 이전에 만든 플래너가 있는지 확인
		int result = plannerDAO.getPlanner(plannerDTO);
		if (result == 0) {			
			// 플래너 생성
			plannerDAO.createPlanner(plannerDTO);
		}
		// 플래너의 식별변호를 가져온다.
		String planner_idx = plannerDAO.getPlannerIdx(plannerDTO);
		plannerDTO.setPlanner_idx(planner_idx);
		// 플래너에 등록된 모든 장소들을 불러온다. 단, place_idx를 기준으로 오름차순으로 반환한다.
		List<PlaceDTO> allPlaces = plannerDAO.getAllPlaces(plannerDTO);
		
		model.addAttribute("planner_idx", planner_idx);
		model.addAttribute("places", allPlaces);
		System.out.println(allPlaces);
		return "planner/planner_map";
	}
	
	@RequestMapping("/planner/addToPlanner.do")
	public ResponseEntity<PlaceDTO> addToPlanner(PlaceDTO placeDTO, Model model) {
		System.out.println("ajax로 들어온 파라미터 : " + placeDTO);
		// 카테고리가 너무 길어서 > 을 기준으로 0번 인덱스만 반영
		placeDTO.setPlace_category(placeDTO.getPlace_category().split(">")[0]);
		// place테이블에 장소 추가
		placeDAO.addPlaceToPlanner(placeDTO);
		
		return ResponseEntity.ok(placeDTO);
	}
	
}

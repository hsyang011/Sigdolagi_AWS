package com.edu.springboot;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.planner.IPlannerService;
import com.edu.springboot.planner.PlannerDTO;

@Controller
public class MainController {
	
	// 플래너 리스트를 가져오기 위한 빈 주입
	@Autowired
	IPlannerService plannerDAO;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/main/main.do")
	public String main(Model model) {
		// 플래너를 모두 셀렉트 합니다.
		List<PlannerDTO> plannerList = plannerDAO.getPlannerByRecent();
		
		model.addAttribute("plannerList", plannerList);
		
		return "main/main";
	}
}

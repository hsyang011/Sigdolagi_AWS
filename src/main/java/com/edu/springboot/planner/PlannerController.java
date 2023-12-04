package com.edu.springboot.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
	
	@RequestMapping("/planner/plannerList.do")
	public String plannerList() {
		return "planner/plannerList";
	}
	
	@RequestMapping("/planner/plannerMap.do")
	public String plannerMap() {
		return "planner/plannerMap";
	}
	
}

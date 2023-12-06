package com.edu.springboot.planner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
	
	@RequestMapping("/planner/planner_list.do")
	public String plannerList() {
		return "planner/planner_list";
	}
	
	@RequestMapping("/planner/planner_map.do")
	public String plannerMap() {
		return "planner/planner_map";
	}
	
}

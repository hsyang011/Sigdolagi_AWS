package com.edu.springboot.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@RequestMapping("/community/freeboard_list.do")
	public String freeboardList() {
		return "community/freeboard_list";
	}
	
	@RequestMapping("/community/freeboard_write.do")
	public String freeboardWrite() {
		return "community/freeboard_write";
	}
	
	@RequestMapping("/community/freeboard_view.do")
	public String freeboardView() {
		return "community/freeboard_view";
	}
	
	@RequestMapping("/community/photoboard_list.do")
	public String photoboardList() {
		return "community/photoboard_list";
	}
	
	@RequestMapping("/community/photoboard_write.do")
	public String photoboardWrite() {
		return "community/photoboard_write";
	}
	
}

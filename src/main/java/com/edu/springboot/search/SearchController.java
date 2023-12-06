package com.edu.springboot.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	
	@RequestMapping("/search/search_result.do")
	public String searchResult() {
		return "search/search_result";
	}
	
}

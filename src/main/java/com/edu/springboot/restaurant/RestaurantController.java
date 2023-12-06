package com.edu.springboot.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {
	
	@RequestMapping("/restaurant/restaurant_list.do")
	public String restaurantList() {
		return "restaurant/restaurant_list";
	}
	
}

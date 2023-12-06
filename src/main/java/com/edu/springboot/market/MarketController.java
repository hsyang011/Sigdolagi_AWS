package com.edu.springboot.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	
	@RequestMapping("/market/market_list.do")
	public String marketList() {
		return "market/market_list";
	}
	
	@RequestMapping("/market/market_view.do")
	public String marketView() {
		return "market/market_view";
	}
	
	@RequestMapping("/market/cart.do")
	public String cart() {
		return "market/cart";
	}
	
	@RequestMapping("/market/payment.do")
	public String payment() {
		return "market/payment";
	}
	
}

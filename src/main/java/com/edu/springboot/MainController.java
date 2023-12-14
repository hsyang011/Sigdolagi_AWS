package com.edu.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.market.IProductService;
import com.edu.springboot.market.ProductDTO;
import com.edu.springboot.planner.IPlannerService;
import com.edu.springboot.planner.PlannerDTO;
import com.edu.springboot.restaurant.IRestaurantService;
import com.edu.springboot.restaurant.RestaurantDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {
	
	// 플래너 리스트를 가져오기 위한 빈 주입
	@Autowired
	IPlannerService plannerDAO;
	
	// 맛집탐방 리스트를 가져오기 위한 빈 주입
	@Autowired
	IRestaurantService restaurantDAO;
	
	// 마켓 리스트를 가져오기 위한 빈 주입
	@Autowired
	IProductService productDAO;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/main/main.do")
	public String main(Model model, HttpServletRequest req) {
		// 로그인에 성공했을 경우
		if (req.getParameter("login")!=null && req.getParameter("login").equals("success")) {
			model.addAttribute("loginSuccessMsg", "로그인에 성공하였습니다!");
		}
		// 로그아웃에 성공했을 경우
		if (req.getParameter("logout")!=null && req.getParameter("logout").equals("success")) {
			model.addAttribute("logoutSuccessMsg", "로그아웃 하였습니다.");
		}
		// 권한이 거부되었을 경우
		if (req.getParameter("permit")!=null && req.getParameter("permit").equals("deny")) {
			model.addAttribute("permitDenyMsg", "권한이 거부되었습니다.");
		}
		// 플래너를 모두 셀렉트 합니다.
		List<PlannerDTO> plannerList = plannerDAO.getPlannerByRecent();
		// 맛집탐방을 모두 셀렉트 합니다.
		List<RestaurantDTO> restaurantList = restaurantDAO.getRestaurant();
		// 마켓 상품을 모두 셀렉트 합니다.
		List<ProductDTO> productList = productDAO.getAllProducts();
		
		// model객체에 저장
		model.addAttribute("plannerList", plannerList);
		model.addAttribute("restaurantList", restaurantList);
		model.addAttribute("productList", productList);
		
		return "main/main";
	}
}

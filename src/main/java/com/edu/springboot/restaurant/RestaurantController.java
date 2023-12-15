package com.edu.springboot.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {

    @Autowired
    IRestaurantService dao;

    @RequestMapping("/restaurant/restaurant_list.do")
    public String restaurantList(ParameterDTO parameterDTO, Model model, RestaurantDTO restaurantDTO) {
        System.out.println("레스토랑 리스트 컨트롤러 들어온다 ");
        int totalCount = dao.getTotalCount(parameterDTO);
        System.out.println(totalCount);

        
        // 모든 식당 정보를 리스트에 담기
        List<RestaurantDTO> restaurantList = dao.allrestaurant();
        model.addAttribute("restaurantList", restaurantList);

        System.out.println("성공?");

        return "restaurant/restaurant_list";
    }
}
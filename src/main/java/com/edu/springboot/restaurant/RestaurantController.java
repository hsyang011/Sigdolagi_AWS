package com.edu.springboot.restaurant;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
        // 랜덤 숫자 생성
        // 랜덤 숫자 생성
        List<Integer> randomNumbers = generateRandomNumbers();
        // 리스트의 첫 번째 값 가져오기 (랜덤한 숫자)
        int randomNum = randomNumbers.get(0);
        model.addAttribute("randomNum", randomNum);

        System.out.println("성공?");
        System.out.println("랜덤넘버");
        System.out.println(randomNum);

        return "restaurant/restaurant_list";
    }
    
    @GetMapping("/generate")
    public List<Integer> generateRandomNumbers() {
        List<Integer> numbers = new ArrayList<>();
        for (int i = 1; i <= 7; i++) {
            numbers.add(i);
        }

        Collections.shuffle(numbers);

        return numbers;
    }
    
    
    
}
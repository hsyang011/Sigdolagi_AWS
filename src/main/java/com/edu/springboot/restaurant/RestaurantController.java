package com.edu.springboot.restaurant;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.community.CommentsDTO;

import jakarta.servlet.http.HttpServletRequest;

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
    
    	//리뷰 
  		@RequestMapping("/restaurant/restaurant_review.do")
  		@ResponseBody
  		public CommentsDTO ReviewPost(Model model, HttpServletRequest req, CommentsDTO commentsDTO, Principal principal) {
  			int idx = commentsDTO.getIdx();
  	        String content = commentsDTO.getContent();
  	        String email =  principal.getName();
  	        String nickname = dao.getnickname(email);
  	        
  	        System.out.println(idx);
  	        System.out.println(content);
  	        System.out.println(nickname);
  	        System.out.println(email);
  	
  	        int result = dao.writeReview(idx, content, nickname, email);
  	
  	        System.out.println("성공?");
  	        System.out.println(commentsDTO);
  	        System.out.println("글쓰기결과:" + result);
  	        // 코멘트 테이블 전부다  얻어와서 저장하기  
  			ArrayList<CommentsDTO> commentsLists = dao.CommentsPage(commentsDTO);
  			//빈에 저장
  			
  			
  			System.out.println("댓글 디비에 있는거 가저오는거 성공?");
  			System.out.println(commentsLists);
  			
  			
  			model.addAttribute("CommentsLists", commentsLists);

  	        
  	        return commentsDTO;
  		}

  	
  	
    
    
}
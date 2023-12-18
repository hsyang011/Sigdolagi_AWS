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

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.CommentsDTO;
import com.edu.springboot.community.IBoardService;
import com.edu.springboot.community.PhotoBoardDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RestaurantController {

    @Autowired
    IRestaurantService restaurantdao;
    
    @Autowired
	   IBoardService boraddao;

    @RequestMapping("/restaurant/restaurant_list.do")
    public String restaurantList(ParameterDTO parameterDTO, Model model, RestaurantDTO restaurantDTO) {
        System.out.println("레스토랑 리스트 컨트롤러 들어온다 ");
        int totalCount = restaurantdao.getTotalCount(parameterDTO);
        System.out.println(totalCount);
        
        // 모든 식당 정보를 리스트에 담기
        List<RestaurantDTO> restaurantList = restaurantdao.allrestaurant();
        model.addAttribute("restaurantList", restaurantList);
        
        System.out.println("성공?");
        
        
        // 랜덤 숫자 생성
        List<Integer> randomNumbers = generateRandomNumbers();
        // 리스트의 첫 번째 값 가져오기 (랜덤한 숫자)
        int randomNum = randomNumbers.get(0);
        model.addAttribute("randomNumbers", randomNumbers);
        System.out.println(randomNumbers);
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
    

    
    
	   //맛집 view 
	   @RequestMapping("/restaurant/restaurant_view.do")
	   public String restaurantView(Model model,HttpServletRequest req,Principal principal, RestaurantDTO restaurantDTO) {
		  restaurantDTO = restaurantdao.rest_view(restaurantDTO);
		  restaurantDTO.setRoad_address(restaurantDTO.getRoad_address());
		  restaurantDTO.setX_point(restaurantDTO.getX_point());
		  restaurantDTO.setY_point(restaurantDTO.getY_point());
		  System.out.println("restaurantDTO"+ restaurantDTO);
	      
		  model.addAttribute("restaurantDTO", restaurantDTO);
	      
	      // boardDTO에서 idx값을 가져와서 commentsDTO에 채우기
	      CommentsDTO commentsDTO = new CommentsDTO();
	      try {	    	  
	    	  commentsDTO.setIdx(Integer.parseInt(restaurantDTO.getRestaurant_idx()));
	      } catch (Exception e) {
	    	  System.out.println("idx가 null입니다.");
	    	  e.printStackTrace();
	      }
	      
	      
	        // 코멘트 테이블 전부다  얻어와서 저장하기  
	      ArrayList<CommentsDTO> commentsLists = restaurantdao.CommentsPage(commentsDTO);
		
	      
	      
			
	      System.out.println("댓글 디비에 있는거 가저오는거 성공?");
	      System.out.println(commentsLists);
		
	      model.addAttribute("CommentsLists", commentsLists);

		  	if(principal!=null) {
	  			String email = principal.getName();
	  	        String nickname= restaurantdao.getnickname(email);
	  	        System.out.println(email);
	  	        model.addAttribute("email", email);
	  	        model.addAttribute("nickname",nickname); 
	  		}
	      return "restaurant/restaurant_view";
	   }
	

    //맛집 댓글
    ///댓글 작성  
  	@RequestMapping("/restaurant/restaurant_comment.do")
  	@ResponseBody
  	public CommentsDTO boardCommentPost(Model model, HttpServletRequest req, 
  			CommentsDTO commentsDTO, PhotoBoardDTO photoBoardDTO, RestaurantDTO restaurantDTO) {
  		
  		System.out.println("댓글 작성 컨트롤러 들어오나?");
  		
  		
  		
  		int idx = commentsDTO.getIdx();
          String content = commentsDTO.getContent();
          String nickname = commentsDTO.getNickname();
          String email = commentsDTO.getEmail();
          String starRating = req.getParameter("starRating");
          System.out.println("별점주기 ");
          System.out.println(starRating);
          
          
          
          System.out.println(idx);
          System.out.println(content);
          System.out.println(nickname);
          System.out.println(email);
          
          int result = restaurantdao.writeConmments(idx, content, nickname, email, starRating);
          System.out.println("평균 구하기 시도");
          double RateAve = restaurantdao.avgStar(photoBoardDTO);
          System.out.println("평균값 ");
          System.out.println(RateAve);
          model.addAttribute("RateAve",RateAve);
          System.out.println("성공?");
          System.out.println(commentsDTO);
          System.out.println("글쓰기결과:" + result);
          
          
          
          
          
          // 코멘트 테이블 전부다  얻어와서 저장하기  
  		//ArrayList<CommentsDTO> commentsLists = restaurantdao.CommentsPage(commentsDTO);
  		//빈에 저장
  		
  		
  		System.out.println("댓글 디비에 있는거 가저오는거 성공?");
  		//System.out.println(commentsLists);
  		
  		
  		//model.addAttribute("CommentsLists", commentsLists);
  		model.addAttribute("photoBoardDTO",photoBoardDTO);
  		model.addAttribute("result", result);
          
          return commentsDTO;
  	}

    
    	//리뷰 
  		@RequestMapping("/restaurant/restaurant_review.do")
  		@ResponseBody
  		public CommentsDTO ReviewPost(Model model, HttpServletRequest req, CommentsDTO commentsDTO, Principal principal) {
  			int idx = commentsDTO.getIdx();
  	        String content = commentsDTO.getContent();
  	        String email =  principal.getName();
  	        String nickname = restaurantdao.getnickname(email);
  	        
  	        System.out.println(idx);
  	        System.out.println(content);
  	        System.out.println(nickname);
  	        System.out.println(email);
  	
  	        int result = restaurantdao.writeReview(idx, content, nickname, email);
  	
  	        System.out.println("성공?");
  	        System.out.println(commentsDTO);
  	        System.out.println("글쓰기결과:" + result);
  	        // 코멘트 테이블 전부다  얻어와서 저장하기  
  			ArrayList<CommentsDTO> commentsLists = restaurantdao.CommentsPage(commentsDTO);
  			//빈에 저장
  			
  			
  			System.out.println("댓글 디비에 있는거 가저오는거 성공?");
  			System.out.println(commentsLists);
  			
  			
  			model.addAttribute("CommentsLists", commentsLists);

  	        
  	        return commentsDTO;
  		}

  	
  	
    
    
}
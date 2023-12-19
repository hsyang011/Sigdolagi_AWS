package com.edu.springboot.restaurant;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.community.BoardDTO;
import com.edu.springboot.community.CommentsDTO;
import com.edu.springboot.community.IBoardService;
import com.edu.springboot.community.PhotoBoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class RestaurantController {

    @Autowired
    IRestaurantService restaurantdao;
    
    @Autowired
      IBoardService boraddao;

    @RequestMapping("/restaurant/restaurant_list.do")
    public String restaurantList(ParameterDTO parameterDTO, Model model, RestaurantDTO restaurantDTO, CommentsDTO commentsDTO) {
        System.out.println("레스토랑 리스트 컨트롤러 들어온다 ");
        System.out.println(commentsDTO);
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
    

    
    
      //맛집 view ../restaurant/restaurantView.do
      @RequestMapping("/restaurant/restaurant_view.do")
      public String restaurantView(Model model,HttpServletRequest req,Principal principal, RestaurantDTO restaurantDTO, CommentsDTO commentsDTO) {
    	  System.out.println("View 컨트롤러 들어오나? ");
    	  System.out.println(restaurantDTO);
    	  String idx = restaurantDTO.getRestaurant_idx(); 
        restaurantDTO = restaurantdao.rest_view(restaurantDTO);
        
        restaurantDTO.setX_point(restaurantDTO.getX_point());
        restaurantDTO.setY_point(restaurantDTO.getY_point());
        System.out.println("restaurantDTO"+ restaurantDTO);
         
        
        model.addAttribute("restaurantDTO", restaurantDTO);
         
         // boardDTO에서 idx값을 가져와서 commentsDTO에 채우기
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
        System.out.println(commentsDTO);
        
        
        int idx = commentsDTO.getIdx();
          String content = commentsDTO.getContent();
          String nickname = req.getParameter("nickname");
          String email = req.getParameter("email");
          String starRating = req.getParameter("starRating");
          System.out.println("별점주기 ");
          System.out.println(starRating);
          System.out.println(idx);
          System.out.println(content);
          System.out.println(nickname);
          System.out.println(email);
          
          
          //여기부터 파일 첨부 시도
          
          
          try {
              System.out.println("파일업로드 컨트롤러 들어오나?");
               // 물리적 경로 얻어오기
               String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
               System.out.println("물리적 경로:" + uploadDir);

               // 파일명 저장을 위한 Map 생성. Key는 원본 파일명, value는 서버에 저장된 파일명을 저장한다.
               Map<String, String> saveFileMaps = new HashMap<>();

               // 2개 이상의 파일 이므로 getParts()메서드를 통해 폼값을 받는다. 컬렉션타입으로 받음
               Collection<Part> parts = req.getParts();

               // 폼값의 갯수만큼 반복
               for (Part part : parts) {
                   // 폼값 중 파일인 경우에만 업로드 처리를 위해 continue를 걸어준다.
                   // 파일이 아니라면 for문의 처음으로 돌아간다.
                   if (!part.getName().equals("ofile"))
                       continue;

                   
                   // 파일명 추출을 위해 헤더값을 얻어온다.
                   String partHeader = part.getHeader("content-disposition");
                   System.out.println("partHeader=" + partHeader);

                   String[] phArr = partHeader.split("filename=");
                   // 파일명을 추출한 후 따옴푤ㄹ 제거한다.
                   String originalFileName = phArr[1].trim().replace("\"", "");

                   // 파일을 원본파일명으로 저장한다.
                   if (!originalFileName.isEmpty()) {
                       part.write(uploadDir + File.separator + originalFileName);
                   }

                   // 저장된 파일명을 UUID로 생성한 새로운 파일명으로 저장한다.
                   String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);

                   // Map 컬렉션에 원본파일명과 저장된 파일명을 key와 value로 저장한다.
                   saveFileMaps.put(originalFileName, savedFileName);
                   System.out.println(savedFileName);


                   commentsDTO.setOfile(originalFileName);
                   commentsDTO.setSfile(savedFileName);
                   String sfile = savedFileName;

                   //int result = restaurantdao.writeConmments(idx, content, nickname, email, starRating);
                   int result = restaurantdao.writeConmments(commentsDTO);
                   if (result == 1) {
                       System.out.println("멀티성공(?)");
                       model.addAttribute("originalFileName", originalFileName);
                       model.addAttribute("saveFileMaps", saveFileMaps);
                      model.addAttribute("title", req.getParameter("title"));
                   }
               }
       	   } catch (Exception e) {
               e.printStackTrace();
               System.out.println("업로드 실패");
           }
          
          
          /////// 파일 첨부 시도 끝 
          // 리뷰쓰기인데 함수이름이 커멘트다 
          //int result = restaurantdao.writeConmments(idx, content, nickname, email, starRating);
          System.out.println("평균 구하기 시도");
         // double RateAve = restaurantdao.avgStar(photoBoardDTO);
          System.out.println("평균값 ");
          //System.out.println(RateAve);
          //model.addAttribute("RateAve",RateAve);
          System.out.println("성공?");
          System.out.println(commentsDTO);
          
          // 코멘트 테이블 전부다  얻어와서 저장하기  
        ArrayList<CommentsDTO> commentsLists = restaurantdao.CommentsPage(commentsDTO);
        //빈에 저장
        
        
        System.out.println("댓글 디비에 있는거 가저오는거 성공?");
        System.out.println(commentsLists);
        
        
        model.addAttribute("CommentsLists", commentsLists);
        model.addAttribute("photoBoardDTO",photoBoardDTO);
         
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
package com.edu.springboot.market;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

@Controller
public class MarketController {
	
	// DAO 호출을 위한 빈 자동 주입.
	@Autowired
	IMarketService dao;
	
	// 상품 리스트
	@RequestMapping("/market/market_list.do")
	public String marketList(ParameterDTO parameterDTO, Model model, HttpServletRequest req) {
		int totalCount = dao.getTotalCount(parameterDTO); // 게시물의 갯수를 카운트
		int pageSize = 16; // 한 페이지당 게시물 수
		int blockPage = 5; // 한 블록당 페이지번호 수
		// 목록에 첫 진입시 페이지 번호가 없으므로 1로 설정하고, 파라미터로 전달된 페이지번호가 있다면 받은 후 정수로 변경해서 설정한다.
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals("")) ?
				1 : Integer.parseInt(req.getParameter("pageNum"));
		
		// 현재 페이지에 출력한 게시물의 구간을 계산한다.
		int start = (pageNum-1)*pageSize+1;
		int end = pageNum*pageSize;
		// 계산된 값은 DTO에 저장한다.
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		// view에서 게시물의 가상번호 계산을 위한 값들을 map에 저장한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		model.addAttribute("map", map);
		
		// DB에서 인출한 게시물의 목록을 model객체에 저장한다.
		List<ProductDTO> list = dao.list(parameterDTO);
		model.addAttribute("list", list);
		
		// 게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 model객체에 저장한다.
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./market_list.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		return "market/market_list";
	}
	
	// 상품 상세보기
	@RequestMapping("/market/market_view.do")
	public String marketView(ProductDTO productDTO, Model model) {
		productDTO = dao.view(productDTO);
		model.addAttribute("productDTO", productDTO);
		
		List<ProductDTO> recommendList = dao.recommendList(productDTO);
		model.addAttribute("recommendList", recommendList);
		
		return "market/market_view";
	}
	
	@RequestMapping("/market/addToCart.do")
	public ResponseEntity<String> addToCart(CartDTO cartDTO, Model model) {
		// 임의로 이메일 설정 (시큐리티 연동 전)
		cartDTO.setEmail("foo@gmail.com");
		
		System.out.println(cartDTO.getCart_idx() + ":" + cartDTO.getEmail() + ":" + cartDTO.getProd_count() + ":" + cartDTO.getProd_idx());
		
		dao.addToCart(cartDTO);
		return ResponseEntity.ok("상품이 성공적으로 추가되었습니다.");
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

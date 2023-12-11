package com.edu.springboot.market;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.member.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.PagingUtil;

@Controller
public class MarketController {
	
	// DAO 호출을 위한 빈 자동 주입.
	@Autowired
	IProductService productDAO;
	
	@Autowired
	ICartService cartDAO;
	
	// 상품 리스트
	@RequestMapping("/market/market_list.do")
	public String marketList(ParameterDTO parameterDTO, Model model, HttpServletRequest req) {
		int totalCount = productDAO.getTotalCount(parameterDTO); // 게시물의 갯수를 카운트
		
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
		List<ProductDTO> list = productDAO.list(parameterDTO);
		model.addAttribute("list", list);
		
		// 게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 model객체에 저장한다.
		String pagingImg = PagingUtil.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"./market_list.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		return "market/market_list";
	}
	
	// 상품 상세보기
	@RequestMapping("/market/market_view.do")
	public String marketView(ProductDTO productDTO, Model model) {
		productDTO = productDAO.view(productDTO);
		model.addAttribute("productDTO", productDTO);
		
		List<ProductDTO> recommendList = productDAO.recommendList(productDTO);
		model.addAttribute("recommendList", recommendList);
		
		return "market/market_view";
	}
	
	// 장바구니에 상품 추가
	@RequestMapping("/market/addToCart.do") // cartDTO에는 email과 prod_idx만 담겨있는 상태
	public ResponseEntity<String> addToCart(CartDTO cartDTO, Model model, Principal principal) {
		cartDTO.setEmail(principal.getName());
		// 추가된 적이 있는지 확인, 0이면 없고, 1이면 있음.
		int result = cartDAO.getProdIdx(cartDTO);
		// 추가된 적이 없다면 insert 쿼리를 실행
		if (result == 0) {			
			cartDAO.addToCart1(cartDTO);
		// 추가된 적이 있다면 update 쿼리를 실행
		} else {
			cartDAO.addToCart2(cartDTO);
		}
		// 상품 총 가격 변경 로직
		// prod_idx로 cart_idx 가져오고 DTO에 넣기
		cartDTO.setCart_idx(cartDAO.getCartIdx(cartDTO));
		// 수량 * 가격을 구해서 prod_totPrice에 반영
		String prodTotPrice = cartDAO.prodTotPrice(cartDTO);
		System.out.println("상품의 가격" + prodTotPrice);
		cartDTO.setProd_totprice(prodTotPrice);
		cartDAO.updateTotPrice(cartDTO);
		return ResponseEntity.ok("상품이 성공적으로 추가되었습니다.");
	}
	
	// 장바구니 페이지
	@RequestMapping("/market/cart.do")
	public String cart(MemberDTO memberDTO, Model model, Principal principal) {
		// 임의로 이메일 설정 (시큐리티 연동 전)
		memberDTO.setEmail(principal.getName());
		// cart_idx들을 모두 모아 List컬렉션에 담는다.
		List<CartDTO> cartInfo = cartDAO.cartInfo(memberDTO);
		// 키값이 cart_idx이고, 상품 정보가 List<ProductDTO>인 Map컬렉션 생성
		Map<String, List<ProductDTO>> map = new HashMap<String, List<ProductDTO>>();
		for (CartDTO cartDTO : cartInfo) {
			// cart_idx와 prod_count사이에 ":"를 넣은 문자열을 키값으로 한다. 0번 : 일련번호, 1번 : 수량, 2번 : 총가격
			map.put(cartDTO.getCart_idx()+":"+cartDTO.getProd_count()+":"+cartDTO.getProd_totprice(), cartDAO.allProductInfo(cartDTO));
		}
		
		
		model.addAttribute("map", map);
		System.out.println(cartInfo);
		
		return "market/cart";
	}
	
	// 장바구니에 상품 수량 변경
	@RequestMapping("/market/updateToCart.do") // cartDTO에는 email과 prod_idx만 담겨있는 상태
	public ResponseEntity<CartDTO> updateToCart(CartDTO cartDTO, Model model, Principal principal) {
		cartDTO.setEmail(principal.getName());
		// 상품 수량 변경
		cartDAO.updateToCart(cartDTO);

		// 상품 총 가격 변경 로직
		// prod_idx로 cart_idx 가져오고 DTO에 넣기
		cartDTO.setCart_idx(cartDAO.getCartIdx(cartDTO));
		// 수량 * 가격을 구해서 prod_totPrice에 반영
		String prodTotPrice = cartDAO.prodTotPrice(cartDTO);
		System.out.println("상품의 가격" + prodTotPrice);
		cartDTO.setProd_totprice(prodTotPrice);
		cartDAO.updateTotPrice(cartDTO);
		return ResponseEntity.ok(cartDTO);
	}
	
	// 장바구니에 상품 제거
	@RequestMapping("/market/deleteToCart.do") // cartDTO에는 email과 prod_idx만 담겨있는 상태
	public ResponseEntity<CartDTO> deleteToCart(CartDTO cartDTO, Model model, Principal principal) {
		cartDTO.setEmail(principal.getName());
		// 상품 제거
		cartDAO.deleteToCart(cartDTO);
		return ResponseEntity.ok(cartDTO);
	}
	
	@RequestMapping("/market/order.do")
	public String order(MemberDTO memberDTO, HttpServletRequest req, Model model, Principal principal) {
		memberDTO.setEmail(principal.getName());
		// cart_idx들을 모두 모아 List컬렉션에 담는다.
		List<CartDTO> cartInfo = cartDAO.cartInfo(memberDTO);
		// 키값이 cart_idx이고, 상품 정보가 List<ProductDTO>인 Map컬렉션 생성
		Map<String, List<ProductDTO>> map = new HashMap<String, List<ProductDTO>>();
		for (CartDTO cartDTO : cartInfo) {
			// cart_idx와 prod_count사이에 ":"를 넣은 문자열을 키값으로 한다. 0번 : 일련번호, 1번 : 수량, 2번 : 총가격
			map.put(cartDTO.getCart_idx()+":"+cartDTO.getProd_count()+":"+cartDTO.getProd_totprice(), cartDAO.allProductInfo(cartDTO));
		}
		model.addAttribute("map", map);
		
		// 파라미터 값을 가져온다.
		String allPrice = req.getParameter("allPrice");
		String payment = req.getParameter("payment");
		String deliveryPrice = req.getParameter("delivery");
		
		System.out.println(allPrice + ":" + payment);
		
		model.addAttribute("_allPrice", allPrice);
		model.addAttribute("payment", payment);
		model.addAttribute("deliveryPrice", deliveryPrice);
		return "market/order";
	}
	
}

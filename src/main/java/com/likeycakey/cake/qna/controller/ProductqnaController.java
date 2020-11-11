package com.likeycakey.cake.qna.controller;

import com.likeycakey.cake.qna.model.service.ProductqnaService;
import com.likeycakey.cake.qna.model.vo.Productqna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class ProductqnaController {
	
	@Autowired
	private ProductqnaService productqnaService;
	
	// 상품큐앤에이 리스트
	// home qna 리스트를 불러오는 컨트롤러
		@RequestMapping(value="detail.ca")
		public ModelAndView list() throws Exception {
			System.out.println("list 도착");
			
			ArrayList<Productqna> list = productqnaService.listAll();		
			System.out.println(list.size());
			System.out.println(list.get(0).getId());
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", list); // 데이터를 저장
			mv.setViewName("qna/productQna"); // 뷰를 homeQna.jsp로 설정
			return mv;
		}
	
	
	// 상품큐앤에이 글쓰기
	@RequestMapping(value="insertPqna.ca")
	public String insertProductqna(@ModelAttribute Productqna pq, @RequestParam("pbNum") String pbNum) throws Exception {
		productqnaService.insertProductqna(pq);
		System.out.println("홈페이지 문의글 등록 컨트롤러");
		return "redirect:detail.ca?pbNum=#{pbNum}";
	}

}

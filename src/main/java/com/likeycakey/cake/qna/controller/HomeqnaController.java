package com.likeycakey.cake.qna.controller;

import com.likeycakey.cake.qna.model.service.HomeqnaService;
import com.likeycakey.cake.qna.model.vo.Homeqna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class HomeqnaController {
	
	@Autowired
	private HomeqnaService homeqnaService;
	// 홈큐앤에이 페이지로 이동	
	// home qna 리스트를 불러오는 컨트롤러
	@RequestMapping(value="homeqna.ca")
	public ModelAndView list() throws Exception {
		System.out.println("list 도착");
		
		ArrayList<Homeqna> list = homeqnaService.listAll();		
		System.out.println(list.size());
		System.out.println(list.get(0).getId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list); // 데이터를 저장
		mv.setViewName("qna/homeQna"); // 뷰를 homeQna.jsp로 설정
		return mv;
	}
	
	// 글쓰기 폼으로 이동하는 컨트롤러
	@RequestMapping (value = "homeqna_write.ca")
	public String onlymoveqnawrite (Model model) {
		return "qna/homeqna_write";
	}
	
	// homeqna_write에서 글 입력한 후 문의하기를 클릭했을 때 등록
	@RequestMapping (value="insertHomeqna.ca", method= RequestMethod.POST)
	public String insertHomeqna(@ModelAttribute Homeqna hq) throws Exception {
		homeqnaService.insertHomeqna(hq);
		System.out.println("홈페이지 문의글 등록 컨트롤러");
		return "redirect:homeqna.ca";
	}
	
	
	// homeqnaView(상세보기)를 보여주는 컨트롤러
	@RequestMapping (value = "homeqnaView.ca", method = RequestMethod.GET)
	public ModelAndView homeqnaView (@RequestParam int hqNum, HttpSession session) throws Exception {
		// 모델 (데이터) + 뷰 (화면) 을 함께 전달하는 객체
		ModelAndView mv = new ModelAndView();
		// 뷰 이름
		mv.setViewName("qna/homeqnaView");
		// 뷰에 데이터 전달
		mv.addObject("homeqna", homeqnaService.read(hqNum));
		return mv;
	}
	
}


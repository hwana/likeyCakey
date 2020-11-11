package com.likeycakey.cake.defaultPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	// @Component 에서 Controller부분의 기본 설정을 추가한 자동 매핑 어노테이션 
	// @Component의 확장판
	@Controller
	public class DefaultController {

		
		@RequestMapping(value="header.ca", method=RequestMethod.GET)
		public String testSelectOne(Model model) {
			
			return "default/header";
		}
		
		@RequestMapping(value="footer.ca", method=RequestMethod.GET)
		public String testMyHome(Model model) {
			
			return "default/footer";
		}
		
		// 회원가입 시 멤버 유형을 선택할 수 있는 선택창으로 이동하는 컨트롤러
		@RequestMapping(value="mem_choice.ca", method=RequestMethod.GET)
		public String joinMemchoose (Model model) {
			return "default/mem_choice";
		}
		
	}

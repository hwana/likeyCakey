package com.likeycakey.cake.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	@RequestMapping(value = "/notice.ca")
	public String noticeMain(Model model) {
		return "notice/notice_main";
	}
}

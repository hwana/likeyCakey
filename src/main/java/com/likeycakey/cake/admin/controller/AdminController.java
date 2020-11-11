package com.likeycakey.cake.admin.controller;

import com.likeycakey.cake.admin.model.service.AdminService;
import com.likeycakey.cake.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	/* 1_1. 관리자_멤버 리스트 셀렉트 */
	@RequestMapping(value = "/adminMemberList.ca", method = RequestMethod.GET)
	public ModelAndView adminMemberList(Member m, @RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		System.out.println("adminmemberList mapping도착");

		try {


			ArrayList<Member> list = adminService.selectList();


			System.out.println("adminMemberList : list.size=" + list.size());
			if (list != null && list.size() > 0) {

				mv.addObject("list", list).setViewName("admin/adminMemberList");
			} else {
				System.out.println("adminMemberList : list가 안 들고 와짐");
				mv.addObject("error", "adminMemberList : 게시글 전체 조회 실패");
				mv.setViewName("admin/adminMemberList");
			}

		} catch (Exception e) {

			System.out.println("adminMemberList에서 에러남");
			mv.addObject("error", "게시글 전체 조회 실패");

			mv.setViewName("admin/adminMemberList");
		}

		return mv;
	}

	/* 1_2. 관리자_멤버 한명만!!! 수정 */
	@RequestMapping(value = "/adminMemberUpdate.ca", method = RequestMethod.POST)
	public ModelAndView adminMemberUpdate(ModelAndView mv, @RequestParam("mcode") String mcode,
			@RequestParam("mid") String mid, @RequestParam("mpasswd") String mpasswd,
			@RequestParam("mname") String mname, @RequestParam("memail") String memail,
			@RequestParam("mphone") String mphone, @RequestParam("mstatus") String mstatus,
			@RequestParam("mblackCnt") String mblackCnt, HttpServletResponse response) {

		System.out.println("adminMemberUpdate mapping도착");

		try {
			/*
			 * JSONObject json = new JSONObject(); json.put("mcode", mcode); json.put("mid",
			 * mid);
			 */
			PrintWriter out = response.getWriter();
			System.out.println("print");
			System.out.println(mcode + " " + mid + " " + mpasswd + " " + mname + " " + memail + " " + mphone + " "
					+ mstatus + " " + mblackCnt);
			Member member = new Member(Integer.parseInt(mcode), mid, mpasswd, mname, memail, mphone,
					Integer.parseInt(mstatus), Integer.parseInt(mblackCnt));
			System.out.println("멤버 초기화?");

			int result = adminService.updateMember(member);// 멤버 업데이트 하고z
			System.out.println("멤버 업데이트 성공: result=" + result);
			if (result > 0)
				out.print("ok");
			else
				out.print("no");

			out.flush();
			out.close();
			/*
			 * Member member = adminService.selectOne(id);//업데이트 한 멤버만 정보 다시 받아오기
			 */ /* mv.setViewName("redirect:home.do"); */
			mv.setViewName("admin/adminMemberList");
		} catch (Exception e) {
			mv.setViewName("admin/adminMemberList");
		}

		return mv;

	}

	/* 1_3. 관리자_멤버 선택 삭제 */
	@RequestMapping(value = "/adminMemberDelete.ca", method = RequestMethod.POST)
	public void adminMemberDelete(@RequestParam("delMembers") String deleteMembers, HttpServletResponse response) {
		System.out.println("adminMemberDelete mapping도착");

		try {
			PrintWriter out = response.getWriter();
			System.out.println("deleteMember="+deleteMembers);
			
			ArrayList<String> delMembers = new ArrayList<String>(Arrays.asList(deleteMembers.split(",")));
			System.out.println("delMembers.size()="+delMembers.size());
			
			int result = 0;
			for (int i = 0; i < delMembers.size(); i++) {
				System.out.println((String) delMembers.get(i));
				result = adminService.deleteMember((String) delMembers.get(i));// 멤버 업데이트 하고z
			}
			System.out.println("멤버 선택 삭제 성공: result=" + result);

			System.out.println(result);
			if (result > 0)
				out.print("ok");
			else
				out.print("no");

		} catch (Exception e) {
			System.out.println("adminMemberDelete에서 에러발생");

		}

	}

	/* 1_4. 관리자_멤버 전체 삭제 */
	@RequestMapping(value = "/adminMemberTotalDelete.ca", method = RequestMethod.POST)
	public void adminMemberTotalDelete(HttpServletResponse response) {

		System.out.println("adminMemberTotalDelete mapping도착");
		try {
			PrintWriter out = response.getWriter();
			int result = adminService.deleteTotalMember();// 멤버 업데이트 하고z
			System.out.println("멤버 업데이트 성공: result=" + result);
			if (result > 0)
				out.print("ok");
			else
				out.print("no");

			out.flush();
			out.close();
		} catch (Exception e) {
		}

	}

	/* 2_1. 관리자_사업장 리스트 셀렉트 */
	/* 1_1. 관리자_멤버 리스트 셀렉트 */
	@RequestMapping(value = "/adminBizList.ca", method = RequestMethod.GET)
	public ModelAndView adminBizList(Member m, @RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		System.out.println("adminBizList mapping도착");

		try {
			ArrayList<Member> list = adminService.selectBizList();

			// 총 페이지수 계산 : 목록이 최소 1개일 때 1page로 처리하기
	
			System.out.println("adminBizList : list.size=" + list.size());
			if (list != null && list.size() > 0) {

				mv.addObject("list", list).setViewName("admin/adminBizList");
			} else {
				System.out.println("adminBizList : list가 안 들고 와짐");
				mv.addObject("error", "adminBizList : 게시글 전체 조회 실패");
				mv.setViewName("admin/adminBizList");
			}

		} catch (Exception e) {

			System.out.println("adminBizList에서 에러남");
			mv.addObject("error", "게시글 전체 조회 실패");

			mv.setViewName("admin/adminBizList");
		}

		return mv;
	}
	
/*	@RequestMapping(value = "/adminBizList.ca", method = RequestMethod.GET)
	public ModelAndView adminBizList(ModelAndView mv) {

		System.out.println("adminBizList mapping도착");

		try {
			 bizService.insertBiz(bm); 
			mv.setViewName("redirect:home.do");
		} catch (Exception e) {
			mv.setViewName("admin/adminBizList");
		}

		return mv;

	}*/

	/* 2_2. 관리자_사업장 수정 */
	@RequestMapping(value = "/adminBizUpdate.ca", method = RequestMethod.GET)
	public ModelAndView adminBizUpdate(Member m, ModelAndView mv) {

		System.out.println("adminBizUpdate mapping도착");
		try {
			/* bizService.insertBiz(bm); */
			mv.setViewName("redirect:home.do");
		} catch (Exception e) {
			mv.setViewName("admin/adminBizList");
		}

		return mv;
	}

	/* 2_3. 관리자_사업장 선택 삭제 */
	@RequestMapping(value = "/adminBizDelete.ca", method = RequestMethod.GET)
	public ModelAndView adminBizDelete(Member m, ModelAndView mv) {

		System.out.println("adminBizDelete mapping도착");
		try {
			/* bizService.insertBiz(bm); */
			mv.setViewName("redirect:home.do");
		} catch (Exception e) {
			mv.setViewName("admin/adminBizList");
		}

		return mv;

	}
	
	

}

package com.likeycakey.cake.list.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.detailView.model.vo.ProductReview;
import com.likeycakey.cake.list.model.service.ListService;
import com.likeycakey.cake.list.model.vo.FilterList;

@Controller
public class ListController {
	
	@Autowired
	private ListService listService;
	
	@RequestMapping(value = "cakeSearch.ca", method = RequestMethod.GET)
	public ModelAndView cakeSearch(
			@RequestParam("input_search") String inputsearch,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "simple_filter", required = false) String simplefilter,
			ModelAndView mv) {
		
		// 페이지 값 처리용
		int currentPage = 1;

		// 한 페이지당 출력할 목록 갯수
		int limit = 6;
		
		// 전달된 페이지값 추출
		if (page != null)
			currentPage = page;
		
		// 총 검색 케이크 수
		int cakeCount = 0;
		
		// 전체 목록 갯수와 해당 페이지별 목록을 리턴
		try {
			if (simplefilter != null) {
				FilterList filterlist = new FilterList(inputsearch, simplefilter);
				cakeCount = listService.getCakeCount(filterlist);
			}
			else {
				cakeCount = listService.getCakeCount(inputsearch);
			}
			System.out.println("태그관련케이크 개수 : " + cakeCount);
		} catch (Exception e){
			System.out.println("태그관련케이크 개수를 불러오는데 실패 ");
			System.out.println(e);
		}
		
		// 케이크 불러오기
		ArrayList<ProductBoard> cakelist;
		if (simplefilter != null) {
			FilterList filterlist = new FilterList(inputsearch, simplefilter);
			cakelist = listService.selectCakeList(filterlist, currentPage, limit);
		}
		else {
			cakelist = listService.selectCakeList(inputsearch, currentPage, limit);
		}
		
		ArrayList<String> locationlist = new ArrayList<String>();
		for(int i=0; i<cakelist.size(); i++) {
			locationlist.add(listService.selectLocationList(cakelist.get(i).getId()));
		}
		
		// 총 페이지 수
		int maxpage = (cakeCount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = ((currentPage - 1) / 6) * 6 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 6 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
	    
		if (cakelist != null && cakelist.size() > 0) {
			
			System.out.println("케이크 조회 가져오기 성공");
			mv.addObject("input_search", inputsearch)
			.addObject("cakelist", cakelist)
			.addObject("currentPage", currentPage)
			.addObject("maxpage", maxpage)
			.addObject("startpage", startpage)
			.addObject("endpage", endpage)
			.addObject("cakeCount", cakeCount)
			.addObject("simple_filter", simplefilter)
			.addObject("locationlist", locationlist);
			mv.setViewName("list/cakelist");
			
		} else {
			System.out.println("케이크 조회 실패");
			mv.addObject("input_search", inputsearch);
			mv.setViewName("list/cakelist");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "cakeSort.ca", method = RequestMethod.GET)
	public ModelAndView cakeSort(
			@RequestParam("input_search") String inputsearch,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "orderfilter", required = true) int orderfilter,
			ModelAndView mv) {
		
		// 페이지 값 처리용
		int currentPage = 1;

		// 한 페이지당 출력할 목록 갯수
		int limit = 6;
		
		// 전달된 페이지값 추출
		if (page != null)
			currentPage = page;
		
		// 총 검색 케이크 수
		int cakeCount = 0;
		
		// 전체 목록 갯수와 해당 페이지별 목록을 리턴
		try {
			cakeCount = listService.getCakeCount(inputsearch);
			System.out.println("태그관련케이크 개수 : " + cakeCount);
		} catch (Exception e){
			System.out.println("태그관련케이크 개수를 불러오는데 실패 ");
			System.out.println(e);
		}
		
		// 케이크 불러오기
		ArrayList<ProductBoard> cakelist;
		if((orderfilter) == 1) {
			cakelist = listService.selectCakeListwithOrder1(inputsearch, currentPage, limit);
		} else if((orderfilter) == 2) {
			cakelist = listService.selectCakeListwithOrder2(inputsearch, currentPage, limit);
		} else if((orderfilter) == 3) {
			cakelist = listService.selectCakeListwithOrder3(inputsearch, currentPage, limit);
		} else if((orderfilter) == 4) {
			cakelist = listService.selectCakeListwithOrder4(inputsearch, currentPage, limit);
		} else {
			cakelist = listService.selectCakeListwithOrder5(inputsearch, currentPage, limit);
		}
		
		ArrayList<String> locationlist = new ArrayList<String>();
		for(int i=0; i<cakelist.size(); i++) {
			locationlist.add(listService.selectLocationList(cakelist.get(i).getId()));
		}
		
		// 총 페이지 수
		int maxpage = (cakeCount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = ((currentPage - 1) / 6) * 6 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 6 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
	    
		if (cakelist != null && cakelist.size() > 0) {
			
			System.out.println("케이크 조회 가져오기 성공");
			mv.addObject("input_search", inputsearch)
			.addObject("cakelist", cakelist)
			.addObject("currentPage", currentPage)
			.addObject("maxpage", maxpage)
			.addObject("startpage", startpage)
			.addObject("endpage", endpage)
			.addObject("cakeCount", cakeCount)
			.addObject("locationlist", locationlist);
			mv.setViewName("list/cakelist");
			
		} else {
			System.out.println("케이크 조회 실패");
			mv.addObject("input_search", inputsearch);
			mv.setViewName("list/cakelist");
		}
		
		if ((orderfilter)==1)
			mv.addObject("orderfilter", "최신 업로드 순");
		else if ((orderfilter)==2)
			mv.addObject("orderfilter", "베스트 케이크 순");
		else if ((orderfilter)==3)
			mv.addObject("orderfilter", "가격 낮은 순");
		else if ((orderfilter)==4)
			mv.addObject("orderfilter", "가격 높은 순");
		else if ((orderfilter)==5)
			mv.addObject("orderfilter", "이용후기 많은 순");
		
		return mv;
	}
	
	@RequestMapping(value = "hostinfo.ca", method = RequestMethod.GET)
	public ModelAndView hostinfo(
			@RequestParam("input_vendor_id") String inputvendor,
			@RequestParam(value = "page_cake", required = false) Integer pagecake,
			@RequestParam(value = "page_review", required = false) Integer pagereview,
			ModelAndView mv) {
		
		// 현재 케이크, 리뷰 페이지
		int pagecake_current = 1;
		int pagereview_current = 1;

		// 한 페이지당 출력할 목록 갯수
		int limitcake = 6;
		int limitreview = 3;
		
		// 전달된 페이지값 추출
		if (pagecake != null)
			pagecake_current = pagecake;
		if (pagereview != null)
			pagereview_current = pagereview;
		
		// 총 검색 케이크 수
		int vendorcakeCount = 0;
		int vendorreviewCount = 0;
		
		// 전체 목록 갯수와 해당 페이지별 목록을 리턴
		try {
			vendorcakeCount = listService.getVendorCakeCount(inputvendor);
			vendorreviewCount = listService.getVendorReviewCount(inputvendor);
			System.out.println("이 상점의 케이크 개수 : " + vendorcakeCount);
			System.out.println("이 상점의 리뷰 개수 : " + vendorreviewCount);
		} catch (Exception e){
			System.out.println("이 상점의 케이크 개수를 불러오는데 실패 ");
			System.out.println(e);
		}
		
		// 케이크 불러오기
		ArrayList<ProductBoard> vendorcakelist;
		vendorcakelist = listService.selectVendorCakeList(inputvendor, pagecake_current, limitcake);
		
		// 리뷰 불러오기
		ArrayList<ProductReview> vendorreviewlist;
		vendorreviewlist = listService.selectVendorReviewList(inputvendor, pagereview_current, limitreview);
			
		// 케이크의 위치 불러오기
		ArrayList<String> vendorlocationlist = new ArrayList<String>();
		for(int i=0; i<vendorcakelist.size(); i++) {
			vendorlocationlist.add(listService.selectVendorLocationList(vendorcakelist.get(i).getId()));
		}
		
		// 리뷰를 쓴 유저의 이미지 불러오기
		ArrayList<String> reviewimglist = new ArrayList<String>();
		for(int i=0; i<vendorreviewlist.size(); i++) {
			reviewimglist.add(listService.selectReviewImgList(vendorreviewlist.get(i).getId()));
		}
		
		// 리뷰와 관련된 케이크 불러오기
		ArrayList<String> reviewcakelist = new ArrayList<String>();
		for(int i=0; i<vendorreviewlist.size(); i++) {
			reviewcakelist.add(listService.selectReviewCakeList(vendorreviewlist.get(i).getPbNum()));
		}
		
		// 케이크 이미지 추가하기
	      String vendorimg;
	      vendorimg = listService.selectVendorImg(inputvendor);
		
		// 총 페이지 수
		int maxpagecake = (vendorcakeCount + limitcake - 1) / limitcake;
		int maxpagereview = (vendorreviewCount + limitreview - 1) / limitreview;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpagecake = ((pagecake_current - 1) / 6) * 6 + 1;
		int startpagereview = ((pagereview_current - 1) / 6) * 6 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpagecake = startpagecake + 6 - 1;
		int endpagereview = startpagereview + 6 - 1;

		if (endpagecake > maxpagecake)
			endpagecake = maxpagecake;
		
		if (endpagereview > maxpagereview)
			endpagereview = maxpagereview;
	    
		if (vendorcakelist != null && vendorcakelist.size() > 0) {
			
			System.out.println("이 상점의 모든 케이크 가져오기 성공");
			mv.addObject("input_vendor", inputvendor)
			.addObject("vendorcakelist", vendorcakelist)
			.addObject("pagecake_current", pagecake_current)
			.addObject("maxpagecake", maxpagecake)
			.addObject("startpagecake", startpagecake)
			.addObject("endpagecake", endpagecake)
			.addObject("vendorcakeCount", vendorcakeCount)
			.addObject("vendorlocationlist", vendorlocationlist)
			.addObject("vendorreviewCount", vendorreviewCount);
			mv.setViewName("list/hostpage");
			
		} else {
			System.out.println("이 상점의 케이크가 없거나 조회 실패");
			mv.addObject("input_vendor", inputvendor);
			mv.setViewName("list/hostpage");
		}
		
		if (vendorreviewlist != null && vendorreviewlist.size() > 0) {
			
			System.out.println("이 상점의 모든 리뷰 가져오기 성공");
			mv.addObject("vendorreviewlist", vendorreviewlist)
			.addObject("pagereview_current", pagereview_current)
			.addObject("maxpagereview", maxpagereview)
			.addObject("startpagereview", startpagereview)
			.addObject("endpagereview", endpagereview)
			.addObject("vendorreviewCount", vendorreviewCount)
			.addObject("reviewimglist", reviewimglist)
			.addObject("vendorcakeCount", vendorcakeCount)
			.addObject("reviewcakelist", reviewcakelist);
			
		} else {
			System.out.println("이 상점의 리뷰가 없거나 조회 실패");
		}
			
		//mv에 달기
	      mv.addObject("vendorimg", vendorimg);
	      
		return mv;
	}
	
	@RequestMapping(value = "showmap.ca", method = RequestMethod.GET)
	public ModelAndView showmap(ModelAndView mv) {
		mv.setViewName("list/showmap");
		return mv;
	}
}

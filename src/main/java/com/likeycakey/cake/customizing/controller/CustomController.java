package com.likeycakey.cake.customizing.controller;

import com.likeycakey.cake.customizing.model.service.CustomService;
import com.likeycakey.cake.detailView.model.vo.CustomBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class CustomController {

	@Autowired
	private CustomService customService;
	
	@RequestMapping(value="customlist.ca", method = RequestMethod .GET)
	public ModelAndView customList(
			ModelAndView mv) {
		
		ArrayList<CustomBoard> customlist;
		customlist = customService.selectCustomCakeList();
		
		ArrayList<String> namelist = new ArrayList<String>();
		ArrayList<String> photolist = new ArrayList<String>();
		ArrayList<String> creamlist = new ArrayList<String>();
		ArrayList<String> sheetlist = new ArrayList<String>();
		ArrayList<String> toppinglist = new ArrayList<String>();

		for(int i=0; i<customlist.size(); i++) {
			namelist.add(customService.selectNameList(customlist.get(i).getid()));
			photolist.add(customService.selectPhotoList(customlist.get(i).getid()));
			ArrayList<String> tempcreamlist = (customService.selectCreamList(customlist.get(i).getid()));
			ArrayList<String> tempsheetlist = (customService.selectSheetList(customlist.get(i).getid()));
			ArrayList<String> temptoppinglist = (customService.selectToppingList(customlist.get(i).getid()));
			String temp1 = "";
			String temp2 = "";
			String temp3 = "";
			for(int j=0; j< tempcreamlist.size(); j++) {
				temp1 = temp1 + " " + tempcreamlist.get(j);
			}
			creamlist.add(temp1);
			for(int j=0; j< tempsheetlist.size(); j++) {
				temp2 = temp2 + " " +tempsheetlist.get(j);
			}
			sheetlist.add(temp2);
			for(int j=0; j< temptoppinglist.size(); j++) {
				temp3 = temp3 + " " +temptoppinglist.get(j);
			}
			toppinglist.add(temp3);
		}
		
		mv.addObject("customlist", customlist)
			.addObject("namelist", namelist)
			.addObject("photolist", photolist)
			.addObject("creamlist", creamlist)
			.addObject("sheetlist", sheetlist)
			.addObject("toppinglist", toppinglist);
		mv.setViewName("customizing/customizing");
		
		return mv;
	}
}

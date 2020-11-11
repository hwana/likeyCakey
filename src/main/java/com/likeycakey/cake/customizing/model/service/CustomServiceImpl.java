package com.likeycakey.cake.customizing.model.service;

import com.likeycakey.cake.customizing.model.dao.CustomDao;
import com.likeycakey.cake.detailView.model.vo.CustomBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("customService")
public class CustomServiceImpl implements CustomService {
	
	@Autowired
	private CustomDao customDao;
	
	@Override
	public ArrayList<CustomBoard> selectCustomCakeList(){
		return customDao.selectCustomCakeList();
	}

	@Override
	public String selectNameList(String id) {
		return customDao.selectNameList(id);
	}
	
	@Override
	public String selectPhotoList(String id) {
		return customDao.selectPhotoList(id);
	}
	
	@Override
	public ArrayList<String> selectSheetList(String id) {
		return customDao.selectSheetList(id);
	}
	
	@Override
	public ArrayList<String> selectToppingList(String id) {
		return customDao.selectToppingList(id);
	}
	
	@Override
	public ArrayList<String> selectCreamList(String id) {
		return customDao.selectCreamList(id);
	}
}

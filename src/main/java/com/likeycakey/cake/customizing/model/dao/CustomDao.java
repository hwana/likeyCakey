package com.likeycakey.cake.customizing.model.dao;

import com.likeycakey.cake.detailView.model.vo.CustomBoard;

import java.util.ArrayList;

public interface CustomDao {
	public ArrayList<CustomBoard> selectCustomCakeList();
	public String selectNameList(String id);
	public String selectPhotoList(String id);
	public ArrayList<String> selectCreamList(String id);
	public ArrayList<String> selectSheetList(String id);
	public ArrayList<String> selectToppingList(String id);
}

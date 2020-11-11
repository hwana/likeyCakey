package com.likeycakey.cake.customizing.model.dao;

import com.likeycakey.cake.detailView.model.vo.CustomBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("customDao")
public class CustomDaoImpl implements CustomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<CustomBoard> selectCustomCakeList(){
		System.out.println("customDao의 selectCustomCakeList()입니다");
		return new ArrayList<CustomBoard>(sqlSession.selectList("customBoard.selectCustomCakeList"));
	}
	
	@Override
	public String selectNameList(String id) {
		System.out.println("customDao의 selectNameList입니다.");
		return sqlSession.selectOne("bizMember.selectNameList", id);
	}
	
	@Override
	public String selectPhotoList(String id) {
		System.out.println("customDao의 selectPhotoList입니다.");
		return sqlSession.selectOne("Member.selectPhotoList", id);
	}
	
	@Override
	public ArrayList<String> selectCreamList(String id) {
		System.out.println("customDao의 selectCreamList입니다.");
		return new ArrayList<String>(sqlSession.selectList("customBoard.selectCreamList", id));
	}
	
	@Override
	public ArrayList<String> selectSheetList(String id) {
		System.out.println("customDao의 selectSheetList입니다.");
		return new ArrayList<String>(sqlSession.selectList("customBoard.selectSheetList", id));
	}
	
	@Override
	public ArrayList<String> selectToppingList(String id) {
		System.out.println("customDao의 selectToppingList입니다.");
		return new ArrayList<String>(sqlSession.selectList("customBoard.selectToppingList", id));
	}
}

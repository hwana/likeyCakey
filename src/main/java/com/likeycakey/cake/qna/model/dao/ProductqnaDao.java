package com.likeycakey.cake.qna.model.dao;

import com.likeycakey.cake.qna.model.vo.Productqna;

import java.util.ArrayList;

public interface ProductqnaDao {

	// 게시글 리스트 불러오기
	public ArrayList<Productqna> listAll() throws Exception;
	
	// 게시글 작성
	public void insertProductqna(Productqna pq) throws Exception;

}

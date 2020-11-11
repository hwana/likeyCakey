package com.likeycakey.cake.qna.model.service;

import com.likeycakey.cake.qna.model.vo.Productqna;

import java.util.ArrayList;

public interface ProductqnaService {
	
	// 게시물 작성
	public void insertProductqna(Productqna pq) throws Exception;

	// 게시물 리스트 불러오기
	public ArrayList<Productqna> listAll() throws Exception;

}

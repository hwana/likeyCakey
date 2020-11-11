package com.likeycakey.cake.qna.model.dao;

import com.likeycakey.cake.qna.model.vo.Homeqna;

import java.util.ArrayList;

public interface HomeqnaDao {
	
	// 홈 큐앤에이 삽입
	public void insertHomeqna(Homeqna hq) throws Exception;
	
	// 홈 큐앤에이 리스트 불러오기
	public ArrayList<Homeqna> listAll() throws Exception;
	
	// 홈 큐앤에이 상세보기
	public Homeqna read(int hqNum) throws Exception;
}

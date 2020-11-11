package com.likeycakey.cake.qna.model.service;

import com.likeycakey.cake.qna.model.vo.Homeqna;

import java.util.ArrayList;

public interface HomeqnaService {
	public void insertHomeqna(Homeqna hq) throws Exception;
	public ArrayList<Homeqna> listAll() throws Exception;
	public Homeqna read(int hqNum) throws Exception;
}

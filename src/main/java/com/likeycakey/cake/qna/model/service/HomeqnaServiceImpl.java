package com.likeycakey.cake.qna.model.service;

import com.likeycakey.cake.qna.model.dao.HomeqnaDao;
import com.likeycakey.cake.qna.model.vo.Homeqna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("homeqnaService")
public class HomeqnaServiceImpl implements HomeqnaService {

	@Autowired
	private HomeqnaDao homeqnaDao;
	
	@Override
	public void insertHomeqna(Homeqna hq) throws Exception {
		System.out.println("홈페이지 QnA 등록 서비스");
        homeqnaDao.insertHomeqna(hq);
	}
	
	@Override
	public ArrayList<Homeqna> listAll() throws Exception {
		System.out.println("WELCOME TO SERVICE HOME_QNA");
		return homeqnaDao.listAll();
	}
	
	// 게시글 상세보기로 넘어가는 서비스
	@Override
	public Homeqna read(int hqNum) throws Exception {
		System.out.println("HOME_QNA : READ");
		return homeqnaDao.read(hqNum);
	}
}

package com.likeycakey.cake.qna.model.dao;

import com.likeycakey.cake.qna.model.vo.Homeqna;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("homeqnaDao")
public class HomeqnaDaoImpl implements HomeqnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 입력하기
	@Override
	public void insertHomeqna(Homeqna hq) throws Exception {
		System.out.println("홈페이지 Qna 다오도착");
		sqlSession.insert("homeqna.insert", hq);
	}
	
	// 게시글 리스트 불러오기
	@Override
	public ArrayList<Homeqna> listAll() throws Exception {
		System.out.println("WELCOME TO DAO HOME_QNA");
		return new ArrayList<Homeqna>(sqlSession.selectList("homeqna.listAll"));
	}
	
	// 게시글 상세보기
	@Override
	public Homeqna read(int hqNum) throws Exception {
		System.out.println("WELCOME TO DAO HOME_QNA_READ");
		return sqlSession.selectOne("homeqna.view", hqNum);
	}
	
}
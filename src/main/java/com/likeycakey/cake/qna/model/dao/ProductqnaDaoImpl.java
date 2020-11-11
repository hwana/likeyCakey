package com.likeycakey.cake.qna.model.dao;

import com.likeycakey.cake.qna.model.vo.Productqna;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("productqnaDao")
public class ProductqnaDaoImpl implements ProductqnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 입력하기
		@Override
		public void insertProductqna(Productqna pq) throws Exception {
			System.out.println("상품  Qna 다오도착");
			sqlSession.insert("productqna.insert", pq);
		}
		
		// 게시글 리스트 불러오기
		@Override
		public ArrayList<Productqna> listAll() throws Exception {
			System.out.println("WELCOME TO DAO PRODCUT_QNA");
			return new ArrayList<Productqna>(sqlSession.selectList("productqna.listAll"));
		}
}

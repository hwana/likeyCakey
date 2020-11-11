package com.likeycakey.cake.qna.model.service;

import com.likeycakey.cake.qna.model.dao.ProductqnaDao;
import com.likeycakey.cake.qna.model.vo.Productqna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("productqnaService")
public class ProductqnaServiceImpl implements ProductqnaService {
	
	@Autowired
	private ProductqnaDao productqnaDao;
	
	// 게시글 작성
	@Override
	public void insertProductqna(Productqna pq) throws Exception {
		System.out.println("상품 QnA 등록 서비스");
        productqnaDao.insertProductqna(pq);
	}
	
	// 게시글 리스트 불러오기
	@Override
	public ArrayList<Productqna> listAll() throws Exception {
		System.out.println("WELCOME TO SERVICE PRODUCT_QNA");
		return productqnaDao.listAll();
	}

}

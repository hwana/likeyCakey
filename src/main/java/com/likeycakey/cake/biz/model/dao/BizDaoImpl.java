package com.likeycakey.cake.biz.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.likeycakey.cake.biz.model.vo.BizMember;
import com.likeycakey.cake.detailView.model.vo.CustomBoard;
import com.likeycakey.cake.detailView.model.vo.CustomCream;
import com.likeycakey.cake.detailView.model.vo.CustomSheet;
import com.likeycakey.cake.detailView.model.vo.CustomSize;
import com.likeycakey.cake.detailView.model.vo.CustomTopping;
import com.likeycakey.cake.detailView.model.vo.ProductBoard;

import com.likeycakey.cake.member.model.vo.Member;




@Repository("bizDao")
public class BizDaoImpl implements BizDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBiz1(Member m) throws Exception {
		System.out.println("here is DAO insertBiz1");
		int result = sqlSession.insert("Member.insertMember", m);
		return result;

	}
	
	@Override
	public int insertBiz2(BizMember bm) throws Exception {
		System.out.println("here is DAO insertBiz2");
		System.out.println(bm.getBizName());
		int result2 = sqlSession.insert("bizMember.insertMember", bm);
		return result2;
	}
	
	@Override

	public Member loginCheck(String id, String passwd) throws Exception {
		System.out.println("여기도착");
		
		System.out.println("DAO="+id);
		System.out.println("DAO="+passwd);
	
		return sqlSession.selectOne("Member.loginCheck", new Member(id, passwd));

	}
	
	@Override
	public int selectMember(String id) {
		return sqlSession.selectOne("Member.dupid", id);
	}
	
	@Override
	public int insertProductBoard(ProductBoard productBoard)  {
		System.out.println("bizDao의 insertProductBoard입니다");
		return sqlSession.insert("productBoard.insertProductBoard", productBoard);
	}

	@Override
	public int updateMypage(Member m) throws Exception {
		int result = sqlSession.update("Member.updateMypage", m);
		return result;
	}
	
	@Override
	public int updateMypage2(BizMember bm) throws Exception {
		int result = sqlSession.update("bizMember.updateMypage", bm);
		return result;
	}

	@Override
	public int customBoardInsert(CustomBoard customboard) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("customBoard.insertCustomBoard",customboard);
	}

	@Override
	public String getBiz(BizMember bm) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bizMember.selectBiz", bm);
	}

	@Override
	public int customCreamInsert(CustomCream customcream) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customBoard.insertCustomCream",customcream);
	}


	@Override
	public int customSheetInsert(CustomSheet customsheet) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customBoard.insertCustomSheet",customsheet);
	}
	


	@Override
	public int customToppingInsert(CustomTopping customtopping) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customBoard.insertCustomTopping",customtopping);
	}

	@Override
	public int customSizeInsert(CustomSize customsize) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customBoard.insertCustomSize",customsize);
	}
}

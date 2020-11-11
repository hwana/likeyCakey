package com.likeycakey.cake.detailView.model.dao;

import com.likeycakey.cake.biz.model.vo.BizMember;
import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.detailView.model.vo.ProductOrder;
import com.likeycakey.cake.detailView.model.vo.ProductReview;
import com.likeycakey.cake.member.model.vo.BizWithMember;
import com.likeycakey.cake.member.model.vo.MemberLike;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository("pbDao")
public class ProductBoardDaoImpl implements ProductBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<ProductBoard> selectTopList() {
		// 							   0부터 시작해서 3개
		RowBounds rows = new RowBounds(0, 3);
		return new ArrayList<ProductBoard>(sqlSession.selectList("ProductBoard.selectTop3", null, rows));
	}

	@Override
	public ProductBoard selectTodaysCake() {
		return sqlSession.selectOne("ProductBoard.selectTodaysCake");
	}

	@Override
	public BizMember selectBizMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bizMember.selectBizMember", id);
	}

	@Override
	public ArrayList<ProductBoard> selectNewArrivalList() {
		RowBounds rows = new RowBounds(0, 6);
		return new ArrayList<ProductBoard> (sqlSession.selectList("ProductBoard.selectNewArrivalList", null, rows));
	}

	@Override
	public String selectBizAddress(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectBizAddress", id);
	}

	@Override
	public ArrayList<ProductBoard> selectBestSellerList() {
		RowBounds rows = new RowBounds(0, 6);
		return new ArrayList<ProductBoard>(sqlSession.selectList("ProductBoard.selectTop3", null, rows));
	}

	@Override
	public ArrayList<ProductBoard> selectBestLikeyList() {
		RowBounds rows = new RowBounds(0, 6);
		return new ArrayList<ProductBoard>(sqlSession.selectList("ProductBoard.selectLikeyList", null, rows));
	}
	
	
	// MEMBER_LIKE 회원 좋아요 INSERT
	@Override
	public int insertHeartMember(String pbNum, String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pbNum", pbNum);
		map.put("id", id);
		return sqlSession.insert("MemberLike.insertHeartMember", map);
	}

	@Override
	public int updateLikeyBoard(String pbNum) {
		return sqlSession.update("ProductBoard.updateLikeyBoard", pbNum);
	}

	@Override
	public ArrayList<MemberLike> selectMemberLikeList(String id) {
		return new ArrayList<MemberLike>(sqlSession.selectList("MemberLike.selectMemberLikeList", id));
	}

	@Override
	public int updateSubtractLikeyBoard(String pbNum) {
		return sqlSession.update("ProductBoard.updateSubtractLikeyBoard", pbNum);
	}

	@Override
	public int deleteHeartMember(String pbNum, String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pbNum", pbNum);
		map.put("id", id);
		return sqlSession.delete("MemberLike.deleteHeartMember", map);
	}

	@Override
	public ProductBoard selectProductDetail(String pbNum) {
		return sqlSession.selectOne("ProductBoard.selectProductDetail", pbNum);
	}

	@Override
	public BizWithMember selectProductDetailBiz(String id) {
		return sqlSession.selectOne("BizWithMember.selectProductDetailBiz", id);
	}

	@Override
	public ArrayList<ProductReview> selectReviewList(String pbNum) {
		return new ArrayList<ProductReview>(sqlSession.selectList("productReview.selectReviewList", Integer.parseInt(pbNum)));
	}

	@Override
	public int insertProductAddCart(ProductOrder productOrder) {
		return sqlSession.insert("ProductOrder.insertProductAddCart", productOrder);
	}

	@Override
	public int updatePReviewReply(ProductReview productReview) {
		return sqlSession.update("productReview.updatePReviewReply", productReview);
	}

	@Override
	public int delectPReviewReply(ProductReview productReview) {
		return sqlSession.delete("productReview.delectPReviewReply", productReview);
	}

	@Override
	public int insertPReviewReply(ProductReview productReview) {
		return sqlSession.insert("productReview.insertPReviewReply", productReview);
	}

}

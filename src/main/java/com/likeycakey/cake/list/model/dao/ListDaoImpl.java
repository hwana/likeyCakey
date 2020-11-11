package com.likeycakey.cake.list.model.dao;

import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.detailView.model.vo.ProductReview;
import com.likeycakey.cake.list.model.vo.FilterList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("listDao")
public class ListDaoImpl implements ListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCakeCount(String inputsearch) throws Exception {
		System.out.println("listDao의 getCakeCount(inputsearch)입니다.");
		return sqlSession.selectOne("productBoard.getCakeCount", inputsearch);
	}
	
	@Override
	public int getCakeCount(FilterList filterlist) throws Exception {
		System.out.println("listDao의 getCakeCount(filterlist)입니다.");
		return sqlSession.selectOne("productBoard.getCakeCountwf", filterlist);
	}
	
	@Override
	public int getVendorCakeCount(String inputvendor) throws Exception {
		System.out.println("listDao의 getVendorCakeCount(inputvendor)입니다.");
		return sqlSession.selectOne("productBoard.getVendorCakeCount", inputvendor);
	}
	
	@Override
	public int getVendorReviewCount(String inputvendor) throws Exception {
		System.out.println("listDao의 getVendorReviewCount(inputvendor)입니다.");
		return sqlSession.selectOne("productBoard.getVendorReviewCount", inputvendor);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeList(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeList(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeList", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeList(FilterList filterlist, int currentPage, int limit){
		System.out.println("listDao의 selectCakeList(filterlist)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwf", filterlist, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectVendorCakeList(String inputvendor, int pagecake_current, int limitcake){
		System.out.println("listDao의 selectVendorCakeList(inputvendor, pagecake_current, limitcake)입니다.");
		int offset = (pagecake_current - 1) * limitcake;
		RowBounds rows = new RowBounds(offset, limitcake);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectVendorCakeList", inputvendor, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder1(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeListwithOrder1(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwo1", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder2(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeListwithOrder2(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwo2", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder3(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeListwithOrder3(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwo3", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder4(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeListwithOrder4(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwo4", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder5(String inputsearch, int currentPage, int limit){
		System.out.println("listDao의 selectCakeListwithOrder5(inputsearch)입니다.");
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<ProductBoard>(sqlSession.selectList("productBoard.selectCakeListwo5", inputsearch, rows));
	}
	
	@Override
	public ArrayList<ProductReview> selectVendorReviewList(String inputvendor, int pagereview_current, int limitreview){
		System.out.println("listDao의 selectVendorReviewList(inputvendor, pagereview_current, limitreview)입니다.");
		int offset = (pagereview_current - 1) * limitreview;
		RowBounds rows = new RowBounds(offset, limitreview);
		return new ArrayList<ProductReview>(sqlSession.selectList("productReview.selectVendorReviewList", inputvendor, rows));
	}
	
	@Override
	public String selectLocationList(String id) {
		System.out.println("listDao의 selectLocationList입니다.");
		return sqlSession.selectOne("Member.selectBizAddress", id);
	}
	
	@Override
	public String selectVendorLocationList(String inputvendor) {
		System.out.println("listDao의 selectVendorLocationList입니다.");
		return sqlSession.selectOne("Member.selectBizAddress", inputvendor);
	}
	
	@Override
	public String selectReviewImgList(String id) {
		System.out.println("listDao의 selectReviewImgList입니다");
		return sqlSession.selectOne("Member.selectReviewImgList", id);
	}
	
	@Override
	public String selectReviewCakeList(int pbNum) {
		System.out.println("listDao의 selectReviewCakeList입니다");
		return sqlSession.selectOne("productBoard.selectReviewCakeList", pbNum);
	}
	
	@Override
	   public String selectVendorImg(String inputvendor) {
	      System.out.println("listDao의 selectInputVendor입니다." );
	      return sqlSession.selectOne("Member.selectVendorImg", inputvendor);
	   }
}

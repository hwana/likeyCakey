package com.likeycakey.cake.list.model.service;

import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.detailView.model.vo.ProductReview;
import com.likeycakey.cake.list.model.dao.ListDao;
import com.likeycakey.cake.list.model.vo.FilterList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("listService")
public class ListServiceImpl implements ListService {
	
	@Autowired
	private ListDao listDao;
	
	@Override
	public int getCakeCount(String inputsearch) throws Exception {
		return listDao.getCakeCount(inputsearch);
	}
	
	@Override
	public int getCakeCount(FilterList filterlist) throws Exception {
		return listDao.getCakeCount(filterlist);
	}
	
	@Override
	public int getVendorCakeCount(String inputvendor) throws Exception {
		return listDao.getVendorCakeCount(inputvendor);
	}
	
	@Override
	public int getVendorReviewCount(String inputvendor) throws Exception {
		return listDao.getVendorReviewCount(inputvendor);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeList(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeList(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeList(FilterList filterlist, int currentPage, int limit){
		return listDao.selectCakeList(filterlist, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectVendorCakeList(String inputvendor, int pagecake_current, int limitcake){
		return listDao.selectVendorCakeList(inputvendor, pagecake_current, limitcake);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder1(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeListwithOrder1(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder2(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeListwithOrder2(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder3(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeListwithOrder3(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder4(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeListwithOrder4(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductBoard> selectCakeListwithOrder5(String inputsearch, int currentPage, int limit){
		return listDao.selectCakeListwithOrder5(inputsearch, currentPage, limit);
	}
	
	@Override
	public ArrayList<ProductReview> selectVendorReviewList(String inputvendor, int pagereview_current, int limitreview){
		return listDao.selectVendorReviewList(inputvendor, pagereview_current, limitreview);
	}
	
	@Override
	public String selectLocationList(String id) {
		return listDao.selectLocationList(id);
	}
	
	@Override
	public String selectVendorLocationList(String inputvendor) {
		return listDao.selectVendorLocationList(inputvendor);
	}
	
	@Override
	public String selectReviewImgList(String id) {
		return listDao.selectReviewImgList(id);
	}
	
	@Override
	public String selectReviewCakeList(int pbNum) {
		return listDao.selectReviewCakeList(pbNum);
	}
	
	@Override
	   public String selectVendorImg(String inputvendor) {
	      return listDao.selectVendorImg(inputvendor);
	   }
}


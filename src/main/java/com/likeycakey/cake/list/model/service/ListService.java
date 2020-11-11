package com.likeycakey.cake.list.model.service;

import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.detailView.model.vo.ProductReview;
import com.likeycakey.cake.list.model.vo.FilterList;

import java.util.ArrayList;

public interface ListService {

	public int getCakeCount(String inputsearch) throws Exception;
	public int getCakeCount(FilterList filterlist) throws Exception;
	public int getVendorCakeCount(String inputvendor) throws Exception;
	public int getVendorReviewCount(String inputvendor) throws Exception;
	public ArrayList<ProductBoard> selectCakeList(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductBoard> selectCakeList(FilterList filterlist, int currentPage, int limit);
	public ArrayList<ProductBoard> selectVendorCakeList(String inputvendor, int pagecake_current, int limitcake);
	public ArrayList<ProductBoard> selectCakeListwithOrder1(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductBoard> selectCakeListwithOrder2(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductBoard> selectCakeListwithOrder3(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductBoard> selectCakeListwithOrder4(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductBoard> selectCakeListwithOrder5(String inputsearch, int currentPage, int limit);
	public ArrayList<ProductReview> selectVendorReviewList(String inputvendor, int pagereview_current, int limitreview);
	public String selectLocationList(String id);
	public String selectVendorLocationList(String inputvendor);
	public String selectReviewImgList(String id);
	public String selectReviewCakeList(int pbNum);
	public String selectVendorImg(String inputvendor);
}

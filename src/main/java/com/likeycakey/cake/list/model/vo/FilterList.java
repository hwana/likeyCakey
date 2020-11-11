package com.likeycakey.cake.list.model.vo;

import org.springframework.stereotype.Component;

// servlet-context의 <context:component-scan>에 설정된 것을 읽음.
@Component
public class FilterList implements java.io.Serializable{
   
   private static final long serialVersionUID = 3045000L;
   
   private String inputsearch; // 검색 단어
   private String simplefilter; // 빵, 떡, 아이스크림
   private String orderfilter;
   
   public FilterList() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   public FilterList(String inputsearch, String simplefilter) {
		super();
		this.inputsearch = inputsearch;
		this.simplefilter = simplefilter;
	}
   
   public FilterList(String inputsearch, String simplefilter, String orderfilter) {
		super();
		this.inputsearch = inputsearch;
		this.simplefilter = simplefilter;
		if(Integer.parseInt(orderfilter)==1)
			setOrderfilter("P_B_NUM DESC");
		else if(Integer.parseInt(orderfilter)==2)
			setOrderfilter("P_B_LIKE DESC");
		else if(Integer.parseInt(orderfilter)==3)
			setOrderfilter("P_PRICE");
		else if(Integer.parseInt(orderfilter)==4)
			setOrderfilter("P_PRICE DESC");
		else if(Integer.parseInt(orderfilter)==5)
			setOrderfilter("P_B_SELLCNT DESC");
	}

	public String getInputsearch() {
		return inputsearch;
	}

	public void setInputsearch(String inputsearch) {
		this.inputsearch = inputsearch;
	}

	public String getSimplefilter() {
		return simplefilter;
	}

	public void setSimplefilter(String simplefilter) {
		this.simplefilter = simplefilter;
	}

	public String getOrderfilter() {
		return orderfilter;
	}

	public void setOrderfilter(String orderfilter) {
		this.orderfilter = orderfilter;
	}
   
}


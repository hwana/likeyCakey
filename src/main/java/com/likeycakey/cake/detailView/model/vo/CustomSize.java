package com.likeycakey.cake.detailView.model.vo;

public class CustomSize {
	private String sizeNum;		//사이즈 번호
	private String id;			//사업자 회원 아이디
	private String sizeName; 	//사이즈 종류
	private int sizePrice;		//사이즈 추가
	
	
	
	public CustomSize() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CustomSize(String sizeNum, String id, String sizeName, int sizePrice) {
		super();
		this.sizeNum = sizeNum;
		this.id = id;
		this.sizeName = sizeName;
		this.sizePrice = sizePrice;
	}
	
	public String getSizeNum() {
		return sizeNum;
	}
	public void setSizeNum(String sizeNum) {
		this.sizeNum = sizeNum;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public int getSizePrice() {
		return sizePrice;
	}
	public void setSizePrice(int sizePrice) {
		this.sizePrice = sizePrice;
	}
	
	
	
}

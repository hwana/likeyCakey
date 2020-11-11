package com.likeycakey.cake.detailView.model.vo;

public class CustomSheet {
	private String shNum;		//시트번호
	private String id;			//사업자 회원 아이디
	private String shName;		//시트 종류
	private int shPrice;		//시트 추가 가격
	
	
	public CustomSheet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CustomSheet(String shNum, String id, String shName, int shPrice) {
		super();
		this.shNum = shNum;
		this.id = id;
		this.shName = shName;
		this.shPrice = shPrice;
	}
	
	public String getShNum() {
		return shNum;
	}
	public void setShNum(String shNum) {
		this.shNum = shNum;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getShName() {
		return shName;
	}
	public void setShName(String shName) {
		this.shName = shName;
	}
	public int getShPrice() {
		return shPrice;
	}
	public void setShPrice(int shPrice) {
		this.shPrice = shPrice;
	}
	
	
}

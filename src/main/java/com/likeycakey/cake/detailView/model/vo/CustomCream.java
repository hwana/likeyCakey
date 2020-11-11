package com.likeycakey.cake.detailView.model.vo;

public class CustomCream {
	private String crNum;		//크림 번호
	private String id;			//사업자 회원 아이디
	private String crName;		//크림 종류
	private int crPrice;		//크림 추가 가격
	
	
	public CustomCream() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomCream(String crNum, String id, String crName, int crPrice) {
		super();
		this.crNum = crNum;
		this.id = id;
		this.crName = crName;
		this.crPrice = crPrice;
	}
	public String getCrNum() {
		return crNum;
	}
	public void setCrNum(String crNum) {
		this.crNum = crNum;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getCrName() {
		return crName;
	}
	public void setCrName(String crName) {
		this.crName = crName;
	}
	public int getCrPrice() {
		return crPrice;
	}
	public void setCrPrice(int crPrice) {
		this.crPrice = crPrice;
	}
	
	
}

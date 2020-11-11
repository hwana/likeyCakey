package com.likeycakey.cake.detailView.model.vo;

public class CustomTopping {
	private String tpNum;	//토핑번호
	private String id;		//사업자 회원 아이디
	private String tpName;	//토핑 종류
	private int tpPrice; //토핑 추가 가격
	
	
	public CustomTopping(String tpNum, String id, String tpName, int tpPrice) {
		super();
		this.tpNum = tpNum;
		this.id = id;
		this.tpName = tpName;
		this.tpPrice = tpPrice;
	}
	public CustomTopping() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTpNum() {
		return tpNum;
	}
	public void setTpNum(String tpNum) {
		this.tpNum = tpNum;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getTpName() {
		return tpName;
	}
	public void setTpName(String tpName) {
		this.tpName = tpName;
	}
	public int getTpPrice() {
		return tpPrice;
	}
	public void setTpPrice(int tpPrice) {
		this.tpPrice = tpPrice;
	}
	
	
	
	
	
}
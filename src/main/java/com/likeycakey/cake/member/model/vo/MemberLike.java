package com.likeycakey.cake.member.model.vo;

public class MemberLike {
	
	
	private int pbNum;
	private int cbNum;
	private String id;
	private int likeNo;
	
	
	public MemberLike() {
		super();
	}
	
	public MemberLike(int pbNum, int cbNum, String id, int likeNo) {
		super();
		this.pbNum = pbNum;
		this.cbNum = cbNum;
		this.id = id;
		this.likeNo = likeNo;
	}
	
	public int getPbNum() {
		return pbNum;
	}
	public void setPbNum(int pbNum) {
		this.pbNum = pbNum;
	}
	public int getCbNum() {
		return cbNum;
	}
	public void setCbNum(int cbNum) {
		this.cbNum = cbNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	
	
	
}

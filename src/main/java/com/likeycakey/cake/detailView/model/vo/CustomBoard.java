package com.likeycakey.cake.detailView.model.vo;

public class CustomBoard {
	
	private int cbNum;
	private String id;
	private String cbMiniTitle;
	private String cbMiniContent;
	private String cbContent;
	private int cbLike;
	private int cbReadCnt;
	private String cbTag;
	private String cbWarn;
	private String cbName;
	private int cbPrice;
	private int cbStatus;
	public CustomBoard(int cbNum, String id, String cbMiniTitle, String cbMiniContent, String cbContent, int cbLike,
			int cbReadCnt, String cbTag, String cbWarn, String cbName, int cbPrice, int cbStatus) {
		super();
		this.cbNum = cbNum;
		this.id = id;
		this.cbMiniTitle = cbMiniTitle;
		this.cbMiniContent = cbMiniContent;
		this.cbContent = cbContent;
		this.cbLike = cbLike;
		this.cbReadCnt = cbReadCnt;
		this.cbTag = cbTag;
		this.cbWarn = cbWarn;
		this.cbName = cbName;
		this.cbPrice = cbPrice;
		this.cbStatus = cbStatus;
	}
	public CustomBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCbNum() {
		return cbNum;
	}
	public void setCbNum(int cbNum) {
		this.cbNum = cbNum;
	}
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getCbMiniTitle() {
		return cbMiniTitle;
	}
	public void setCbMiniTitle(String cbMiniTitle) {
		this.cbMiniTitle = cbMiniTitle;
	}
	public String getCbMiniContent() {
		return cbMiniContent;
	}
	public void setCbMiniContent(String cbMiniContent) {
		this.cbMiniContent = cbMiniContent;
	}
	public String getCbContent() {
		return cbContent;
	}
	public void setCbContent(String cbContent) {
		this.cbContent = cbContent;
	}
	public int getCbLike() {
		return cbLike;
	}
	public void setCbLike(int cbLike) {
		this.cbLike = cbLike;
	}
	public int getcbReadCnt() {
		return cbReadCnt;
	}
	public void setcbReadCnt(int cbReadCnt) {
		this.cbReadCnt = cbReadCnt;
	}
	public String getCbTag() {
		return cbTag;
	}
	public void setCbTag(String cbTag) {
		this.cbTag = cbTag;
	}
	public String getCbWarn() {
		return cbWarn;
	}
	public void setCbWarn(String cbWarn) {
		this.cbWarn = cbWarn;
	}
	public String getCbName() {
		return cbName;
	}
	public void setCbName(String cbName) {
		this.cbName = cbName;
	}
	public int getCbPrice() {
		return cbPrice;
	}
	public void setCbPrice(int cbPrice) {
		this.cbPrice = cbPrice;
	}
	public int getCbStatus() {
		return cbStatus;
	}
	public void setCbStatus(int cbStatus) {
		this.cbStatus = cbStatus;
	}
	@Override
	public String toString() {
		return "CustomBoard [cbNum=" + cbNum + ", id=" + id + ", cbMiniTitle=" + cbMiniTitle + ", cbMiniContent="
				+ cbMiniContent + ", cbContent=" + cbContent + ", cbLike=" + cbLike + ", cbReadCnt=" + cbReadCnt
				+ ", cbTag=" + cbTag + ", cbWarn=" + cbWarn + ", cbName=" + cbName + ", cbPrice=" + cbPrice
				+ ", cbStatus=" + cbStatus + "]";
	}
	
	
	

}

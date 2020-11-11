package com.likeycakey.cake.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class BizWithMember implements java.io.Serializable{
	
	private static final long serialVersionUID = 10L;
	
	private String id;
	private String bizName; // 매장이름
	private String bizPn;	// 사업자 전화번호
	private String bizNum; // 사업자 등록번호
	private int bizDelivery; // 배송비
	private String masterName; // 담당자 이름
	private String bizDeliveryYn; // 배송 여부
	private String bizCustomYn; // 커스텀 가능 여부
	private String mName; // 사업자 이름
	private String mEmail; // 사업자 이메일
	private String mPost; // 매장 우편번호
	private String mBasicAddr; // 매장 기본 주소 
	private String mDetailAddr; // 매장 상세 주소
	private String mCp; // 전화번호
	private String mPhoto; // 사업자 로고
	private int mStatus; // 회원 블록 상태
	
	public BizWithMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BizWithMember(String id, String bizName, String bizPn, String bizNum, int bizDelivery, String masterName,
			String bizDeliveryYn, String bizCustomYn, String mName, String mEmail, String mPost, String mBasicAddr,
			String mDetailAddr, String mCp, String mPhoto, int mStatus) {
		super();
		this.id = id;
		this.bizName = bizName;
		this.bizPn = bizPn;
		this.bizNum = bizNum;
		this.bizDelivery = bizDelivery;
		this.masterName = masterName;
		this.bizDeliveryYn = bizDeliveryYn;
		this.bizCustomYn = bizCustomYn;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPost = mPost;
		this.mBasicAddr = mBasicAddr;
		this.mDetailAddr = mDetailAddr;
		this.mCp = mCp;
		this.mPhoto = mPhoto;
		this.mStatus = mStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getBizPn() {
		return bizPn;
	}

	public void setBizPn(String bizPn) {
		this.bizPn = bizPn;
	}

	public String getBizNum() {
		return bizNum;
	}

	public void setBizNum(String bizNum) {
		this.bizNum = bizNum;
	}

	public int getBizDelivery() {
		return bizDelivery;
	}

	public void setBizDelivery(int bizDelivery) {
		this.bizDelivery = bizDelivery;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getBizDeliveryYn() {
		return bizDeliveryYn;
	}

	public void setBizDeliveryYn(String bizDeliveryYn) {
		this.bizDeliveryYn = bizDeliveryYn;
	}

	public String getBizCustomYn() {
		return bizCustomYn;
	}

	public void setBizCustomYn(String bizCustomYn) {
		this.bizCustomYn = bizCustomYn;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPost() {
		return mPost;
	}

	public void setmPost(String mPost) {
		this.mPost = mPost;
	}

	public String getmBasicAddr() {
		return mBasicAddr;
	}

	public void setmBasicAddr(String mBasicAddr) {
		this.mBasicAddr = mBasicAddr;
	}

	public String getmDetailAddr() {
		return mDetailAddr;
	}

	public void setmDetailAddr(String mDetailAddr) {
		this.mDetailAddr = mDetailAddr;
	}

	public String getmCp() {
		return mCp;
	}

	public void setmCp(String mCp) {
		this.mCp = mCp;
	}

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public int getmStatus() {
		return mStatus;
	}

	public void setmStatus(int mStatus) {
		this.mStatus = mStatus;
	}

	
	
	
}

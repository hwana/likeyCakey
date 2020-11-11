package com.likeycakey.cake.biz.model.vo;

import org.springframework.stereotype.Component;

@Component
public class BizMember {

	private String id;
	private String bizName; //매장이름
	private String bizPn;
	private String bizNum; //사업자 등록번호
	private int bizDelivery; //배송비
	private String masterName; //대표자 이름
	//환희 추가부분
	private String bizDeliveryYn; //배송가능여부
	private String bizCustomYn; //커스텀 가능여부
	
	public BizMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BizMember(String id, String bizName, String bizPn, String bizNum, int bizDelivery, String masterName,
			String bizDeliveryYn, String bizCustomYn) {
		super();
		this.id = id;
		this.bizName = bizName;
		this.bizPn = bizPn;
		this.bizNum = bizNum;
		this.bizDelivery = bizDelivery;
		this.masterName = masterName;
		this.bizDeliveryYn = bizDeliveryYn;
		this.bizCustomYn = bizCustomYn;
	}

	public BizMember(String id) {
		this.id = id;
	}

	public BizMember(String id, String masterName) {
		this.id = id;
		this.masterName = masterName;
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
	//환희 추가부분
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
	
}

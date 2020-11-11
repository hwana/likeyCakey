package com.likeycakey.cake.qna.model.vo;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Productqna implements java.io.Serializable {
	private static final long serialVersionUID = 3000200L;
	
	private int pqNum; // 게시글 번호
	private int pbNum; // 게시글 참조번호
	private String id; // 회원 아이디
	private String pqContent; // 게시글 내용
	private Date pqDate; // 게시글 작성일
	public int getPqNum() {
		return pqNum;
	}
	public void setPqNum(int pqNum) {
		this.pqNum = pqNum;
	}
	public int getPbNum() {
		return pbNum;
	}
	public void setPbNum(int pbNum) {
		this.pbNum = pbNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPqContent() {
		return pqContent;
	}
	public void setPqContent(String pqContent) {
		this.pqContent = pqContent;
	}
	public Date getPqDate() {
		return pqDate;
	}
	public void setPqDate(Date pqDate) {
		this.pqDate = pqDate;
	}
	public Productqna() {
		super();
	}
	public Productqna(int pqNum, int pbNum, String id, String pqContent, Date pqDate) {
		super();
		this.pqNum = pqNum;
		this.pbNum = pbNum;
		this.id = id;
		this.pqContent = pqContent;
		this.pqDate = pqDate;
	}
	
	
	
	
	
}
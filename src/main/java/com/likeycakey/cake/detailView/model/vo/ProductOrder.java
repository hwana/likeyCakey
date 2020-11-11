package com.likeycakey.cake.detailView.model.vo;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ProductOrder implements java.io.Serializable{
	
	private static final long serialVersionUID = 3000011L;
	  
	private int poNum;			// 주문 번호(시퀀스)
	private int pbNum;			// 참고 게시글 번호
	private int sNum; 			// 주문진행상태
	private String id; 			// 현재 로그인 한 아이디, 주문자
	private int poBizDelivery;	// 배송비
	private String poMemo; 		// 배송 메모
	private Date poDate;		// 주문 일자
	private Date poBookDate;	// 예약 일자
	private int poCnt;			// 주문 수량
	private int poPrice;		// 주문 총 가격
	private String poText;		// 케이크 문구
	private String poRecName; 	// 받는 사람 이름
	private String poRecCp; 	// 받는 사람 전화번호
	private String poRecPost; 	// 받는 사람 우편번호
	private String poRecBasicAddr; 	// 받는 사람 기본 주소
	private String poRecDetailAddr; // 받는 사람 상세 주소
	
	
	public ProductOrder() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ProductOrder(int poNum, int pbNum, int sNum, String id, int poBizDelivery, String poMemo, Date poDate,
			Date poBookDate, int poCnt, int poPrice, String poText, String poRecName, String poRecCp, String poRecPost,
			String poRecBasicAddr, String poRecDetailAddr) {
		super();
		this.poNum = poNum;
		this.pbNum = pbNum;
		this.sNum = sNum;
		this.id = id;
		this.poBizDelivery = poBizDelivery;
		this.poMemo = poMemo;
		this.poDate = poDate;
		this.poBookDate = poBookDate;
		this.poCnt = poCnt;
		this.poPrice = poPrice;
		this.poText = poText;
		this.poRecName = poRecName;
		this.poRecCp = poRecCp;
		this.poRecPost = poRecPost;
		this.poRecBasicAddr = poRecBasicAddr;
		this.poRecDetailAddr = poRecDetailAddr;
	}


	public int getPoNum() {
		return poNum;
	}


	public void setPoNum(int poNum) {
		this.poNum = poNum;
	}


	public int getPbNum() {
		return pbNum;
	}


	public void setPbNum(int pbNum) {
		this.pbNum = pbNum;
	}


	public int getsNum() {
		return sNum;
	}


	public void setsNum(int sNum) {
		this.sNum = sNum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getPoBizDelivery() {
		return poBizDelivery;
	}


	public void setPoBizDelivery(int poBizDelivery) {
		this.poBizDelivery = poBizDelivery;
	}


	public String getPoMemo() {
		return poMemo;
	}


	public void setPoMemo(String poMemo) {
		this.poMemo = poMemo;
	}


	public Date getPoDate() {
		return poDate;
	}


	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}


	public Date getPoBookDate() {
		return poBookDate;
	}


	public void setPoBookDate(Date poBookDate) {
		this.poBookDate = poBookDate;
	}


	public int getPoCnt() {
		return poCnt;
	}


	public void setPoCnt(int poCnt) {
		this.poCnt = poCnt;
	}


	public int getPoPrice() {
		return poPrice;
	}


	public void setPoPrice(int poPrice) {
		this.poPrice = poPrice;
	}


	public String getPoText() {
		return poText;
	}


	public void setPoText(String poText) {
		this.poText = poText;
	}


	public String getPoRecName() {
		return poRecName;
	}


	public void setPoRecName(String poRecName) {
		this.poRecName = poRecName;
	}


	public String getPoRecCp() {
		return poRecCp;
	}


	public void setPoRecCp(String poRecCp) {
		this.poRecCp = poRecCp;
	}


	public String getPoRecPost() {
		return poRecPost;
	}


	public void setPoRecPost(String poRecPost) {
		this.poRecPost = poRecPost;
	}


	public String getPoRecBasicAddr() {
		return poRecBasicAddr;
	}


	public void setPoRecBasicAddr(String poRecBasicAddr) {
		this.poRecBasicAddr = poRecBasicAddr;
	}


	public String getPoRecDetailAddr() {
		return poRecDetailAddr;
	}


	public void setPoRecDetailAddr(String poRecDetailAddr) {
		this.poRecDetailAddr = poRecDetailAddr;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}

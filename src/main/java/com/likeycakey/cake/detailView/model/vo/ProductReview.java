package com.likeycakey.cake.detailView.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
public class ProductReview implements java.io.Serializable{
   
   private static final long serialVersionUID = 3009990L;
   
   private int prNum; // 리뷰 게시글 번호
   private int pbNum; // 리뷰 게시글이 참조하는 게시글 번호
   private String id; // 리뷰 글쓴 회원 아이디
   private String prContent; //리뷰 글 내용
   @JsonFormat(pattern="yyyy/MM/dd")
   private Date prDate; // 리뷰 글 작성일
   private int prLike; // 리뷰 좋아요 수
   private int prBlack; // 리뷰 신고 수
   private String prFile; // 리뷰 이미지
   private int prStar; // 리뷰 별점
   private int prcNum; // 리뷰 댓글 번호
   private String prcContent; // 리뷰 댓글 내용
   @JsonFormat(pattern="yyyy/MM/dd")
   private Date prcDate; // 리뷰 댓글 작성일

   public ProductReview() {
      super();
   }
   
   public ProductReview(int prNum, int pbNum, String id, String prContent, Date prDate, int prLike, int prBlack,
		String prFile, int prStar, int prcNum, String prcContent, Date prcDate) {
	super();
	this.prNum = prNum;
	this.pbNum = pbNum;
	this.id = id;
	this.prContent = prContent;
	this.prDate = prDate;
	this.prLike = prLike;
	this.prBlack = prBlack;
	this.prFile = prFile;
	this.prStar = prStar;
	this.prcNum = prcNum;
	this.prcContent = prcContent;
	this.prcDate = prcDate;
   }
   
	public int getPrNum() {
		return prNum;
	}
	
	public void setPrNum(int prNum) {
		this.prNum = prNum;
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
	
	public String getPrContent() {
		return prContent;
	}
	
	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}
	
	public Date getPrDate() {
		return prDate;
	}
	
	public void setPrDate(Date prDate) {
		this.prDate = prDate;
	}
	
	public int getPrLike() {
		return prLike;
	}
	
	public void setPrLike(int prLike) {
		this.prLike = prLike;
	}
	
	public int getPrBlack() {
		return prBlack;
	}
	
	public void setPrBlack(int prBlack) {
		this.prBlack = prBlack;
	}
	
	public String getPrFile() {
		return prFile;
	}
	
	public void setPrFile(String prFile) {
		this.prFile = prFile;
	}
	
	public int getPrStar() {
		return prStar;
	}
	
	public void setPrStar(int prStar) {
		this.prStar = prStar;
	}
	
	public int getPrcNum() {
		return prcNum;
	}
	
	public void setPrcNum(int prcNum) {
		this.prcNum = prcNum;
	}
	
	public String getPrcContent() {
		return prcContent;
	}
	
	public void setPrcContent(String prcContent) {
		this.prcContent = prcContent;
	}
	
	public Date getPrcDate() {
		return prcDate;
	}
	
	public void setPrcDate(Date prcDate) {
		this.prcDate = prcDate;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

@Override
   public String toString() {
      return "ProductReview [prNum=" + prNum + ", pbNum=" + pbNum + ", id=" + id + ", prContent=" + prContent
            + ", prDate=" + prDate + ", prLike=" + prLike + ", prBlack=" + prBlack + ", prFile=" + prFile
            + ", prStar=" + prStar + "]";
   }
     
}


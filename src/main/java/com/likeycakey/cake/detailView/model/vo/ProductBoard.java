package com.likeycakey.cake.detailView.model.vo;

import org.springframework.stereotype.Component;

// servlet-context의 <context:component-scan>에 설정된 것을 읽음.
@Component
public class ProductBoard implements java.io.Serializable{
   
   private static final long serialVersionUID = 3000000L;
   
   private int pbNum; // 게시글 번호
   private String id; // 회원 아이디
   private String pName; // 케이크 이름
   private int pPrice; // 케이크 가격
   private String pImg; // 케이크 사진
   private int pSize; // 케이크 호수
   private String pCM; // 케이크 사이즈(cm)
   private int pCount; // 케이크 재고
   private int pCountLimit; // 케이크 일일판매제한 개수
   private String pbMiniTitle; // 케이크 상세페이지 소 제목
   private String pbMiniContent; // 케이크 상세페이지 소 내용(가격 밑 명시하는 것)
   private String pbContent; // 케이크 상세페이지 내용 
   private int pbLike; // 케이크 좋아요 개수
   private int pbReadCnt; // 케이크 상세페이지 조회수
   private String pbYN; // 케이크 당일 구매 여부
   private String pbWarn; // 케이크 예약시 주의사항 
   private String pbTag; // 케이크 태그
   private int pbSellCnt; // 케이크 팔린 개수
   private int pbStatus; //상품 삭제 상태
   
   public ProductBoard() {
      super();
      // TODO Auto-generated constructor stub
   }

   
   
   
   
   public ProductBoard(int pbNum, String id, String pName, int pPrice, String pImg, int pSize, String pCM, int pCount,
		int pCountLimit, String pbMiniTitle, String pbMiniContent, String pbContent, int pbLike, int pbReadCnt,
		String pbYN, String pbWarn, String pbTag, int pbSellCnt, int pbStatus) {
	super();
	this.pbNum = pbNum;
	this.id = id;
	this.pName = pName;
	this.pPrice = pPrice;
	this.pImg = pImg;
	this.pSize = pSize;
	this.pCM = pCM;
	this.pCount = pCount;
	this.pCountLimit = pCountLimit;
	this.pbMiniTitle = pbMiniTitle;
	this.pbMiniContent = pbMiniContent;
	this.pbContent = pbContent;
	this.pbLike = pbLike;
	this.pbReadCnt = pbReadCnt;
	this.pbYN = pbYN;
	this.pbWarn = pbWarn;
	this.pbTag = pbTag;
	this.pbSellCnt = pbSellCnt;
	this.pbStatus = pbStatus;
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
   public String getpName() {
      return pName;
   }
   public void setpName(String pName) {
      this.pName = pName;
   }
   public int getpPrice() {
      return pPrice;
   }
   public void setpPrice(int pPrice) {
      this.pPrice = pPrice;
   }
   public String getpImg() {
      return pImg;
   }
   public void setpImg(String pImg) {
      this.pImg = pImg;
   }
   public int getpSize() {
      return pSize;
   }
   public void setpSize(int pSize) {
      this.pSize = pSize;
   }
   public String getpCM() {
      return pCM;
   }
   public void setpCM(String pCM) {
      this.pCM = pCM;
   }
   public int getpCount() {
      return pCount;
   }
   public void setpCount(int pCount) {
      this.pCount = pCount;
   }
   public int getpCountLimit() {
      return pCountLimit;
   }
   public void setpCountLimit(int pCountLimit) {
      this.pCountLimit = pCountLimit;
   }
   public String getPbMiniTitle() {
      return pbMiniTitle;
   }
   public void setPbMiniTitle(String pbMiniTitle) {
      this.pbMiniTitle = pbMiniTitle;
   }
   public String getPbMiniContent() {
      return pbMiniContent;
   }
   public void setPbMiniContent(String pbMiniContent) {
      this.pbMiniContent = pbMiniContent;
   }
   public String getPbContent() {
      return pbContent;
   }
   public void setPbContent(String pbContent) {
      this.pbContent = pbContent;
   }
   public int getPbLike() {
      return pbLike;
   }
   public void setPbLike(int pbLike) {
      this.pbLike = pbLike;
   }
   public int getPbReadCnt() {
      return pbReadCnt;
   }
   public void setPbReadCnt(int pbReadCnt) {
      this.pbReadCnt = pbReadCnt;
   }
   public String getPbYN() {
      return pbYN;
   }
   public void setPbYN(String pbYN) {
      this.pbYN = pbYN;
   }
   public String getpbWarn() {
      return pbWarn;
   }
   public void setpbWarn(String pbWarn) {
      this.pbWarn = pbWarn;
   }
   public String getPbTag() {
      return pbTag;
   }
   public void setPbTag(String pbTag) {
      this.pbTag = pbTag;
   }

   public int getPbSellCnt() {
      return pbSellCnt;
   }

   public void setPbSellCnt(int pbSellCnt) {
      this.pbSellCnt = pbSellCnt;
   }
   
  

public int getPbStatus() {
	return pbStatus;
}





public void setPbStatus(int pbStatus) {
	this.pbStatus = pbStatus;
}





@Override
public String toString() {
	return "ProductBoard [pbNum=" + pbNum + ", id=" + id + ", pName=" + pName + ", pPrice=" + pPrice + ", pImg=" + pImg
			+ ", pSize=" + pSize + ", pCM=" + pCM + ", pCount=" + pCount + ", pCountLimit=" + pCountLimit
			+ ", pbMiniTitle=" + pbMiniTitle + ", pbMiniContent=" + pbMiniContent + ", pbContent=" + pbContent
			+ ", pbLike=" + pbLike + ", pbReadCnt=" + pbReadCnt + ", pbYN=" + pbYN + ", pbWarn=" + pbWarn + ", pbTag="
			+ pbTag + ", pbSellCnt=" + pbSellCnt + "]";
}
   
}

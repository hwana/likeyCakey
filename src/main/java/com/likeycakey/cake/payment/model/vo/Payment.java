package com.likeycakey.cake.payment.model.vo;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Payment implements java.io.Serializable {
	// 자바 내부에서 사용하는 자료를 자바 외의 프로그램에서도 인식할 수 있게 바이트로 변환하여
	// 데이터를 전송하기 위해 직렬화 처리를 한다.
	// 이 때 프로그램을 인식시키기 위한 고유의 식별 번호를 부여한다.
	// 만약 이 식별번호가 일치하면 자바에서 해당 객체를 중복으로 인식하여 에러를 발생시킨다.
	private static final long serialVersionUID = 1000000L;

	/*
	 * PO.P_O_NUM, <!-- 주문번호 --> PO.P_B_NUM, <!-- 참고게시글번호 --> PO.BIZ_DELIVERY, <!--
	 * 배송비 --> PO.P_O_DATE, <!-- 주문일자 --> PO.P_O_BOOKDATE, <!-- 예약날짜 --> PO.P_O_CNT,
	 * <!-- 주문수량 --> PO.P_O_PRICE,<!-- 총 상품가격 --> PO.P_O_TEXT, <!-- 맞춤형 문구 -->
	 * MB.BIZ_NAME, <!-- 사업장이름(가게이름) --> PB.P_NAME, <!-- 제품 이름 --> PB.P_PRICE, <!--
	 * 제품 하나 가격 --> PB.P_IMG, <!-- 제품 이미지 -->
	 */

	
	private String m_id; //현재 로그인 한 아이디
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	private int poNum;	//주문 번호(시퀀스)
	private int pbNum;	//참고 게시글 번호
	private int poBizDelivery;	//배송비
	private Date poDate;		//주문 일자
	private Date poBookDate;	//예약 일자
	private int poCnt;			//주문 수량
	private int poPrice;		//주문 가격
	private String poText;		//케이크 문구
	private String mbBizName;	//가게 이름
	private String pbName;		//제품(케이크) 이름
	private int pbPrice;		//제품 가격
	private String pbImg;		//제품 이미지
	
	private int pay_price;	//결제 값
	private int pay_NUM;		//결제 시퀀스 번호
	private String imp_uid;		//결제 아이디
	private Date pay_date;		//결제 일시
	private String pay_method;	//결제 방법
	
	private String recPost;	//수령인 우편번호
	private String recName;	//수령인 이름
	private String recCP;	//수령인 전화번호
	private String recBasicAddr;	//수령인 기본 주소
	private String recDetailAddr;	//수령인 상세 주소
	private String recMemo;//수령 메모
	private int    s_num;	//주문 진행 상태
	private String s_status; //주문 현황
	
	private String bizDeliveryYN; 	//배송 가능 여부
	
	private int type;// 타입
	
	private String coSize; //케이크 사이즈
	private String coTopping; //선택 토핑
	private String coCream;// 선택 크림
	private String coSheet; //선택 시트
	
	
	
	
	
	
	



	public String getCoSize() {
		return coSize;
	}

	public void setCoSize(String coSize) {
		this.coSize = coSize;
	}

	public String getCoTopping() {
		return coTopping;
	}

	public void setCoTopping(String coTopping) {
		this.coTopping = coTopping;
	}

	public String getCoCream() {
		return coCream;
	}

	public void setCoCream(String coCream) {
		this.coCream = coCream;
	}

	public String getCoSheet() {
		return coSheet;
	}

	public void setCoSheet(String coSheet) {
		this.coSheet = coSheet;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getBizDeliveryYN() {
		return bizDeliveryYN;
	}

	public void setBizDeliveryYN(String bizDeliveryYN) {
		this.bizDeliveryYN = bizDeliveryYN;
	}

	public String getS_status() {
		return s_status;
	}

	public void setS_status(String s_status) {
		this.s_status = s_status;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getRecMemo() {
		return recMemo;
	}

	public void setRecMemo(String recMemo) {
		this.recMemo = recMemo;
	}

	public String getRecPost() {
		return recPost;
	}

	public void setRecPost(String recPost) {
		this.recPost = recPost;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getRecCP() {
		return recCP;
	}

	public void setRecCP(String recCP) {
		this.recCP = recCP;
	}

	public String getRecBasicAddr() {
		return recBasicAddr;
	}

	public void setRecBasicAddr(String recBasicAddr) {
		this.recBasicAddr = recBasicAddr;
	}

	public String getRecDetailAddr() {
		return recDetailAddr;
	}

	public void setRecDetailAddr(String recDetailAddr) {
		this.recDetailAddr = recDetailAddr;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public int getPay_NUM() {
		return pay_NUM;
	}

	public void setPay_NUM(int pay_NUM) {
		this.pay_NUM = pay_NUM;
	}

	
	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
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

	public int getPoBizDelivery() {
		return poBizDelivery;
	}

	public void setPoBizDelivery(int poBizDelivery) {
		this.poBizDelivery = poBizDelivery;
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

	public String getMbBizName() {
		return mbBizName;
	}

	public void setMbBizName(String mbBizName) {
		this.mbBizName = mbBizName;
	}

	public String getPbName() {
		return pbName;
	}

	public void setPbName(String pbName) {
		this.pbName = pbName;
	}

	public int getPbPrice() {
		return pbPrice;
	}

	public void setPbPrice(int pbPrice) {
		this.pbPrice = pbPrice;
	}

	public String getPbImg() {
		return pbImg;
	}

	public void setPbImg(String pbImg) {
		this.pbImg = pbImg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	@Override
	public String toString() {
		return this.poNum + ", " + this.pbNum + ", " + this.poBizDelivery + ", " + this.poDate + ", "
				+ this.poBookDate + ", " + this.poCnt + ", " + this.poPrice + ", "
				+ this.poText + ", " + this.mbBizName + ", " + this.pbName + ", " + this.pbPrice + ", "
				+ this.pbImg;
	}

	public Payment() {

		}

	public Payment(int poNum, int pbNum, int poBizDelivery, Date poDate, Date poBookDate, int poCnt, int poPrice,
			 String poText, String mbBizName, String pbName, int pbPrice, String pbImg) {
			super();
			this.poNum = poNum;
			this.pbNum = pbNum;
			this.poBizDelivery = poBizDelivery;
			this.poDate = poDate;
			this.poBookDate = poBookDate;
			this.poCnt = poCnt;
			this.poPrice = poPrice;
			this.poText = poText;
			this.mbBizName = mbBizName;
			this.pbName = pbName;
			this.pbPrice = pbPrice;
			this.pbImg = pbImg;
		}

	
		

}

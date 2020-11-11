package com.likeycakey.cake.biz.model.dao;



import com.likeycakey.cake.biz.model.vo.BizMember;
import com.likeycakey.cake.detailView.model.vo.CustomBoard;
import com.likeycakey.cake.detailView.model.vo.CustomCream;
import com.likeycakey.cake.detailView.model.vo.CustomSheet;
import com.likeycakey.cake.detailView.model.vo.CustomSize;
import com.likeycakey.cake.detailView.model.vo.CustomTopping;
import com.likeycakey.cake.detailView.model.vo.ProductBoard;
import com.likeycakey.cake.member.model.vo.Member;

public interface BizDao {
	public int updateMypage(Member m) throws Exception;
	public int updateMypage2(BizMember bm) throws Exception;
	public int insertBiz1(Member member) throws Exception;
	public int insertBiz2(BizMember bizMember) throws Exception;
	public int selectMember(String id);
	public int insertProductBoard(ProductBoard productBoard) ;
	public Member loginCheck(String id, String passwd) throws Exception;
	public int customBoardInsert(CustomBoard customboard) throws Exception;
	public String getBiz(BizMember bm);
	public int customCreamInsert(CustomCream customcream);
	public int customSheetInsert(CustomSheet customsheet);
	public int customToppingInsert(CustomTopping customtopping);
	public int customSizeInsert(CustomSize customsize);

}

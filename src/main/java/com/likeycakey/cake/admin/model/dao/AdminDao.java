package com.likeycakey.cake.admin.model.dao;

import com.likeycakey.cake.member.model.vo.Member;
import java.util.ArrayList;

public interface AdminDao {
	
	public int getListCount() throws Exception;
	
	public ArrayList<Member> selectList() throws Exception;
	
	public Member selectOne(String id) throws Exception;
	
	public int updateMember(Member m) throws Exception;
	
	public int deleteMember(String id) throws Exception;
	
	public int deleteTotalMember() throws Exception;

	public ArrayList<Member> selectBizList() throws Exception;
}


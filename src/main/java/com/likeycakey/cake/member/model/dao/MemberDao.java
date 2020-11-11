package com.likeycakey.cake.member.model.dao;
import com.likeycakey.cake.member.model.vo.Member;
import com.likeycakey.cake.qna.model.vo.Homeqna;

import java.util.ArrayList;
import java.util.List;
public interface MemberDao {
	public int insertMember(Member m) throws Exception;
	public int updateMember(Member m) throws Exception;
	public int deleteMember(String id) throws Exception;
	public Member forLogin(String id, String passwd) throws Exception;
	public int selectMember(String id);
	public Member selectMemberInfo(String id);
	public Member findId(String email, String name) throws Exception;
	public int updatePassword(Member m) throws Exception;
	public ArrayList<Homeqna> homeqlist(Member m) throws Exception;
	public List<Member> findId(Member m);
}

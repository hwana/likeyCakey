package com.likeycakey.cake.member.model.service;

import com.likeycakey.cake.member.model.vo.Member;
import com.likeycakey.cake.qna.model.vo.Homeqna;

import java.util.ArrayList;

public interface MemberService {
	public int insertMember(Member m) throws Exception;
	public int idCheck(String id);
	public Member forLogin(String id, String passwd) throws Exception;
	public int mdupid(String id);
	// 멤버 정보 id로 불러오기
	public Member selectMemberInfo(String id);
	public int updateMember(Member m) throws Exception;
	public int updatePassword(Member m)throws Exception;
	public ArrayList<Homeqna> homeqlist(Member m) throws Exception;
	public ArrayList<String> findId(Member m) throws Exception;
}

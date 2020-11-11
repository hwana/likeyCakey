package com.likeycakey.cake.member.model.dao;

import com.likeycakey.cake.member.model.vo.Member;
import com.likeycakey.cake.qna.model.vo.Homeqna;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// member insert 할 수 있는 DAO
	@Override
	public int insertMember(Member m) throws Exception {
		System.out.println("일반 회원가입");
		int result = sqlSession.insert("Member.insertMember", m);
		return result;
	}

	// id 찾기
	@Override
	public Member findId(String email, String name) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("아이디 찾기 dao 진입");
		return sqlSession.selectOne("Member.findId", new Member(email, name));
	}

	// member idcheck 할 수 있는 DAO
	@Override
	public int selectMember(String id) {
		return sqlSession.selectOne("Member.dupid", id);
	}

	// member update 할 수 있는 DAO
	@Override
	public int updateMember(Member m) throws Exception {
		System.out.println("회원정보 업데이트 다오");
		return sqlSession.update("Member.updateMember", m);
	}

	// member delete 할 수 있는 DAO
	@Override
	public int deleteMember(String id) throws Exception {
		return sqlSession.delete("Member.deleteMember", id);
	}

	// 로그인 할 수 있는 DAO
	@Override
	public Member forLogin(String id, String passwd) throws Exception {
		System.out.println("일반회원 로그인");
		return sqlSession.selectOne("Member.loginCheck", new Member(id, passwd));
	}

	// 비밀번호를 수정할 수 있는 DAO
	@Override
	public int updatePassword(Member m) throws Exception {
		return sqlSession.update("Member.updatePassword", m);
	}

	// 게시글 리스트 불러오기
	@Override
	public ArrayList<Homeqna> homeqlist(Member m) throws Exception {
		System.out.println("WELCOME TO DAO 홈큐 리스트");
		return new ArrayList<Homeqna>(sqlSession.selectList("homeqna.m_listAll", m));
	}

	
	@Override
	public Member selectMemberInfo(String id) {
		return sqlSession.selectOne("Member.selectMemberInfo", id);
	}

	@Override
	public List<Member> findId(Member m) {
		return null;
	}

}

package com.likeycakey.cake.admin.model.service;

import com.likeycakey.cake.admin.model.dao.AdminDao;
import com.likeycakey.cake.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public int getListCount() throws Exception{
		return adminDao.getListCount();
	}

	@Override
	public ArrayList<Member> selectList() throws Exception{
		return adminDao.selectList();
	}
	@Override
	public Member selectOne(String id) throws Exception{
		return adminDao.selectOne(id);
	}
	@Override
	public int updateMember(Member m) throws Exception{
		return adminDao.updateMember(m);	
		
	}
	@Override
	public int deleteMember(String id) throws Exception{
		
		return adminDao.deleteMember(id);
	}

	@Override
	public int deleteTotalMember() throws Exception{
		// TODO Auto-generated method stub
		return adminDao.deleteTotalMember();
	}

	@Override
	public ArrayList<Member> selectBizList() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.selectBizList();
	}
	
	

}
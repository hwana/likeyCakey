package com.likeycakey.cake.admin.model.dao;

import com.likeycakey.cake.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public int getListCount() throws Exception{
      System.out.println("adminDao.getListCount 도착");
      return sqlSession.selectOne("AdminMapper.getListCount");
      
   }

   @Override
   public ArrayList<Member> selectList() throws Exception{
      System.out.println("adminDao.selectList 도착");

      return new ArrayList<Member>(sqlSession.selectList("AdminMapper.selectList"));
   }
   
   @Override
   public Member selectOne(String id) throws Exception{
      System.out.println("adminDao.selectOne 도착");
      return (Member)(sqlSession.selectOne("AdminMapper.selectOne", id));
   }
   
   @Override
   public int updateMember(Member m) throws Exception{
      return sqlSession.update("AdminMapper.updateMember",m);      
      
   }
   
   @Override
   public int deleteMember(String id) throws Exception{
      
      return sqlSession.update("AdminMapper.deleteMember",id);
   }

   @Override
   public int deleteTotalMember() throws Exception{
      // TODO Auto-generated method stub
      return sqlSession.update("AdminMapper.deleteTotalMember");
   }

   @Override
   public ArrayList<Member> selectBizList() throws Exception {
      // TODO Auto-generated method stub
      return new ArrayList<Member>(sqlSession.selectList("AdminMapper.selectBizList"));
   }
   

}
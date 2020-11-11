package com.likeycakey.cake.payment.model.dao;

import com.likeycakey.cake.payment.model.vo.Payment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("paymentDao")
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Payment> cartselectList(String m_id) throws Exception {
		System.out.println("paymentDao: cartselectList 도착");
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.cartselectList", m_id));
	}
	
	@Override
	public ArrayList<Payment> cartCustomselectList(String m_id) throws Exception {
		System.out.println("paymentDao: cartCustomselectList 도착");
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.cartCustomselectList", m_id));
	}

	@Override
	public int updateCart(Payment payment) throws Exception {
		System.out.println("paymentDao: updateCart 도착");
		return sqlSession.update("PaymentMapper.updateCart", payment);		
	}
	

	@Override
	public int updateCustomCart(Payment payment) throws Exception {
		System.out.println("paymentDao: updateCustomCart 도착");
		return sqlSession.update("PaymentMapper.updateCustomCart", payment);	
	}

	@Override
	public int deleteCart(int poNumber) throws Exception {
		System.out.println("paymentDao: deleteCart 도착");
		return sqlSession.delete("PaymentMapper.deleteCart",poNumber);
	}

	@Override
	public int deleteCustomCart(int poNumber) throws Exception {
		System.out.println("paymentDao: deleteCustomCart 도착");
		return sqlSession.delete("PaymentMapper.deleteCustomCart",poNumber);
	}
	
	@Override
	public int insertPayment(Payment payment) throws Exception {
		System.out.println("paymentDao: insertPayment 도착");
		return sqlSession.insert("PaymentMapper.insertPayment",payment);
	}

	@Override
	public int updateProductOrder(Payment payment) throws Exception {
		System.out.println("paymentDao: updateProductOrder 도착");
		return sqlSession.update("PaymentMapper.updateProductOrder",payment);
	}
	
	@Override
	public int updateCustomOrder(Payment payment) throws Exception {
		System.out.println("paymentDao: updateCustomOrder 도착");
		return sqlSession.update("PaymentMapper.updateCustomOrder",payment);
	}

	@Override
	public Payment paymentSuccess(String m_id) throws Exception {
		System.out.println("paymentDao: paymentSuccess 도착");
		return sqlSession.selectOne("PaymentMapper.paymentSuccess",m_id);
	}

	@Override
	public int getBuyListCount(String m_id) throws Exception {
		System.out.println("paymentDao: getBuyListCount 도착");
		return sqlSession.selectOne("PaymentMapper.getBuyListCount", m_id);
	}

	@Override
	public ArrayList<Payment> selectBuyList(String m_id) throws Exception {
		System.out.println("paymentDao: selectBuyList 도착");
		
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.selectBuyList", m_id));
	}
	
	@Override
	public ArrayList<Payment> selectCustomBuyList(String m_id) throws Exception {
			System.out.println("paymentDao: selectCustomBuyList 도착");
		
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.selectCustomBuyList", m_id));
	}

	@Override
	public int recPostUpdate(Payment payment) throws Exception {
		System.out.println("paymentDao: recPostUpdate 도착");
		return sqlSession.update("PaymentMapper.recPostUpdate",payment);
	}

	@Override
	public int poTextUpdate(Payment payment) throws Exception {
		System.out.println("paymentDao: poTextUpdate 도착");
		return sqlSession.update("PaymentMapper.poTextUpdate",payment);
	}

	@Override
	public int poDelete(int poNum) throws Exception {
		System.out.println("paymentDao: poDelete 도착");
		return sqlSession.update("PaymentMapper.poDelete",poNum);
	}

	@Override
	public ArrayList<Payment> directCheckoutList(String m_id) throws Exception {
		System.out.println("paymentDao: directCheckoutList 도착");
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.directCheckoutList", m_id));
	}

	@Override
	public int updateDirectProductOrder(Payment payment) throws Exception {
		System.out.println("paymentDao: updateDirectProductOrder 도착");
		return sqlSession.update("PaymentMapper.updateDirectProductOrder",payment);
	}

	@Override
	public ArrayList<Payment> directCustomCheckoutList(String m_id) throws Exception {
		System.out.println("paymentDao: directCustomCheckoutList 도착");
		return new ArrayList<Payment>(sqlSession.selectList("PaymentMapper.directCustomCheckoutList", m_id));
	}

	@Override
	public int updateDirectCustomOrder(Payment payment) throws Exception {
		System.out.println("paymentDao: updateDirectCustomOrder 도착");
		return sqlSession.update("PaymentMapper.updateDirectCustomOrder",payment);
	}

	@Override
	public int countProductOrder(String m_id) throws Exception {
		System.out.println("paymentDao: countProductOrder 도착");
		return sqlSession.selectOne("PaymentMapper.countProductOrder", m_id);
	}

	@Override
	public int countCustomOrder(String m_id) throws Exception {
		System.out.println("paymentDao: countCustomOrder 도착");
		return sqlSession.selectOne("PaymentMapper.countCustomOrder", m_id);
	}








	


}
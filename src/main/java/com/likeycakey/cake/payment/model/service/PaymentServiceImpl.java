package com.likeycakey.cake.payment.model.service;

import com.likeycakey.cake.payment.model.dao.PaymentDao;
import com.likeycakey.cake.payment.model.vo.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentDao paymentDao;

	@Override
	public ArrayList<Payment> cartselectList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : cartselectList 도착");
		return paymentDao.cartselectList(m_id);
	}
	
	@Override
	public ArrayList<Payment> cartCustomselectList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : cartCustomselectList 도착");
		return paymentDao.cartCustomselectList(m_id);
	}

	@Override
	public int updateCart(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateCart 도착");
		return paymentDao.updateCart(payment);
	}
	
	@Override
	public int updateCustomCart(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateCustomCart 도착");
		return paymentDao.updateCustomCart(payment);
	}

	@Override
	public int deleteCart(int poNumber) throws Exception {
		System.out.println("PaymentServiceImpl : deleteCart 도착");
		return paymentDao.deleteCart(poNumber);
	}
	
	@Override
	public int deleteCustomCart(int poNumber) throws Exception {
		System.out.println("PaymentServiceImpl : deleteCustomCart 도착");
		return paymentDao.deleteCustomCart(poNumber);
	}

	@Override
	public int insertPayment(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : insertPayment 도착");
		return paymentDao.insertPayment(payment);
	}

	@Override
	public int updateProductOrder(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateProductOrder 도착");
		return paymentDao.updateProductOrder(payment);
	}
	
	@Override
	public int updateCustomOrder(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateCustomOrder 도착");
		return paymentDao.updateCustomOrder(payment);
	}

	@Override
	public Payment paymentSuccess(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : paymentSuccess 도착");
		return paymentDao.paymentSuccess(m_id);
	}

	@Override
	public int getBuyListCount(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : getBuyListCount 도착");
		return paymentDao.getBuyListCount(m_id);
	}

	@Override
	public ArrayList<Payment> selectBuyList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : selectBuyList 도착");
		return paymentDao.selectBuyList(m_id);
	}
	
	@Override
	public ArrayList<Payment> selectCustomBuyList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : selectCustomBuyList 도착");
		return paymentDao.selectCustomBuyList(m_id);
	}

	@Override
	public int recPostUpdate(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : poTextUpdate 도착");
		return paymentDao.recPostUpdate(payment);
	}

	@Override
	public int poTextUpdate(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : poTextUpdate 도착");
		return paymentDao.poTextUpdate(payment);
	}

	@Override
	public int poDelete(int poNum) throws Exception {
		System.out.println("PaymentServiceImpl : poDelete 도착");
		return paymentDao.poDelete(poNum);
	}

	@Override
	public ArrayList<Payment> directCheckoutList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : directCheckoutList 도착");
		return paymentDao.directCheckoutList(m_id);
	}

	@Override
	public int updateDirectProductOrder(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateDirectProductOrder 도착");
		return paymentDao.updateDirectProductOrder(payment);
	}

	@Override
	public ArrayList<Payment> directCustomCheckoutList(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : directCustomCheckoutList 도착");
		return paymentDao.directCustomCheckoutList(m_id);
	}

	@Override
	public int updateDirectCustomOrder(Payment payment) throws Exception {
		System.out.println("PaymentServiceImpl : updateDirectCustomOrder 도착");
		return paymentDao.updateDirectCustomOrder(payment);
	}

	@Override
	public int countProductOrder(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : countProductOrder 도착");
		return paymentDao.countProductOrder(m_id);
	}

	@Override
	public int countCustomOrder(String m_id) throws Exception {
		System.out.println("PaymentServiceImpl : countCustomOrder 도착");
		return paymentDao.countCustomOrder(m_id);
	}









	

	

}
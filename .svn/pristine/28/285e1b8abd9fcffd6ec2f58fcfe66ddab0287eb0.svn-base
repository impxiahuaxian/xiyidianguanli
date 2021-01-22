package com.weiweiqin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.OrderDetailDao;
import com.weiweiqin.model.OrderDetail;
import com.weiweiqin.service.OrderDetailService;
import com.weiweiqin.vo.common.Page;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailDao orderDetailDetailDao;

	public void update(OrderDetail orderDetail) {
		orderDetailDetailDao.update(orderDetail);
	}

	public OrderDetail get(int id) {
		return orderDetailDetailDao.get(id);
	}

	public List<OrderDetail> pageList(Page page, Map<String, Object> conditions) {
		return orderDetailDetailDao.pageList(page, conditions);
	}

	public int totalCount(Map<String, Object> conditions) {
		return orderDetailDetailDao.totalCount(conditions);
	}

	public void save(OrderDetail orderDetail) {
		orderDetailDetailDao.insert(orderDetail);
	}

	public void del(int id) {
		orderDetailDetailDao.delete(id);
	}

}
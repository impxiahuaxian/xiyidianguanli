package com.weiweiqin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiweiqin.dao.OrderDao;
import com.weiweiqin.dao.OrderDetailDao;
import com.weiweiqin.model.Order;
import com.weiweiqin.model.OrderDetail;
import com.weiweiqin.service.OrderService;
import com.weiweiqin.vo.common.Page;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private OrderDetailDao orderdetailDao;

	public void update(Order order) {
		orderDao.update(order);
	}

	public Order get(int id) {
		return orderDao.get(id);
	}

	public List<Order> pageList(Page page, Map<String, Object> conditions) {
		return orderDao.pageList(page, conditions);
	}

	public int totalCount(Map<String, Object> conditions) {
		return orderDao.totalCount(conditions);
	}


	@Transactional
	public void save(Order order, String clothesIds,String nums) {
		String[] clothesIdList = clothesIds.split(",");
		String[] numList = nums.split(",");
		orderDao.insert(order);
		for(int i = 1 ;i<clothesIdList.length;i++){
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(order.getId());
			orderDetail.setClothesId(Integer.valueOf(clothesIdList[i]));
			orderDetail.setNum(Integer.valueOf(numList[i]));
			orderdetailDao.insert(orderDetail);
		}
	}

	public void del(int id) {
		orderDao.delete(id);
	}

}
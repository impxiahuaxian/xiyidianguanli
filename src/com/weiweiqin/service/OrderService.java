package com.weiweiqin.service;

import java.util.List;
import java.util.Map;

import com.weiweiqin.model.Order;
import com.weiweiqin.vo.common.Page;

public interface OrderService {

	void update(Order order);

	Order get(int id);

	List<Order> pageList(Page page, Map<String, Object> conditions);

	int totalCount(Map<String, Object> conditions);

	void save(Order order, String clothesIds,String nums);

	void del(int id);

}
package com.weiweiqin.dao.impl;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.OrderDao;
import com.weiweiqin.model.Order;
@Repository
public class OrderDaoImpl extends GenericMybatisDao<Order, Integer>
		implements OrderDao {
}
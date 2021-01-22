package com.weiweiqin.dao.impl;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.OrderDetailDao;
import com.weiweiqin.model.OrderDetail;
@Repository
public class OrderDetailDaoImpl extends GenericMybatisDao<OrderDetail, Integer>
		implements OrderDetailDao {
}
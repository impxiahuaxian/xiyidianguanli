package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.CustomerAddrDao;
import com.weiweiqin.model.CustomerAddr;

@Repository
public class CustomerAddrDaoImpl extends
		GenericMybatisDao<CustomerAddr, Integer> implements CustomerAddrDao {

	@SuppressWarnings("unchecked")
	public List<CustomerAddr> getByCustomerId(int customerId) {
		return (List<CustomerAddr>) getSqlSession().selectList("CustomerAddr_getByCustomerId", customerId);
	}

}
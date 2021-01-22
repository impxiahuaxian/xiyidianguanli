package com.weiweiqin.dao.impl;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.CustomerDao;
import com.weiweiqin.model.Customer;

@Repository
public class CustomerDaoImpl extends GenericMybatisDao<Customer, Integer>
		implements CustomerDao {
	
	public Customer getByActiveCode(String activeCode) {
		return (Customer) getSqlSession().selectOne("Customer_getByActiveCode",activeCode);
	}

	public Customer getByUsername(String username) {
		return (Customer) getSqlSession().selectOne("Customer_getByUsername",username);
	}
}
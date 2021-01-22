package com.weiweiqin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.CustomerAddrDao;
import com.weiweiqin.model.CustomerAddr;
import com.weiweiqin.service.CustomerAddrService;

@Service
public class CustomerAddrServiceImpl implements CustomerAddrService {
	@Autowired
	private CustomerAddrDao customerAddrDao;

	public void update(CustomerAddr order) {
		customerAddrDao.update(order);
	}

	public CustomerAddr get(int id) {
		return customerAddrDao.get(id);
	}


	public void save(CustomerAddr customerAddr) {
		customerAddrDao.insert(customerAddr);
		
	}

	public List<CustomerAddr> getByCustomerId(int customerId) {
		return customerAddrDao.getByCustomerId(customerId);
	}

	public void del(int id) {
		customerAddrDao.delete(id);
	}

	
}
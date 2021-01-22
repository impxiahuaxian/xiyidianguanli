package com.weiweiqin.dao;

import com.weiweiqin.model.Customer;

public interface CustomerDao extends GenericDao<Customer, Integer> {

	Customer getByActiveCode(String activeCode);
	
	Customer getByUsername(String username);
	
}

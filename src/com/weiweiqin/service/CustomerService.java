package com.weiweiqin.service;

import java.util.List;
import java.util.Map;

import com.weiweiqin.model.Customer;
import com.weiweiqin.model.CustomerAddr;
import com.weiweiqin.vo.common.Page;

public interface CustomerService {

	void save(Customer customer,String href);
	
	void update(Customer customer);

	Customer get(int id);

	List<Customer> pageList(Page page, Map<String, Object> conditions);

	int totalCount(Map<String, Object> conditions);
	
	void activeAccount(String activeCode);
	
	Customer getByActiveCode(String activeCode);
	
	Customer getByUsername(String username);
	
	List<CustomerAddr> getCustomerAddrs(int customerId);
	
	void addCustomerAddr(CustomerAddr customerAddr);
	
	void updateCustomerAddr(CustomerAddr customerAddr);
	
	void delCustomerAddr(int id,int customerId);
	
	void setDefaultAddr(int id,int customerId);
	
}
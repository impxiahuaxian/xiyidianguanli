package com.weiweiqin.vo.common;

import java.io.Serializable;

import com.weiweiqin.model.Customer;

/**
 * 结果VO
 * 
 * @author weiweiqin
 * 
 */
public class CustomerTabVO implements Serializable {

	private static final long serialVersionUID = 2076324875575488461L;

	private Customer customer;

	private String regDate;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


}
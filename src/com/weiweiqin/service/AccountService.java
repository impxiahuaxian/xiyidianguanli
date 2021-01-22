package com.weiweiqin.service;


import com.weiweiqin.model.Account;

public interface AccountService {
	
	void  update(Account account);
	
	Account getByUsername(String username);
	
}
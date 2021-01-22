package com.weiweiqin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.AccountDao;
import com.weiweiqin.model.Account;
import com.weiweiqin.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountDao accountDao;

	public void update(Account account) {
		accountDao.update(account);
	}

	public Account getByUsername(String username) {
		return accountDao.getByUsername(username);
	}

	

}
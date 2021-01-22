package com.weiweiqin.dao;

import com.weiweiqin.model.Account;


public interface AccountDao extends GenericDao<Account,Integer>{
	Account getByUsername(String username);
}

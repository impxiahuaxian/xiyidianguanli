package com.weiweiqin.dao.impl;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.AccountDao;
import com.weiweiqin.model.Account;

@Repository
public class AccountDaoImpl extends GenericMybatisDao<Account, Integer>
		implements AccountDao {

	public Account getByUsername(String username) {
		return (Account)getSqlSession().selectOne("Account_getByAccountName", username);
	}



}
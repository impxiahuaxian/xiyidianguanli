package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.VipTypeDao;
import com.weiweiqin.model.VipType;
@Repository
public class VipTypeDaoImpl extends GenericMybatisDao<VipType, Integer>
		implements VipTypeDao {

	@SuppressWarnings("unchecked")
	public List<VipType> getAll() {
		return (List<VipType>)getSqlSession().selectList("VipType_getAll");
	}
}
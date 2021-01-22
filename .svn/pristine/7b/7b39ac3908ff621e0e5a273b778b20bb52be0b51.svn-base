package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.CityDao;
import com.weiweiqin.model.City;
@Repository
public class CityDaoImpl extends GenericMybatisDao<City, Integer>
		implements CityDao {
	
	@SuppressWarnings("unchecked")
	public List<City> getByProvincecode(String provincecode) {
		return (List<City>)getSqlSession().selectList("City_getByProvincecode",provincecode);
	}
	 
	
}
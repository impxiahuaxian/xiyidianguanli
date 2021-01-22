package com.weiweiqin.dao;

import java.util.List;

import com.weiweiqin.model.City;


public interface CityDao extends GenericDao<City,Integer>{
		List<City> getByProvincecode(String provincecode);
}

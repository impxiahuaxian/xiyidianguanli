package com.weiweiqin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.CityDao;
import com.weiweiqin.model.City;
import com.weiweiqin.service.CityService;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityDao cityDao;


	public List<City> getByProvincecode(String provincecode) {
		return cityDao.getByProvincecode(provincecode);
	}

 

	 

}
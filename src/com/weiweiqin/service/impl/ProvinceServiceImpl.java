package com.weiweiqin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.ProvinceDao;
import com.weiweiqin.model.Province;
import com.weiweiqin.service.ProvinceService;

@Service
public class ProvinceServiceImpl implements ProvinceService {

	@Autowired
	private ProvinceDao provinceDao;

	public List<Province> getAll() {
		return provinceDao.getAll();
	}

}
package com.weiweiqin.dao;

import java.util.List;

import com.weiweiqin.model.Province;


public interface ProvinceDao extends GenericDao<Province,Integer>{
		List<Province> getAll();
}

package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.ProvinceDao;
import com.weiweiqin.model.Province;
@Repository
public class ProvinceDaoImpl extends GenericMybatisDao<Province, Integer>
		implements ProvinceDao {
	
	@SuppressWarnings("unchecked")
	public List<Province> getAll() {
		return (List<Province>)getSqlSession().selectList("Province_getProvinces");
	}
	 
	
}
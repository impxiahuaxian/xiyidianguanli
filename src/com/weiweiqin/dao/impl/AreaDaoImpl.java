package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.AreaDao;
import com.weiweiqin.model.Area;

@Repository
public class AreaDaoImpl extends GenericMybatisDao<Area, Integer>
		implements AreaDao {
	
	@SuppressWarnings("unchecked")
	public List<Area> getByCitycode(String citycode) {
		return (List<Area>)getSqlSession().selectList("Area_getByCitycode",citycode);
	}
	 
	
}
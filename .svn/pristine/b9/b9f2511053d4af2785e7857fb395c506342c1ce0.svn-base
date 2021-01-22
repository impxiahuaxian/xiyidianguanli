package com.weiweiqin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.AreaDao;
import com.weiweiqin.model.Area;
import com.weiweiqin.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao;

	public List<Area> getByCitycode(String citycode) {
		return areaDao.getByCitycode(citycode);
	}
}
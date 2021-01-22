package com.weiweiqin.service;

import java.util.List;
import java.util.Map;

import com.weiweiqin.model.VipType;
import com.weiweiqin.vo.common.Page;

public interface VipTypeService {

	void update(VipType vipType);

	VipType get(int id);

	List<VipType> pageList(Page page, Map<String, Object> conditions);

	int totalCount(Map<String, Object> conditions);

	void save(VipType vipType);

	void del(int id);
	
	List<VipType> getAll();

}
package com.weiweiqin.service;

import java.util.List;
import java.util.Map;

import com.weiweiqin.model.Clothes;
import com.weiweiqin.vo.common.Page;

public interface ClothesService {

	void update(Clothes clothes);

	Clothes get(int id);

	List<Clothes> pageList(Page page, Map<String, Object> conditions);

	int totalCount(Map<String, Object> conditions);

	void save(Clothes clothes);

	void del(int id);
	
	List<Clothes> getAll();

}
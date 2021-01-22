package com.weiweiqin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weiweiqin.dao.ClothesDao;
import com.weiweiqin.model.Clothes;
import com.weiweiqin.service.ClothesService;
import com.weiweiqin.vo.common.Page;

@Service
public class ClothesServiceImpl implements ClothesService {

	@Autowired
	private ClothesDao clothesDao;

	public void update(Clothes clothes) {
		clothesDao.update(clothes);
	}

	public Clothes get(int id) {
		return clothesDao.get(id);
	}

	public List<Clothes> pageList(Page page, Map<String, Object> conditions) {
		return clothesDao.pageList(page, conditions);
	}

	public int totalCount(Map<String, Object> conditions) {
		return clothesDao.totalCount(conditions);
	}

	public void save(Clothes clothes) {
		clothesDao.insert(clothes);
	}

	public void del(int id) {
		clothesDao.delete(id);
	}

	public List<Clothes> getAll() {
		return clothesDao.getAll();
	}

}
package com.weiweiqin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.ClothesDao;
import com.weiweiqin.model.Clothes;
@Repository
public class ClothesDaoImpl extends GenericMybatisDao<Clothes, Integer>
		implements ClothesDao {
	
	@SuppressWarnings("unchecked")
	public List<Clothes> getAll() {
		return (List<Clothes>)getSqlSession().selectList("Clothes_getAll");
	}
}
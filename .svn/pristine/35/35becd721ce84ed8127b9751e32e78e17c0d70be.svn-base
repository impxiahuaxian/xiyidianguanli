package com.weiweiqin.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.weiweiqin.vo.common.Page;

/**
 * GenericDao DAO层泛型接口，定义基本的DAO功能
 * 
 * @author weiweiqin
 * @since 0.1
 * @param <T>
 *            实体类
 * @param <PK>
 *            主键类，必须实现Serializable接口
 * @param <DynamicSqlParameter>
 * 
 * @see com.thinkon.commons.dao.GenericIbatisDao
 */
public abstract interface GenericDao<T, PK extends Serializable> {
	/**
	 * 插入一个实体（在数据库INSERT一条记录）
	 * 
	 * @param entity
	 *            实体对象
	 */
	public abstract void insert(T entity);

	/**
	 * 修改一个实体对象（UPDATE一条记录）
	 * 
	 * @param entity
	 *            实体对象
	 * @return 修改的对象个数，正常情况=1
	 */
	public abstract int update(T entity);

	/**
	 * 按主键删除记录
	 * 
	 * @param primaryKey
	 *            主键对象
	 * @return 删除的对象个数，正常情况=1
	 */
	public abstract int delete(PK primaryKey);

	/**
	 * 按主键取记录
	 * 
	 * @param primaryKey
	 *            主键值
	 * @return 记录实体对象，如果没有符合主键条件的记录，则返回null
	 */
	public abstract T get(PK primaryKey);

	/**
	 * 取全部记录
	 * 
	 * @return 全部记录实体对象的List
	 */
	public abstract List<T> select();

	public List<T> pageList(Page page, Map<String, Object> conditions);

	public int totalCount(Map<String,Object> condtions);
}

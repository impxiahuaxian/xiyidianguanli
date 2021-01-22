package com.weiweiqin.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.weiweiqin.dao.GenericDao;
import com.weiweiqin.vo.common.Page;

/**
 * iBatis DAO层泛型基类，实现了基本的DAO增删改查功能
 * 
 * @author weiweiqin
 * @since 0.1
 * @param <T>
 *            实体类
 * @param <PK>
 *            主键类，必须实现Serializable接口
 * @see com.thinkon.commons.dao.GenericDao
 * @see org.springframework.orm.ibatis.support.SqlMapClientDaoSupport
 */
@SuppressWarnings("unchecked")
@Repository
public abstract class GenericMybatisDao<T, PK extends Serializable> extends
		SqlSessionDaoSupport implements GenericDao<T, PK> {

	/**
	 * mapper文件中对应的增删改查sqlid
	 */
	public static final String SQLID_INSERT = "insert";
	public static final String SQLID_UPDATE = "update";
	public static final String SQLID_DELETE = "delete";
	public static final String SQLID_SELECT = "select";
	public static final String SQLID_PAGELIST = "pageList";
	public static final String SQLID_TOTAL_COUNT = "totalCount";
	public static final String SQLID_SELECT_PK = "selectPk";
	
	/**
	 * 第一个泛型参数索引
	 */
	public static final int FIRST_GENPARAM = 0;

	private String sqlmapNamespace = "";

	public GenericMybatisDao() {
		Class<?> genericType = getGenericType(FIRST_GENPARAM);
		String simpleName = genericType.getSimpleName();
		this.sqlmapNamespace = simpleName;
	}

	public int delete(PK primaryKey) {
		int rows = getSqlSession().delete(sqlmapNamespace + "_" + SQLID_DELETE,
				primaryKey);
		return rows;
	}

	public T get(PK primaryKey) {

		return (T) getSqlSession().selectOne(
				sqlmapNamespace + "_" + SQLID_SELECT_PK, primaryKey);
	}

	public void insert(T entity) {
		getSqlSession().insert(sqlmapNamespace + "_" + SQLID_INSERT, entity);
	}

	public List<T> pageList(Page page, Map<String, Object> conditions) {
		if (null == conditions) {
			conditions = new HashMap<String, Object>();
		}
		conditions.put("page", page);
		return (List<T>) getSqlSession().selectList(
				sqlmapNamespace + "_" + SQLID_PAGELIST, conditions);
	}

	public List<T> select() {
		return getSqlSession().selectList(sqlmapNamespace + "_" + SQLID_SELECT);
	}

	public int update(T entity) {
		return getSqlSession().update(sqlmapNamespace + "_" + SQLID_UPDATE,
				entity);
	}

	/**
	 * 获取泛型类型
	 * 
	 * @name 中文名称
	 * @Description 相关说明
	 * @return
	 * @history 修订历史（历次修订内容、修订人、修订时间等）
	 */
	public Class<Object> getGenericType(int index) {
		Type genType = getClass().getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			throw new RuntimeException("Index outof bounds");
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class<Object>) params[index];
	}

	/**
	 * sqlmapNamespace，对应sqlmap.xml中的命名空间
	 * 
	 * @return
	 */
	public String getSqlmapNamespace() {
		return sqlmapNamespace;
	}

	/**
	 * sqlmapNamespace的设置方法，可以用于spring注入
	 * 
	 * @param sqlmapNamespace
	 */
	public void setSqlmapNamespace(String sqlmapNamespace) {
		this.sqlmapNamespace = sqlmapNamespace;
	}

	public int totalCount(Map<String, Object> conditions) {
		return (Integer) getSqlSession().selectOne(
				getSqlmapNamespace() + "_" + SQLID_TOTAL_COUNT, conditions);
	}

}
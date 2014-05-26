package org.guess.core.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PropertyFilter;

public interface BaseService<T,ID extends Serializable> {

	/**
	 * 根据ID获得单个对象
	 * 
	 * @param id
	 * @return
	 * @throws DataAccessException
	 */
	T get(ID id) throws Exception;

	/**
	 * 获得对象所有集合
	 * 
	 * @return
	 * @throws DataAccessException
	 */
	List<T> getAll() throws Exception;
	
	/**
	 * 根据ID集合查询
	 * 
	 * @param ids
	 * @return
	 */
	List<T> get(final Collection<ID> ids);

	/**
	 * 保存对象
	 * 
	 * @param o
	 * @throws DataAccessException
	 */
	void save(T o) throws Exception;

	/**
	 * 更新对象
	 * 
	 * @param o
	 * @throws DataAccessException
	 */
	void update(T o) throws Exception;

	/**
	 * 删除对象
	 * 
	 * @param o
	 * @throws DataAccessException
	 */
	void remove(T o) throws Exception;

	/**
	 * 根据ID删除对象
	 * 
	 * @param id
	 * @throws DataAccessException
	 */
	void removeById(ID id) throws Exception;
	
	/**
	 * 批量删除
	 * 
	 * @param id
	 * @throws DataAccessException
	 */
	void removeByIds(ID[] ids) throws Exception;
	
	/**
	 * 分页查询
	 * @param pageRequest
	 * @param hql
	 * @param values
	 * @return page
	 */
	Page<T> findPage(final PageRequest pageRequest, String hql, final Object... values);
	
	/**
	 * 分页查询
	 * @param pageRequest
	 * @param hql
	 * @param values
	 * @return page
	 */
	Page<T> findPage(final PageRequest pageRequest, String hql, final Map<String, ?> values);
	
	/**
	 * 按照属性条件封装类查询
	 * @param pageRequest
	 * @param filters
	 * @return
	 */
	Page<T> findPage(final PageRequest pageRequest,final List<PropertyFilter> filters);
	
	/**
	 * 添加orfilters
	 * @param pageRequest
	 * @param filters
	 * @param orfilters
	 * @return
	 */
	Page<T> findPage(final PageRequest pageRequest, final List<PropertyFilter> filters, final List<PropertyFilter> orfilters);
	
	/**
	 * 根据属性值查找唯一对象
	 * @param propertyName
	 * @param value
	 * @return
	 */
	T findUniqueBy(final String propertyName, final Object value);
	
	/**
	 * 按照属性条件封装类查询 不分页
	 * @param filters
	 * @return
	 */
	List<T> find(List<PropertyFilter> filters);
	
	/**
	 * 按一个属性查询
	 * @param propertyName
	 * @param value
	 * @return
	 */
	List<T> findBy(final String propertyName, final Object value);
	
	/**
	 * 按属性查询,并按某个属性排序
	 * @param propertyName
	 * @param value
	 * @param orderByProperty
	 * @param isAsc
	 * @return
	 */
	List<T> findBy(final String propertyName, final Object value,String orderByProperty,boolean isAsc);

}

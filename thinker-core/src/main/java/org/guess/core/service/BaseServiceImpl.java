package org.guess.core.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.guess.core.orm.EntityDao;
import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PropertyFilter;
import org.springframework.beans.factory.annotation.Autowired;

abstract public class BaseServiceImpl<T, ID extends Serializable> implements
		BaseService<T, ID> {

	@Autowired
	private EntityDao<T, ID> entityDao;

	@Override
	public T get(ID id) throws Exception {
		return entityDao.get(id);
	}

	@Override
	public List<T> getAll() throws Exception {
		return entityDao.getAll();
	}

	@Override
	public List<T> get(Collection<ID> ids) {
		return entityDao.get(ids);
	}

	@Override
	public void save(T o) throws Exception {
		entityDao.save(o);
	}

	@Override
	public void update(T o) throws Exception {
		entityDao.save(o);
	}

	@Override
	public void remove(T o) throws Exception {
		entityDao.delete(o);
	}

	@Override
	public void removeById(ID id) throws Exception {
		entityDao.delete(id);

	}

	@Override
	public void removeByIds(ID[] ids) throws Exception {
		entityDao.batchDelete((ID[]) ids);
	}

	@Override
	public Page<T> findPage(PageRequest pageRequest, String hql,
			Map<String, ?> values) {
		return entityDao.findPage(pageRequest, hql, values);
	}

	@Override
	public Page<T> findPage(PageRequest pageRequest, String hql,
			Object... values) {
		return entityDao.findPage(pageRequest, hql, values);
	}

	@Override
	public Page<T> findPage(PageRequest pageRequest,
			List<PropertyFilter> filters) {
		return entityDao.findPage(pageRequest, filters);
	}

	@Override
	public Page<T> findPage(PageRequest pageRequest,
			List<PropertyFilter> filters, List<PropertyFilter> orfilters) {
		return entityDao.findPage(pageRequest, filters, orfilters);
	}

	@Override
	public T findUniqueBy(String propertyName, Object value) {
		return entityDao.findUniqueBy(propertyName, value);
	}

	@Override
	public List<T> find(List<PropertyFilter> filters) {
		return entityDao.find(filters);
	}

	@Override
	public List<T> findBy(String propertyName, Object value) {
		return entityDao.findBy(propertyName, value);
	}

	@Override
	public List<T> findBy(String propertyName, Object value,
			String orderByProperty, boolean isAsc) {
		return entityDao.findBy(propertyName, value, orderByProperty, isAsc);
	}

}

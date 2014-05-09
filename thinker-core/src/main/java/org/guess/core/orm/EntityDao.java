package org.guess.core.orm;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface EntityDao<T,ID extends Serializable> {

	T get(ID id);

	List<T> getAll();
	
	List<T> get(final Collection<ID> ids);

	void save(T o);

	void delete(ID id);
	
	void delete(T o);
	
	void batchDelete(ID[] ids);
	
	int batchExecute(final String hql, final Object... values);

	Page<T> findPage(final PageRequest pageRequest, String hql, final Object... values);

	Page<T> findPage(final PageRequest pageRequest, String hql, final Map<String, ?> values);
	
	Page<T> findPage(final PageRequest pageRequest,final List<PropertyFilter> filters);
	
	Page<T> findPage(final PageRequest pageRequest, final List<PropertyFilter> filters, final List<PropertyFilter> orfilters);
	
	T findUniqueBy(final String propertyName, final Object value);
	
	List<T> find(List<PropertyFilter> filters);
	
	List<T> findBy(final String propertyName, final Object value);
	
	List<T> findBy(final String propertyName, final Object value,String orderByProperty,boolean isAsc);
}

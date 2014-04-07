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

	Page<T> findPage(final PageRequest pageRequest, String hql, final Object... values);

	Page<T> findPage(final PageRequest pageRequest, String hql, final Map<String, ?> values);
	
	Page<T> findPage(final PageRequest pageRequest,final List<PropertyFilter> filters);
	
	T findUniqueBy(final String propertyName, final Object value);
	
	List<T> find(List<PropertyFilter> filters);
	
	List<T> findBy(final String propertyName, final Object value);
}

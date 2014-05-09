package org.guess.showcase.cms.service;

import java.util.Set;

import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Category;

/**
 * 栏目entityservice
 * @author rguess
 * @version 2014-05-03
 */
public interface CategoryService extends BaseService<Category, Long>{
	
	/**
	 * 根据id获取所有子节点id
	 */
	public Set<String> getChlidIdsById(String id);

	public void order(Long id, String type);

}

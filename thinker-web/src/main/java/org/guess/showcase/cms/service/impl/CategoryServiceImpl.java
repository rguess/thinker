package org.guess.showcase.cms.service.impl;

import java.util.Set;

import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.CategoryDao;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Sets;

/**
 * 栏目entityserviceImpl
 * @author rguess
 * @version 2014-05-03
 */
@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category, Long> implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	private Set<String> ids = Sets.newHashSet();

	@Override
	public Set<String> getChlidIdsById(String id) {
		Category parent = categoryDao.get(Long.valueOf(id));
		ids.clear();
		this.recursion(parent);
		return ids;
	}
	
	/**
	 * 迭代把id加入Set
	 */
	private void recursion(Category parent){
		ids.add(String.valueOf(parent.getId()));
		if(parent.getChildList().size() > 0){
			for(Category category : parent.getChildList()){
				this.recursion(category);
			}
		}
	}

}

package org.guess.showcase.cms.service.impl;

import java.util.List;
import java.util.Set;

import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PageRequest.Sort;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.CategoryDao;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
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

	@Override
	public void order(Long id, String type) {
		Category category = categoryDao.get(id);
		List<Category> list = categoryDao.findBy("grade", category.getGrade(), "orderNo", true);
		
	}

	@Override
	public List<Category> listGradeOne(Site curSite) {
		List<PropertyFilter> filters = Lists.newArrayList();
		filters.add(new PropertyFilter("EQI_grade", "1"));
		filters.add(new PropertyFilter("EQL_site.id", String.valueOf(curSite.getId())));
		PageRequest pageRequest = new PageRequest(1, 1000);
		return categoryDao.findPage(pageRequest, filters).getResult();
	}

	@Override
	public List<Category> listGradeTop(Site curSite) {
		List<PropertyFilter> filters = Lists.newArrayList();
		filters.add(new PropertyFilter("EQI_grade", "0"));
		filters.add(new PropertyFilter("EQL_site.id", String.valueOf(curSite.getId())));
		PageRequest pageRequest = new PageRequest(1, 1000);
		return categoryDao.findPage(pageRequest, filters).getResult();
	}

	@Override
	public List<Category> listIsShow(Site curSite) {
		List<PropertyFilter> filters = Lists.newArrayList();
		filters.add(new PropertyFilter("EQI_grade", "1"));
		filters.add(new PropertyFilter("EQL_site.id", String.valueOf(curSite.getId())));
		filters.add(new PropertyFilter("EQI_isShow", String.valueOf(Category.ISSHOW_SHOW)));
		PageRequest pageRequest = new PageRequest(1, 1000);
		pageRequest.setOrderBy("orderNo");
		pageRequest.setOrderDir(Sort.ASC);
		return categoryDao.findPage(pageRequest, filters).getResult();
	}

}

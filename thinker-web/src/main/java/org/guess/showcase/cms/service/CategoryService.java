package org.guess.showcase.cms.service;

import java.util.List;
import java.util.Set;

import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Site;

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
	
	/**
	 * 根据当前站点获取等级为1的栏目列表
	 */
	public List<Category> listGradeOne(Site curSite);
	
	/**
	 * 根据当前站点获取顶级栏目
	 */
	public List<Category> listGradeTop(Site curSite);
	
	/**
	 * 获取当前现在在导航栏的栏目列表
	 */
	public List<Category> listIsShow(Site curSite);

}

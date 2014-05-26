package org.guess.showcase.cms.dao;

import org.guess.core.orm.EntityDao;
import org.guess.showcase.cms.model.Category;

/**
 * 栏目entitydao
 * @author rguess
 * @version 2014-05-03
 */
public interface CategoryDao extends EntityDao<Category, Long>{

	/**
	 * 获取相邻记录
	 * @param category
	 * @return
	 */
	Category getAdjacent(Category category,String type);
	
}

package org.guess.showcase.cms.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.CategoryDao;
import org.guess.showcase.cms.model.Category;
import org.springframework.stereotype.Repository;

/**
 * 栏目entitydaoImpl
 * 
 * @author rguess
 * @version 2014-05-03
 */
@Repository
public class CategoryDaoImpl extends HibernateDao<Category, Long> implements
		CategoryDao {

	@Override
	public Category getAdjacent(Category category, String type) {
		String ud = "<";
		String order = "desc";
		if (type.equals("down")) {
			ud = ">";
			order = "asc";
		}
		Category adjacent = (Category) getSession().createQuery(
				"from Category where parent.id = "
						+ category.getParent().getId() + " and orderNo " + ud
						+ " " + category.getOrderNo()
						+ " order by orderNo "+order).setFirstResult(0).setMaxResults(1).uniqueResult();
		return adjacent;
	}

}

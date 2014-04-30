package org.guess.showcase.cms.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.CategoryDao;
import org.guess.showcase.cms.model.Category;
import org.springframework.stereotype.Repository;

/**
 * 栏目entitydaoImpl
 * @author rguess
 * @version 2014-05-03
 */
@Repository
public class CategoryDaoImpl extends HibernateDao<Category,Long> implements CategoryDao {

}

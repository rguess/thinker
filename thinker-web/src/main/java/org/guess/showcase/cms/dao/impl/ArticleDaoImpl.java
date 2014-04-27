package org.guess.showcase.cms.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.ArticleDao;
import org.guess.showcase.cms.model.Article;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDaoImpl extends HibernateDao<Article,Long> implements ArticleDao {

}

package org.guess.showcase.cms.dao.impl;

import java.util.List;
import java.util.Set;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.ArticleDao;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Sets;

@Repository
@SuppressWarnings("unchecked")
public class ArticleDaoImpl extends HibernateDao<Article, Long> implements
		ArticleDao {

	@Override
	public Set<String> getTags(Site curSite) {
		List<String> list = getSession()
				.createQuery(
						"select a.keywords from Article as a where category.site.id="+curSite.getId())
				.list();
		Set<String> set = Sets.newHashSet();
		set.addAll(list);
		return set;
	}
	
	@Override
	public void save(Article entity) {
		Session session = getSession();
		session.merge(entity);
	}

}

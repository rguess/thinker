package org.guess.showcase.cms.dao;

import java.util.Set;

import org.guess.core.orm.EntityDao;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;

public interface ArticleDao extends EntityDao<Article, Long>{

	Set<String> getTags(Site curSite);
	
}

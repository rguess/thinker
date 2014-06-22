package org.guess.showcase.cms.service;

import java.util.List;
import java.util.Set;

import org.guess.core.orm.Page;
import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;

public interface ArticleService extends BaseService<Article, Long>{

	Page<Article> listIndexs(Site curSite, Page<Article> p);

	List<Article> listHots(Site curSite);

	Set<String> listTags(Site curSite);
	
	/**
	 * 增加点击量
	 */
	void addHits(Article article);

}

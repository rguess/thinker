package org.guess.showcase.cms.service;

import java.util.List;
import java.util.Set;

import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;

public interface ArticleService extends BaseService<Article, Long>{

	List<Article> listIndexs(Site curSite);

	List<Article> listHots(Site curSite);

	Set<String> listTags(Site curSite);

}

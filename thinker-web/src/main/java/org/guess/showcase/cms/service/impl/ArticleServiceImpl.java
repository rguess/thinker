package org.guess.showcase.cms.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.service.ArticleService;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl extends BaseServiceImpl<Article, Long> implements ArticleService {

	@Override
	public void removeByIds(Long[] ids) throws Exception {
		super.removeByIds(ids);
	}
}
package org.guess.showcase.cms.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.orm.PageRequest;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.ArticleDao;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Sets;

@Service
public class ArticleServiceImpl extends BaseServiceImpl<Article, Long> implements ArticleService {
	
	@Autowired
	private ArticleDao articleDao;

	@Override
	public void removeByIds(Long[] ids) throws Exception {
		super.removeByIds(ids);
	}

	@Override
	public List<Article> listIndexs(Site curSite) {
		PageRequest pageRequest = new PageRequest(1, 10);
		return articleDao.findPage(pageRequest, "from Article as a where category.site=? order by a.createDate desc", curSite).getResult();
	}

	@Override
	public List<Article> listHots(Site curSite) {
		PageRequest pageRequest = new PageRequest(1, 10);
		return articleDao.findPage(pageRequest, "from Article as a where category.site=? order by a.hits desc", curSite).getResult();
	}

	@Override
	public Set<String> listTags(Site curSite) {
		Set<String> tags = articleDao.getTags(curSite);
		Set<String> set = Sets.newHashSet();
		for(String tag : tags){
			if(StringUtils.indexOf(tag, ",") != -1){
				String[] strs = StringUtils.split(tag,",");
				for (String str: strs) {
					set.add(str);
				}
				continue;
			}
			set.add(tag);
		}
		return set;
	}
}
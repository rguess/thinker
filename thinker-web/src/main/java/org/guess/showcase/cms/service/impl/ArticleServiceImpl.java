package org.guess.showcase.cms.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.ArticleDao;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.sys.model.User;
import org.guess.sys.util.UserUtil;
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
	public Page<Article> listIndexs(Site curSite, Page<Article> p) {
		return articleDao.findPage(p, "from Article as a where category.site=? order by a.createDate desc", curSite);
	}

	@Override
	public List<Article> listHots(Site curSite) {
		PageRequest pageRequest = new PageRequest(1, 5);
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
	
	@Override
	public void save(Article article) throws Exception {
		if(article.getId() != null){
			
			Article dbArticle = articleDao.get(article.getId());
			
			//点击量
			article.setHits(dbArticle.getHits());
			
			//保留发表者以及发表提起
			article.setCreateBy(dbArticle.getCreateBy());
			article.setCreateDate(dbArticle.getCreateDate());
			
			//更新者
			User cuser = UserUtil.getCurrentUser();
			article.setUpdateBy(cuser);
		}else{
			article.setCreateBy(UserUtil.getCurrentUser());
		}
		
		super.save(article);
	}

	@Override
	public void addHits(Article article) {
		article.setHits(article.getHits()+1);
		articleDao.save(article);
	}
}
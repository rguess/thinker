package org.guess.showcase.cms.service.impl;

import java.util.List;

import org.guess.core.orm.PageRequest;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.LinkDao;
import org.guess.showcase.cms.model.Link;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 链接serviceImpl
 * 
 * @author rguess
 * @version 2014-05-07
 */
@Service
public class LinkServiceImpl extends BaseServiceImpl<Link, Long> implements
		LinkService {

	@Autowired
	private LinkDao linkDao;

	@Override
	public List<Link> listFriendLinks(Site curSite) {
		return linkDao.findPage(
						new PageRequest(1, 20),
						"from Link where category.name like '%友情链接%' and category.site = ?",
						curSite).getResult();
	}

}

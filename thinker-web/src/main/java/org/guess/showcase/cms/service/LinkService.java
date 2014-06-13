package org.guess.showcase.cms.service;

import java.util.List;

import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Link;
import org.guess.showcase.cms.model.Site;

/**
 * 链接service
 * @author rguess
 * @version 2014-05-07
 */
public interface LinkService extends BaseService<Link, Long>{

	List<Link> listFriendLinks(Site curSite);

}

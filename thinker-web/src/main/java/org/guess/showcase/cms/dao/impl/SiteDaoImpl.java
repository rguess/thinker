package org.guess.showcase.cms.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.SiteDao;
import org.guess.showcase.cms.model.Site;
import org.springframework.stereotype.Repository;

/**
 * 站点daoImpl
 * @author rguess
 * @version 2014-05-15
 */
@Repository
public class SiteDaoImpl extends HibernateDao<Site,Long> implements SiteDao {

}

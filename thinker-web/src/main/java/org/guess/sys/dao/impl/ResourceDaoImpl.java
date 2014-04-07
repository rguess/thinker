package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.ResourceDao;
import org.guess.sys.model.Resource;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDaoImpl extends HibernateDao<Resource,Long> implements ResourceDao {

}

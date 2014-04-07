package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.IconDao;
import org.guess.sys.model.Icon;
import org.springframework.stereotype.Repository;

@Repository
public class IconDaoImpl extends HibernateDao<Icon,Long> implements IconDao {

}

package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.LogDao;
import org.guess.sys.model.Log;
import org.springframework.stereotype.Repository;

@Repository
public class LogDaoImpl extends HibernateDao<Log,Long> implements LogDao {

}

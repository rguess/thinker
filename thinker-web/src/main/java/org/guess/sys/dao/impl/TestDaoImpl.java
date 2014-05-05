package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.TestDao;
import org.guess.sys.model.Test;
import org.springframework.stereotype.Repository;

/**
 * testdaoImpl
 * @author rguess
 * @version 2014-05-06
 */
@Repository
public class TestDaoImpl extends HibernateDao<Test,Long> implements TestDao {

}

package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.UserDao;
import org.guess.sys.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends HibernateDao<User,Long> implements UserDao {

}

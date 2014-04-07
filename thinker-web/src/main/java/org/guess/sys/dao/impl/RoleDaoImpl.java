package org.guess.sys.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.sys.dao.RoleDao;
import org.guess.sys.model.Role;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl extends HibernateDao<Role,Long> implements RoleDao {

}

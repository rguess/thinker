package org.guess.showcase.workflow.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.workflow.dao.LeaveDao;
import org.guess.showcase.workflow.model.Leave;
import org.springframework.stereotype.Repository;

@Repository
public class LeaveDaoImpl extends HibernateDao<Leave,Long> implements LeaveDao {

}

package org.guess.showcase.qixiu.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.qixiu.dao.RdetailDao;
import org.guess.showcase.qixiu.model.Rdetail;
import org.springframework.stereotype.Repository;

/**
 * 详细daoImpl
 * @author rguess
 * @version 2014-06-04
 */
@Repository
public class RdetailDaoImpl extends HibernateDao<Rdetail,Long> implements RdetailDao {

}

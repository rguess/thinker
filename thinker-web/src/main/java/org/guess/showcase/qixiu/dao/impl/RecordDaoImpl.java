package org.guess.showcase.qixiu.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.qixiu.dao.RecordDao;
import org.guess.showcase.qixiu.model.Record;
import org.springframework.stereotype.Repository;

/**
 * 评论daoImpl
 * @author rguess
 * @version 2014-06-04
 */
@Repository
public class RecordDaoImpl extends HibernateDao<Record,Long> implements RecordDao {

}

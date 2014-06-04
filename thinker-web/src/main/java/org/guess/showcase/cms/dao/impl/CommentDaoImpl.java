package org.guess.showcase.cms.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.cms.dao.CommentDao;
import org.guess.showcase.cms.model.Comment;
import org.springframework.stereotype.Repository;

/**
 * 评论daoImpl
 * @author rguess
 * @version 2014-06-04
 */
@Repository
public class CommentDaoImpl extends HibernateDao<Comment,Long> implements CommentDao {

}

package org.guess.showcase.cms.service.impl;

import java.util.List;

import org.guess.core.orm.PageRequest;
import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.cms.dao.CommentDao;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 评论serviceImpl
 * @author rguess
 * @version 2014-06-04
 */
@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment, Long> implements CommentService {
	
	@Autowired
	private CommentDao commentDao;

	@Override
	public List<Comment> listNewest(Site curSite) {
		PageRequest pageRequest = new PageRequest(1, 5);
		return commentDao.findPage(pageRequest, "from Comment where article.category.site=? order by id desc", curSite).getResult();
	}

}

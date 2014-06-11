package org.guess.showcase.cms.service;

import java.util.List;

import org.guess.core.service.BaseService;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.model.Site;

/**
 * 评论service
 * @author rguess
 * @version 2014-06-04
 */
public interface CommentService extends BaseService<Comment, Long>{

	List<Comment> listNewest(Site curSite);

}

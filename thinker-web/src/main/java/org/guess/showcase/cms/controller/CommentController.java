package org.guess.showcase.cms.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 评论controller
 * @author rguess
 * @version 2014-06-04
 */
@Controller
@RequestMapping("/cms/comment")
public class CommentController extends BaseController<Comment>{

	{
		editView = "/cms/comment/edit";
		listView = "/cms/comment/list";
		showView = "/cms/comment/show";
	}
	
	@Autowired
	private CommentService commentService;
}
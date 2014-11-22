package org.guess.showcase.qixiu.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.service.CommentService;
import org.guess.showcase.qixiu.model.Record;
import org.guess.showcase.qixiu.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 评论controller
 * @author rguess
 * @version 2014-06-04
 */
@Controller
@RequestMapping("/qixu/record")
public class RecordController extends BaseController<Record>{

	{
		editView = "/qixiu/record/edit";
		listView = "/qixiu/record/list";
		showView = "/qixiu/record/show";
	}
	
	@Autowired
	private RecordService recordService;
}
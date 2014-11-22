package org.guess.showcase.qixiu.controller;

import org.guess.core.web.BaseController;
import org.guess.showcase.qixiu.model.Rdetail;
import org.guess.showcase.qixiu.service.RdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 详细记录controller
 * @author rguess
 * @version 2014-11-22 18:58:51
 */
@Controller
@RequestMapping("/qixiu/rdetail")
public class RdetailController extends BaseController<Rdetail>{

	{
		editView = "/qixiu/rdetail/edit";
		listView = "/qixiu/rdetail/list";
		showView = "/qixiu/rdetail/show";
	}
	
	@Autowired
	private RdetailService rdetailService;


}
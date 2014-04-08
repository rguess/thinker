package org.guess.sys.controller;

import org.guess.core.web.BaseController;
import org.guess.sys.model.Log;
import org.guess.sys.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/sys/log/")
public class LogController extends BaseController<Log>{

	{
		editView = "/sys/log/edit";
		listView = "/sys/log/list";
		showView = "/sys/log/show";
	}
	
	@Autowired
	private LogService logService;
	
}

package org.guess.sys.controller;

import org.guess.core.web.BaseController;
import org.guess.sys.model.Test;
import org.guess.sys.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * testcontroller
 * @author rguess
 * @version 2014-05-06
 */
@Controller
@RequestMapping("/sys/test")
public class TestController extends BaseController<Test>{

	{
		editView = "/sys/test/edit";
		listView = "/sys/test/list";
		showView = "/sys/test/show";
	}
	
	@Autowired
	private TestService testService;
}
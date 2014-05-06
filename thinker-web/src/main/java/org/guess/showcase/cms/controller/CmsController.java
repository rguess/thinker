package org.guess.showcase.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cms")
public class CmsController {

	private static final String listView = "/cms/list";
	
	@RequestMapping("/*")
	public String list() {
		return listView;
	}
}

package org.guess.showcase.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	private static final String IndexView = "/cms/front/index";
	
	@RequestMapping("/{cmspath}/index.html")
	public String index() {
		return IndexView;
	}
	
	
}

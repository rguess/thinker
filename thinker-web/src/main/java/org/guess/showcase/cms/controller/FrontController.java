package org.guess.showcase.cms.controller;

import org.guess.showcase.cms.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FrontController {
	
	@Autowired
	private ArticleService articleService;

	//首页
	@RequestMapping("{site}/index.html")
	public String index(@PathVariable("site") String site) {
		return "/front/"+site+"/index";
	}
	
	//文章详细内容
	@RequestMapping("{site}/article/{aid}.html")
	public ModelAndView detail(ModelAndView mav,@PathVariable("site") String site,@PathVariable("aid") Long aid) throws Exception {
		mav.addObject("obj", articleService.get(aid));
		mav.setViewName("/front/"+site+"/detail");
		return mav;
	}
	
	
}

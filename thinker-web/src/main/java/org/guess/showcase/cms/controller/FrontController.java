package org.guess.showcase.cms.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Set;

import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PropertyFilter;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.showcase.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Lists;

@Controller
public class FrontController {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private CategoryService categoryService;

	// 首页
	@RequestMapping("{site}/index.html")
	public String index(@PathVariable("site") String site) {
		return "/front/" + site + "/index";
	}

	// 文章详细内容
	@RequestMapping("{site}/article/{aid}.html")
	public ModelAndView detail(ModelAndView mav,
			@PathVariable("site") String site, @PathVariable("aid") Long aid)
			throws Exception {
		Article article = articleService.get(aid);
		if (null == article) {
			mav.setViewName("redirect:/errorpage/404.jsp");
			return mav;
		}

		// 增加点击量
		article.setHits(article.getHits() + 1);
		articleService.save(article);

		mav.addObject("obj", article);
		mav.setViewName("/front/" + site + "/detail");
		return mav;
	}

	@RequestMapping("{site}/list/{cid}.html")
	public ModelAndView list(ModelAndView mav,
			@PathVariable("site") String site, @PathVariable("cid") Long cid)
			throws Exception {
		Category category = categoryService.get(cid);
		Set<String> cids = categoryService.getChlidIdsById(String.valueOf(cid));
		List<PropertyFilter> filters = Lists.newArrayList();
		for (String id : cids) {
			filters.add(new PropertyFilter("EQL_category.id", id));
		}
		List<PropertyFilter> andfilters = Lists.newArrayList();
		PageRequest pageRequest = new PageRequest(1, 1000);
		Page<Article> pageData = articleService.findPage(pageRequest,
				andfilters, filters);
		mav.addObject("articles", pageData.getResult());
		mav.addObject("category", category);
		mav.setViewName("/front/" + site + "/list");
		return mav;
	}

	@RequestMapping("{site}/tag/{tag}.html")
	public ModelAndView tag(ModelAndView mav,
			@PathVariable("site") String site, @PathVariable("tag") String tag)
			throws Exception {
		String decodeTag = URLDecoder.decode(tag, "utf-8");
		List<PropertyFilter> filters = Lists.newArrayList();
		filters.add(new PropertyFilter("LIKES", decodeTag));
		List<Article> articles = articleService.find(filters);
		
		mav.addObject("articles", articles);
		mav.addObject("tag", tag);
		
		mav.setViewName("/front/" + site + "/list");
		return mav;
	}

}

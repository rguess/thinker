package org.guess.showcase.cms.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.showcase.cms.service.CategoryService;
import org.guess.showcase.cms.service.CommentService;
import org.guess.showcase.cms.util.CmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Lists;

@Controller
public class FrontController {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CommentService commentService;

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
		articleService.addHits(article);

		mav.addObject("obj", article);
		mav.setViewName("/front/" + site + "/detail");
		return mav;
	}

	/**
	 * 根据栏目获取列表
	 * 
	 * @param mav
	 * @param site
	 * @param cid
	 * @return
	 * @throws Exception
	 */
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

	/**
	 * 根据标签获取列表
	 * 
	 * @param mav
	 * @param site
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("{site}/tag/{tag}.html")
	public ModelAndView tag(ModelAndView mav,
			@PathVariable("site") String site, @PathVariable("tag") String tag)
			throws Exception {
		String decodeTag = URLDecoder.decode(tag, "utf-8");
		List<PropertyFilter> filters = Lists.newArrayList();
		filters.add(new PropertyFilter("LIKES_keywords", decodeTag));
		List<Article> articles = articleService.find(filters);

		mav.addObject("articles", articles);
		mav.addObject("tag", decodeTag);

		mav.setViewName("/front/" + site + "/list");
		return mav;
	}

	/**
	 * 获取最热文章
	 */
	@RequestMapping("{site}/showHots")
	@ResponseBody
	public List<Article> showHots(HttpServletRequest request) {
		return articleService.listHots(CmsUtil.getCurrentSite(request));
	}

	/**
	 * 获取标签
	 */
	@RequestMapping("{site}/getTags")
	@ResponseBody
	public Set<String> getTags(HttpServletRequest request) {
		return articleService.listTags(CmsUtil.getCurrentSite(request));
	}

	/**
	 * 评论文章
	 * 
	 * @throws Exception
	 */
	@RequestMapping("{site}/comment")
	public String comment(Comment comment, @PathVariable("site") String site,
			HttpServletRequest request) throws Exception {
		comment.setIp(ServletUtils.getIpAddr(request));
		commentService.save(comment);
		return "redirect:/" + site + "/article/" + comment.getArticle().getId()
				+ ".html#comment-" + comment.getId();
	}
}

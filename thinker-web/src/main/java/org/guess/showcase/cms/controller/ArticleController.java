package org.guess.showcase.cms.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.orm.Page;
import org.guess.core.orm.PropertyFilter;
import org.guess.core.utils.FileUtil;
import org.guess.core.utils.UuidUtil;
import org.guess.core.utils.WordToHtml;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.showcase.cms.util.CmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cms/article")
public class ArticleController {

	private static final String editView = "/cms/article/edit";
	private static final String listView = "/cms/article/list";

	@Autowired
	private ArticleService aService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = "/*")
	public String list() {
		return listView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/create")
	public ModelAndView create() throws Exception {
		ModelAndView mav = new ModelAndView(editView);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/edit")
	public ModelAndView edit(ModelAndView mav, Article article,
			@RequestParam(value = "articleFile") MultipartFile articleFile) {

		File tempFile = new File(ServletUtils.generateTempFileName(request,
				articleFile.getOriginalFilename()));
		try {

			// 把文件保存到临时文件夹
			articleFile.transferTo(tempFile);

			// 生成要保存的html文件路径
			String uuid = UuidUtil.uuid();
			String articlefolerName = CmsUtil.getArticleFilePath(request) + "/"
					+ uuid;
			FileUtil.isFolderExitAndCreate(articlefolerName);

			// word转为html
			String htmlFileName = articlefolerName + "/index";
			WordToHtml.wordToHtml(tempFile.getAbsolutePath(), htmlFileName);
			// 保存到数据库
			article.setHtmlid(uuid);
			aService.save(article);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			FileUtil.deleteFile(tempFile);
		}
		mav.setViewName("redirect:" + listView);
		return mav;
	}

	@RequestMapping("/page")
	public @ResponseBody
	Map<String, Object> page(Page<Article> page, HttpServletRequest request) {
		Page<Article> pageData = aService.findPage(page,
				PropertyFilter.buildFromHttpRequest(request, "search"));
		return pageData.returnMap();
	}

	@RequestMapping("/view/{htmlid}")
	public ModelAndView toArticle(ModelAndView mav,
			@PathVariable("htmlid") String htmlid) {
		
		mav.addObject("htmlid", htmlid);
		mav.setViewName("/cms/article");
		return mav;
	}

}

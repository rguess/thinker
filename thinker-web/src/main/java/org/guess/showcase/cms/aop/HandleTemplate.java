package org.guess.showcase.cms.aop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.guess.core.utils.FreeMarkers;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.showcase.cms.service.CategoryService;
import org.guess.showcase.cms.util.CmsUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.common.collect.Maps;

/**
 * aop方式静态化cms模块
 * 
 * @author rguess
 * 
 */
@Aspect
@Component
public class HandleTemplate {
	
	private static Logger logger = LoggerFactory.getLogger(HandleTemplate.class);
	
	@Autowired
	private CategoryService cService;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired 
	private HttpServletRequest request;

	@After("execution(* org.guess.showcase.cms.controller.CategoryController.create(..))||"
			+ "execution(* org.guess.showcase.cms.controller.CategoryController.delete(..))")
	public void updateNav() throws IOException {
		Site curSite = CmsUtil.getCurrentSite(request);
		String dirPath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/template/nav.jsp";
		logger.info("更新模板开始");
		List<Category> list = cService.listIsShow(curSite);
		Map<String,Object> model = Maps.newHashMap();
		model.put("categorys", list);
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "nav.ftl", dirPath, model);
		logger.info("更新模板结束");
		//线程有问题---不能联级读取hibernate懒加载对象
		/*Thread thread= new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("更新模板开始");
				List<Category> list = cService.listIsShow(curSite);
				Map<String,Object> model = Maps.newHashMap();
				model.put("categorys", list);
				FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "nav.ftl", dirPath, model);
				logger.info("更新模板结束");
			}
		});
		thread.start();*/
		logger.info("操作成功");
	}
	
	@After("execution(* org.guess.showcase.cms.controller.ArticleController.edit(..))||"
			+ "execution(* org.guess.showcase.cms.controller.ArticleController.delete(..))")
	public void updateMainContent() throws IOException {
		Site curSite = CmsUtil.getCurrentSite(request);
		List<Article> list = articleService.listIndexs(curSite);
		String dirPath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/index.jsp";
		Map<String,Object> model = Maps.newHashMap();
		model.put("list", list);
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "index.ftl", dirPath, model);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

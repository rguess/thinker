package org.guess.showcase.cms.aop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.guess.core.utils.FreeMarkers;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.service.CategoryService;
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
	
	private static final String NAV_FILE_PATH = "/WEB-INF/content/cms/front/nav.jsp";
	
	private String filePath;
	
	@Autowired
	private CategoryService cService;
	
	@Autowired 
	private HttpServletRequest request;

	@After("execution(* org.guess.showcase.cms.controller.CategoryController.create(..))")
	public void after() throws IOException {
		filePath = ServletUtils.getRealPath(request)+NAV_FILE_PATH;
		Thread thread= new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("更新模板开始");
				List<Category> list = cService.findBy("isShow", 0);
				Map<String,Object> model = Maps.newHashMap();
				model.put("categorys", list);
				FreeMarkers.writeFile("classpath:/template/", "cms_nav.ftl", filePath, model);
				logger.info("更新模板结束");
			}
		});
		thread.start();
		logger.info("操作成功");
	}
	
}

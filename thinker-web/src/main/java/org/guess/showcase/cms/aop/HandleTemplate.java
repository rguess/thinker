package org.guess.showcase.cms.aop;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.guess.core.orm.Page;
import org.guess.core.orm.PageRequest;
import org.guess.core.utils.FreeMarkers;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Article;
import org.guess.showcase.cms.model.Category;
import org.guess.showcase.cms.model.Comment;
import org.guess.showcase.cms.model.Link;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.ArticleService;
import org.guess.showcase.cms.service.CategoryService;
import org.guess.showcase.cms.service.CommentService;
import org.guess.showcase.cms.service.LinkService;
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
	private CommentService commentService;
	
	@Autowired 
	private HttpServletRequest request;
	
	@Autowired
	private LinkService linkService;

	
	/**
	 * 静态化导航栏
	 * @throws IOException
	 */
	@After("execution(* org.guess.showcase.cms.controller.CategoryController.create(..))||"
			+ "execution(* org.guess.showcase.cms.controller.CategoryController.delete(..))||"
			+ "execution(* org.guess.showcase.cms.controller.CategoryController.order(..))")
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
	
	/**
	 * 静态化首页及侧边栏
	 * @throws IOException
	 */
	@After("execution(* org.guess.showcase.cms.controller.ArticleController.edit(..))||"
			+ "execution(* org.guess.showcase.cms.controller.ArticleController.delete(..))")
	public void updateMainContent() throws IOException {
		Site curSite = CmsUtil.getCurrentSite(request);
		
		//静态化主要文章内容
		Page<Article> p = new Page<Article>(new PageRequest(1, 10));
		Page<Article> page = articleService.listIndexs(curSite,p);
		String indexPath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/index.jsp";
		Map<String,Object> model = Maps.newHashMap();
		model.put("list", page.getResult());
		model.put("sliders", page.getSlider(20));
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "index.ftl", indexPath, model);
		
		//静态化最热文章和标签
		List<Article> hots = articleService.listHots(curSite);
		Set<String> tags = articleService.listTags(curSite);
		String sidePath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/template/sider.jsp";
		Map<String,Object> sideModel = Maps.newHashMap();
		sideModel.put("hots", hots);
		sideModel.put("tags", tags);
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "sider.ftl", sidePath, sideModel);
	}
	
	/**
	 * 发表评论后，静态化侧边栏评论
	 */
	@After("execution(* org.guess.showcase.cms.controller.FrontController.comment(..))")
	public void updateSideComment() throws IOException {
		Site curSite = CmsUtil.getCurrentSite(request);
		
		//静态化主要文章内容
		List<Comment> list = commentService.listNewest(curSite);
		
		String indexPath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/template/side_comment.jsp";
		Map<String,Object> model = Maps.newHashMap();
		model.put("list", list);
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "sider_comment.ftl", indexPath, model);
	
	}
	
	/**
	 * 发表评论后，静态化侧边栏评论
	 */
	@After("execution(* org.guess.showcase.cms.controller.LinkController.create(..))||"
			+ "execution(* org.guess.showcase.cms.controller.LinkController.delete(..))")
	public void updateLinks() throws IOException {
		Site curSite = CmsUtil.getCurrentSite(request);
		
		//静态化主要文章内容
		List<Link> list = linkService.listFriendLinks(curSite);
		String indexPath = ServletUtils.getRealPath(request)+"/WEB-INF/content/front/"+curSite.getName()+"/template/flinks.jsp";
		Map<String,Object> model = Maps.newHashMap();
		model.put("list", list);
		FreeMarkers.writeFile("classpath:/template/"+curSite.getName(), "flinks.ftl", indexPath, model);
	
	}
}

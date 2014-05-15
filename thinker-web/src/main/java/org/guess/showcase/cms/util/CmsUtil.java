package org.guess.showcase.cms.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.guess.core.Constants;
import org.guess.core.utils.spring.SpringContextUtil;
import org.guess.core.utils.web.ServletUtils;
import org.guess.showcase.cms.model.Site;
import org.guess.showcase.cms.service.SiteService;

public class CmsUtil {
	
	private static final SiteService siteService = SpringContextUtil.getBean(SiteService.class);
	
	//保存在session中的当前站点key
	public static String CURRENT_SITE_STR = "cursite";
	//session中没有当前站点信息是根据name取出当期站点并设置进去
	public static final String DEF_SITE_NAME = "blog";
	
	
	/**
	 * 返回文章上传路径
	 */
	public static String getArticleFilePath(HttpServletRequest request){
		return ServletUtils.getRealPath(request)+"/"+Constants.UPLOAD_FOLDER_NAME+"/"+CmsConstants.ARTICLE_FOLDER_NAME;
	}
	
	/**
	 * 获取当前站点没有就设置
	 */
	public static Site getCurrentSite(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(null != session && null != session.getAttribute(CURRENT_SITE_STR)){
			return (Site) session.getAttribute(CURRENT_SITE_STR);
		}
		Site site = siteService.findUniqueBy("name", DEF_SITE_NAME);
		session.setAttribute(CURRENT_SITE_STR, site);
		return site;
	}

	/**
	 * 切换站点
	 * @param request
	 * @param name
	 */
	public static void changeSite(HttpServletRequest request, String name) {
		Site site = siteService.findUniqueBy("name", name);
		request.getSession().setAttribute(CURRENT_SITE_STR, site);
	}
}

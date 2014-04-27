package org.guess.showcase.cms.util;

import javax.servlet.http.HttpServletRequest;

import org.guess.core.Constants;
import org.guess.core.utils.web.ServletUtils;

public class CmsUtil {

	/**
	 * 返回文章上传路径
	 */
	public static String getArticleFilePath(HttpServletRequest request){
		return ServletUtils.getRealPath(request)+"/"+Constants.UPLOAD_FOLDER_NAME+"/"+CmsConstants.ARTICLE_FOLDER_NAME;
	}
}

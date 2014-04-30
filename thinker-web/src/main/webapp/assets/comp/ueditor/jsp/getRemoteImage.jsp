<%@page import="org.apache.commons.io.FileUtils"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="ueditor.Uploader"%>
<%@ page import="org.guess.core.utils.Sha1Utils"%>
<%@ page import="org.guess.core.utils.web.ServletUtils"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String url = request.getParameter("upfile");
	String state = "远程图片抓取成功！";

	String filePath = "upload";
	String[] arr = url.split("ue_separate_ue");
	String[] outSrc = new String[arr.length];
	for (int i = 0; i < arr.length; i++) {

		//保存文件路径
		String str = application.getRealPath(request.getServletPath());
		File f = new File(str);
		String savePath = f.getParent() + "/" + filePath;
		//格式验证
		String type = getFileType(arr[i]);
		if (type.equals("")) {
			state = "图片类型不正确！";
			continue;
		}
		//大小验证
		HttpURLConnection.setFollowRedirects(false);
		HttpURLConnection conn = (HttpURLConnection) new URL(arr[i])
				.openConnection();
		if (conn.getContentType().indexOf("image") == -1) {
			state = "请求地址头不正确";
			continue;
		}
		if (conn.getResponseCode() != 200) {
			state = "请求地址不存在！";
			continue;
		}
		File dir = new File(savePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			InputStream is = conn.getInputStream();
			String tempName = Long.toString(new Date().getTime()) + type;
			File tempFile = new File(ServletUtils.generateTempFileName(request,tempName));
			FileUtils.copyInputStreamToFile(is, tempFile);
			String saveName = Sha1Utils.getInstance().getFileHash(tempFile) + type;
			
			File savetoFile = new File(savePath + "/" + saveName);
			outSrc[i] = filePath + "/" + saveName;
			FileUtils.copyFile(tempFile, savetoFile);
			is.close();
			// 这里处理 inputStream
			org.guess.core.utils.FileUtils.deleteFile(tempFile);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("页面无法访问");
		}
	}
	String outstr = "";
	for (int i = 0; i < outSrc.length; i++) {
		outstr += outSrc[i] + "ue_separate_ue";
	}
	outstr = outstr.substring(0, outstr.lastIndexOf("ue_separate_ue"));
	response.getWriter().print(
			"{'url':'" + outstr + "','tip':'" + state + "','srcUrl':'"
					+ url + "'}");
%>
<%!public String getFileType(String fileName) {
		String[] fileType = { ".gif", ".png", ".jpg", ".jpeg", ".bmp" };
		Iterator<String> type = Arrays.asList(fileType).iterator();
		while (type.hasNext()) {
			String t = type.next();
			if (fileName.endsWith(t)) {
				return t;
			}
		}
		return "";
	}%>

/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package org.guess.generate;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.guess.core.utils.DateUtil;
import org.guess.core.utils.FileUtils;
import org.guess.core.utils.FreeMarkers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;

import com.google.common.collect.Maps;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 代码生成器
 * 
 * @author ThinkGem
 * @version 2013-06-21
 */
public class Generate {

	private static Logger logger = LoggerFactory.getLogger(Generate.class);

	public static void main(String[] args) throws Exception {

		// ========== ↓↓↓↓↓↓ 执行前请修改参数，谨慎执行。↓↓↓↓↓↓ ====================

		// 主要提供基本功能模块代码生成。
		// 目录生成结构：{packageName}/{moduleName}/{dao,entity,service,web}/{subModuleName}/{className}

		// packageName
		// 包名，这里如果更改包名，请在applicationContext.xml和srping-mvc.xml中配置base-package、packagesToScan属性，来指定多个（共4处需要修改）。
		String packageName = "com.dview.modules";

		String moduleName = "wf"; // 模块名，例：sys
		String className = "WfTask"; // 类名，例：user
		String classAuthor = "rguess"; // 类作者，例：ThinkGem
		String functionName = "行政区"; // 功能名，例：用户
		
		List<Field> fields = new ArrayList<Field>();
		fields.add(new Field("content", "内容", "String"));
		fields.add(new Field("name", "名称", "String"));
		fields.add(new Field("ip", "ip地址", "String"));
		fields.add(new Field("createDate", "日期", "Date"));
		
		

		// 是否启用生成工具
		Boolean isEnable = true;

		// ========== ↑↑↑↑↑↑ 执行前请修改参数，谨慎执行。↑↑↑↑↑↑ ====================

		if (!isEnable) {
			logger.error("请启用代码生成工具，设置参数：isEnable = true");
			return;
		}

		if (StringUtils.isBlank(moduleName) || StringUtils.isBlank(moduleName)
				|| StringUtils.isBlank(className)
				|| StringUtils.isBlank(functionName)) {
			logger.error("参数设置错误：包名、模块名、类名、功能名不能为空。");
			return;
		}

		// 获取文件分隔符
		String separator = File.separator;

		// 获取工程路径
		File projectPath = new DefaultResourceLoader().getResource("")
				.getFile();
//		File projectPath = new File("D:/template");
		while (!new File(projectPath.getPath() + separator + "src" + separator
				+ "main").exists()) {
			projectPath = projectPath.getParentFile();
		}
		logger.info("Project Path: {}", projectPath);

		// 模板文件路径
		String tplPath = StringUtils.replace(projectPath.getAbsolutePath()
				+ "/src/test/java/org/guess/generate/temp", "/", separator);
		logger.info("Template Path: {}", tplPath);

		// Java文件路径
		String javaPath = StringUtils.replaceEach(projectPath.getAbsolutePath()
				+ "/src/main/java/" + StringUtils.lowerCase(packageName),
				new String[] { "/", "." },
				new String[] { separator, separator });
//		String javaPath = "D:/template";
		logger.info("Java Path: {}", javaPath);
		
		String viewPath = StringUtils.replace(projectPath+"/src/main/webapp/WEB-INF/content/"+moduleName+"/"+className, "/", separator);
//		String viewPath = "D:/template";
				
		// 代码模板配置
		Configuration cfg = new Configuration();
		FileUtils.isFolderExitAndCreate(tplPath);
		cfg.setDirectoryForTemplateLoading(new File(tplPath));

		// 定义模板变量
		Map<String, Object> model = Maps.newHashMap();
		model.put("packageName", StringUtils.lowerCase(packageName));
		model.put("moduleName", StringUtils.lowerCase(moduleName));
		model.put("className", StringUtils.uncapitalize(className));
		model.put("ClassName", StringUtils.capitalize(className));
		model.put("classAuthor",
				StringUtils.isNotBlank(classAuthor) ? classAuthor
						: "Generate Tools");
		model.put("classVersion", DateUtil.getCurrenDate());
		model.put("functionName", functionName);
		model.put("tableName",model.get("moduleName") + "_" + model.get("className"));
		
		model.put("fields", fields);
		
		

		// 生成 Entity
		Template template = cfg.getTemplate("entity.ftl");
		String content = FreeMarkers.renderTemplate(template, model);
		String filePath = javaPath + separator + model.get("moduleName")
				+ separator + "model" + separator
				+ model.get("ClassName") + ".java";
//		writeFile(content, filePath);
		logger.info("Entity: {}", filePath);

		// 生成 Dao
		template = cfg.getTemplate("dao.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "dao" + separator + model.get("ClassName") + "Dao.java";
		writeFile(content, filePath);
		logger.info("Dao: {}", filePath);

		// 生成 DaoImpl
		template = cfg.getTemplate("daoImpl.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "dao"+ separator+ "impl" + separator + model.get("ClassName") + "DaoImpl.java";
		writeFile(content, filePath);
		logger.info("Dao: {}", filePath);

		// 生成 Service
		template = cfg.getTemplate("service.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "service" + separator + model.get("ClassName") + "Service.java";
		writeFile(content, filePath);
		logger.info("Service: {}", filePath);

		// 生成 Service
		template = cfg.getTemplate("serviceImpl.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "service" + separator+ "impl" + separator + model.get("ClassName") + "ServiceImpl.java";
		writeFile(content, filePath);
		logger.info("Service: {}", filePath);

		// 生成 Controller
		template = cfg.getTemplate("controller.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = javaPath + separator + model.get("moduleName") + separator
				+ "controller" + separator + model.get("ClassName") + "Controller.java";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);
		
	/*	// 生成 list.jsp
		template = cfg.getTemplate("list.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = viewPath + separator + "list.jsp";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);
		
		// 生成 edit.jsp
		template = cfg.getTemplate("edit.ftl");
		content = FreeMarkers.renderTemplate(template, model);
		filePath = viewPath + separator + "edit.jsp";
		writeFile(content, filePath);
		logger.info("Controller: {}", filePath);*/

		logger.info("Generate Success.");
	}

	/**
	 * 将内容写入文件
	 * 
	 * @param content
	 * @param filePath
	 */
	public static void writeFile(String content, String filePath) {
		try {
			if (FileUtils.createFile(filePath)) {
				FileWriter fileWriter = new FileWriter(filePath, true);
				BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
				bufferedWriter.write(content);
				bufferedWriter.close();
				fileWriter.close();
			} else {
				logger.info("生成失败，文件已存在！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

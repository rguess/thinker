package org.guess.generate;

import java.io.IOException;
import java.util.Map;

import org.guess.core.utils.FileUtils;
import org.guess.core.utils.FreeMarkers;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class Test1 {

	public static void main(String[] args) throws IOException {
//		FileUtils.zipFiles("D:/temp", "*", "D:/template.zip");
		
		Map<String, String> model = com.google.common.collect.Maps.newHashMap();
		Configuration cfg = FreeMarkers.buildConfiguration("classpath:/");
		Template template = cfg.getTemplate("cms_nav.ftl");
		String result2 = FreeMarkers.renderTemplate(template, model);
		System.out.println(result2);
	}
}

package org.guess.core.utils;

import java.io.File;

import org.apache.commons.lang3.StringUtils;

/**
 * 文件处理相关
 * @author guess
 *
 */
public class FileUtil {

	/**
	 * 根据文件获取文件后缀
	 * @param fileName
	 */
	public static String getFileType(File file){
		return getFileType(file.getName());
	}
	
	/**
	 * 根据文件名称获取文件后缀
	 * @param fileName
	 */
	public static String getFileType(String fileName){
		return StringUtils.substringAfterLast(fileName, ".");
	}
	
	/**
	 * 根据文件名随机生成uuid文件名称
	 */
	public static String uuidFileName(String fileName){
		return UuidUtil.uuid()+"."+getFileType(fileName);
	}
}

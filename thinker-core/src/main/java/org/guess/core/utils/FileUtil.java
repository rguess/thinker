package org.guess.core.utils;

import java.io.File;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 文件处理相关
 * @author guess
 *
 */
public class FileUtil {
	
	private static Logger log = LoggerFactory.getLogger(FileUtil.class);

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
	
	
    /**
     * 判断文件夹是否存在，如不存在则创建
     */
    public static void isFolderExitAndCreate(String folderName){
    	File file = new File(folderName);
    	if(!file.exists()){
    		file.mkdir();
    	}
    }
    
    /**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static void deleteFile(File file) {
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
        }
    }
    
    /**
	 * 
	 * 删除单个文件
	 * 
	 * @param fileName 被删除的文件名
	 * @return 如果删除成功，则返回true，否则返回false
	 */
	public static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				log.debug("删除单个文件 " + fileName + " 成功!");
				return true;
			} else {
				log.debug("删除单个文件 " + fileName + " 失败!");
				return false;
			}
		} else {
			log.debug(fileName + " 文件不存在!");
			return true;
		}
	}
    
    /**
	 * 
	 * 删除目录及目录下的文件
	 * 
	 * @param dirName 被删除的目录所在的文件路径
	 * @return 如果目录删除成功，则返回true，否则返回false
	 */
	public static boolean deleteDirectory(String dirName) {
		String dirNames = dirName;
		if (!dirNames.endsWith(File.separator)) {
			dirNames = dirNames + File.separator;
		}
		File dirFile = new File(dirNames);
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			log.debug(dirNames + " 目录不存在!");
			return true;
		}
		boolean flag = true;
		// 列出全部文件及子目录
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = FileUtil.deleteFile(files[i].getAbsolutePath());
				// 如果删除文件失败，则退出循环
				if (!flag) {
					break;
				}
			}
			// 删除子目录
			else if (files[i].isDirectory()) {
				flag = FileUtil.deleteDirectory(files[i]
						.getAbsolutePath());
				// 如果删除子目录失败，则退出循环
				if (!flag) {
					break;
				}
			}
		}

		if (!flag) {
			log.debug("删除目录失败!");
			return false;
		}
		// 删除当前目录
		if (dirFile.delete()) {
			log.debug("删除目录 " + dirName + " 成功!");
			return true;
		} else {
			log.debug("删除目录 " + dirName + " 失败!");
			return false;
		}

	}
}

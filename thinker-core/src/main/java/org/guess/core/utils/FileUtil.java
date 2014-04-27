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
	
	/**
     * /删除指定文件夹
     * 
     * @param folderPath
     *            文件夹全路径
     * @param htmlfile
     *            转换后HTML存放路径
     */
    public static void delFolder(String folderPath) {
        try {
            delAllFile(folderPath); // 删除完里面所有内容
            String filePath = folderPath;
            filePath = filePath.toString();
            java.io.File myFilePath = new java.io.File(filePath);
            myFilePath.delete(); // 删除空文件夹
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    /**
     * /删除指定文件夹下所有文件
     * 
     * @param path
     *            文件全路径
     */
    public static boolean delAllFile(String path) {
        boolean flag = false;
        File file = new File(path);
        if (!file.exists()) {
            return flag;
        }
        if (!file.isDirectory()) {
            return flag;
        }
        String[] tempList = file.list();
        File temp = null;
        for (int i = 0; i < tempList.length; i++) {
            if (path.endsWith(File.separator)) {
                temp = new File(path + tempList[i]);
            } else {
                temp = new File(path + File.separator + tempList[i]);
            }
            if (temp.isFile()) {
                temp.delete();
            }
            if (temp.isDirectory()) {
                delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
                delFolder(path + "/" + tempList[i]);// 再删除空文件夹
                flag = true;
            }
        }
        return flag;
    }
    
    /**
     * 判断文件夹是否存在，入不存在则创建
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
}

/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package org.guess.core;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-2-7 下午5:14
 * <p>Version: 1.0
 */
public interface Constants {
    /**
     * 操作名称
     */
    String OP_NAME = "op";


    /**
     * 消息key
     */
    String MESSAGE = "message";

    /**
     * 错误key
     */
    String ERROR = "error";

    /**
     * 上个页面地址
     */
    String BACK_URL = "BackURL";

    String IGNORE_BACK_URL = "ignoreBackURL";

    /**
     * 当前请求的地址 带参数
     */
    String CURRENT_URL = "currentURL";

    /**
     * 当前请求的地址 不带参数
     */
    String NO_QUERYSTRING_CURRENT_URL = "noQueryStringCurrentURL";

    String CONTEXT_PATH = "ctx";

    /**
     * 当前登录的用户
     */
    String CURRENT_USER = "c_user";
    String CURRENT_USERNAME = "username";
    String USER_MENUS = "menus";
    /**
     * 一级菜单grade标识
     */
    int FIRST_MENU = 1;
    
    /**
     * 二级菜单grade标识
     */
    int SECOND_MENU = 2;
    
    /**
     * 操作按钮等级标识
     */
    int MENU_GRADE = 3;
    
    /**
     * 最高级资源grade标识
     */
    int TOP_REC = 0;

    String ENCODING = "UTF-8";
    
    
    /**
     * 系统用户状态--启用
     */
    int USER_STATUS_UNLOCK = 1;
    
    /**
     * 系统用户状态--禁用
     */
    int USER_STATUS_LOCK = 0;
    
    /**
     * 登录页面
     */
    String LOGIN_URL = "/login";
    
    /**
     * 上传文件夹
     */
    String UPLOAD_FOLDER_NAME = "upload";
    
    /**
     * 临时文件夹
     */
    String TEMP_FOLDER_NAME = "temp";

}

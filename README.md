mystyle

##介绍
* 工作中的积累，搭建的j2ee应用快速开发手架，重点在代码重构，一些常用功能的演示，工具，插件等的整理

##功能要点简介

* 以springmvc、sprng、hibernate为基础框架搭建java web快速开发手架.ps:(参考<a href="https://github.com/springside" target="_blank">springside4</a>，<a href="https://github.com/zhangkaitao/es" target="_blank">es快速开发手架</a>)
* mysql数据库
* 前端使用基于bootstrap的metronic组件库
* 使用泛型封装dao、service、controller基类，包含分页，查询条件封装，从而达到快速crud操作
* 基于hibernate简单查询条件的封装
* ehcache缓存
* 权限管理——使用框架apache shiro进行系统认证、授权操作(完成)
	* 系统认证、授权操作
	* 按钮粒度的权限控制
	* 并发登录人数控制
* 系统管理——包含用户、角色、权限、资源、菜单管理(完成)
* 系统登录,操作日志记录,查询,分析(未完成)
* 集成activiti(工作流引擎)
	* 整合spring
  	* 工作流引擎并完成工作流通用基类、常用工具类
  	* 通用待办,已办,我的流程等常用查询
  	* 定义业务开发需实现的借口
  	* 流程部署
  	* 请假流程作为例子
* 集成jsper report动态报表工具(未完成)
* jpush消息推送
* jquery fileupload多文件上传带进度条
* 开发中常用工具类整理
	* 基于apache poi的通用导出excel工具类
	* 各种类型相互转化工具类
	* Http与Servlet工具类
	* 常用日期处理工具类
	* 各种编码,解码,加密等工作类
	* 反射操作封装
* 整理了丰富多样的js、jquery插件
	* bootstrap
	* jquery validation、修改验证后显示以适应bootstrap，显得更加美观、添加常用验证
	* 自定义的js分页插件(配合bootstrap-paginator)
	* ztree(jquery 树插件)
	* datetimepicker(日历控件)
	* gritter(提示框)
	* jquery-slimscroll(定义局部元素滚动)
	* jquery-treegrid(树插件能更好的与bootstrap table融合以展示数据)
	* bootstrap-tree(简易的树插件)
	* chosen-bootstrap(下拉框选择控件)
	* font-awesome(字体)
	* uniform(表单美化)
	* jquery blockUI(遮罩层)
	* ueditor(富文本编辑器)(未完成)
	* bootstrap-fileupload(未完成)
	* jquery-file-upload(未完成)


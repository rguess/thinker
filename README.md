##thinker(像一个思想者一样去写代码)

##me
* 个人博客  <a href="http://rguess.com" target="_blank">http://rguess.com</a>
* github <a href="https://github.com/rguess" target="_blank">https://github.com/rguess</a>
* gitoschina <a href="http://git.oschina.net/rguess" target="_blank">http://git.oschina.net/rguess</a>

##介绍
* 工作中的积累，搭建的j2ee应用快速开发手架，重点在代码重构，一些常用功能的演示，工具，插件等的整理。ps:(参考<a href="https://github.com/springside" target="_blank">springside4</a>，<a href="https://github.com/zhangkaitao/es" target="_blank">es快速开发手架</a>，<a href="https://github.com/thinkgem/jeesite" target="_blank">jeesite</a>)
* springmvc、spring、hibernate为基础框架
* mysql数据库
* 前端使用基于bootstrap的metronic组件库

##模块
###common
* 泛型封装dao、service、controller基类，包含分页，查询条件封装，从而达到快速crud操作(参考<a href="https://github.com/springside" target="_blank">springside4</a>")
* 简易代码生成器,增加字段配置功能、生成页面功能，实现增删查改不需要写一句代码(参考<a href="https://github.com/thinkgem/jeesite" target="_blank">jeesite</a>)
* ehcache缓存

###系统权限管理
* 系统管理——包含用户、角色、权限、资源、菜单管理
* 权限管理——使用框架apache shiro进行系统认证、授权操作
	* 系统认证、授权操作
	* 按钮粒度的权限控制
	* 并发登录人数控制
* 系统登录,操作日志记录,查询,分析

###OA工作流程
* 集成activiti(工作流引擎)
	* 整合spring
  	* 工作流引擎并完成工作流通用基类、常用工具类
  	* 通用待办,已办,我的流程等常用查询
  	* 定义业务开发需实现的接口
  	* 流程部署
  	* 请假流程例子
  	* 自由工作流设计例子

###内容管理
* 实现栏目，文章，系统静态资源的管理
* 实现上传word发表文章
* 实现ueditor富文本方式发表文章
* aop+freemarker+线程实现首页静态化
* 实现多个站点的管理
* 基于该cms的个人博客网站

###utils
* 开发中常用工具类整理
	* 基于apache poi的通用导出excel工具类
	* 各种类型相互转化工具类
	* Http与Servlet工具类
	* 常用日期处理工具类
	* 各种编码,解码,加密等工作类
	* 反射操作封装
	* 文件操作
	* WordToHtml
	* ...
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
	* ueditor(富文本编辑器)
	* bootstrap-fileupload
	* jquery fileupload多文件上传带进度条
	* ....

###others
* 集成jsper report动态报表工具(未完成)
* jpush消息推送
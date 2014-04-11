<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>用户信息</title>
<script type="text/javascript">
	$(function() {
		App.activeMenu("html/friday");
	});
</script>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="用户信息" pageTitleContent="showcase-星期五下午开会"
				titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="portlet box blue">
				<div class="portlet-title">
					<h4>
						<i class="icon-reorder"></i>主要内容
					</h4>
					<div class="tools">
						<a href="javascript:;" class="collapse"></a> <a
							href="javascript:;" class="remove"></a>
					</div>
				</div>
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<div class="form-horizontal form-view">
						<h3 class="form-section">人</h3>
						<div class="row-fluid">
							<a class="span2" href="http://baike.baidu.com/view/2192255.htm" target="_blank">Rod Johnson</a>
							<div class="span2">
								<a href="http://baike.baidu.com/view/117611.htm" target="_blank">Linus Torvalds</a>
								<a href="http://www.ruanyifeng.com/blog/2012/09/linus_torvalds.html" target="_blank">自传</a>
							</div>
							<a class="span2" href="http://baike.baidu.com/view/3729312.htm" target="_blank">Bruce Eckel</a>
							<div class="span2">
								<a href="http://baike.baidu.com/view/992117.htm" target="_blank">springside</a>
								<a href="https://github.com/springside" target="_blank">github</a>
							</div>
							<div class="span2">
								<a href="http://jinnianshilongnian.iteye.com/" target="_blank">张开涛</a>
								<a href="https://github.com/zhangkaitao/" target="_blank">github</a>
							</div>
						</div>
						<h3 class="form-section">社区</h3>
						<div class="row-fluid">
							<a class="span2" href="http://rguess.iteye.com" target="_blank">我的博客</a>
							<a class="span2" href="https://github.com/rguess" target="_blank">我的github</a>
							<a class="span2" href="http://git.oschina.net/rguess" target="_blank">我的gitoschina</a>
						</div>
						<h3 class="form-section">git</h3>
						<div class="row-fluid">
							<a class="span2" href="http://www.bootcss.com/" target="_blank">git guide</a>
						</div>
						<h3 class="form-section">maven</h3>
						<div class="row-fluid">
							<a class="span2" href="http://www.juvenxu.com/" target="_blank">Juven Xu</a>
							<a class="span2" href="http://www.blogjava.net/ilovesimple/archive/2010/06/04/322756.html" target="_blank">优势</a>
							<a class="span2" href="http://baike.baidu.com/view/309926.htm" target="_blank">敏捷开发</a>
							<a class="span2" href="http://baike.baidu.com/view/4169795.htm" target="_blank">瀑布模式开发</a>
							<a class="span2" href="http://www.cnblogs.com/zh2000g/archive/2010/02/22/1671286.html" target="_blank">比较</a>
						</div>
						<h3 class="form-section">权限</h3>
						<div class="row-fluid">
							<a class="span2" href="http://jinnianshilongnian.iteye.com/blog/2018398" target="_blank">shiro</a>
							<a class="span2" href="http://www.iteye.com/topic/930648" target="_blank">RBAC</a>
						</div>
					</div>
				</div>
				<!-- END FORM-->
			</div>
		</div>
	</div>
</body>
</html>
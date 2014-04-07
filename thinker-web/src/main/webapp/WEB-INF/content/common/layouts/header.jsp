<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>

<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="navbar-inner">
		<div class="container-fluid">
			<!-- BEGIN LOGO -->
			<a class="brand" href="index.html"><img src="${ctx}/assets/img/logo.png" alt="logo" /></a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<%-- <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse"> 
				<img src="${ctx}/assets/img/menu-toggler.png" alt="" />
			</a> --%>
			<!-- END RESPONSIVE MENU TOGGLER -->
<!-- 			<div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="/">首页</a></li>
              <li class="">
                <a href="getting-started.html" class="bootstro" data-bootstro-title="这里介绍了从零开始使用Bootstrap的基本步骤。教你创建一个最简单的Bootstrap页面。" data-bootstro-placement="bottom" data-bootstro-step="0">起步</a>
              </li>
              <li class="">
                <a href="scaffolding.html" class="bootstro" data-bootstro-title="这里详细介绍了Bootstrap的栅格系统。对于栅格系统的理论知识，最好动手谷歌一下！" data-bootstro-placement="bottom" data-bootstro-step="1">脚手架</a>
              </li>
              <li class="">
                <a href="base-css.html" class="bootstro" data-bootstro-title="这里介绍了Bootstrap对HTML标签所设置的默认样式。任何一个符合HTML5规范的页面只要引入Bootstrap就自然具有了优雅的外观，这就是Bootstrap的功劳！" data-bootstro-placement="bottom" data-bootstro-step="2">基本CSS样式</a>
              </li>
              <li class="">
                <a href="components.html" class="bootstro" data-bootstro-title="这里介绍了常用的诸如按钮、弹框、导航条、下拉菜单、进度条等等常见的页面组件。按照例子照猫画虎就可以，熟能生巧。这些都不需要刻意去记忆，需要的时候随时回来翻文档，然后复制、粘贴即可！" data-bootstro-placement="bottom" data-bootstro-step="3">组件</a>
              </li>
              <li class="">
                <a href="javascript.html" class="bootstro" data-bootstro-title="这里介绍了Bootstrap自带的具有交互功能的组件。页面要想与用户交互当然离不开Javascript了。Bootstrap的组件都是基于jQuery的，你熟悉jQuery吗？建议谷歌一下。" data-bootstro-placement="bottom" data-bootstro-step="4">JavaScript插件</a>
              </li>
              <li class="">
                <a href="customize.html" class="bootstro" data-bootstro-title="在这里可以通过设置Bootstrap提供的参数改变Bootstrap的样貌。我们不建议过早接触这里，在你熟悉Bootstrap阶段，最好是通过覆盖样式的方式修改Bootstrap默认的外观。等你需要深入了解Bootstrap时，可以先学习Lesscss ---&gt;&gt;&gt;" data-bootstro-placement="bottom" data-bootstro-step="5">定制</a>
              </li>
              <li class="lesscss">
                <a target="_blank" href="lesscss.html" class="bootstro" data-bootstro-title="Lesscss是一种预编译脚本，编译之后就是你所熟悉的CSS了。Bootstrap就是采用Less语法书写的。想要深入Bootstrap底层的同学一定要看这里打好基础！" data-bootstro-placement="bottom" data-bootstro-step="6">Lesscss教程</a>
              </li>

              <li class="">
                <a href="about.html">关于</a>
              </li>
            </ul>
          </div> -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<li class="dropdown" id="header_notification_bar">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<i class="icon-warning-sign"></i> 
						<span class="badge">6</span>
					</a>
					<ul class="dropdown-menu extended notification">
						<li>
							<p>You have 14 new notifications</p>
						</li>
						<li>
							<a href="javascript:;" onclick="App.onNotificationClick(1)"> 
								<span class="label label-success">
								<i class="icon-plus"></i>
								</span> New user registered. 
								<span class="time">Just now</span>
							</a>
						</li>
						<li><a href="#"> <span class="label label-important"><i
									class="icon-bolt"></i></span> Server #12 overloaded. <span
								class="time">15 mins</span>
						</a></li>
						<li><a href="#"> <span class="label label-warning"><i
									class="icon-bell"></i></span> Server #2 not respoding. <span
								class="time">22 mins</span>
						</a></li>
						<li><a href="#"> <span class="label label-info"><i
									class="icon-bullhorn"></i></span> Application error. <span
								class="time">40 mins</span>
						</a></li>
						<li><a href="#"> <span class="label label-important"><i
									class="icon-bolt"></i></span> Database overloaded 68%. <span
								class="time">2 hrs</span>
						</a></li>
						<li><a href="#"> <span class="label label-important"><i
									class="icon-bolt"></i></span> 2 user IP blocked. <span class="time">5
									hrs</span>
						</a></li>
						<li class="external"><a href="#">See all notifications <i
								class="m-icon-swapright"></i></a></li>
					</ul></li>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<li class="dropdown" id="header_inbox_bar"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-envelope-alt"></i> <span class="badge">5</span>
				</a>
					<ul class="dropdown-menu extended inbox">
						<li>
							<p>You have 12 new messages</p>
						</li>
						<li><a href="#"> <span class="photo"><img
									src="${ctx}/assets/img/avatar2.jpg" alt="" /></span> <span class="subject">
									<span class="from">Lisa Wong</span> <span class="time">Just
										Now</span>
							</span> <span class="message"> Vivamus sed auctor nibh congue
									nibh. auctor nibh auctor nibh... </span>
						</a></li>
						<li><a href="#"> <span class="photo"><img
									src="${ctx}/assets/img/avatar3.jpg" alt="" /></span> <span class="subject">
									<span class="from">Richard Doe</span> <span class="time">16
										mins</span>
							</span> <span class="message"> Vivamus sed congue nibh auctor
									nibh congue nibh. auctor nibh auctor nibh... </span>
						</a></li>
						<li><a href="#"> <span class="photo"><img
									src="${ctx}/assets/img/avatar1.jpg" alt="" /></span> <span class="subject">
									<span class="from">Bob Nilson</span> <span class="time">2
										hrs</span>
							</span> <span class="message"> Vivamus sed nibh auctor nibh
									congue nibh. auctor nibh auctor nibh... </span>
						</a></li>
						<li class="external"><a href="#">See all messages <i
								class="m-icon-swapright"></i></a></li>
					</ul></li>
				<!-- END INBOX DROPDOWN -->
				<!-- BEGIN TODO DROPDOWN -->
				<li class="dropdown" id="header_task_bar"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-tasks"></i> <span class="badge">5</span>
				</a>
					<ul class="dropdown-menu extended tasks">
						<li>
							<p>You have 12 pending tasks</p>
						</li>
						<li><a href="#"> <span class="task"> <span
									class="desc">New release v1.2</span> <span class="percent">30%</span>
							</span> <span class="progress progress-success "> <span
									style="width: 30%;" class="bar"></span>
							</span>
						</a></li>
						<li><a href="#"> <span class="task"> <span
									class="desc">Application deployment</span> <span
									class="percent">65%</span>
							</span> <span class="progress progress-danger progress-striped active">
									<span style="width: 65%;" class="bar"></span>
							</span>
						</a></li>
						<li><a href="#"> <span class="task"> <span
									class="desc">Mobile app release</span> <span class="percent">98%</span>
							</span> <span class="progress progress-success"> <span
									style="width: 98%;" class="bar"></span>
							</span>
						</a></li>
						<li><a href="#"> <span class="task"> <span
									class="desc">Database migration</span> <span class="percent">10%</span>
							</span> <span class="progress progress-warning progress-striped">
									<span style="width: 10%;" class="bar"></span>
							</span>
						</a></li>
						<li><a href="#"> <span class="task"> <span
									class="desc">Web server upgrade</span> <span class="percent">58%</span>
							</span> <span class="progress progress-info"> <span
									style="width: 58%;" class="bar"></span>
							</span>
						</a></li>
						<li><a href="#"> <span class="task"> <span
									class="desc">Mobile development</span> <span class="percent">85%</span>
							</span> <span class="progress progress-success"> <span
									style="width: 85%;" class="bar"></span>
							</span>
						</a></li>
						<li class="external"><a href="#">See all tasks <i
								class="m-icon-swapright"></i></a></li>
					</ul></li>
				<!-- END TODO DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img alt="" src="${ctx}/assets/img/avatar1_small.jpg" />
							<span class="username"><shiro:principal/></span> 
							<i class="icon-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0);">
							<i class="icon-user"></i>&nbsp&nbsp&nbsp<span>个人信息</span>
							</a>
						</li>
						<li><a href="javascript:void(0);" onclick="javascript:Header.changePwd();">
							<i class="icon-wrench"></i>&nbsp&nbsp&nbsp<span>修改密码</span>
							</a>
						</li>
						<li><a href="javascript:void(0);">
							<i class="icon-calendar"></i>&nbsp&nbsp&nbsp<span>我的任务</span>
							</a>
						</li>
						<li><a href="javascript:void(0);" onclick="javascript:Header.loadSysSetting();">
							<i class="icon-cog"></i>&nbsp&nbsp&nbsp<span>系统设置</span>
							</a>
						</li>
						<li class="divider"></li>
						<li><a href="${ctx }/logout"><i class="icon-key"></i>退出</a></li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>













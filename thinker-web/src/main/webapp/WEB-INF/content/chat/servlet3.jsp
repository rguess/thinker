<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>基于servlet3异步即时通讯演示</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="聊天" pageTitleContent="showcase-即时通讯-servlet3.0" titleIcon="icon-comments-alt"/>
        <div class="row-fluid">
            <div class="span8">
                <!-- BEGIN PORTLET-->
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <h4><i class="icon-comments"></i>Chats</h4>

                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body" id="chats">
                        <div class="scroller" data-height="343px" data-always-visible="1" data-rail-visible1="1">
                            <ul class="chats">
                                <li class="in">
                                    <img class="avatar" alt="" src="${ctx}/assets/img/avatar1.jpg"/>

                                    <div class="message">
                                        <span class="arrow"></span>
                                        <a href="#" class="name">Bob Nilson</a>
                                        <span class="datetime">at Jul 25, 2012 11:09</span>
										<span class="body">
										你好，PICC项目DEMO修改，临时通知的，事情比较急，对方要求明天演示。北京这边现在人力比较紧张，需要你那边安排一下。辛苦！
										</span>
                                    </div>
                                </li>
                                <li class="out">
                                    <img class="avatar" alt="" src="${ctx}/assets/img/avatar2.jpg"/>

                                    <div class="message">
                                        <span class="arrow"></span>
                                        <a href="#" class="name">Lisa Wong</a>
                                        <span class="datetime">at Jul 25, 2012 11:09</span>
										<span class="body">
										广坤：你看一下这个demo需求吧，具体除了demo功能模块是这些。
										</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="chat-form">
                            <div class="input-cont">
                                <input class="m-wrap" type="text" placeholder="Type a message here..."/>
                            </div>
                            <div class="btn-cont">
                                <span class="arrow"></span>
                                <a href="javascript:;" class="btn blue icn-only"><i class="icon-ok icon-white"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-ui.jsp" %>
<%@ include file="/WEB-INF/content/common/plugins/jquery-slimscroll.jsp" %>
<script type="text/javascript" src="${ctx}/assets/js/chat/Chat.js"></script>
<script type="text/javascript">
    $(function () {
        Chat.init();
    })
</script>
</body>
</html>
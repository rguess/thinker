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
                                    <img class="avatar" alt="" src="${ctx}/assets/img/avatar.png"/>
                                    <div class="message">
                                        <span class="arrow"></span>
                                        <a href="#" class="name">admin</a>
                                        <span class="datetime"><tool:curDate /></span>
										<span class="body">
										可以聊天了！
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
            <div class="span4">
                <div class="portlet">
                    <div class="portlet-title line">
                        <h4><i class="diy_icon_01_35"></i>在线</h4>

                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="scroller" data-height="432px" data-always-visible="1" data-rail-visible1="1">
                            <div class="row-fluid">
                                <c:forEach var="obj" items="${users}">
                                    <div class="user-info">
                                        <img alt="" src="${ctx}/assets/img/avatar.png"/>
                                        <div class="details">
                                            <div>
                                                <a href="#">${obj.user.name}</a>
                                                <span>${obj.ip}</span>
                                            </div>
                                            <div>
                                                <tool:curDate />
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-ui.jsp" %>
<script type="text/javascript" src="${ctx}/assets/js/chat/chat.js"></script>
<script type="text/javascript">
    $(function () {
        App.activeMenu("/chat/servlet3");
        Chat.init();
    });
    var me = "${sessionScope.c_user.loginId}"
</script>
</body>
</html>
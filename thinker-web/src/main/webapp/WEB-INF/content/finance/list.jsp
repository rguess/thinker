<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>财务列表</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="用户列表" pageTitleContent="功能演示-财务列表" titleIcon="icon-home"/>
        <!-- 主体内容 -->
        <div class="row-fluid">
            <div class="span12">
                <div class="portlet box purple">
                    <div class="portlet-title">
                        <h4>
                            <i class="diy_icon_04_38"></i>列表
                        </h4>

                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a><a
                                href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="row-fluid">
                            <form class="queryForm span8">
                                <div class="row-fluid">

                                    <div class="span2">
                                        <div class="control-group">
                                            <div class="controls">
                                                <input type="text" id="name" class="m-wrap span12" placeholder="名称">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <div class="controls">
                                                <a class="btn blue" href="javascript:void(0)"
                                                   onclick="javascript:doQuery();">
                                                    <i class="icon-search"></i>
                                                    查询</a>
                                                <button type="reset" class="btn">
                                                    <i class="icon-trash"></i>清空
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="span4 pull-right">
                                <a class="btn green" href="javascript:void(0)" onclick="Page.addObj();">
                                    添加 <i class="icon-plus"></i>
                                </a>
                                <a class="btn blue" href="javascript:void(0);" onclick="Page.updateObj();">
                                    修改<i class="icon-pencil"></i>
                                </a>
                                <a class="btn red" href="javascript:void(0);" onclick="Page.deleteObj();">
                                    删除<i class="icon-trash"></i>
                                </a>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="sample_1">

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp" %>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        //高亮左侧菜单
        App.activeMenu("finance/list");
        Page.initData(
                {
                    url: "${ctx}/finance/page",
                    tableId: "#sample_1",
                    pageSize: 10
                },
                null,
                [
                    {cName: "name", cValue: "名称"},
                    {cName: "type", cValue: "类型"},
                    {cName: "inorout", cValue: "收入or支出", format: function (i, value, item) {
                        if (value == 1) {
                            return "收入";
                        } else if (value == 0) {
                            return "支出";
                        } else {
                            return "未知";
                        }
                    }},
                    {cName: "money", cValue: "金额", format: function (i, value, item) {
                        return value + "元";
                    }},
                    {cName: "time", cValue: "时间", format: function (i, value, item) {
                        return new Date(value).format("yyyy-MM-dd hh:mm");
                    }},
                    {cName: "content", cValue: "详细内容", noSort: true}
                ]
        );
    });

    function doQuery() {

    }
</script>
</body>
</html>
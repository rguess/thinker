<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>客户提醒</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="记录列表" pageTitleContent="showcase-记录-客户提醒" titleIcon="icon-home"/>
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

                        </div>
                        <table class="table table-striped table-bordered table-hover" id="sample_1">

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        //高亮左侧菜单
        App.activeMenu("qixiu/record/toReminder");
        Page.initData(
                {
                    url: "${ctx}/qixiu/record/reminder",
                    tableId: "#sample_1",
                    pageSize: 10
                },
                null,
                [
                    {cName: "customer", cValue: "姓名", format: function (i, value, item) {
                        return item.record.customer;
                    }},
                    {cName: "phone", cValue: "手机", noSort: true, format: function (i, value, item) {
                        return item.record.phone;
                    }},
                    {cName: "chepai", cValue: "车牌", format: function (i, value, item) {
                        return item.record.chepai;
                    }},
                    {cName: "chexing", cValue: "车型", format: function (i, value, item) {
                        return item.record.chexing;
                    }},
                    {cName: "latestDate", cValue: "最后维修日期", format: function (i, value, item) {
                        return item.record.latestDate;
                    }},
                    {cName: "leibie", cValue: "维修项目"},
                    {cName: "jiage", cValue: "价格"},
                    {cName: "nextxiu", cValue: "提醒日期"},
                    {cName: "xiudate", cValue: "维修日期"},
                    {cName: "remark", cValue: "备注"}
                ]
        );
    });
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>记录列表</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="记录列表" pageTitleContent="showcase-记录-列表" titleIcon="icon-home"/>
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
                                    <div class="span4">
                                        <div class="control-group">
                                            <div class="controls">
                                                <input type="text" id="filters" class="m-wrap span12"
                                                       placeholder="姓名&电话&车牌">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span4 ">
                                        <div class="control-group">
                                            <div class="controls">
                                                <input type="text" id="daterange" class="m-wrap span12"
                                                       placeholder="时间范围" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span3">
                                        <div class="control-group">
                                            <div class="controls">
                                                <a class="btn blue" href="javascript:void(0)"
                                                   onclick="javascript:doQuery();">
                                                    <i class="icon-search"></i>
                                                    查询</a>
                                                <button type="reset" class="btn"
                                                        onclick="javascript:Page.clearQuery();">
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
                                <a class="btn blue" href="javascript:void(0);" onclick="Page.viewObj();">
                                    详细<i class="icon-search"></i>
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
<%@ include file="/WEB-INF/content/common/plugins/daterangepicker.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        //高亮左侧菜单
        App.activeMenu("qixiu/record/list");
        Page.initData(
                {
                    url: "${ctx}/qixiu/record/page",
                    tableId: "#sample_1",
                    pageSize: 10
                },
                null,
                [
                    {cName: "customer", cValue: "姓名"},
                    {cName: "phone", cValue: "手机", noSort: true},
                    {cName: "chepai", cValue: "车牌"},
                    {cName: "chexing", cValue: "车型"},
                    {cName:"latestDate",cValue:"最新修改"},
                    {cName: "remark", cValue: "备注"}
                ]
        );
        $('#daterange').daterangepicker({
            ranges: {
                '今日': ['today', 'today'],
                '昨日': ['yesterday', 'yesterday'],
                '本月': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
                '今日开始到本周五': [Date.today(), Date.today().next().friday()],
                '今日开始的一周': ['today', Date.today().add({days: 7})],
                '今日到本月末尾': ['today', Date.today().moveToLastDayOfMonth()]
            },
            startDate: "2014/05/05",
            endDate: "2014/05/05"
        });
    });

    function doQuery() {
        var queryObj = {};
        if (App.isNundef($("#daterange").val()) && App.isEqPlacehoder($("#daterange")) != null) {
            var arr = $("#daterange").val().split("-")
            queryObj = {
                "search_GED_latestDate": arr[0].replaceAll("/", "-") + " 00:00:00",
                "search_LED_latestDate": arr[1].replaceAll("/", "-") + " 23:59:59"
            }
        }
        queryObj["search_LIKES_phone_OR_customer_OR_chepai"] = App.isEqPlacehoder($("#filters"));
        Page.doQuery(queryObj);
    }
</script>
</body>
</html>
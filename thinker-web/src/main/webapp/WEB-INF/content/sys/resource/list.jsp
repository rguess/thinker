<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<html>
<head>
    <title>资源列表</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="资源列表" pageTitleContent="系统管理-资源管理-资源列表"
                     titleIcon="icon-home"/>
        <!-- 主体内容 -->
        <div class="row-fluid">
            <div class="span12">
                <div class="portlet box green">
                    <div class="portlet-title">
                        <h4>
                            <i class="icon-globe"></i>资源树
                        </h4>

                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div>
                            <div class="btn-group">
                                <shiro:hasPermission name="sys:resource:add">
                                    <a class="btn green" href="${ctx}/sys/resource/create">
                                        添加 <i class="icon-plus"></i>
                                    </a>
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <div>
                            <table id="treeTable" class="table table-striped table-bordered table-hover tree">
                                <thead>
                                <tr id="dataTr">
                                    <th>名称</th>
                                    <th>资源串</th>
                                    <th>图标</th>
                                    <th>权限标识</th>
                                    <th>排序编号</th>
                                    <th>备注</th>
                                </tr>
                                </thead>
                                <tbody id="treeBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-treegrid.jsp" %>
<script type="text/javascript">

    //根据权限添加按钮
    var btns = [];
    <shiro:hasPermission name="sys:resource:update">
    btns.push({clickFn: "edit(this)", name: "修改", icon: "icon-pencil"});
    </shiro:hasPermission>
    <shiro:hasPermission name="sys:resource:delete">
    btns.push({clickFn: "del(this)", name: "删除", icon: "icon-trash"});
    </shiro:hasPermission>

    $(document).ready(function () {
        App.activeMenu("sys/resource/list");
        initTree();
        if (btns.length > 0) {
            $("#dataTr").append($("<th></th>").text("操作"));
        }
    });

    /* 初始化树 */
    function initTree() {
        blockUI();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "${ctx}/sys/resource/tree",
            success: function (data) {
                $.each(data, function (i, item) {
                    $("#treeBody").append(fillData(item, null));
                    $.each(item.childRes, function (j, cd) {
                        $("#treeBody").append(fillData(cd, item.id));
                        $.each(cd.childRes, function (n, m) {
                            $("#treeBody").append(fillData(m, cd.id));
                        });
                    });
                });
                $('#treeTable').treegrid({initialState: "collapsed",saveState:true});
                unBlockUI();
                registerTdOnclickEvent();
            }
        });
    }

    //填充数据
    function fillData(item, pId) {
        var tr = $("<tr></tr>").attr("id", item.id).addClass("treegrid-" + item.id);
        if (pId != null) {
            tr.addClass("treegrid-parent-" + pId);
        }
        tr.append($("<td></td>").html(item.name));
        tr.append($("<td></td>").html(item.resString));
        tr.append($("<td></td>").html($("<i class=" + item.icon + "></i>")));
        tr.append($("<td></td>").html(item.permsString));
        tr.append($("<td></td>").html(item.orderNo));
        tr.append($("<td></td>").html(item.remark));
        if (btns.length > 0) {
            tr.append($("<td></td>").html(operBtn(item.id)));
        }
        return tr;
    }

    //生产下拉操作按钮
    function operBtn(id) {
        return App.initDropDownBtn({
            icon: "icon-cogs",
            name: "操作",
            group: btns
        });
    }

    //编辑
    function edit(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/resource/update/" + id;
    }

    //删除
    function del(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/resource/delete/" + id;
    }

    //详细
    function show(obj) {
        var id = $(obj).closest("tr").attr("id");
        window.location.href = ctx + "/sys/resource/show/" + id;
    }

    function registerTdOnclickEvent() {
        $("td").click(function () {
            $(this).parent().addClass("selectedTr").siblings().removeClass("selectedTr");
        });
    }
</script>
</body>
</html>
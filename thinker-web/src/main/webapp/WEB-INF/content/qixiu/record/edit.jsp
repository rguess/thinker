<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/content/common/common.jsp" %>
<c:set var="pageTitle" value="${empty obj ? '添加':'修改' }" scope="page"/>
<html>
<head>
    <title>${pageTitle }</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">
        <!-- 页面导航 -->
        <tool:navBar pageTitle="${pageTitle }"
                     pageTitleContent="showcase-记录-${pageTitle }" titleIcon="icon-home"/>
        <!-- 主体内容 -->
        <div class="row-fluid">
            <div class="span12">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <h4>
                            <i class="icon-reorder"></i>请填写表单
                        </h4>

                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a> <a
                                href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <form action="${ctx }/qixiu/record/create" class="form-horizontal form_sync"
                              method="post" id="form1">
                            <!-- 用户ID -->
                            <input type="hidden" value="${obj.id }" name="id">

                            <div class="control-group">
                                <label class="control-label">客户姓名:</label>

                                <div class="controls">
                                    <input type="text" class="span6 m-wrap"
                                           validate="{required:true,minlength:2,maxlength:10}"
                                           name="customer" value="${obj.customer }"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">联系电话:</label>

                                <div class="controls">
                                    <input type="text" class="span6 m-wrap"
                                           validate="{required:true,isMobile:true}" name="phone"
                                           value="${obj.phone }"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">车牌:</label>

                                <div class="controls">
                                    <input type="text" class="span6 m-wrap"
                                           validate="{required:true}"
                                           name="chepai" value="${obj.chepai }"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">车型:</label>

                                <div class="controls">
                                    <input type="text" class="span6 m-wrap"
                                           validate="{required:true}"
                                           name="chexing" value="${obj.chexing }"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">详细记录:</label>

                                <div class="controls">
                                    <%--<input type="hidden" value="${obj.id }" name="details[0].record.id">--%>
                                    <div class="input-append date form_date" data-date-format="yyyy-mm-dd">
                                        <input class="m-wrap" name="details[0].xiudate"
                                               type="text" readonly="readonly"
                                               value="<fmt:formatDate value='${obj.details[0].xiudate }'/>"
                                               placeholder="维修日期">
                                            <span class="add-on">
                                                <i class="icon-th"></i>
                                            </span>
                                    </div>

                                    <div class="input-append date form_date" data-date-format="yyyy-mm-dd">
                                        <input class="m-wrap" id="nextxiu" name="details[0].nextxiu"
                                               type="text" readonly="readonly"
                                               value="<fmt:formatDate value='${obj.details[0].nextxiu }'/>"
                                               placeholder="提醒下次维修日期">
                                            <span class="add-on">
                                                <i class="icon-th"></i>
                                            </span>
                                    </div>

                                    <input type="text" class="span3 m-wrap"
                                           placeholder="维修类别"
                                           name="details[0].leibie" value="${obj.details[0].leibie }"/>

                                    <div style="margin-top: 10px"></div>
                                    <div class="input-append">
                                        <input name="details[0].jiage" class="m-wrap " type="text"
                                               placeholder="维修价格" value="${obj.details[0].jiage }"><span
                                            class="add-on">元</span>
                                    </div>
                                    <a href="javascript:void(0)" style="font-size: 30px"
                                       onclick="javascript:adddetail()">+</a>
                                    <a href="javascript:void(0)" style="font-size: 30px"
                                       onclick="javascript:deldetail();">-</a>

                                    <div style="margin-top: 10px"></div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">备注:</label>

                                <div class="controls">
                                    <textarea rows="3" cols="6" class="span6 m-wrap"
                                              name="remark">${obj.remark }</textarea>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn blue">提交</button>
                                <a class='btn' href="${header.Referer }">返回</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp" %>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp" %>
<script type="text/javascript">

    var copments = {

    }

    $(function () {
        App.activeMenu("qixiu/record/list");
    });

    function adddetail() {
        alert(12);
    }
</script>
</body>
</html>
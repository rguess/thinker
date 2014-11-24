<%@ page import="org.guess.core.utils.DateUtil" %>
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
                        <form action="${ctx }/qixiu/record/edit" class="form-horizontal form_sync"
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
                                <label class="control-label">最新维修时间:</label>

                                <div class="controls">
                                    <div class="span6 m-wrap">
                                        <input type="text" class="span6 m-wrap"
                                               validate="{required:true}"
                                               name="latestDate" value="<%=DateUtil.getToday()%>" readonly="readonly"/>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group" id="ddiv">
                                <label class="control-label">详细记录:</label>

                                <c:if test="${empty obj.details}">
                                    <div class="controls dlist">
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
                                            <input class="m-wrap" name="details[0].nextxiu"
                                                   type="text" readonly="readonly"
                                                   value="<fmt:formatDate value='${obj.details[0].nextxiu }'/>"
                                                   placeholder="提醒下次维修日期">
                                            <span class="add-on">
                                                <i class="icon-th"></i>
                                            </span>
                                        </div>

                                        <input type="text" class="span3 m-wrap"
                                               placeholder="维修项目"
                                               name="details[0].leibie" value="${obj.details[0].leibie }"/>

                                        <div style="margin-top: 10px"></div>
                                        <div class="input-append">
                                            <input name="details[0].jiage" class="m-wrap " type="text"
                                                   placeholder="维修价格" value="${obj.details[0].jiage }"><span
                                                class="add-on">元</span>
                                        </div>
                                        <a href="javascript:void(0)" class="btn icn-only blue"
                                           onclick="javascript:adddetail()"><i class="icon-plus"></i></a>

                                        <div style="margin-top: 10px"></div>
                                    </div>
                                </c:if>

                                <c:forEach var="item" items="${obj.details}" varStatus="status">
                                    <div class="controls dlist">
                                        <div class="input-append date form_date" data-date-format="yyyy-mm-dd">
                                            <input class="m-wrap" name="details[${status.index}].xiudate"
                                                   type="text" readonly="readonly"
                                                   value="<fmt:formatDate value='${item.xiudate }'/>"
                                                   placeholder="维修日期">
                                            <span class="add-on">
                                                <i class="icon-th"></i>
                                            </span>
                                        </div>

                                        <div class="input-append date form_date" data-date-format="yyyy-mm-dd">
                                            <input class="m-wrap" name="details[${status.index}].nextxiu"
                                                   type="text" readonly="readonly"
                                                   value="<fmt:formatDate value='${item.nextxiu }'/>"
                                                   placeholder="提醒下次维修日期">
                                            <span class="add-on">
                                                <i class="icon-th"></i>
                                            </span>
                                        </div>

                                        <input type="text" class="span3 m-wrap"
                                               placeholder="维修项目"
                                               name="details[${status.index}].leibie"
                                               value="${item.leibie }"/>

                                        <div style="margin-top: 10px"></div>
                                        <div class="input-append">
                                            <input name="details[${status.index}].jiage" class="m-wrap " type="text"
                                                   placeholder="维修价格" value="${item.jiage }"><span
                                                class="add-on">元</span>
                                        </div>
                                        <a href="javascript:void(0)" class="btn icn-only blue"
                                           onclick="javascript:adddetail()"><i class="icon-plus"></i></a>
                                        <c:if test="${status.last && !status.first}">
                                            <a href="javascript:void(0)" class="btn icn-only red delbtn"
                                               onclick="javascript:deldetail(this)"><i class="icon-remove"></i></a>
                                        </c:if>
                                        <div style="margin-top: 10px"></div>
                                    </div>
                                </c:forEach>
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
    var html = {
        d1: function (index) {
            return $('<div class="input-append date form_date" data-date-format="yyyy-mm-dd"></div>')
                    .append($('<input class="m-wrap" name="details[' + index + '].xiudate" type = "text" value = "" placeholder = "维修日期" >>'))
        },
        d2: function (index) {
            return $('<div class="input-append date form_date" data-date-format="yyyy-mm-dd"></div>')
                    .append($('<input class="m-wrap" name="details[' + index + '].nextxiu" type = "text" value = "" placeholder = "提醒下次维修日期" >>'))
        },
        d3: function (index) {
            return $('<input type="text" class="span3 m-wrap" placeholder="维修项目" name="details[' + index + '].leibie" value=""/>')
        },
        d4: function (index) {
            return $('<div class="input-append"><input name="details[' + index + '].jiage" class="m-wrap" type="text" placeholder="维修价格" value=""><span class="add-on">元</span></div>')

        },
        d5: function () {
            return $('<div style="margin-top: 10px"></div>');
        },
        d6: function () {
            return $('<a href="javascript:void(0)" class="btn icn-only blue" onclick="javascript:adddetail()"><i class="icon-plus"></i></a><a href="javascript:void(0)" class="btn icn-only red delbtn" onclick="javascript:deldetail(this)"><i class="icon-remove"></i></a>');
        }

    }

    $(function () {
        App.activeMenu("qixiu/record/list");
    });

    function adddetail() {
        $(".delbtn").remove();
        var index = $(".dlist").length;
        $("#ddiv").append($('<div class="controls dlist"></div>')
                .append(html.d1(index))
                .append(html.d2(index))
                .append(html.d3(index))
                .append(html.d5())
                .append(html.d4(index))
                .append(html.d6(index))
                .append(html.d5()));
    }

    function deldetail(obj) {
        $(obj).closest('.dlist').remove();
        if ($('.dlist').length > 1) {
            $(".dlist:last").find("a").after($('<a href="javascript:void(0)" class="btn icn-only red delbtn" onclick="javascript:deldetail(this)"><i class="icon-remove"></i></a>'));
        }
    }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%pageContext.setAttribute("App_Path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CIMS-院校管理员管理</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="../commons/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <!-- 自定义全局样式 -->
    <link rel="stylesheet" href="../commons/css/me.css">

    <style>
        .jumbotron {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">CIMS-校园即时通系统</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="areaIndex">首页</a></li>
                <li><a href="areaManager">院校管理</a></li>
                <li class="active"><a href="areaAdminManager">院校管理员管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>平台管理员：<span id="loginUser_nav"></span></a>
                </li>
                <li id="logout_nav"><a href="#"><span class="glyphicon glyphicon-log-out"></span>注销</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- /container -->
<div class="container">
    <h3>院校管理员管理</h3>
    <hr>
    <div class="row">
        <input type="hidden" id="pn" value="${requestScope.pn}">
        <form action="" method="post">
            <div class="header">
                <div class="col-lg-3">
                    <label for="">省：</label>
                    <select class="selectpicker" data-width="80%" title="请选择省份">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="">市：</label>
                    <select class="selectpicker" data-width="80%" title="请选择市">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="">院校：</label>
                    <select class="selectpicker" data-width="80%" title="请选择院校">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="input-group" role="group">
                            <input type="text" class="form-control" placeholder="请输入用户名">
                            <span class="input-group-btn">
										<button type="button" class="btn btn-primary"><span
                                                class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索</button>
										<button type="button" class="btn btn-warning"><span
                                                class="glyphicon glyphicon-refresh"
                                                aria-hidden="true"></span>重置</button>
									</span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <hr>
    <div class="">
        <table class="area-table table table-bordered table-striped" id="areaAdmins-table">
            <thead>
            <tr>
                <th>
                    <input class="checkAll" type="checkbox" name="" id="check_all" value=""/>
                </th>
                <th>用户名</th>
                <th>所属区域</th>
                <th>操作人</th>
                <th>操作时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%--<tr>
                <td><input type="checkbox" name="" id="" value=""/></td>
                <td>张三</td>
                <td>浙江省 杭州市 杭州职业技术学院</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn  btn-default" style="background-color:#D4D4D4">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>重置密码
                        </button>
                        <button type="button" class="btn  btn-danger">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id="" value=""/></td>
                <td>张三</td>
                <td>浙江省 杭州市 杭州职业技术学院</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn  btn-default" style="background-color:#D4D4D4">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>重置密码
                        </button>
                        <button type="button" class="btn  btn-danger">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td><input type="checkbox" name="" id="" value=""/></td>
                <td>张三</td>
                <td>浙江省 杭州市 杭州职业技术学院</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn  btn-default" style="background-color:#D4D4D4">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>重置密码
                        </button>
                        <button type="button" class="btn  btn-danger">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                </td>
                <td>
                    <div class="btn-group"></div>
                    <button class="btn btn-primary update_btn" data-toggle="modal" data-target="#editModal"
                            delete_id="6"><span class="glyphicon glyphicon-edit" aria-hidden="true">修改</span></button>
                    <button class="btn btn-lock reset_btn" delete_id="6"><span class="glyphicon glyphicon-edit"
                                                                               aria-hidden="true">重置</span></button>
                    <button class="btn btn-danger delete_btn" delete_id="6"><span class="glyphicon glyphicon-remove"
                                                                                  aria-hidden="true">删除</span></button>
                </td>
            </tr>--%>
            </tbody>
            <tfoot>
            <%--<tr>
                <td class="tfoot row" colspan="6">
                    <div class="box">
                        <div class="left col-lg-4 text-left">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#addModal">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
                                </button>
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                                </button>
                            </div>
                        </div>
                        <div class="center col-lg-4 text-center">
                            <ul class="pagination" style="margin: 0;">
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">首页</span></a></li>
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">&laquo;</span></a></li>
                                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                <li class=""><a href="#">2 <span class="sr-only">(current)</span></a></li>
                                <li class=""><a href="#">3 <span class="sr-only">(current)</span></a></li>
                                <li class=""><a href="#">4 <span class="sr-only">(current)</span></a></li>
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">&raquo;</span></a></li>
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">尾页</span></a></li>
                            </ul>
                        </div>
                        <div class="right col-lg-4 text-right">
                            当前第<span>2</span>页，总<span>3</span>页，总<span>12</span>条记录
                        </div>
                    </div>
                </td>
            </tr>--%>
            </tfoot>
        </table>
    </div>
</div>

<footer class="footer">
    <p class="text-center">@2020 杭州职业技术学院 软件技术专业 软件1811 求琰锋</p>
</footer>
<!-- ---------------------------------------------- -->
<!-- -------------------模态框---------------------- -->
<!-- ----------------------------------------------- -->

<div class="modal fade" id="areaAdmin_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增院校管理员</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="" method="" id="areaAdmin_add_frm">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">用户名</label>
                        <div class="col-lg-10">
                            <input class="form-control" type="text" name="userName" id="userName_add_modal" value=""
                                   placeholder="请输入用户名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">密码</label>
                        <div class="col-lg-10">
                            <input class="form-control" type="password" name="userPassword" id="password_add_modal"
                                   placeholder="请输入密码"
                                   value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">省</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="provinceSelect_add_modal" title="请选择省" data-width="100%">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">市</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="citySelect_add_modal" title="请选择市" data-width="100%">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">院校</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="schoolSelect_add_modal" name="userAreaId" title="请选择院校"
                                    data-width="100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="help-block col-lg-10 col-lg-offset-2" style="color: red">

                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="areaAdmin_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 修改 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改院校管理员</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="" method="">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">用户名</label>
                        <div class="col-lg-10">
                            <input class="form-control" type="text" name="" id="" value="张三"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="">省</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="" title="请选择省" data-width="100%">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">市</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="" title="请选择市" data-width="100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">院校</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="" title="请选择院校" data-width="100%">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- js导入 -->
<script src="../commons/js/jquery-3.5.1.min.js"></script>
<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="../commons/js/com.js"></script>

<script>
    var currPage = $("#pn").val();
    $(function () {
        to_page(currPage);
    });

    /*构建tfoot*/
    function build_page_nav(result) {
        $("#areaAdmins-table tfoot").empty();
        /*左边的操作按钮组*/
        var addBtn = $("<button></button>").addClass("btn btn-default").attr("id", "areaAdmin_add_btn").attr("data-toggle", "modal").attr("data-target", "#areaAdmin_add_modal")
            .append($("<span></span>").addClass("glyphicon glyphicon-plus").attr("aria-hidden", "true")).append("添加");
        var delAllBtn = $("<button></button>").addClass("btn btn-default").attr("id", "areaAdmin_delete_all_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-remove").attr("aria-hidden", "true")).append("删除");

        var left = $("<div></div>").addClass("left col-lg-4 text-left").append($("<div class=\"btn-group\"></div>").append(addBtn).append(delAllBtn));
        var center = $("<div></div>").addClass("center col-lg-4 text-center");
        var right = $("<div></div>").addClass("right col-lg-4 text-center");

        right.append("当前第" + result.extend.pageInfo.pageNum + "页，总" + result.extend.pageInfo.pages + "页，总" + result.extend.pageInfo.total + "条记录");
        var pageUI = $("<ul></ul>").addClass("pagination").attr("style", "margin:0");
        /*首页*/
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        if (result.extend.pageInfo.isFirstPage) {
            firstPageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        pageUI.append(firstPageLi);
        /*前一页*/
        var PreviousPageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!result.extend.pageInfo.hasPreviousPage) {
            PreviousPageLi.addClass("disabled");
        } else {
            PreviousPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        pageUI.append(PreviousPageLi);

        /*12345*/
        $.each(result.extend.pageInfo.navigatepageNums, function (index, num) {
            var pageLi = $("<li></li>").append($("<a></a>").append(num));
            if (result.extend.pageInfo.pageNum === num) {
                pageLi.addClass("active");
            } else {
                pageLi.click(function () {
                    to_page(num);
                });
            }
            pageUI.append(pageLi);
        });

        /*后一页*/
        var NextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!result.extend.pageInfo.hasNextPage) {
            NextPageLi.addClass("disabled");
        } else {
            NextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }
        pageUI.append(NextPageLi);

        /*末页*/
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.isLastPage) {
            lastPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        pageUI.append(lastPageLi);
        center.append(pageUI);
        var box = $("<div class=\"box\"></div>").append(left).append(center).append(right);
        var ul = $("<td class=\"tfoot row\" colspan=\"6\"></td>").append(box);
        $("<tr></tr>").append(ul).appendTo("#areaAdmins-table tfoot");
    }


    /*构建表单*/
    function build_areaAdmins_table(result) {
        $("#areaAdmins-table tbody").empty();

        var areaAdmins = result.extend.pageInfo.list;
        $.each(areaAdmins, function (index, areaAdmin) {

            var checkbox = $("<td></td>").append($("<input>").attr({"type": "checkbox"}).addClass("check_item").val(areaAdmin.id));
            var name = $("<td></td>").append(areaAdmin.userName);
            var parentAreaList = '';
            var areaList = areaAdmin.area;
            while (areaList != null) {
                // console.log(areaList.areaName)
                parentAreaList = areaList.areaName + " " + parentAreaList;
                areaList = areaList.parentArea;
            }
            var area = $("<td></td>").append(parentAreaList);
            var userOperator = $("<td></td>").append(areaAdmin.userOperator.userName);
            var userOperatorTime = $("<td></td>").append(areaAdmin.userOperatorTime);

            var updateBtn = $("<button></button>").addClass("btn btn-primary update_btn").attr("data-toggle", "modal").attr("data-target", "#editModal").attr("delete_id", areaAdmin.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-edit").attr("aria-hidden", "true")).append("修改");
            var resetBtn = $("<button></button>").addClass("btn btn-lock reset_btn").attr("delete_id", areaAdmin.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-edit").attr("aria-hidden", "true")).append("重置密码");
            var delBtn = $("<button></button>").addClass("btn btn-danger delete_btn").attr("delete_id", areaAdmin.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove").attr("aria-hidden", "true")).append("删除");

            var operation = $("<td></td>").append($("<div class='btn-group'></div>").append(updateBtn).append(resetBtn).append(delBtn));

            var base = $("<tr></tr>").append(checkbox).append(name).append(area).append(userOperator).append(userOperatorTime).append(operation);
            $("#areaAdmins-table tbody").append(base);
        });
    }

    function to_page(pn) {
        $.ajax({
            url: "../user/areaAdmins",
            data: {"pn": pn},
            type: "GET",
            dataType: "json",
            beforeSend: function () {
                $("#areaAdmins-table tbody").empty();
                $("#areaAdmins-table tfoot").empty();
                $("#areaAdmins-table tbody").append("<tr><td colspan='6'>正在加载数据，请稍后...</td></tr>");
            },
            success: function (result) {
                if (result.code == 100) {
                    if(result.extend.pageInfo.total==0){
                        $("#areaAdmins-table tfoot").empty();
                        $("#areaAdmins-table tbody").empty();
                        $("#areaAdmins-table tbody").append("<tr><td colspan='6'>数据为空...</td></tr>");
                    }else{
                        //查询成功，解析并显示数据
                        //1、显示院校管理员信息
                        build_areaAdmins_table(result);
                        //显示分页信息
                        build_page_nav(result);
                        currPage = result.extend.pageInfo.pageNum;
                        $("#pn").val(currPage);
                        $("#checkAll").prop("checked", false);
                    }
                } else {
                    alert("获取信息失败")
                }
            },
            error: function () {
                $("#areaAdmins-table tbody").empty();
                $("#areaAdmins-table tfoot").empty();
                $("#areaAdmins-table tbody").append("<tr><td colspan='6'>查询出错，请稍后再试！</td></tr>");
            }
        });
    }

    /*全选*/
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item").length == $(".check_item:checked").length;
        $("#check_all").prop("checked", flag)
    })
    /*删除院校管理员*/
    $(document).on("click", ".delete_btn", function () {
        var userName = $(this).parents("tr").find("td:eq(1)").text();
        if (confirm("确认删除[" + userName + "]吗?")) {
            $.ajax({
                url: "../user/areaAdmin/" + $(this).attr("delete_id"),
                type: "DELETE",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    if (result.code == 100) {
                        to_page(1);
                    }
                }
            });
        }
    })
    /*删除所有选中管理员*/
    $(document).on("click", "#areaAdmin_delete_all_btn", function () {
        var userNames = "", ids = "";
        $.each($(".check_item:checked"), function () {
            userNames = userNames + $(this).parents("tr").find("td:eq(1)").text() + ",";
            ids = ids + $(this).parents("tr").find("td:eq(5)").find(".delete_btn").attr("delete_id") + "-";
        })
        userNames = userNames.substring(0, userNames.length - 1);
        ids = ids.substring(0, ids.length - 1);
        if (confirm("确认删除[" + userNames + "]吗?")) {
            $.ajax({
                url: "../user/areaAdmin/" + ids,
                type: "DELETE",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    if (result.code == 100) {
                        to_page(1);
                        $("#check_all").prop("checked", false);
                    }
                }
            });
        }
    })

    /*新增管理员*/
    function getAreaList(element, txt, parentId, selText) {
        var url = "list";
        if (parentId != null) {
            url = url + "?parentId=" + parentId;
        }
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function (result) {
                console.log(result)
                $(element).empty();
                if (txt != "") {
                    optionElement = $("<option></option>").append(txt).attr({"value": 0});
                    optionElement.append($(element));
                }
                $.each(result.extend.areaList, function (index, area) {
                    optionElement = $("<option></option>").append(area.areaName).attr({"value": area.id});
                    optionElement.appendTo($(element));
                });
                $(element).removeAttr("disabled");
                $(element).selectpicker("refresh");
                if (selText != "") {
                    $(element).next().prop("title", selText);
                    $(element).next().find("div.filter-option-inner-inner").html(selText);
                    $(element).next().removeClass("bs-placeholder");
                }
            }
        })
    }

    $(document).on("click", "#areaAdmin_add_btn", function () {
        getAreaList("#provinceSelect_add_modal", "", "", "");
        $("#areaAdmin_add_modal").modal({
            "backdrop": "static"
        });
    });
    /*省、市、院校联动*/
    $("#provinceSelect_add_modal").on("changed.bs.select", function () {
        $("#citySelect_add_modal").empty();
        $("#citySelect_add_modal").attr("disabled", "disabled");
        $("#citySelect_add_modal").selectpicker("refresh");
        $("#schoolSelect_add_modal").empty();
        $("#schoolSelect_add_modal").attr("disabled", "disabled");
        $("#schoolSelect_add_modal").selectpicker("refresh");
        getAreaList("#citySelect_add_modal", "", $(this).val(), "");
    });
    $("#citySelect_add_modal").on("changed.bs.select", function () {
        $("#schoolSelect_add_modal").empty();
        $("#schoolSelect_add_modal").attr("disabled", "disabled");
        $("#schoolSelect_add_modal").selectpicker("refresh");
        if ($(this).val() > 0) {
            getAreaList("#schoolSelect_add_modal", "", $(this).val(), "");
        }
    });
    /*模态框隐藏，重置窗体*/
    $(document).on('hidden.bs.modal', '.modal', function () {
        $("#areaAdmin_add_modal form")[0].reset();
        $("#areaAdmin_add_modal form").find("*").removeClass("has-error has-success");
        $("#areaAdmin_add_modal form").find(".help-block").text("");
        $(".modal .selectpicker").empty();
        $(".modal .selectpicker").attr("disabled", "disabled");
        $(".modal .selectpicker").selectpicker("refresh");
    });
    /*新增院校管理员模态框保存操作*/
    $("#areaAdmin_save_btn").click(function () {
        /*数据校验*/
        if (valid_modal()) {
            /*新增院校管理员的异步请求*/
            $.ajax({
                url: "../user/areaAdmin/",
                data: $("#areaAdmin_add_frm").serialize(),
                type: "post",
                dataType: "json",
                success: function (result) {
                    if (result.code == 100) {
                        $("#areaAdmin_add_modal").modal('hide');
                        alert("院校管理员添加成功！");
                        to_page(1);
                        $("#check_all").prop("checked", false);
                    } else {
                        //删除失败
                        alert(result.msg);
                    }
                }
            })
        }
    })

    function valid_modal() {
        var flag = true;
        var userName = $("#userName_add_modal").val();
        var password = $("#password_add_modal").val();
        var school = $("#schoolSelect_add_modal").val();
        if (userName == '') {
            $("#userName_add_modal").parent().addClass("has-error");
            $(".help-block").text("用户名不能为空");
            flag = false;
        } else if (password == '') {
            $("#password_add_modal").parent().addClass("has-error");
            $(".help-block").text("密码不能为空");
            flag = false;
        } else if (school == '') {
            $("#schoolSelect_add_modal").parent().addClass("has-error");
            $(".help-block").text("院校不能为空");
            flag = false;
        }
        return flag;
    }
</script>


</body>
</html>

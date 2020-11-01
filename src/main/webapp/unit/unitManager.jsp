<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%pageContext.setAttribute("App_Path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CIMS-院校首页</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../commons/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <!-- 自定义全局样式 -->
    <link rel="stylesheet" href="../commons/css/me.css">
    <style>
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
                <li><a href="unitIndex">首页</a></li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">单位管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="unitType">单位类型</a></li>
                        <li class="active"><a href="unitManager">单位管理</a></li>
                    </ul>
                </li>
                <li><a href="userManager">用户管理</a></li>
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
    <h3>单位管理</h3>
    <hr>
    <div class="row">
        <form action="" method="post">
            <div class="header">

                <div class="col-lg-5">
                    <label for="unitType_search_select">单位类型：</label>
                    <select class="selectpicker" id="unitType_search_select" data-width="70%" title="请选择单位类型">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-5" style="display: inline;">
                    <label for="unitName_search_input">单位名称：</label>
                    <input style="width: 70%;display: inline;" id="unitName_search_input" type="text"
                           class="form-control" placeholder="请输入单位名称">
                </div>
                <div class="col-lg-2">
                    <div class="form-group">
                        <div class="input-group" role="group">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary" id="search_btn"><span
                                        class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索</button>
                                <button type="button" class="btn btn-warning" id="reset_btn"><span
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
        <table class="unit-table table table-bordered table-striped" id="unit-table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" name="" id="check_all" value=""/>
                </th>
                <th>单位名称</th>
                <th>单位类型</th>
                <th>排序号</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
            </tfoot>
        </table>
    </div>
</div>


<footer class="footer">
    <p class="text-center">@2020 杭州职业技术学院 软件技术专业 软件1811 求琰锋</p>
</footer>

<!-- 新增 -->
<div class="modal fade" id="unit_add_modal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">添加单位</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="unit_add_frm">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="unitName_add_modal">单位名称</label>
                        <div class="col-lg-10">
                            <input class="form-control unitName_modal" type="text" name="unitName"
                                   id="unitName_add_modal"
                                   value="" onblur=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="unitSelect_add_modal">单位类型</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="unitSelect_add_modal" name="unitTypeId"
                                    title="请选择单位类型" data-width="100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="sortNum_add_modal">排序号</label>
                        <div class="col-lg-10">
                            <input class="form-control sortNum_modal" type="text" name="unitSortNum"
                                   id="sortNum_add_modal"
                                   value="" onblur=""/>
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
                <button type="button" class="btn btn-primary" id="unit_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--修改--%>
<div class="modal fade" id="unit_edit_modal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">修改单位</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="unit_edit_frm">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="unitName_edit_modal">单位名称</label>
                        <div class="col-lg-10">
                            <input class="form-control unitName_modal" type="text" name="unitName"
                                   id="unitName_edit_modal"
                                   value="" onblur=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="unitSelect_edit_modal">单位类型</label>
                        <div class="col-lg-10">
                            <input type="hidden" name="unitTypeIdOld" id="unitTypeIdOld">
                            <select class="selectpicker" id="unitSelect_edit_modal" name="unitTypeId"
                                    title="请选择单位类型" data-width="100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="sortNum_edit_modal">排序号</label>
                        <div class="col-lg-10">
                            <input class="form-control sortNum_modal" type="text" name="unitSortNum"
                                   id="sortNum_edit_modal"
                                   value="" onblur=""/>
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
                <button type="button" class="btn btn-primary" id="unit_edit_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--上传文件--%>
<div class="modal fade" id="unit_upload_modal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="uploadModalLabel">上传附件：</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="unit_import_frm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="unitFile_import_modal" class="col-lg-3 control-label">上传附件</label>
                        <div class="col-sm-9">
                            <input type="file" id="unitFile_import_modal" name="unitFile">
                            <p class="help-block">文件类型限定为csv文件，大小不超过2M</p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="upload_btn">导入</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- js导入 -->
<script src="../commons/js/jquery-3.5.1.min.js"></script>
<script src="../commons/js/Chart.js"></script>
<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="../commons/js/com.js"></script>

<script>
    var unitTypeId, unitName, pn, flag = true, currPage, edit_unitName;

    $(function () {
        to_page(pn);
        getUnitTypeList("#unitType_search_select", "全部类型", "", "");
    })

    function to_page(pn) {
        $.ajax({
            url: "units",
            data: {"unitTypeId": unitTypeId, "unitName": unitName, "pn": pn},
            type: "GET",
            dataType: "json",
            beforeSend: function () {
                $("#unit-table tbody").empty();
                $("#unit-table tfoot").empty();
                $("#unit-table tbody").append("<tr><td colspan='6'>正在加载数据，请稍后...</td></tr>");
            },
            success: function (result) {
                console.log(result)
                if (result.code == 100) {
                    if (result.extend.pageInfo.total == 0) {
                        $("#unit-table tfoot").empty();
                        $("#unit-table tbody").empty();
                        $("#unit-table tbody").append("<tr><td colspan='6'>数据为空...</td></tr>");
                    } else {
                        build_unit_table(result);
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
                $("#unit-table tbody").empty();
                $("#unit-table tfoot").empty();
                $("#unit-table tbody").append("<tr><td colspan='6'>查询出错，请稍后再试！</td></tr>");
            }
        });
    }

    /*构建表单*/
    function build_unit_table(result) {
        $("#unit-table tbody").empty();

        var unitTypes = result.extend.pageInfo.list;
        $.each(unitTypes, function (index, unitType) {
            var checkbox = $("<td></td>").append($("<input>").attr({"type": "checkbox"}).addClass("check_item").val(unitType.id));
            var unitName = $("<td></td>").append(unitType.unitName);
            var unitTypeName = $("<td></td>").append(unitType.unitTypeName);
            var unitSortNum = $("<td></td>").append(unitType.unitSortNum);
            var updateBtn = $("<button></button>").addClass("btn btn-primary edit_btn").attr("edit-id", unitType.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-edit").attr("aria-hidden", "true")).append("修改");
            var delBtn = $("<button></button>").addClass("btn btn-danger delete_btn").attr("delete-id", unitType.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove").attr("aria-hidden", "true")).append("删除");
            var operation = $("<td></td>").append($("<div class='btn-group'></div>").append(updateBtn).append(delBtn));
            var base = $("<tr></tr>").append(checkbox).append(unitName).append(unitTypeName).append(unitSortNum).append(operation);
            $("#unit-table tbody").append(base);
        });
    }

    function build_page_nav(result) {
        $("#unit-table tfoot").empty();
        /*左边的操作按钮组*/
        var addBtn = $("<button></button>").addClass("btn btn-default").attr("id", "unit_add_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-plus").attr("aria-hidden", "true")).append("添加");
        var delAllBtn = $("<button></button>").addClass("btn btn-default").attr("id", "unit_delete_all_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-remove").attr("aria-hidden", "true")).append("批量删除");
        var addMoreBtn = $("<button></button>").addClass("btn btn-default").attr("id", "unit_upload_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-download").attr("aria-hidden", "true")).append("批量导入");

        var left = $("<div></div>").addClass("left col-lg-4 text-left").append($("<div class=\"btn-group\"></div>").append(addBtn).append(delAllBtn).append(addMoreBtn));
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
        $("<tr></tr>").append(ul).appendTo("#unit-table tfoot");
    }

    /*获取下拉列表*/
    function getUnitTypeList(element, txt, selText) {
        $.ajax({
            url: "unitTypes",
            type: "GET",
            dataType: "json",
            success: function (result) {
                $(element).empty();
                if (txt != "") {
                    optionElement = $("<option></option>").append(txt).attr({"value": 0});
                    optionElement.appendTo($(element));
                }
                $.each(result.extend.unitTypes, function (index, unitType) {
                    optionElement = $("<option></option>").append(unitType.unitTypeName).attr({"value": unitType.id});
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

    /*搜索*/
    $("#search_btn").click(function () {
        if ($("#unitType_search_select").val() == "") {
            unitTypeId = 0;
        } else {
            unitTypeId = $("#unitType_search_select").val();
        }
        unitName = $("#unitName_search_input").val();
        to_page(pn);
    })
    /*重置*/
    $("#reset_btn").click(function () {
        getUnitTypeList("#unitType_search_select", "全部类型", "");
        $("#unitName_search_input").val("");
        unitTypeId = 0;
        unitName = "";
        to_page(pn);
    })

    /*删除院校管理员*/
    $(document).on("click", ".delete_btn", function () {
        var unitName = $(this).parents("tr").find("td:eq(1)").text();
        if (confirm("确认删除[" + unitName + "]吗?")) {
            $.ajax({
                url: "../unit/delUnit/" + $(this).attr("delete-id"),
                type: "DELETE",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    if (result.code == 100) {
                        to_page(1);
                        console.log("删除成功")
                    } else {
                        console.log("删除失败")
                    }
                }
            });
        }
    })

    /*删除所有选中管理员*/
    $(document).on("click", "#unit_delete_all_btn", function () {
        var unitNames = "", ids = "";
        $.each($(".check_item:checked"), function () {
            unitNames = unitNames + $(this).parents("tr").find("td:eq(1)").text() + ",";
            ids = ids + $(this).parents("tr").find("td:eq(4)").find(".delete_btn").attr("delete-id") + "-";
        })
        console.log(ids)
        unitNames = unitNames.substring(0, unitNames.length - 1);
        ids = ids.substring(0, ids.length - 1);
        if (confirm("确认删除[" + unitNames + "]吗?")) {
            $.ajax({
                url: "../unit/delUnit/" + ids,
                type: "DELETE",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    if (result.code == 100) {
                        to_page(1);
                        $("#check_all").prop("checked", false);
                        console.log("删除成功")
                    } else {
                        console.log("删除失败")
                    }
                }
            });
        }
    })

    /*增加*/
    $(document).on("click", "#unit_add_btn", function () {
        getUnitTypeList("#unitSelect_add_modal", "", "");
        $("#unit_add_modal").modal({
            "backdrop": "static"
        });
    });

    /*模态框隐藏，重置窗体*/
    $(document).on('hidden.bs.modal', '.modal', function () {
        $(".modal form")[0].reset();
        $(".modal form").find("*").removeClass("has-error has-success");
        $(".modal form").find(".help-block").text("");
        $(".modal .selectpicker").empty();
        $(".modal .selectpicker").attr("disabled", "disabled");
        $(".modal .selectpicker").selectpicker("refresh");
    });
    /*添加*/
    $("#unit_save_btn").click(function () {
        var unit_name = $("#unitName_add_modal").val();
        var sortNum = $("#sortNum_add_modal").val();
        var unitSelect = $("#unitSelect_add_modal").val();
        if(unit_name == '' || sortNum == '' || unitSelect == ""){
            flag = false;
        }else{
            flag = true;
        }
        /*数据校验*/
        if (flag) {
            /*新增院校管理员的异步请求*/
            $.ajax({
                url: "unit",
                data: $("#unit_add_frm").serialize(),
                type: "post",
                dataType: "json",
                success: function (result) {
                    if (result.code == 100) {
                        $("#unit_add_modal").modal('hide');
                        alert("单位添加成功！");
                        to_page(1);
                        $("#check_all").prop("checked", false);
                    } else {
                        alert("添加失败");
                    }
                }
            })
        } else {
            alert("请输入数据")
        }
    })

    /*修改前获取数据*/
    $(document).on("click", ".edit_btn", function () {
        $.ajax({
            url: "getUnit",
            data: {id: $(this).attr("edit-id")},
            type: "GET",
            dataType: "json",
            success: function (result) {
                console.log(result)
                if (result.code == 100) {
                    console.log(result)
                    $("#unitName_edit_modal").val(result.extend.unit.unitName);
                    edit_unitName = result.extend.unit.unitName;
                    $("#unitTypeIdOld").val(result.extend.unit.unitTypeId)
                    getUnitTypeList("#unitSelect_edit_modal", "", result.extend.unit.unitTypeName);
                    $("#sortNum_edit_modal").val(result.extend.unit.unitSortNum)
                }
            }
        });
        $("#unit_edit_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#unit_edit_modal").modal({
            "backdrop": "static"
        });
    });
    /*修改*/
    $("#unit_edit_btn").click(function () {
        var unit_name = $("#unitName_edit_modal").val();
        var sortNum = $("#sortNum_edit_modal").val();
        if(unit_name == '' || sortNum == ''){
            flag = false;
        }else{
            flag = true;
        }
        /*数据校验*/
        if (flag) {
            /*新增院校管理员的异步请求*/
            $.ajax({
                url: "unit/" + $(this).attr("edit-id"),
                data: $("#unit_edit_frm").serialize(),
                type: "put",
                dataType: "json",
                success: function (result) {
                    if (result.code == 100) {
                        $("#unit_edit_modal").modal('hide');
                        alert("单位修改成功！");
                        to_page(1);
                        $("#check_all").prop("checked", false);
                    } else {
                        alert("修改失败");
                    }
                }
            })
        } else {
            alert("您未修改！")
        }
    })

    /*上传*/
    $(document).on("click", "#unit_upload_btn", function () {
        $("#unit_upload_modal").modal({
            "backdrop": "static"
        });
    });

    $("#upload_btn").click(function () {

        const formData = new FormData($("#unit_import_frm")[0]);
        $.ajax({
            url: "fileImport",
            type: "POST",
            data: formData,
            dataType: "json",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                console.log(result)
                if(result.code == 100){
                    $("#unit_upload_modal").modal("hide");
                    alert("单位信息批量导入成功！")
                    to_page(1)
                    $("#check_all").prop("checked", false);
                }else{
                    alert(result.extend.msg)
                }
            }
        })
    })
</script>


</body>
</html>

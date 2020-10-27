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


<!-- js导入 -->
<script src="../commons/js/jquery-3.5.1.min.js"></script>
<script src="../commons/js/Chart.js"></script>
<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="../commons/js/com.js"></script>

<script>
    var unitTypeId, unitName, pn;

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
            var unitTypeName = $("<td></td>").append(unitType.unitType.unitTypeName);
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
        var addMoreBtn = $("<button></button>").addClass("btn btn-default").attr("id", "unit_delete_all_btn")
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
</script>


</body>
</html>

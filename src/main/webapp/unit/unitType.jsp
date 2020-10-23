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
                <li><a href="unitIndex">首页</a></li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">单位管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="unitType">单位类型</a></li>
                        <li><a href="unitManager">单位管理</a></li>
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
    <h3>单位类型</h3>
    <hr>
    <div class="padding-xl">
        <table class="unit-table table table-bordered table-striped" id="unitType-table">
            <thead>
            <tr>
                <th>类型编号</th>
                <th>类型名称</th>
                <th>排序号</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
            <tr>
                <td class="tfoot row" colspan="5">
                    <div class="box">
                        <div class="left col-lg-6 text-left">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#addModal">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                                </button>
                            </div>
                        </div>

                        <div class="right col-lg-6 text-right">
                            总<span>5</span>条记录
                        </div>
                    </div>
                </td>
            </tr>
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
    $(function () {
        getList();
    });

    function getList() {
        $.ajax({
            url: "unitTypes",
            type: "GET",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    console.log(result)
                    build_unitTypes_table(result);
                    build_page_nav(result);
                } else {
                    alert("获取信息失败")
                }
            }
        });
    }

    function build_unitTypes_table(result) {
        $("#unitType-table tbody").empty();

        var unitTypes = result.extend.unitTypes;
        console.log(unitTypes);

        $.each(unitTypes, function (index, unitType) {
            var number = $("<td></td>").append(unitType.id);
            var unitTypeName = $("<td></td>").append(unitType.unitTypeName);
            var unitTypeSortNum = $("<td></td>").append(unitType.unitTypeSortNum);

            var updateBtn = $("<button></button>").addClass("btn btn-primary edit_btn").attr("data-toggle", "modal").attr("data-target", "#areaAdmin_edit_modal").attr("edit-id", unitType.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-edit").attr("aria-hidden", "true")).append("修改");
            var delBtn = $("<button></button>").addClass("btn btn-danger delete_btn").attr("delete-id", unitType.id)
                .append($("<span></span>").addClass("glyphicon glyphicon-remove").attr("aria-hidden", "true")).append("删除");

            var operation = $("<td></td>").append($("<div class='btn-group'></div>").append(updateBtn).append(delBtn));

            var base = $("<tr></tr>").append(number).append(unitTypeName).append(unitTypeSortNum).append(operation);
            $("#unitType-table tbody").append(base);
        });
    }

    function build_page_nav(result) {
        $("#unitType-table tfoot").empty();
        var addBtn = $("<button></button>").addClass("btn btn-default").attr("id", "areaAdmin_add_btn").attr("data-toggle", "modal").attr("data-target", "#areaAdmin_add_modal")
            .append($("<span></span>").addClass("glyphicon glyphicon-plus").attr("aria-hidden", "true")).append("添加");
        var left = $("<div></div>").addClass("left col-lg-6 text-left").append($("<div class=\"btn-group\"></div>").append(addBtn));
        var right = $("<div></div>").addClass("right col-lg-6 text-right").append($("<span></span>").append("总" + result.extend.unitTypeCount + "条记录"));
        var box = $("<td></td>").addClass("tfoot row").attr("colspan", "5").append($("<div></div>").addClass("box").append(left).append(right))
        var base = $("<tr></tr>").append(box);
        $("#unitType-table tfoot").append(base);

    }
</script>
</body>
</html>

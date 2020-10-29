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
        .panel-content {
            min-height: 190px;
        }

        .jumbotron {
            margin-top: 50px;
        }

        select {

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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">单位管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="unitType">单位类型</a></li>
                        <li class=""><a href="unitManager">单位管理</a></li>
                    </ul>
                </li>
                <li class="active"><a href="userManager">用户管理</a></li>
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
    <h3>用户管理</h3>
    <hr>
    <div class="row">
        <form action="" method="post">
            <div class="header">

                <div class="col-lg-4">
                    <label for="">单位类型：</label>
                    <select class="selectpicker" data-width="70%" title="请选择单位类型">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-4">
                    <label for="">单位名称：</label>
                    <select class="selectpicker" data-width="70%" title="请选择单位名称">
                        <option>Mustard</option>
                    </select>
                </div>
                <div class="col-lg-4">
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
        <table class="user-table table table-bordered table-striped">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" name="" id="" value=""/>
                </th>
                <th>用户名</th>
                <th>所属单位</th>
                <th>操作人</th>
                <th>操作时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox" name="" id="" value=""/></td>
                <td>张三</td>
                <td>信息工程学院 1号楼</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn" style="background-color:#D4D4D4" data-toggle="modal"
                                data-target="#distModal">
                            <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>单位分配
                        </button>
                        <button type="button" class="btn  btn-warning">
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
                <td>信息工程学院 1号楼</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn" style="background-color:#D4D4D4" data-toggle="modal"
                                data-target="#distModal">
                            <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>单位分配
                        </button>
                        <button type="button" class="btn  btn-warning">
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
                <td>信息工程学院 1号楼</td>
                <td>admin</td>
                <td>2020-9-16 17:14</td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn" style="background-color:#D4D4D4" data-toggle="modal"
                                data-target="#distModal">
                            <span class="glyphicon glyphicon-signal" aria-hidden="true"></span>单位分配
                        </button>
                        <button type="button" class="btn  btn-warning">
                            <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>重置密码
                        </button>
                        <button type="button" class="btn  btn-danger">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                </td>
            </tr>

            </tbody>
            <tfoot>
            <tr>
                <td class="tfoot row" colspan="6">
                    <div class="box">
                        <div class="left col-lg-4 text-left">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#addModal">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
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
            </tr>
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

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addModalLabel">新增院校管理员</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="" method="">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">用户名</label>
                        <div class="col-lg-10">
                            <input class="form-control" type="text" name="" id="" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">密码</label>
                        <div class="col-lg-10">
                            <input class="form-control" type="password" name="" id="" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">省</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择省" data-width="100%">
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">市</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择市" data-width="100%">
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">院校</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择院校" data-width="100%">
                                <option>1</option>
                                <option>2</option>
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
                        <label class="col-lg-2 control-label">省</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择省" data-width="100%">
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">市</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择市" data-width="100%">
                                <option>1</option>
                                <option>2</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">院校</label>
                        <div class="col-lg-10">
                            <select class="selectpicker" id="type" title="请选择院校" data-width="100%">
                                <option>1</option>
                                <option>2</option>
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
<!-- 单位分配-->
<div class="modal fade" id="distModal" tabindex="-1" role="dialog" aria-labelledby="distModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="distModalLabel">单位分配</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="" method="">
                    <div class="form-group">
                        <label class="col-lg-2 control-label">用户名</label>
                        <div class="col-lg-10">
                            <input class="form-control" placeholder="请输入用户名" type="text" name="" id="" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label">所属单位</label>
                        <div class="col-lg-10">
                            <div class="row panel-content">
                                <!--  -->
                                <div class="col-lg-6 ">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" data-toggle="collapse" href="#collegeBodyOne">
                                            <input type="checkbox" class="" name="" id="xueyuan" value=""/>
                                            学院
                                        </div>
                                        <div id="collegeBodyOne" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="collegeList">
                                                    <label for="xinxi"><input type="checkbox" name="" id="xinxi"
                                                                              value=""/>信息学院</label>
                                                    <label for="dali"><input type="checkbox" name="" id="dali"
                                                                             value=""/>达利学院</label>
                                                    <label for="jidian"><input type="checkbox" name="" id="jidian"
                                                                               value=""/>机电学院</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--  -->
                                <div class="col-lg-6 ">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" data-toggle="collapse" href="#collegeBodyTwo">
                                            <input type="checkbox" class="" name="" id="xueyuan" value=""/>
                                            学院
                                        </div>
                                        <div id="collegeBodyTwo" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="collegeList">
                                                    <label for="xinxi"><input type="checkbox" name="" id="xinxi"
                                                                              value=""/>信息学院</label>
                                                    <label for="dali"><input type="checkbox" name="" id="dali"
                                                                             value=""/>达利学院</label>
                                                    <label for="jidian"><input type="checkbox" name="" id="jidian"
                                                                               value=""/>机电学院</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--  -->
                            </div>
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
<script type="text/javascript">
    $("#xueyuan").click(function (event) {
        event.stopPropagation()
    })
    $(window).scroll(function () {
        var scrollTop = $(this).scrollTop();//滚动条距离顶部的高度
        var windowHeight = $(this).height();//可视区高度
        var scrollHeight = $(document).height();//整个文档的高度
        if (scrollTop + windowHeight + 1 >= scrollHeight)
            console.log('到底了')
    });

    var unitTypeId,unitId, userName, pn, flag = true, currPage, edit_unitName;

    $(function () {
        to_page(pn);
    })

    function to_page(pn) {
        $.ajax({
            url: "../user/units",
            data: {"unitTypeId": unitTypeId,"unitId":unitId,"userName": userName, "pn": pn},
            type: "GET",
            dataType: "json",
            beforeSend: function () {
                $("#user-table tbody").empty();
                $("#user-table tfoot").empty();
                $("#user-table tbody").append("<tr><td colspan='6'>正在加载数据，请稍后...</td></tr>");
            },
            success: function (result) {
                console.log(result)
                if (result.code == 100) {
                    if (result.extend.pageInfo.total == 0) {
                        $("#user-table tfoot").empty();
                        $("#user-table tbody").empty();
                        $("#user-table tbody").append("<tr><td colspan='6'>数据为空...</td></tr>");
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
                $("#user-table tbody").empty();
                $("#user-table tfoot").empty();
                $("#user-table tbody").append("<tr><td colspan='6'>查询出错，请稍后再试！</td></tr>");
            }
        });
    }


</script>
</body>
</html>

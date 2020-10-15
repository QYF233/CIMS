<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%pageContext.setAttribute("App_Path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CIMS-院校管理</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="../commons/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <!-- 自定义全局样式 -->
    <link rel="stylesheet" href="../commons/css/me.css">

    <style>
        .jumbotron {
            margin-top: 100px;
        }

        .operation {
            height: 40px;
            margin-bottom: 20px;
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
                <li class="active"><a href="areaManager">院校管理</a></li>
                <li><a href="areaAdminManager">院校管理员管理</a></li>
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
    <h3>院校管理</h3>
    <hr>
    <div class="row">
        <div class="col-lg-4">
            <div class="operation text-center">
                <button type="button" class="btn btn-primary" id="add_area_btn"><span class="glyphicon glyphicon-plus"
                                                                                      aria-hidden="true"></span>添加
                </button>
                <button type="button" class="btn btn-danger" id="delete_area_btn"><span
                        class="glyphicon glyphicon-remove"
                        aria-hidden="true"></span>删除
                </button>
            </div>
            <div class="sidebar">
                <div id="area_tree"></div>
            </div>
        </div>
        <div class="col-lg-8">
            <div id="add_area_div">
                <h4>添加院校</h4>
                <hr>
                <div class="row">
                    <form class="form-horizontal" action="" method="get" id="add_area_frm">
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaParentName_add_input">父节点</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaParentId" id="areaParentId_add_input">
                                <input class="form-control" type="text" id="areaParentName_add_input" value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaName_add_input">名称</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="areaName" id="areaName_add_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaType_add_select">类型</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaType" id="areaType_add_input">
                                <select class="selectpicker" id="areaType_add_select" title="请选择类型" data-width="100%">
                                    <option>省</option>
                                    <option>市</option>
                                    <option>院校</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaSortNumber_add_input">排序号</label>
                            <div class="col-lg-10 areaSortNum_input">
                                <input class="form-control" type="text" name="areaSortNum" id="areaSortNumber_add_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" id="submit_add_btn"><span
                                    class="glyphicon glyphicon-download-alt"
                                    aria-hidden="true"></span>保存
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="modify_area_div">
                <h4>修改</h4>
                <hr>
                <div class="row">
                    <form class="form-horizontal" action="" method="get" id="modify_area_frm">

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaParentName_modify_input">父节点</label>
                            <div class="col-lg-10">
                                <%--父节点id--%>
                                <input type="hidden" name="areaParentId" id="areaParentId_modify_input">
                                <input class="form-control" type="text" name="" id="areaParentName_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaName_modify_input">名称</label>
                            <div class="col-lg-10">
                                <input class="form-control" type="text" name="areaName" id="areaName_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaType_modify_select">类型</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="areaType" id="areaType_modify_input">
                                <select class="selectpicker" id="areaType_modify_select" title="请选择类型"
                                        data-width="100%">
                                    <option>省</option>
                                    <option>市</option>
                                    <option>院校</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="areaSortNumber_modify_input">排序号</label>
                            <div class="col-lg-10 areaSortNum_input">
                                <input class="form-control" type="text" name="areaSortNum"
                                       id="areaSortNumber_modify_input"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" class="btn btn-primary" id="submit_modify_btn">
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>修改
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <p class="text-center">@2020 杭州职业技术学院 软件技术专业 软件1811 求琰锋</p>
</footer>


<!-- js导入 -->
<script src="../commons/js/jquery-3.5.1.min.js"></script>
<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="../commons/js/com.js"></script>
<script type="text/javascript">
    $(function () {
        loadAreaTree();
        $("#add_area_div").hide();//添加的div
        $("#modify_area_div").hide();//修改的div
    })

    function loadAreaTree() {
        const treeData = [{
            text: "院校配置",
            id: 0,
            areaType: 0,
            nodes: []
        }];
        $.ajax({
            url: "tree",
            dataType: "json",
            type: "GET",
            success: function (result) {
                treeData[0].nodes = result.extend.areas;
                console.log(result);
                $('#area_tree').treeview({
                    data: treeData,
                    levels: 2,
                    onNodeSelected: function (event, node) {
                        console.log("************************")
                        $("#add_area_frm")[0].reset();//添加的form
                        $("#add_area_div").hide();//添加的div
                        $("#modify_area_frm")[0].reset();//修改的form
                        $("#modify_area_div").hide();//修改的div

                        $("#add_area_btn").attr("disabled", "disabled");//添加按钮
                        $("#delete_area_btn").attr("disabled", "disabled");//删除按钮


                        if (node.areaType < 3) {
                            $("#add_area_btn").removeAttr("disabled")
                        }

                        if (node.areaType > 0) {
                            $("#delete_area_btn").removeAttr("disabled");
                            $("#modify_area_div").show();
                            var parentNode = $("#area_tree").treeview("getParent", node);
                            $("#areaParentName_modify_input").val(parentNode.text);
                            /*省份的节点parentId为null*/
                            if (parentNode.id === 0) {
                                $("#areaParentId_modify_input").val(null);
                            } else {
                                $("#areaParentId_modify_input").val(parentNode.id);
                            }
                            $("#areaName_modify_input").val(node.text);
                            var areaOptions = ['省', '市', '院校'];
                            $("#areaType_modify_select").attr("disabled", "disabled");
                            $("#areaType_modify_select").selectpicker('val', areaOptions[node.areaType - 1]);
                            $("#areaType_modify_input").val(node.areaType);
                            console.log(node.areaType)
                            $("#areaSortNumber_modify_input").val(node.areaSortNum);
                            $("#submit_modify_btn").attr("edit-id", node.id);
                        }

                    },
                    onNodeUnselected: function (event, node) {
                        $("#add_area_frm")[0].reset();
                        $("#add_area_div").hide();
                        $("#modify_area_frm")[0].reset();
                        $("#modify_area_div").hide();

                        $("#add_area_btn").attr("disabled", "disabled");
                        $("#delete_area_btn").attr("disabled", "disabled");
                    }
                });
            }
        });
        /*****************************添加******************************/
        $("#add_area_btn").click(function () {
            var nodesSelected = $("#area_tree").treeview("getSelected");
            var count = Object.keys(nodesSelected).length;
            if (count > 0) {
                $("#add_area_frm")[0].reset();
                $("#add_area_div").hide();
                $("#modify_area_frm")[0].reset();
                $("#modify_area_div").hide();

                $("#add_area_div").show();
                $("#areaParentName_add_input").val(nodesSelected[0].text);
                $("#areaParentId_add_input").val(nodesSelected[0].id);
                $("#areaType_add_select").selectpicker('val', [nodesSelected[0].areaType + 1]);
            } else {
                alert("请选择需要添加的节点！");
            }
        });

        /**********添加验证**********/
        function validateAdd() {
            var flag = true;
            var reg = /^(\d+)$/;
            var areaParentName = $("#areaParentName_add_input").val();
            var areaName = $("#areaName_add_input").val();
            var areaType = $("#areaType_add_select").selectpicker('val')
            var areaSortNumber = $("#areaSortNumber_add_input").val();
            if (areaParentName === "院校配置") {
                $("#areaParentId_add_input").val(null)
            }
            if (areaParentName == null || areaName == null || !reg.test(areaSortNumber) || areaType == null) {
                show_validation_msg(".areaSortNum_input","error","请输入排序号")
                flag = false;
            }
            /*将select选中的id绑定到隐藏域*/
            var areaTypeId;
            if (areaType === "省")
                areaTypeId = 1;
            if (areaType === "市")
                areaTypeId = 2;
            if (areaType === "院校")
                areaTypeId = 3;

            $("#areaType_add_input").val(areaTypeId);
            return flag;
        }

        /**********修改验证**********/
        function validateUpdate() {
            var flag = true;
            var reg = /^(\d+)$/;
            var areaParentName = $("#areaParentName_modify_input").val();

            var areaName = $("#areaName_modify_input").val();
            var areaType = $("#areaType_modify_select").selectpicker('val');
            var areaSortNumber = $("#areaSortNumber_modify_input").val();
            if (areaParentName == null || areaName == null || !reg.test(areaSortNumber) || areaType == null) {
                flag = false;
            }

            /*将select选中的id绑定到隐藏域*/
            var areaTypeId;
            if (areaType === "省")
                areaTypeId = 1;
            if (areaType === "市")
                areaTypeId = 2;
            if (areaType === "院校")
                areaTypeId = 3;

            $("#areaType_modify_input").val(areaTypeId);
            return flag;
        }

        /**********添加**********/
        $("#submit_add_btn").click(function () {

            if (validateAdd()) {
                //添加
                $.ajax({
                    url: "school",
                    data: $("#add_area_frm").serialize(),
                    type: "post",
                    dataType: "json",
                    success: function (result) {
                        console.log(result);
                        if (result.code === 100) {
                            //添加成功，刷新所有地域信息
                            alert("添加成功！");
                            loadAreaTree();
                            // $('#area_tree').treeview("refresh");
                            // $( '#area_tree' ).treeview( 'toggleNodeExpanded' , [ 2, { silent: true } ]);
                        } else {
                            alert("请选择需要添加的节点！");
                        }
                    }
                });
            } else {
                alert("不能为空或字符类型不匹配。添加失败！");
            }
        });

        /**********修改**********/
        $("#submit_modify_btn").click(function () {
            console.log(validateUpdate())
            var parentId = $("#areaParentId_modify_input")
            if (validateUpdate()) {
                //修改
                $.ajax({
                    url: "school/" + $(this).attr("edit-id"),
                    data: $("#modify_area_frm").serialize(),
                    type: "put",
                    dataType: "json",
                    success: function (result) {
                        if (result.code === 100) {
                            //修改成功，刷新所有地域信息
                            alert("修改成功！");
                            loadAreaTree();
                        }
                    }
                });
            } else {
                alert("修改失败！");
            }

        });

        /**********删除**********/
        $("#delete_area_btn").click(function () {
            //判断是否有地域选中
            var nodesSelected = $("#area_tree").treeview("getSelected");
            if (nodesSelected.length === 0) {
                alert("请选择需要删除的院校！");
                return;
            }
            var delete_id = nodesSelected[0].id;
            $.ajax({
                url: "school/" + delete_id,
                type: "delete",
                data: $("#modify_area_frm").serialize(),
                dataType: "json",
                success: function (result) {
                    if (result.code === 100) {
                        //删除成功，刷新所有地域信息
                        alert("删除成功院校！");
                        loadAreaTree();
                    } else {
                        alert("删除失败！");
                    }
                }
            });
        })

    }

</script>
</body>
</html>

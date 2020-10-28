<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%pageContext.setAttribute("App_Path", request.getContextPath());%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CIMS</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="commons/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
    <!-- 自定义全局样式 -->
    <link rel="stylesheet" href="commons/css/me.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">CIMS-校园即时通系统</a>
        </div>
    </div>
</nav>
<!-- /container -->
<div class="container">
    <div class="row main">
        <div class="col-lg-4 col-lg-offset-4">
            <form class="form" action="">
                <h2 class="text-center">欢迎登录</h2>
                <div class="form-group has-feedback">
                    <label class="sr-only" for="username">用户名</label>
                    <div class="input-group username-input">
                        <div class="input-group-addon">用户名</div>
                        <input type="text" class="form-control" id="username" name="userName" placeholder="请输入用户名"
                               aria-describedby="inputSuccess2Status">
                        <span id="inputSuccess2Status" class="glyphicon glyphicon-ok form-control-feedback hidden"
                              aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="password">密码</label>
                    <div class="input-group password-input">
                        <div class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码</div>
                        <input type="password" class="form-control" id="password" name="userPassword"
                               placeholder="请输入密码">
                        <div class="input-group-addon" id="eye"><span id="icon"
                                                                      class="glyphicon glyphicon-eye-open"></span></div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" id="login-btn" style="width: 100%;">登录</button>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-warning-sign" aria-hidden="true">&nbsp;<span
                            class="msg"></span></span>
                </div>
            </form>
        </div>
    </div>

</div>

<footer class="footer">
    <p class="text-center">@2020 杭州职业技术学院 软件技术专业 软件1811 求琰锋</p>
</footer>

<!-- js导入 -->
<script src="commons/js/jquery-3.5.1.min.js"></script>
<script src="commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
<script src="commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
<script src="commons/js/com.js"></script>

<script>

    $("body").keydown(function () {

        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#login-btn').click();//换成按钮的id即可
        }
    });

    var flag = true;
    $(function () {
        $(".glyphicon-warning-sign").hide();
        $('#eye').click(function () {
            if (flag) {
                $('#icon').addClass("glyphicon-eye-close").removeClass("glyphicon-eye-open");
                $('#password').attr("type", "text");
                flag = false;
            } else {
                $('#icon').addClass("glyphicon-eye-open").removeClass("glyphicon-eye-close");
                $('#password').attr("type", "password");
                flag = true;
            }
        })
    });
    //
    $("#login-btn").click(function () {

        if ($("#username").val() === "") {
            $("#username").focus();
            show_validation_msg(".username-input", "error", "请输入用户名");
        } else if ($("#password").val() === "") {
            $("#password").focus();
            show_validation_msg(".password-input", "error", "请输入密码");
        } else {
            /*登录请求*/
            $.ajax({
                url: "user/login",
                data: $("form").serialize(),
                type: "POST",
                dataType: "json",
                success: function (result) {
                    console.log(result)
                    if (result.code === 100) {
                        $("#login-btn").html("正在登录中...");
                        setTimeout(function () {
                            window.location.href = result.target;
                        }, 500)
                    } else {
                        if (result.extend.fieldErrors== "密码错误") {
                            show_validation_msg(".password-input", "error", "密码错误");
                        } else {
                            show_validation_msg(".username-input", "error", "用户不存在");
                        }
                    }
                }
            })

        }

    })


</script>
</body>
</html>

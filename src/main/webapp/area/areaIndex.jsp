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
		<link rel="stylesheet" href="../commons/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
		<link rel="stylesheet" href="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
		<link rel="stylesheet" href="../commons/bootstrap-select-1.13.9/dist/css/bootstrap-select.css">
		<!-- 自定义全局样式 -->
		<link rel="stylesheet" href="../commons/css/me.css">
		<style>
			.jumbotron{
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
						<li class="active"><a href="areaIndex">首页</a></li>
						<li><a href="areaManager">院校管理</a></li>
						<li><a href="areaAdminManager">院校管理员管理</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>平台管理员：admin</a></li>
						<li><a href="../"><span class="glyphicon glyphicon-log-out"></span>注销</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- /container -->
		<div class="container">
			<div class="jumbotron">
				<div><h1><small>校园即时通系统</small>&nbsp;云管理平台</h1></div>
				<div>
					<h2><small>接入地区：</small></h2>
					<div id="">
						10个
					</div>
				</div>
				<div>
					<h2><small>接入城市：</small></h2>
					<div id="">
						100个
					</div>
				</div>
				<div>
					<h2><small>接入院校：</small></h2>
					<div id="">
						1000个
					</div>
				</div>
				<div>
					<h2><small>使用用户：</small></h2>
					<div id="">
						1000名
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
	</body>
</html>

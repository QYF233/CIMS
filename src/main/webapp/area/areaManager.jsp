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
			.jumbotron{
				margin-top: 100px;
			}
			.operation{
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
						<li><a href="areaIndex.html">首页</a></li>
						<li class="active"><a href="areaManager.html">院校管理</a></li>
						<li><a href="areaAdminManager.html">院校管理员管理</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>平台管理员：admin</a></li>
						<li><a href="../login.html"><span class="glyphicon glyphicon-log-out"></span>注销</a></li>
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
						<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加</button>
						<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</button>
					</div>
					<div class="sidebar">
						<div id="tree"></div>
					</div>
				</div>
				<div class="col-lg-8">
					<div id="">
						<h4>添加院校</h4>
						<hr>
						<div class="row">
							<form class="form-horizontal" action="" method="">
								<div class="form-group">
									<label class="col-lg-2 control-label">父节点</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">名称</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">类型</label>
									<div class="col-lg-10">
										<select class="selectpicker" id="type" title="请选择类型" data-width="100%">
											<option>1</option>
											<option>2</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">排序号</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group text-center">
									<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>保存</button>
								</div>
							</form>
						</div>
					</div>
					<div id="">
						<h4>修改</h4>
						<hr>
						<div class="row">
							<form class="form-horizontal" action="" method="">
								<div class="form-group">
									<label class="col-lg-2 control-label">父节点</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">名称</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">类型</label>
									<div class="col-lg-10">
										<select class="selectpicker" id="type" title="请选择类型" data-width="100%">
											<option>1</option>
											<option>2</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">排序号</label>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="" id="" value="" />
									</div>
								</div>
								<div class="form-group text-center">
									<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>保存</button>
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
		<script type="text/javascript">
			function getTree() {
				var tree = [{
						text: "院系配置",
						nodes: [{
								text: "浙江省",
								nodes: [{
										text: "杭州市"
									},
									{
										text: "宁波市"
									},
									{
										text: "温州市"
									}
								]
							},
							{
								text: "江苏省",
								nodes: [{
										text: "南京市"
									},
									{
										text: "苏州市"
									}
								]
							},
							{
								text: "安徽省",
								nodes: [{
									text: "合肥市"
								}, ]
							},
						]
					},

				];
				return tree;
			}
			$("#tree").treeview({
				data: getTree()
			});
		</script>
	</body>
</html>

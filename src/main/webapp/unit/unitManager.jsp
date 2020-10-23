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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">单位管理
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="unitType">单位类型</a></li>
								<li class="active"><a href="unitManager">单位管理</a></li>
							</ul>
						</li>
						<li><a href="userManager">用户管理</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>平台管理员：<span id="loginUser_nav"></span></a></li>
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
							<label for="">单位类型：</label>
							<select class="selectpicker" data-width="70%" title="请选择单位类型">
								<option>Mustard</option>
							</select>
						</div>
						<div class="col-lg-5" style="display: inline;">
							<label for="">单位名称：</label>
							<input style="width: 70%;display: inline;" type="text" class="form-control" placeholder="请输入单位名称">
							<!-- <select class="selectpicker" data-width="70%" title="请选择单位名称">
								<option>Mustard</option>
							</select> -->
						</div>
						<div class="col-lg-2">
							<div class="form-group">
								<div class="input-group" role="group">
									<!-- <input type="text" class="form-control" placeholder="请输入用户名"> -->
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索</button>
										<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<hr>
			<div class="">
				<table class="area-table table table-bordered table-striped">
					<thead>
						<tr>
							<th>
								<input type="checkbox" name="" id="" value="" />
							</th>
							<th>单位名称</th>
							<th>单位类型</th>
							<th>排序号</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><input type="checkbox" name="" id="" value="" /></td>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
									</button>
									<button type="button" class="btn  btn-danger">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
									</button>
								</div>
							</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="" id="" value="" /></td>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
									</button>
									<button type="button" class="btn  btn-danger">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="" id="" value="" /></td>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#editModal">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>修改
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
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
											</button>
											<button type="button" class="btn btn-default">
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>批量删除
											</button>
											<button type="button" class="btn btn-default">
												<span class="glyphicon glyphicon-download" aria-hidden="true"></span>批量导入
											</button>
										</div>
									</div>
									<div class="center col-lg-4 text-center">
										<ul class="pagination" style="margin: 0;">
											<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
											<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
											<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
											<li class=""><a href="#">2 <span class="sr-only">(current)</span></a></li>
											<li class=""><a href="#">3 <span class="sr-only">(current)</span></a></li>
											<li class=""><a href="#">4 <span class="sr-only">(current)</span></a></li>
											<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
											<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">尾页</span></a></li>
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


		<!-- js导入 -->
		<script src="../commons/js/jquery-3.5.1.min.js"></script>
		<script src="../commons/js/Chart.js"></script>
		<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
		<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
		<script src="../commons/js/com.js"></script>
	</body>
</html>

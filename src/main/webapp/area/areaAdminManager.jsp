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
						<li><a href="areaIndex">首页</a></li>
						<li><a href="areaManager">院校管理</a></li>
						<li class="active"><a href="areaAdminManager">院校管理员管理</a></li>
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
			<h3>院校管理员管理</h3>
			<hr>
			<div class="row">
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
							<th>用户名</th>
							<th>所属区域</th>
							<th>操作人</th>
							<th>操作时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="" id="" value="" /></td>
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
							<td><input type="checkbox" name="" id="" value="" /></td>
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
							<td><input type="checkbox" name="" id="" value="" /></td>
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
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
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
									<input class="form-control" type="text" name="" id="" value="" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">密码</label>
								<div class="col-lg-10">
									<input class="form-control" type="password" name="" id="" value="" />
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
									<input class="form-control" type="text" name="" id="" value="张三" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">省</label>
								<div class="col-lg-10">
									<select class="selectpicker" id="" title="请选择省" data-width="100%">
										<option>1</option>
										<option>2</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">市</label>
								<div class="col-lg-10">
									<select class="selectpicker" id="" title="请选择市" data-width="100%">
										<option>1</option>
										<option>2</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">院校</label>
								<div class="col-lg-10">
									<select class="selectpicker" id="" title="请选择院校" data-width="100%">
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

		<!-- js导入 -->
		<script src="../commons/js/jquery-3.5.1.min.js"></script>
		<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
		<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
		<script src="../commons/js/com.js"></script>
	</body>
</html>

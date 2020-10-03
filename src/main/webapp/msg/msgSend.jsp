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
						<li><a href="msgIndex.html">首页</a></li>
						<li class="active"><a href="msgSend.html">发消息</a></li>
						<li><a href="msgReceive.html">收消息</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>zhangsan</a></li>
						<li><a href="../login.html"><span class="glyphicon glyphicon-log-out"></span>注销</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- /container -->
		<div class="container">
			<h3>发送消息</h3>
			<hr>
			<div class="">
				<table class="area-table table table-bordered table-striped">
					<thead>
						<tr>
							<th>标题</th>
							<th>时间</th>
							<th>类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#noticeModal">
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>查看
									</button>
									<button type="button" class="btn  btn-danger">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#noticeModal">
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>查看
									</button>
									<button type="button" class="btn  btn-danger">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>信息工程学院</td>
							<td>院系</td>
							<td>1</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn  btn-primary" data-toggle="modal" data-target="#noticeModal">
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>查看
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

		<!-- 通知 -->
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
		<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="noticeModalLabel">这是一个通知</h4>
						<p><strong style="color: gray;">通知 </strong>2020-8-20 10:10:23</p>
					</div>
					<div class="modal-body">
						<p>这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知</p>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>接收人</th>
									<th>状态</th>
									<th>回复时间</th>
									<th>回复内容</th>
								</tr>
							</thead>
							<tbody>
								<tr class="danger">
									<td>张三</td>
									<td>未处理</td>
									<td></td>
									<td></td>
								</tr>
								<tr class="success">
									<td>张三</td>
									<td>已处理</td>
									<td>2020-8-20 10:10:23</td>
									<td>内容内容内容内容</td>
								</tr>
								<tr class="danger">
									<td>张三</td>
									<td>未处理</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<div class="chart-container" style="width: 80%;">
							<canvas id="receiveChart"></canvas>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">保存</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		<!-- 新增 -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="addModalLabel">发送消息</h4>
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
		<!-- js导入 -->
		<script src="../commons/js/jquery-3.5.1.min.js"></script>
		<script src="../commons/js/Chart.js"></script>
		<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
		<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
		<script>
			var ctx = document.getElementById("receiveChart");
			var myChart = new Chart(ctx, {
				type: 'doughnut',
				data: {
					labels: ["已读", "已回复", "未读"],
					datasets: [{
						label: '4564654',
						data: [12, -19, 3],
						backgroundColor: [
							'rgba(255, 99, 132, 0.5)',
							'rgba(54, 162, 235, 0.5)',
							'rgba(255, 206, 86, 0.5)'
						],
						borderColor: [
							'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)'
						],
						borderWidth: 1
					}]
				},
				options: {
					title: {
						display: false,
						position: "top",
						fontSize: 12,
						text: "月发送消息统计图"
					},
					scales: {
						/* yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}] */
					},
					legend: {
						display: true,
						position: 'right',

					}
				}
			});
		</script>

	</body>
</html>

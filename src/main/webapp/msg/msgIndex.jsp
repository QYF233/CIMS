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

			.chart-container {
				display: flex;
				justify-content: space-between;
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
						<li class="active"><a href="msgIndex.html">首页</a></li>
						<li><a href="msgSend.html">发消息</a></li>
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

			<h3>个人消息</h3>
			<hr>
			<div class="jumbotron " style="height: 60vh; min-height: 400px;">

				<div class="row chart-container" style="margin-top: 30px;">
					<div class="bgChart  col-sm-5">
						<div class="chart-container" style="">
							<canvas id="receiveChart"></canvas>
						</div>
					</div>
					<div class="bgChart  col-sm-5">
						<div class="chart-container" style="">
							<canvas id="sendChart"></canvas>
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
		<script src="../commons/js/Chart.js"></script>
		<script src="../commons/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="../commons/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
		<script src="../commons/bootstrap-select-1.13.9/dist/js/bootstrap-select.js"></script>
		<script>
			var ctx = document.getElementById("receiveChart");
			var myChart = new Chart(ctx, {
				type: 'pie',
				data: {
					labels: ["已读", "已回复", "未读"],
					datasets: [{
						label: '4564654',
						data: [12, 19, 3],
						backgroundColor: [
							'rgba(255, 0, 0, 0.7)',
							'rgba(0, 170, 255, 0.7)',
							'rgba(255, 206, 86, 0.7)'
						],
						borderColor: [
							'rgba(255, 255, 255, 1.0)'
						],
						borderWidth: 1
					}]
				},
				options: {
					title: {
						display: true,
						position: "top",
						fontSize: 12,
						text: "接收消息"
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
		<script>
			var data = {
				labels: ["已读", "未读", "已回复"],
				datasets: [{
						label: "DataSet1",
						backgroundColor: "rgba(85, 170, 255, 0.8)",
						pointBackgroundColor: "rgba(255,48,48,0.2)",
						data: [65, 10, 50]
					},
					{
						label: "DataSet2",
						backgroundColor: "rgba(255,62,150, 0.5)",
						pointBackgroundColor: "rgba(255,48,48,0.2)",
						data: [13, 50, 20]
					}
				]
			};

			var ctx = document.getElementById("sendChart");
			var myChart = new Chart(ctx, {
				type: 'line',
				data: data,
				options: {
					title: {
						display: true,
						position: "top",
						fontSize: 12,
						text: "发送消息"
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
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

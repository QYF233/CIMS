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
			/* 回到顶部 */
			.J_goTop{
			  position: fixed;
			  bottom: 10%;
			  right: 3%;
			  cursor: pointer;
			  width: 2.5rem;
			  height: 2.5rem;
			  display: none;
			}

			#up{
				display: flex;
				width: 40px;
				height: 40px;
				background-color: #0086B3;
				color: #FFFFFF;
				font-size: 1.5em;
				justify-content: center;
				align-items:center;
			}
			
			.jumbotron {
				margin-top: 50px;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top" id="top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">CIMS-校园即时通系统</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="msgIndex.html">首页</a></li>
						<li><a href="msgSend.html">发消息</a></li>
						<li class="active"><a href="msgReceive.html">收消息</a></li>
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
			<h3>接收消息</h3>
			<hr>
			<div class="msgList">
				<!--  -->
				<div class="panel panel-success" name="notice">
					<div class="panel-heading">
						<div class="noticeHeader">
							<span class="panel-title">这是一个通知</span>
							<span class="right">
								FROM：<strong>zhangsan</strong> [通知] 2020-10-12 20:30
							</span>
						</div>
					</div>
					<div class="panel-body">
						<p class="notice">这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知</p>
						<div class="form-group text-right">
							<button type="button" class="btn btn-default" disabled="disabled">已完成</button>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="panel panel-danger" name="notice">
					<div class="panel-heading">
						<div class="noticeHeader">
							<span class="panel-title">这是一个通知</span>
							<span class="right">
								FROM：<strong>zhangsan</strong> [通知] 2020-10-12 20:30
							</span>
						</div>
					</div>
					<div class="panel-body">
						<p class="notice">这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知</p>
						<div class="form-group text-right">
							<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-record" aria-hidden="true"></span>点击查收</button>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="panel panel-danger" name="message">
					<div class="panel-heading">
						<div class="messageHeader">
							<span class="panel-title">这是一个消息</span>
							<span class="right">
								FROM：<strong>zhangsan</strong> [通知] 2020-10-12 20:30
							</span>
						</div>
					</div>
					<div class="panel-body">
						<p class="message">这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息这是一个消息</p>
						<div class="row">
							<div class="col-lg-6 col-lg-offset-6">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入内容">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>回复</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="panel panel-danger" name="vote">
					<div class="panel-heading">
						<div class="voteHeader">
							<span class="panel-title">这是一个投票</span>
							<span class="right">
								FROM：<strong>zhangsan</strong> [通知] 2020-10-12 20:30
							</span>
						</div>
					</div>
					<div class="panel-body">
						<p class="vote">这是一个投票这是一个投票这是一个投票这是一个投票这是一个投票这是一个投票这是一个投票这是一个投票这是一个投票</p>
						<div class="form-group text-right">
							<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>赞成</button>
							<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>反对</button>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="panel panel-success" name="notice">
					<div class="panel-heading">
						<div class="noticeHeader">
							<span class="panel-title">这是一个通知</span>
							<span class="right">
								FROM：<strong>zhangsan</strong> [通知] 2020-10-12 20:30
							</span>
						</div>
					</div>
					<div class="panel-body">
						<p class="notice">这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知这是一个通知</p>
						<div class="form-group text-right">
							<button type="button" class="btn">已完成</button>
						</div>
					</div>
				</div>
				<!--  -->
			</div>

		</div>

		<div class="J_goTop"><span class="glyphicon glyphicon-chevron-up" id="up" aria-hidden="true"></span></div>

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
		<script type="text/javascript">
			function loadData(){
				$(".msgList").append("*************<br>**************")
			}
			$.ajax(function(){
				
			})
		</script>
		<script>
			$(document).scroll(function() {
				var scroH = $(document).scrollTop(); //滚动高度
				if (scroH >= 100) { // 显示
					$('.J_goTop').css("display", "block") // $('.J_goTop').fadeIn();
				} else { // 消失
					$('.J_goTop').removeAttr("style") // $('.J_goTop').fadeOut();
				}
				// 点击事件 
				$('.J_goTop').click(function() {
					if (scroH != 0) { // 判断好像无效 :)
						// 巨坑！！！执行animate前先结束这个循环动作
						$('body,html').stop().animate({}).animate({ // document,window对象不能执行animate
							scrollTop: '0px',
						}, 600);
						return false;
					}
				})
			});
		</script>

	</body>
</html>

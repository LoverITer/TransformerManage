<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="zh">
<base href="<%=basePath%>">
<!--
	作者：Virgo
	时间：2018-03-21
	描述：平台登录页
-->
<head>
<meta charset="utf-8">
<title>电力变压器维保可视化平台</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="dist/css/sb-admin-2.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" align="center">充电站变压器健康状态监测系统登陆</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="login/userCheck" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="用户名" name="username"
										type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="密码" name="password"
										type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox" value="">下次自动登陆
									</label>
								</div>
								<button type="submit" class="btn btn-lg btn-success btn-block">登陆</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/metisMenu/metisMenu.min.js"></script>
	<script src="dist/js/sb-admin-2.js"></script>
</body>
</html>
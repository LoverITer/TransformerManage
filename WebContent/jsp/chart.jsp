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
	描述：平台信息总览页
-->
<head>
<meta charset="utf-8">
<title>变压器维保可视化平台</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="dist/css/sb-admin-2.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">可视化平台</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="pandect/pandectShow">充电站变压器健康状态监测系统
				</a>
			</div>
			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户信息</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 用户设置</a></li>
						<li class="divider"></li>
						<li><a href="login/logout"><i
								class="fa fa-sign-out fa-fw"></i> 退出系统</a></li>
					</ul></li>
			</ul>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<!-- <li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</li> -->
						<li><a href="pandect/pandectShow"><i
								class="fa fa-dashboard fa-fw"></i> 全局信息总览</a></li>
						<li><a href="chart/chartShow"><i
								class="fa fa-bar-chart-o fa-fw"></i> 图表可视分析</a></li>
						<li><a href="#"><i class="fa fa-table fa-fw"></i> 维保进度</a></li>
						<li><a href="failurePrediction/failurePredictionShow"><i
								class="fa fa-edit fa-fw"></i> 故障预测</a></li>
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i> <span>站点规划</span>
						</a></li>
						<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> <span>站点信息</span>
						</a></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i> 用户管理<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">用户总览</a></li>
								<li><a href="#">创建用户</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">图表可视分析</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 运行用量统计
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4" style="width: 680px; height: 400px;"
									id="areaUses"></div>
							</div>
						</div>
					</div>
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 故障次数统计
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4" style="width: 680px; height: 400px;"
									id="faultCounts"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 可用占比
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4" style="width: 350px; height: 400px;"
									id="proportion"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<!-- <p style="text-align: center;">
					Power by <a href="#" title="virgoartcw@gmail.com" target="_blank">陈稳</a> -
					Collect from <a href="#" title="xust.edu.cn" target="_blank">西安科技大学</a>
				</p> -->
			</div>
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/metisMenu/metisMenu.min.js"></script>
	<script src="vendor/raphael/raphael.min.js"></script>
	<script src="dist/js/sb-admin-2.js"></script>
	<script src="vendor/echarts/echarts-all.js"></script>
	<script src="js/charts/faultCounts.js"></script>
	<script src="js/charts/proportion.js"></script>
	<script src="js/charts/areaUses.js"></script>
</body>

</html>
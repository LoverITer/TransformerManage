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
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=Zbwr31LW9utU0EIEYGeBaZR27GhfSyWD"></script>
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
				<a class="navbar-brand" href="pandect/pandectShow">充电站变压器健康状态监测系统</a>
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
					<h1 class="page-header">全局信息总览</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-warning fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">18</div>
									<div>故障监控预警</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">故障详情浏览</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-wrench fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13</div>
									<div>设备维保进度</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">维保进度详情</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">712</div>
									<div>全市站点统计</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">查看分布概要</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-legal fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">2</div>
									<div>新建站点规划</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">新建站点详情</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-user-md"></i> 西安市充电站变压器分布图
							<!-- <span>选择主题: <select id="stylelist"
							onchange="changeMapStyle(this.value)"></select>
						</span> -->
						</div>
						<!-- <div class="panel-body" align="left"
						style="background-color: gray;">
						<div style="background-color: highlight; width: 120px">
							<span>总站数：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span>11</span>
						</div>
					</div> -->
						<div class="panel-body" align="left" id="allmap"
							style="height: 300px;"></div>
					</div>
				</div>
				<!-- <div class="col-lg-2" style="display: none;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span> 参变系数 </span>
						</div>
						<div class="panel-body" align="left" id="" style="height: 300px;"></div>
					</div>
				</div> -->
			</div>
			<div class="row" style="display: none">
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
			<!-- <p style="text-align: center;">
				Power by <a href="#" title="virgoartcw@gmail.com" target="_blank">陈稳</a> -
				Collect from <a href="#" title="xust.edu.cn" target="_blank">西安科技大学</a>
			</p> -->
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
	<script type="text/javascript"
		src="http://lbsyun.baidu.com/custom/stylelist.js"></script>
	<script type="text/javascript">
		//初始化模板选择的下拉框
		/* var sel = document.getElementById('stylelist');
		for ( var key in mapstyles) {
			var style = mapstyles[key];
			var item = new Option(style.title, key);
			sel.options.add(item);
		} */
		var map = new BMap.Map("allmap");
		window.map = map;
		var point = new BMap.Point(108.952, 34.223);

		map.addControl(new BMap.NavigationControl()); // 添加平移缩放控件
		map.addControl(new BMap.ScaleControl()); // 添加比例尺控件
		map.addControl(new BMap.OverviewMapControl()); //添加缩略地图控件
		//map.enableScrollWheelZoom(); //启用滚轮放大缩小
		map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
		map.disable3DBuilding();
		map.centerAndZoom(point, 14);

		//代码使用如下,即可. 模板页可以查看http://lbsyun.baidu.com/custom/list.htm      
		//map.setMapStyle({style:'midnight'});

		changeMapStyle('hardedge');
		//sel.value = 'hardedge';

		function changeMapStyle(style) {
			map.setMapStyle({
				style : style
			});
			$('#desc').html(mapstyles[style].desc);
		}
		/*信息*/
		var data_info = [ [ 108.952, 34.223, "运行良好：负压60%；温度57℃；" ],
				[ 109.95122, 32.66223, "运行良好：负压60%；温度57℃；" ],
				[ 108.95152, 33.41223, "运行良好：负压60%；温度57℃；" ] ];
		var opts = {
			width : 250, // 信息窗口宽度
			height : 80, // 信息窗口高度
			title : "状态信息", // 信息窗口标题
			enableMessage : true
		//设置允许信息窗发送短息
		};
		for (var i = 0; i < data_info.length; i++) {
			var marker = new BMap.Marker(new BMap.Point(data_info[i][0],
					data_info[i][1])); // 创建标注
			var content = data_info[i][2];
			map.addOverlay(marker); // 将标注添加到地图中
			addClickHandler(content, marker);
		}
		function addClickHandler(content, marker) {
			marker.addEventListener("click", function(e) {
				openInfo(content, e);
			});
		}
		function openInfo(content, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content, opts); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow, point); //开启信息窗口
		}
	</script>
</body>

</html>
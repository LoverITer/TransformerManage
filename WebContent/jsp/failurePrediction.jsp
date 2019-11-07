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
<link href="css/loadWait.css" rel="stylesheet">
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
					<h1 class="page-header">故障预测</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-upload"></i> 设备运行音频信息上传
						</div>
						<div class="panel-body" align="left">
							<form action="failurePrediction/saveFile" method="POST"
								enctype="multipart/form-data" onsubmit="return fileOnSubmit()">
								<span> <i class="fa fa-folder-open"></i><span>&nbsp;</span><input
									type="file" name="soundFile" id="soundFile"
									style="all: inherit; background-color: gainsboro;"> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<button type="reset" class="btn btn-danger">文件重置</button> <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<button type="submit" class="btn btn-success">提交预测</button>
								</span>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class=""
				style="display: none; position: absolute; left: 281px; top: 202px; width: 560px; height: 64px; z-index: 9999"
				id="submitError">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<span id="msg"></span>
			</div>
			<div class="row">
				<div class="col-lg-12" style="height: 320px;">
					<p>注意事项：</p>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统目前仅支持 <span
							style="color: red;">.WAV</span> 类型音频文件处理判断，其他格式正在开发中，请稍后。
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请勿上传与变压器运行音频信息无关的音频文件，由此带来的经济财产损失，本系统概不负责。</p>
				</div>
			</div>
			<div>
				<!-- <p style="text-align: center;">
					Power by <a href="#" title="virgoartcw@gmail.com" target="_blank">陈稳</a>
					- Collect from <a href="#" title="xust.edu.cn" target="_blank">西安科技大学</a>
				</p>
			</div> -->
		</div>
	</div>
	<div class="loader" id="loader" style="display: none">
		<p class="load_hint ">正在处理·····请等待</p>
	</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/metisMenu/metisMenu.min.js"></script>
	<script src="vendor/raphael/raphael.min.js"></script>
	<script src="dist/js/sb-admin-2.js"></script>
	<script type="text/javascript">
		function showWait() {
			document.getElementById("loader").style.display = "";
			return true;
		}
		function fileOnSubmit() {
			var file_form = document.getElementById("soundFile");
			var file = file_form.value;
			if (file == null || file == "") {
				document.getElementById("msg").innerHTML = "请选择要上传的文件!";
				document.getElementById("submitError").style.display = "";
				document.getElementById("submitError").className = "alert alert-danger alert-dismissable";
				return false;
			}
			if (file.lastIndexOf('.') == -1) { //如果不存在"."    
				document.getElementById("msg").innerHTML = "文件路径不正确!";
				document.getElementById("submitError").style.display = "";
				document.getElementById("submitError").className = "alert alert-warning alert-dismissable";
				return false;
			}
			var AllImgExt = ".wav|";
			var extName = file.substring(file.lastIndexOf(".")).toLowerCase();//（把路径中的所有字母全部转换为小写）          
			if (AllImgExt.indexOf(extName + "|") == -1) {
				ErrMsg = "该文件类型不允许上传，当前文件类型为" + extName;
				document.getElementById("msg").innerHTML = ErrMsg;
				document.getElementById("submitError").style.display = "";
				document.getElementById("submitError").className = "alert alert-info alert-dismissable";
				return false;
			}
			showWait();
		}
	</script>
</body>
</html>
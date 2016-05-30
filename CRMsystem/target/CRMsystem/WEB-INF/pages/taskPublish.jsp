<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>CRM管理系统</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/fullcalendar.css" />	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/unicorn.main.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/unicorn.grey.css" class="skin-color" />
	</head>
	<body>
		
		
		<div id="header">
			<h1><a href="index.html">首页</a></h1>		
		</div>

		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse" ><a title="" href="#"><i class="icon icon-user"></i> <span class="text">${sessionScope.login_admin.username}</span></a></li>
                <li class="btn btn-inverse"><a title="" href="../admin/logout"><i class="icon icon-share-alt"></i> <span class="text">登出</span></a></li>
            </ul>
        </div>
            
		<div id="sidebar">
			<a href="#" class="visible-phone"><i class="icon icon-home"></i> 首页</a>
			<ul>
				<li><a href="index.html"><i class="icon icon-home"></i> <span>公告通知</span></a></li>
				<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理</span> <span class="label">3</span></a>
					<ul>
						<li><a href="manage-permission.html">权限管理</a></li>
						<li><a href="manage-user.html">用户管理</a></li>
						<li><a href="manage-system.html">系统管理</a></li>
					</ul>
				</li>
				<li><a href="customerInformation.html"><i class="icon icon-tint"></i> <span>客户信息</span></a></li>
				<li><a href="accountRegister.html"><i class="icon icon-pencil"></i> <span>账号开通</span></a></li>
				<li><a href="employeeReport.html"><i class="icon icon-th"></i> <span>员工汇报</span></a></li>
				<li class="active"><a href="taskPublish.html"><i class="icon icon-th-list"></i> <span>任务发布</span></a></li>
			</ul>
		
		</div>
		
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>Style:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
            <a href="#light-blue" style="background-color: #8399b0;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
            <a href="#red-green" style="background-image: url('img/demo/red-green.png');background-repeat: no-repeat;"></a>
		</div>
		
		<div id="content">
			<div id="content-header">
				<h1>任务发布</h1>
			</div>
		
		</div>
		
       <script src="<%=request.getContextPath()%>/CRM/js/excanvas.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.ui.custom.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/bootstrap.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.flot.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.flot.resize.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.peity.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/fullcalendar.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/unicorn.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/unicorn.dashboard.js"></script>
	</body>
</html>

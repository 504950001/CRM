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
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>首页</a>
		<ul>
			<li><a
				href="<%=request.getContextPath()%>/admin/index"><i
					class="icon icon-home"></i> <span>公告通知</span></a></li>
			<li  class="submenu active open"><a href="#"><i class="icon icon-th-list"></i>
					<span>管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理</span> <span
					class="label">3</span></a>
				<ul>
					<li  class="active"><a
						href="<%=request.getContextPath()%>/admin/manage-permission">权限管理</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/manage-user">用户管理</a></li>
					<li><a
						href="<%=request.getContextPath()%>/admin/manage-system">系统管理</a></li>
				</ul></li>
			<li><a
				href="<%=request.getContextPath()%>/customer/customerList"><i
					class="icon icon-tint"></i> <span>客户信息</span></a></li>
			<li><a
				href="<%=request.getContextPath()%>/admin/accountRegister"><i
					class="icon icon-pencil"></i> <span>账号开通</span></a></li>
			<li><a href="<%=request.getContextPath()%>/admin/employeeReport"><i
					class="icon icon-th"></i> <span>员工汇报</span></a></li>
			<li><a href="<%=request.getContextPath()%>/admin/taskPublish"><i
					class="icon icon-th-list"></i> <span>任务发布</span></a></li>
		</ul>
	</div>

		<div id="content">
		<div id="content-header">
				<h1>权限管理</h1>
			</div>
			<div class="row-fluid">
					<div class="span1"></div>
					<div class="span6">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-th-list"></i>
								</span>
								<h5>管理员账户添加</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" method="post" action="<%=request.getContextPath()%>/admin/addAdmin">
									<div class="control-group">
										<label class="control-label">管理员账户</label>
										<div class="controls">
											<input type="text" name="username" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">密码</label>
										<div class="controls">
											<input type="password" name="password" />
										</div>
									</div>
									<div class="form-actions">
											<input id="reset" class="btn btn-primary" type="reset" value="清空" />
											<input id="submit" class="btn btn-primary" type="submit" value="提交" />
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="span4">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-th-list"></i>
								</span>
								<h5>管理员列表</h5>
							</div>
							<div class="widget-content">
								现版本只支持管理员添加，后续将继续完善权限管理，将包括不同管理员的操作权限，包括
								管理员添加删除管理员账户、客户账户和员工账户等权限。敬请期待。
							</div>
						</div>
					</div>
					<div class="span1"></div>
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

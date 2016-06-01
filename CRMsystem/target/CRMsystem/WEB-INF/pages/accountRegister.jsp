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
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理</span> <span
					class="label">3</span></a>
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/admin/manage-permission">权限管理</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/manage-user">用户管理</a></li>
					<li><a
						href="<%=request.getContextPath()%>/admin/manage-system">系统管理</a></li>
				</ul></li>
			<li><a
				href="<%=request.getContextPath()%>/customer/customerList"><i
					class="icon icon-tint"></i> <span>客户信息</span></a></li>
			<li class="active"><a
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
				<h1>账号开通</h1>
					<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-pencil"></i>
								</span>
								<h5>员工账户开通</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" method="post" action="../employee/addEmployee">
									<div class="control-group">
										<label class="control-label">员工ID</label>
										<div class="controls">
											<input id="id" type="text" name="id" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">员工姓名</label>
										<div class="controls">
											<input id="name" type="text" name="name" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">密码</label>
										<div class="controls">
											<input id="password" type="password" name="password" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认密码</label>
										<div class="controls">
											<input id="password2" type="password" name="password2" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">性别</label>
										<div class="controls">
											<input id="sex" type="text" name="sex" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">电话</label>
										<div class="controls">
											<input id="telephone" type="text" name="telephone" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">邮箱</label>
										<div class="controls">
											<input id="email" type="text" name="email" />
										</div>
									</div>
									<div class="form-actions">
											<input id="reset" class="btn btn-primary" type="reset" value="清空" />
											<input id="submit" class="btn btn-primary" type="submit" value="提交" />
											<div id="status"></div>
									</div>
									<div id="submitted"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row-fluid">
					<div id="footer" class="span12">
						2015 - 2016 &copy; CRM Admin. Brought to you by <a href="#">tanzhouming</a>
					</div>
				</div>
			</div>
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

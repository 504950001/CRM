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
					<li><a
						href="<%=request.getContextPath()%>/admin/manage-permission">权限管理</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/manage-user">用户管理</a></li>
					<li class="active"><a
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
			<h1>系统管理</h1>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>手机系统管理</h5>
							</div>
							<div class="widget-content nopadding">
								<form action="#" method="get" class="form-horizontal">
									<div class="control-group">
										<label class="control-label">系统名称</label>
										<div class="controls">
											<input type="text" name="sysName" value="${systemInfo.systemName}" readonly="readonly"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">版本</label>
										<div class="controls">
											<input type="text" name="version" value="${systemInfo.sysVersion}" readonly="readonly"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">开发人员</label>
										<div class="controls">
											<input type="text" name="person" value="${systemInfo.person}" readonly="readonly"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">邮箱</label>
										<div class="controls">
											<input type="email" name="email" value="${systemInfo.email}" readonly="readonly"/>
										</div>
									</div>
								</form>
							</div>
						</div>	
					<!-- 触发显示对话框的按钮 -->
					<a href="#editTable" role="button" class="btn btn-primary"
						data-toggle="modal">编辑</a>
					<!-- 对话框 -->
					<div id="editTable" class="modal hide fade" tabindex="-1"
						role="dialog" aria-labelledby="#Edit" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="Edit">编辑对话框</h3>
						</div>
						<form
							action="<%=request.getContextPath()%>/admin/updateSystemInfo"
							method="post" class="form-horizontal">
							<div class="modal-body">
								<div class="control-group">
										<label class="control-label">系统名称</label>
										<div class="controls">
											<input type="text" name="sysName" value="${systemInfo.systemName}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">版本</label>
										<div class="controls">
											<input type="text" name="version" value="${systemInfo.sysVersion}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">开发人员</label>
										<div class="controls">
											<input type="text" name="person" value="${systemInfo.person}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">邮箱</label>
										<div class="controls">
											<input type="email" name="email" value="${systemInfo.email}"/>
										</div>
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary">保存</button>
							</div>
						</form>
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

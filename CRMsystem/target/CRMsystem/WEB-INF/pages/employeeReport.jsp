<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CRM管理系统</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/bootstrap.min.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/colorpicker.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/datepicker.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/uniform.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/select2.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/unicorn.main.css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/unicorn.grey.css"
			class="skin-color" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/CRM/css/bootstrap-datetimepicker.min.css" />
</head>
<body>


	<div id="header">
		<h1>
			<a href="index.html">首页</a>
		</h1>
	</div>

	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-user"></i> <span class="text">${sessionScope.login_admin.username}</span></a></li>
			<li class="btn btn-inverse"><a title="" href="../admin/logout"><i
					class="icon icon-share-alt"></i> <span class="text">登出</span></a></li>
		</ul>
	</div>

	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>首页</a>
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/index"><i
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
			<li><a
				href="<%=request.getContextPath()%>/admin/accountRegister"><i
					class="icon icon-pencil"></i> <span>账号开通</span></a></li>
			<li class="active"><a
				href="<%=request.getContextPath()%>/admin/employeeReport"><i
					class="icon icon-th"></i> <span>员工汇报</span></a></li>
			<li><a href="<%=request.getContextPath()%>/admin/taskPublish"><i
					class="icon icon-th-list"></i> <span>任务发布</span></a></li>
		</ul>
	</div>

	<div id="content">
			<div id="content-header">
				<h1>客户信息</h1>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<h5>客户信息表</h5>
							</div>
							<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>客户编号</th>
										<th>客户姓名</th>
										<th>性别</th>
										<th>电话</th>
										<th>邮箱</th>
										<th>公司</th>
									</tr>
								</thead>
								<tbody id="cloneTr">
									<c:forEach items="${cList}" var="customer">
									<tr >
										<td>${customer.id}</td>
										<td>${customer.name}</td>
										<td>${customer.sex}</td>
										<td>${customer.telephone}</td>
										<td>${customer.email}</td>
										<td>${customer.address}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
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
	<script src="<%=request.getContextPath()%>/CRM/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/jquery.ui.custom.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/CRM/js/bootstrap-colorpicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/CRM/js/bootstrap-datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/jquery.uniform.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/unicorn.js"></script>
	<script
		src="<%=request.getContextPath()%>/CRM/js/unicorn.form_validation.js"></script>
	<script
		src="<%=request.getContextPath()%>/CRM/js/unicorn.form_common.js"></script>
</body>
</html>

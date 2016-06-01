<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<li><a
				href="<%=request.getContextPath()%>/admin/accountRegister"><i
					class="icon icon-pencil"></i> <span>账号开通</span></a></li>
			<li><a href="<%=request.getContextPath()%>/admin/employeeReport"><i
					class="icon icon-th"></i> <span>员工汇报</span></a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/admin/taskPublish"><i
					class="icon icon-th-list"></i> <span>任务发布</span></a></li>
		</ul>
	</div>
		
		<div id="content">
		<div id="content-header">
			<h1>任务发布</h1>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"> <i class="icon-align-justify"></i>
								</span>
								<h5>任务发布</h5>
							</div>
							<div class="widget-content nopadding">
								<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/admin/addTask"
									name="basic_validate" id="basic_validate"
									novalidate="novalidate">
									<div class="control-group">
										<label class="control-label">任务标题</label>
										<div class="controls">
											<input type="text" name="title" id="title">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">委派员工</label>
										<div class="controls">
											<select multiple name="employeeName">
												<c:forEach items="${employeeList}" var="employee">
													<!-- 标示员工，形成唯一标示方便，员工接收任务分配，手机contain函数判定是否读取数据库表，员工号004，00401 -->
													<option value="${employee.id}:${employee.name}">${employee.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">发布日期</label>
										<div class="controls">
											<div class="input-append date form_datetime">
												<input size="24" type="text" value="" name="datatime" id="datatime" readonly>
												<span class="add-on"><i class="icon-remove"></i></span> <span
													class="add-on"><i class="icon-th"></i></span>
											</div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">任务内容</label>
										<div class="controls">
											<textarea rows="5" cols="" name="myContent" id="myContent"></textarea>
										</div>
									</div>
									<div class="form-actions">
										<input type="reset" value="清空" class="btn btn-primary">
										<input type="submit" value="发布" class="btn btn-primary">
									</div>
								</form>
							</div>
						</div>
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
	<script
		src="<%=request.getContextPath()%>/CRM/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		$(".form_datetime").datetimepicker({
			format : 'yyyy-mm-dd hh:ii',
			showMeridian : true,
			autoclose : true,
			todayBtn : true
		});
	</script>
	</body>
</html>

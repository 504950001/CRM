<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<h1>员工汇报</h1>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<h5>汇报列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table
								class="table table-bordered table-striped table-hover data-table">
								<thead>
									<tr>
										<th>编号</th>
										<th>主题</th>
										<th>汇报人</th>
										<th>内容</th>
										<th width="120px">编辑</th>
									</tr>
								</thead>
								<tbody id="cloneTr">
									<c:forEach items="${reportList}" var="report">
										<tr>
											<td>${report.idreport}</td>
											<td>${report.title}</td>
											<td>${report.author}</td>
											<td>${report.content}</td>
											<td>
												<!-- 触发显示对话框的按钮 --> <a href="#${report.idreport}" role="button"
												class="btn btn-primary" data-toggle="modal">详情</a> <!-- 对话框 -->
												<div id="${report.idreport}" class="modal hide fade"
													tabindex="-1" role="dialog" aria-labelledby="#Edit"
													aria-hidden="true">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h3 id="Edit">查看详情</h3>
													</div>
													<form class="form-horizontal">
														<div class="modal-body">
															<div class="control-group">
																<label class="control-label">主题</label>
																<div class="controls">
																	<input type="text" name="id" value="${report.title}" readonly="readonly" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">汇报人</label>
																<div class="controls">
																	<input type="text" name="name" value="${report.author}" readonly="readonly" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">内容</label>
																<div class="controls">
																	<input type="text" name="sex" value="${report.content}" readonly="readonly" />
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">关闭</button>
														</div>
													</form>
												</div> 
												<a href="#${report.idreport}Del" role="button"
												class="btn btn-danger" data-toggle="modal">删除</a> <!-- 对话框 -->
												<div id="${report.idreport}Del" class="modal hide fade"
													tabindex="-1" role="dialog" aria-labelledby="#Edit"
													aria-hidden="true">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h3 id="Edit">删除对话框</h3>
													</div>
													<form
														action="<%=request.getContextPath()%>/admin/deleteReport"
														method="post" class="form-horizontal">
														<div class="modal-body">
															<input style="display: none;" name="idreport" value="${report.idreport}"/>
															<input style="display: none;" name="title" value="${report.title}"/>
															<input style="display: none;" name="author" value="${report.author}"/>
															<input style="display: none;" name="content" value="${report.content}"/>
															<span>是否删除编号为<a style="color: red;">${report.idreport}</a>的汇报信息？
															</span>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">否</button>
															<button type="submit" class="btn btn-primary">是</button>
														</div>
													</form>
												</div>
											</td>
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

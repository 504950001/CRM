<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>CRM管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/bootstrap-responsive.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/jquery-ui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/uniform.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/select2.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/unicorn.main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CRM/css/unicorn.grey.css"
	class="skin-color" />
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
			<li class="btn btn-inverse"><a title=""
				href="<%=request.getContextPath()%>/admin/logout"><i
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
			<li class="active"><a
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
										<th>地址</th>
										<th width="120px">编辑</th>
									</tr>
								</thead>
								<tbody id="cloneTr">
									<c:forEach items="${cList}" var="customer">
										<tr>
											<td>${customer.id}</td>
											<td>${customer.name}</td>
											<td>${customer.sex}</td>
											<td>${customer.telephone}</td>
											<td>${customer.email}</td>
											<td>${customer.address}</td>
											<td>
												<!-- 触发显示对话框的按钮 --> <a href="#${customer.id}" role="button"
												class="btn btn-primary" data-toggle="modal">编辑</a> <!-- 对话框 -->
												<div id="${customer.id}" class="modal hide fade"
													tabindex="-1" role="dialog" aria-labelledby="#Edit"
													aria-hidden="true">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h3 id="Edit">编辑对话框</h3>
													</div>
													<form
														action="<%=request.getContextPath()%>/customer/updateCustomer"
														method="post" class="form-horizontal">
														<div class="modal-body">
															<div class="control-group">
																<label class="control-label">编号</label>
																<div class="controls">
																	<input type="text" name="id" value="${customer.id}" readonly="readonly" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">姓名</label>
																<div class="controls">
																	<input type="text" name="name" value="${customer.name}" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">性别</label>
																<div class="controls">
																	<input type="text" name="sex" value="${customer.sex}" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">电话</label>
																<div class="controls">
																	<input type="text" name="telephone"
																		value="${customer.telephone}" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">邮箱</label>
																<div class="controls">
																	<input type="text" name="email"
																		value="${customer.email}" />
																</div>
															</div>
															<div class="control-group">
																<label class="control-label">地址</label>
																<div class="controls">
																	<input type="text" name="address"
																		value="${customer.address}" />
																</div>
															</div>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">取消</button>
															<button type="submit" class="btn btn-primary">保存</button>
														</div>
													</form>
												</div> <a href="#${customer.id}Del" role="button"
												class="btn btn-danger" data-toggle="modal">删除</a> <!-- 对话框 -->
												<div id="${customer.id}Del" class="modal hide fade"
													tabindex="-1" role="dialog" aria-labelledby="#Edit"
													aria-hidden="true">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h3 id="Edit">删除对话框</h3>
													</div>
													<form
														action="<%=request.getContextPath()%>/customer/deleteCustomer"
														method="post" class="form-horizontal">
														<div class="modal-body">
															<input style="display: none;" name="id" value="${customer.id}"/>
															<input style="display: none;" name="name" value="${customer.name}"/>
															<input style="display: none;" name="sex" value="${customer.sex}"/>
															<input style="display: none;" name="telephone" value="${customer.telephone}"/>
															<input style="display: none;" name="email" value="${customer.email}"/>
															<input style="display: none;" name="address" value="${customer.address}"/>
															<span>是否删除客户<a style="color: red;">${customer.name}</a>？
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
	<script src="<%=request.getContextPath()%>/CRM/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/jquery.uniform.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/CRM/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/unicorn.js"></script>
	<script src="<%=request.getContextPath()%>/CRM/js/unicorn.tables.js"></script>
	<script type="text/javascript">
	   		function delRow(id){
		   		//var id=$(this).attr("id");
		   		alert("id="+id);
			}
	   </script>
	<script type="text/javascript">
		$(function() {
			console.log("start ajax");
			$.ajax({
				url : "http://localhost:8080/CRMsystem/customer/customerList",
				async : true,
				type : "POST",
				dataType : "json",
				contentType: "application/json; charset=utf-8",
				success : function(objects) {
					console.log("success===="+ JSON.stringify(objects));
					 $("#cloneTr").html("");
					//1,获取上面id为cloneTr的tr元素  
                    //var tr = $("#cloneTr");  
                    var tr = $("<tr></tr>");
                    $.each(objects, function(index,item){ 
                    	$("#cloneTr").append("<tr>");                         	
                    	$("#cloneTr").append("<td>"+item.id+"</td>");
                    	$("#cloneTr").append("<td>"+item.name+"</td>");
                    	$("#cloneTr").append("<td>"+item.sex+"</td>");
                    	$("#cloneTr").append("<td>"+item.telephone+"</td>");
                    	$("#cloneTr").append("<td>"+item.email+"</td>");
                    	$("#cloneTr").append("<td>"+item.address+"</td>");   
                    	$("#cloneTr").append("</tr>");                         
                    });
				},
				error:function(){   
					console.log("error");
				   alert(objects);   
				}
			});
		});
	   </script>
</body>
</html>


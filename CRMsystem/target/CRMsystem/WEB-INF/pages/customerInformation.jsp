<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>CRM管理系统</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/jquery-ui.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/uniform.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/select2.css" />		
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
                <li class="btn btn-inverse"><a title="" href="<%=request.getContextPath()%>/admin/logout"><i class="icon icon-share-alt"></i> <span class="text">登出</span></a></li>
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
				<li  class="active"><a href="customerInformation.html"><i class="icon icon-tint"></i> <span>客户信息</span></a></li>
				<li><a href="accountRegister.html"><i class="icon icon-pencil"></i> <span>账号开通</span></a></li>
				<li><a href="employeeReport.html"><i class="icon icon-th"></i> <span>员工汇报</span></a></li>
				<li><a href="taskPublish.html"><i class="icon icon-th-list"></i> <span>任务发布</span></a></li>
				
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
								<c:forEach items="${cList}" var="emplouee">
        ${user.username}
        ${user.password}
        ${user.address.value}//可以去对象中的对象的值属性

</c>
									<tr >
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
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
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.uniform.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/select2.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/jquery.dataTables.min.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/unicorn.js"></script>
       <script src="<%=request.getContextPath()%>/CRM/js/unicorn.tables.js"></script>
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
					   alert(objects);   
					}
				});
			});
		</script>
</body>
</html>

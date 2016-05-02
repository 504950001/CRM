<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="CRM/bootstrap/bootstrap.min.css"/>
		<title></title>
		<style type="text/css">
			#panel{
				padding-top: 10px;
				height: 200px;
				background-color: beige;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="liftBox"class="panel">
			</div>
			<div id="panel" class="panel">
				<h1>----CRM客户关系管理系统----</h1>
			</div>
		</div>			
		</div>
		<div class="container" role="form">
    		<form action="admin/loginCheck" method="post">
    			<input type="text" class="form-control" placeholder="用户名" name="username" autofocus/>
    			<input type="password" class="form-control" placeholder="密码" name="password" />
    			<input type="submit" class="btn btn-lg btn-primary btn-block" value="登录"/>
    		</form>
    	</div>
    	<br><h3>员工注册</h3>
    	<div class="container" role="form">
    		<form action="employee/loginCheck" method="post">
    			<input type="text" class="form-control" placeholder="用户名" name="username" autofocus/>
    			<input type="password" class="form-control" placeholder="密码" name="password" />
    			<input type="submit" class="btn btn-lg btn-primary btn-block" value="登录"/>
    		</form>
    	</div>
	</body>
</html>
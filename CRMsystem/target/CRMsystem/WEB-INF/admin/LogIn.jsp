<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../bootstrap/bootstrap.min.css"/>
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
				<h1>panel h1</h1>
			</div>
		</div>			
    	<div class="container">
    		<form action="admin/loginCheck" method="post">
    			<input type="text" class="form-control" placeholder="用户名" id="username"/>
    			<input type="password" class="form-control" placeholder="密码" id="password"/>
    			<input type="submit" class="btn btn-lg btn-primary btn-block" value="登录"/>
    		</form>
    	</div>
    
 	</body>
</html>
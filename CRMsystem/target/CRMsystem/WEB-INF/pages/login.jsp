<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CRM Admin</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 
        
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/bootstrap-responsive.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CRM/css/unicorn.login.css"/>
    </head>
    <body>
        <div id="logo">
            <img src="<%=request.getContextPath()%>/CRM/img/logo.png" alt="" />
        </div>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="../admin/loginCheck" method="post">
				<p>输入用户名和密码完成登录</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span><input name="username" type="text" placeholder="用户名" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input name="password" type="password" placeholder="密码" />
                        </div>
                    </div>
                </div>
                <!--<a href="#" class="flip-link" id="to-recover">忘记密码？</a>-->
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="">忘记密码？</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="登录" /></span>
                </div>
            <!-- 忘记密码 -->  
            </form>
            <form id="recoverform" action="#" class="form-vertical">
				<p>Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				<div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="to-login">&lt; Back to login</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="Recover" /></span>
                </div>
            </form>
        </div>
        
        <script src="<%=request.getContextPath()%>/CRM/js/jquery.min.js"></script>  
        <script src="<%=request.getContextPath()%>/CRM/js/unicorn.login.js"></script> 
    </body>
</html>

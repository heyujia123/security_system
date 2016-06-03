<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/register.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#inp').click(function() {
			var username = $('#username').val();
			var password = $('#password').val();
			var password2 = $('#password2').val();
			if (username == null || password == null || password2 == null) {
				alert('输入错误，不能为空');
			} else {
				if (password != password2) {
					alert('两次输入的密码不同，请重新输入');
					window.location.href = "register.jsp";
				} else {
					$.ajax({
						type : "post",
						url : "register",
						dataType : "json",
						data : {
							"username" : username,
							"password" : password,
						},
						success : function(data) {
							if (data.result == true || data.result == "true") {
								alert('注册成功，即将进入登录页面');
								window.location.href = "login.jsp";
							} else
								alert("网络连接异常,请稍后重试!");
						}
					});
				}
			}
		});
	});
</script>
</head>

<body>
	<div id="header"></div>
<div id="container">
	<div id="reg" class="reg">
    	<div id="box" class=" container-fluid">
            <div class="form-group">
                <label for="name">用户名：</label>
                <input type="text" class="form-control" name="name" required placeholder="请输入用户名" />
            </div>
            <div class="form-group">
                <label for="name">邮箱：</label>
                <input type="text" class="form-control" name="name" required placeholder="请输入邮箱" />
            </div>
            <div class="form-group">
                <label for="name">电话：</label>
                <input type="text" class="form-control" name="name" required placeholder="请输入电话" />
            </div>
            
            <div class="form-group">
                <label for="password">密码：</label>
                <input type="password" class="form-control" name="name" required placeholder="请输入密码" />
            </div>
            <div class="form-group">
                <label for="pwdCheck">确认密码：</label>
                <input type="password" class="form-control" name="name" required placeholder="请再次输入密码" />
            </div>
    	</div>
    	<div id="confirm">
    		<input name="confirm" type="button" class="btn btn-danger btn-lg" value="立即注册" id="inp"/></div>
	</div>
    <div class="register_pic">
    </div>
</div>
<div id="footer" class="center-block">
			<div class="container">
        		<p class="footer">版权所有：大连理工大学软件学院白晨阳</p>
   		 	</div>
</div>
<script src="js/jquery-1.12.1development.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>

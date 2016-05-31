<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link href="css/style_r.css" rel="stylesheet" type="text/css" />
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
	<div id="reg">
		<div id="pic2"></div>
		<div id="line"></div>
		<div id="box">
			<table width="300" border="0" cellspacing="0">
				<tr>
					<td height="32" class="text">用户名：</td>
					<td><input name="name" type="text" id="username" /></td>
				</tr>
				<tr>
					<td height="32" class="text">输入密码：</td>
					<td><input name="name" type="password" id="password" /></td>
				</tr>
				<tr>
					<td height="32" class="text">确认密码：</td>
					<td><input name="name" type="password" id="password2" /></td>
				</tr>
			</table>
		</div>
		<div id="confirm">
			<input name="confirm" type="button" value="确认" id="inp" />
		</div>
	</div>
</body>
</html>

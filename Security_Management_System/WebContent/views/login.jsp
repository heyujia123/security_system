<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

$(document).ready(function(){
	$('#login').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		var type = $('#type input[name="type"]:checked ').val();
		if(type==1){
			if(username=='admin'&&password=='123'){
				<% session.setAttribute("user_id",1);%>
				alert('管理员登录成功');
				window.location.href="manager.jsp";
				
			}else{
				alert('用户名或密码错误');
				window.location.href="login.jsp";
			}
		}else{
			$.ajax({
				type : "post",
				url : "login",
				dataType : "json",
				data : {"username" : username, "password" : password },
				success : function(data){
					
					if(data.result == "failed"){
						alert('用户名密码错误!');
					}
					else {
						var result = JSON.parse(data.result);
						window.location.href="index.html";
					}
				}
			});
		}
	});
});
</script>
</head>
<body>
<div id="header">
</div>
<div id="container">
	<div id="main">
 		 <h3>账户登录</h3>
  		 <div class="input-group in" id="user">
  			<span class="input-group-btn ">
        		<button class="btn btn-default user_login"></button>
     		</span>
    		<input type="text" name="username" id="username" class="form-control"  placeholder="请输入用户名"/>
 		 </div>
  		 <div class="input-group in" id="pass"> 
  			<span class="input-group-btn">
        		<button class="btn btn-default user_pwd"></button>
     		</span>
    		<input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" />
  		</div>
 
  		<div id="type" class="btn-group" data-toggle="buttons">
  			<label for="type" class="btn btn-info">
  				<input name="type" type="radio"  value="1"/>管理员
    		</label>
    		<label for="type" class="btn btn-info">
  			<input name="type" type="radio"  value="2" checked = "checked"/>普通用户
    		</label>
  		</div>
        <div id="register">
   			<a href="register.jsp">免费注册</a>
   		</div>
  		<div id="submit">
  			<input class="btn btn-primary" name="submit" type="button" value="登录" id="login"/>
  		</div>
   		
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
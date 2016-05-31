<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>
<title>登陆</title>
<link href="css/style_l.css" rel="stylesheet" type="text/css" />
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

<div id="main">
  <div id="pic"></div>
  <div id="register"><a href="register.jsp">我要注册</a></div>
  <div class="in" id="user">
    <input type="text" name="username" id="username" />
  </div>
  <div class="in" id="pass"> 
    <input type="password" name="password" id="password"/>
  </div>
  <div id="type">
  	<input name="type" type="radio"  value="1"/>管理员
  	<input name="type" type="radio"  value="2" checked = "checked"/>普通用户
  </div>
  <div id="submit">
  <input name="submit" type="button" value="登录" id="login"/>
  </div>
</div>
</html>
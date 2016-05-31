<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>股票详情</title>
<link href="css/search_style.css" rel="stylesheet" type="text/css" />
<link href="css/navigation.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<style>
table {
	border-collapse: separate;
	border-spacing: 10px; . tabledate { <!-- --table样式- --> border : 1px
	solid black;
	width: 100%;
	border-collapse: collapse;
}

.tddata {<!---td样式---- > border:1pxsolidblack;
	
}
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var id = $('#id').val();
	$.ajax({
		type : "post",
		url : "getSharesById",
		dataType : "json",
		data : {"id":id},
		success : function(data){
			var result = JSON.parse(data.result);
				var li = "股票代号:&nbsp;&nbsp;"+result.number+"<br/><br/>股票名称:&nbsp;&nbsp;"+result.name+"<br/><br/>所属行业:&nbsp;&nbsp;"+result.category+"<br/><br/>所属模块:&nbsp;&nbsp;"+result.module+"<br/><br/>主要业务:&nbsp;&nbsp;"+result.service+"<br/><br/>副业务:&nbsp;&nbsp;&nbsp;"
				+result.subService+"<br/><br/>核心产品:&nbsp;&nbsp;"+result.coreProduct+"<br/><br/>利好因素:&nbsp;&nbsp;"+result.positiveFactors+"<br/><br/>利空因素:&nbsp;&nbsp;"+result.nagetiveFactors+"<br/><br/>利好月份:&nbsp;&nbsp;"+result.positiveMonth+"<br/><br/>";
				$('#shares').append(li);
		}
	});
});
</script>
</head>
<body>
<input type="hidden" id="id" value=<%=request.getParameter("id")%>>
	<div id="main">
		<div id="header">
			<p id="reg">
				<a href="login.jsp">注销</a> <a href="#">加入我们</a>
			</p>
			<div id="gradient"></div>
		</div>
		<!--end of header-->
		<div id="navigation">
			<ul>
				<li id="first"><a href="index.html">首页<img
						class="daoying_img" src="img/daoying1.png" /></a></li>
				<li id="second"><a href="search.jsp">股票信息查询<img
						class="daoying_img" src="img/daoying2.png" /></a></li>
				<li id="third"><a href="sharesList.jsp">股票信息列表<img
						class="daoying_img" src="img/daoying3.png" /></a></li>
				<!--下拉菜单-->
				<li id="four"><a href="manager.jsp">股票管理<img
						class="daoying_img" src="img/daoying4.png" /></a></li>
			</ul>
		</div>
		<div id="body1">
			<div id="part1">
				<div id="top">
				</div>
				<div id="cont">
					<h2>股票详情</h2>
					<div id="shares" ></div>
				</div>
				<!--end of cont-->
			</div>
			<!--end of part 1-->
			<div id="img"></div>

		</div>
		<!--end of body-->
		<div id="footer">
			<p class="footer">版权所有：大连理工大学软件学院白晨阳</p>
		</div>
		<!--end of footer-->
	</div>
	<!--end of main-->
	<script src="js/jquery.min.js"></script>
	<script src="js/navigation.js"></script>
</body>
</html>
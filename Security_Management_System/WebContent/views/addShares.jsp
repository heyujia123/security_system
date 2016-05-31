<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
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
	$(document).ready(function() {
		$('#add').click(function() {
			var number = $('#number').val();
			var name = $('#name').val();
			var category = $('#category').val();
			var module=$('module').val;
			var service=$('service').val;
			var subService=$('subService').val;
			var coreProduct=$('coreProduct').val;
			var positiveFactors=$('positiveFactors').val;
			var nagetiveFactors=$('nagetiveFactors').val;
			var positiveMonth=$('positiveMonth').val;
			if (number == null || name == null || category == null || module ==null || service==null ||subService==null ||coreProduct==null || positiveFactors==null ||nagetiveFactors==null || positiveMonth) {
				alert('输入错误，不能为空');
			} else {
					$.ajax({
						type : "post",
						url : "addShares",
						dataType : "json",
						data : {
							"number" : number,
							"name" : name,
							"category":category,
							"module":module,
							"service":service,
							"subService":service,
							"coreProduct":coreProduct,
							"positiveFactors":positiveFactors,
							"nagetiveFactors":nagetiveFactors,
							"positiveMonth":positiveMonth
						},
						success : function(data) {
							if (data.result == true || data.result == "true") {
								alert('添加成功成功，即将进入管理页面');
								window.location.href = "manager.jsp";
							} else
								alert("网络连接异常,请稍后重试!");
						}
					});
			}
		});
	});
</script>
</head>
<body>
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
				<div id="top"><p>添加股票</p></div>
				<div id="cont">
						股票代码:<input type="text" name="number" id="number" /><br/><br/>
						股票名称:<input type="text" name="name" id="name" /><br/><br/>
						所属行业:<input type="text" name="category" id="category" /><br/><br/>
						所属模块:<input type="text" name="module" id="module" /><br/><br/>
						主要业务:<input type="text" name="service" id="service" /><br/><br/>
						副业务:  <input type="text" name="subService" id="subService" /><br/><br/>
						核心产品:<input type="text" name="coreProduct" id="coreProduct" /><br/><br/>
						利好因素:<input type="text" name="positiveFactors" id="positiveFactors" /><br/><br/>
						利空因素:<input type="text" name="nagetiveFactors" id="nagetiveFactors" /><br/><br/>
						利好月份:<input type="text" name="positiveMonth" id="positiveMonth" /><br/><br/>
						<input type="button" name="submit" id="submit" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="manager.jsp"><input type="button" name="submit" id="submit" value="返回"></a>

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
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
<script type="text/javascript">
	$(document).ready(
			function () {
				$('#submit').click(
						function search() {
							var search = $('#search').val();
							if (search == null) {
								alert('输入错误');
							} else {
								$.ajax({
									type : "post",
									url : "search",
									dataType : "json",
									data : {
										"number" : search
									},
									success : function(data) {
										$("#shares").empty();
										$("#img1").empty();
										var result = JSON.parse(data.result);
										var elements=result.data.split(",");
										var li="<td>"+ elements[0]
										+ "</td><td>"
										+ elements[1]
										+ "</td><td>"
										+ elements[2]
										+ "</td><td>"
										+ elements[3]
										+ "</td><td>"
										+ elements[4]
										+ "</td><td>"
										+ elements[5]
										+ "</td>";
										$('#shares').append(li);
										var minUrl=result.minUrl;
										var dailyUrl=result.dailyUrl;
										var weeklyUrl=result.weeklyUrl;
										var monthUrl=result.monthUrl;
										var li2="<input id='img1' type='image' src='"+minUrl+"' height='350px' width='350px' />"+
										"<input id='img1' type='image' src='"+dailyUrl+"' height='350px' width='350px' /><br/>"+
										"<input id='img1' type='image' src='"+weeklyUrl+"' height='350px' width='350px' />"+
										"<input id='img1' type='image' src='"+monthUrl+"' height='350px' width='350px' />";
										$('#img1').append(li2);
									}
								});
							}
						});
					/* var a=setInterval(search, 5000);  */
			});
</script>
<script type="text/javascript">
	var fresh=function(){
		$.ajax({
			type : "post",
			url : "search",
			dataType : "json",
			data : {
				"number" : search
			},
			success : function(data) {
				$("#shares").empty();
				$("#img1").empty();
				var result = JSON.parse(data.result);
				var elements=result.data.split(",");
				var li="<td>"+ elements[0]
				+ "</td><td>"
				+ elements[1]
				+ "</td><td>"
				+ elements[2]
				+ "</td><td>"
				+ elements[3]
				+ "</td><td>"
				+ elements[4]
				+ "</td><td>"
				+ elements[5]
				+ "</td>";
				$('#shares').append(li);
				var minUrl=result.minUrl;
				var dailyUrl=result.dailyUrl;
				var weeklyUrl=result.weeklyUrl;
				var monthUrl=result.monthUrl;
				var li2="<input id='img1' type='image' src='"+minUrl+"' height='350px' width='350px' />"+
				"<input id='img1' type='image' src='"+dailyUrl+"' height='350px' width='350px' /><br/>"+
				"<input id='img1' type='image' src='"+weeklyUrl+"' height='350px' width='350px' />"+
				"<input id='img1' type='image' src='"+monthUrl+"' height='350px' width='350px' />";
				$('#img1').append(li2);
				}
		});	
	}
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
				<li id="four"><a href="collectionList.jsp">我的收藏<img
						class="daoying_img" src="img/daoying4.png" /></a></li>
			</ul>
		</div>
		<div id="body1">
			<div id="part1">
				<div id="top">
					<table width="800" height="38" background=" #72BBFD">
						<tr>
							<td width="30" height="32"><input id="submit" type='image'
								src='img/find.png' height="30px" width="30px" /></td>
							<td width="758"><input id="search" name='search' type='text'
								value="请输入6位股票代码进行查询"
								onfocus="javascript:if(this.value=='请输入6位股票代号进行查询')this.value='';" /></td>
						</tr>
					</table>
				</div>
				<div id="cont">
					<table>
						<tr>
							<th>指数名称&nbsp;&nbsp;&nbsp;</th>
							<th>当前点数&nbsp;&nbsp;&nbsp;</th>
							<th>当前价格&nbsp;&nbsp;&nbsp;</th>
							<th>涨跌率&nbsp;&nbsp;&nbsp;</th>
							<th>成交量&nbsp;&nbsp;&nbsp;</th>
							<th>成交额&nbsp;&nbsp;&nbsp;</th>
						</tr>
						<tr id="shares">
						</tr>
					</table>
					<div id= img1></div>
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
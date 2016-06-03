<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/basic.css" />
<link rel="stylesheet" href="css/search.css" />
<script src="js/jquery.min.js"></script>
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
										var li2="<div class='row'><div class='col-md-6 sina'><img class='img-responsive' src='"+minUrl+"'/></div>"+
										"<div class='col-md-6 sina'><img class='img-responsive' src='"+dailyUrl+"'/></div></div>"+
										"<div class='row'><div class='col-md-6 sina'><img class='img-responsive' src='"+weeklyUrl+"'/></div>"+
										"<div class='col-md-6 sina'><img class='img-responsive' src='"+monthUrl+"'/></div></div>"+
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
				$("#sina").empty();
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
				var li2="<div class='row'><div class='col-md-6 sina'><img class='img-responsive' src='"+minUrl+"'/></div>"+
				"<div class='col-md-6 sina'><img class='img-responsive' src='"+dailyUrl+"'/></div></div>"+
				"<div class='row'><div class='col-md-6 sina'><img class='img-responsive' src='"+weeklyUrl+"'/></div>"+
				"<div class='col-md-6 sina'><img class='img-responsive' src='"+monthUrl+"'/></div></div>"+
				$('#sina').append(li2);
				}
		});	
	}
</script>

</head>
<body>
<div id="header">
	<p id="reg">
		<a href="login.jsp">注销</a> <a href="#">加入我们</a>
	</p>
</div>
<div id="navigation">
			<ul>
				<li class="nav_active" id="first"><a href="index_manager.html"><span class="glyphicon glyphicon-home"></span> 网站首页<img
						class="daoying_img" src="img/daoying6.png" /></a></li>
				<li id="second"><a href="search_manager.jsp"><span class="glyphicon glyphicon-search"></span> 实时数据<img
						class="daoying_img" src="img/daoying2.png" /></a></li>
				<li id="third"><a href="sharesList_manager.jsp"><span class="glyphicon glyphicon-th-list"></span> 股票信息查询<img
						class="daoying_img" src="img/daoying3.png" /></a></li>
				<!--下拉菜单-->
				<li id="four"><a href="manager.jsp"><span class="glyphicon glyphicon-cog"></span> 股票管理<img
						class="daoying_img" src="img/daoying5.png" /></a></li>
			</ul>
</div>

<div id="body1" class="container">
			<div id="part1">
				<div id="top">
				<input id="search" class="form-control" name='search' type='text' placeholder="请输入6位股票代号进行查询" onfocus="javascript:if(this.value=='请输入6位股票代号进行查询')this.value='';" />
                    <input id="submit" type='image' src='img/find.png' height="30px" width="30px" />	
				</div>
                
				<div id="cont">
					<table class="table">
						<tr>
							<th>指数名称</th>
							<th>当前点数</th>
							<th>当前价格</th>
							<th>涨跌率</th>
							<th>成交量</th>
							<th>成交额</th>
						</tr>
						<tr id="shares">
						</tr>  
					</table>
                     <hr />
				</div>
				<!--end of cont-->
                <div id="sina">
                </div>
			</div>
			<!--end of part 1-->

</div>
<div id="footer" class="center-block">
			<div class="container">
        		<p class="footer">版权所有：大连理工大学软件学院白晨阳</p>
   		 	</div>
</div>
<script type="text/javascript" src="js/jquery-1.12.1development.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
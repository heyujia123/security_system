<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>股票详情</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/basic.css" />
<link rel="stylesheet" href="css/share_manager.css" />
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
				var li = "<li><span>股票代号:</span><span>"+result.number+"</span></li><li><span>股票名称:</span><span>"+result.name+"</span></li><li><span>所属行业:</span><span>"+result.category+"</span></li><li><span>所属模块:</span><span>"+result.module+"</span></li><li><span>主要业务:</span><span>"+result.service+"</span></li><li><span>副业务:</span><span>"
				+result.subService+"</span></li><li><span>核心产品:</span><span>"+result.coreProduct+"</span></li><li><span>利好因素:</span><span>"+result.positiveFactors+"</span></li><li><span>利空因素:</span><span>"+result.nagetiveFactors+"</span></li><li><span>利好月份:</span><span>"+result.positiveMonth+"</span></li>";
				$('#sharesDetails').append(li);
		}
	});
	$('#collect')
	.click(
			function() {
				var id = $('#id').val();
				$.ajax({
							type : "post",
							url : "addCollection",
							dataType : "json",
							data : {
								"sharesId" : id
							},
							success : function(data) {
								if (data.result == true
										|| data.result == "true") {
									alert('添加成功 ');
									window.location.href = "collectionList.jsp";
								} else
									alert("网络连接异常,请稍后重试!");
							}
						});

			});
});
</script>
</head>
<body>
<input type="hidden" id="id" value=<%=request.getParameter("id")%>>
<div id="header">
	<p id="reg">
		<a href="login.jsp">注销</a> <a href="#">加入我们</a>
	</p>
</div>
<div id="navigation">
						<ul>
				<li id="first"><a href="index.html"><span class="glyphicon glyphicon-home"></span> 网站首页<img
						class="daoying_img" src="img/daoying6.png" /></a></li>
				<li id="second"><a href="search.jsp"><span class="glyphicon glyphicon-search"></span> 实时数据<img
						class="daoying_img" src="img/daoying2.png" /></a></li>
				<li id="third" class="nav_active"><a href="sharesList.jsp"><span class="glyphicon glyphicon-th-list"></span> 股票信息查询<img
						class="daoying_img" src="img/daoying3.png" /></a></li>
				<!--下拉菜单-->
				<li id="four"><a href="collectionList.jsp"><span class="glyphicon glyphicon-cog"></span> 我的收藏<img
						class="daoying_img" src="img/daoying5.png" /></a></li>
			</ul>

</div>

<div id="body1" class="container">
	<div id="part1">
		<div id="top">
        	<input class="btn btn-info collect" type="button" id="collect" name="collect" value="收藏">
		</div>
		<div id="cont">
        	<hr />
			<h2>股票详情</h2>
			<div id="shares" >
            	<ul class="sharesDetails" id="sharesDetails">
                </ul>
            </div>
		</div>
				<!--end of cont-->
	</div>
			<!--end of part 1-->
	<div id="img"></div>

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
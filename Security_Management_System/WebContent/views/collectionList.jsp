<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收藏列表</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/basic.css" />
<link rel="stylesheet" href="css/sharesList.css" />
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
	$.ajax({
		type : "post",
		url : "getByUid",
		dataType : "json",
		data : {},
		success : function(data){
				var result = JSON.parse(data.result);
				for(var i=0;i<result.length;i++){
					var li="";
					if(i%2==0){
						var li = li+"<tr class='info'><td>"+result[i].number+"</td><td>"+result[i].name+"</td><td>"+result[i].category+"</td><td>"+result[i].module+"</td><td>"+result[i].service+"</td><td>"
						+result[i].subService+"</td><td>"+result[i].coreProduct+"</td><td>"+result[i].positiveFactors+"</td><td>"+result[i].nagetiveFactors+"</td><td>"+result[i].positiveMonth+"</td><td><a href='#'><span class='glyphicon glyphicon-trash' id='delete'></span></a></td></tr>";
					}else{
						var li = li+"<tr class='success'><td>"+result[i].number+"</td><td>"+result[i].name+"</td><td>"+result[i].category+"</td><td>"+result[i].module+"</td><td>"+result[i].service+"</td><td>"
						+result[i].subService+"</td><td>"+result[i].coreProduct+"</td><td>"+result[i].positiveFactors+"</td><td>"+result[i].nagetiveFactors+"</td><td>"+result[i].positiveMonth+"</td><td><a href='#'><span class='glyphicon glyphicon-trash' id='delete'></span></a></td></tr>";
					}
					$('#shares').append(li);
					var sharesId = result[i].id;
					$('#delete').click(
							function() {
								$.ajax({
									
											type : "post",
											url : "deleteCollection",
											dataType : "json",
											data : {
												"sharesId" : sharesId
											},
											success : function(data) {
												if (data.result == true || data.result == "true") {
													window.location.href = "collectionList.jsp";
												} else
													alert("网络连接异常,请稍后重试!");
											}
										});
							});
			}
		}
	});
});
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
				<li class="nav_active" id="first"><a href="index.html"><span class="glyphicon glyphicon-home"></span> 网站首页<img
						class="daoying_img" src="img/daoying6.png" /></a></li>
				<li id="second"><a href="search.jsp"><span class="glyphicon glyphicon-search"></span> 实时数据<img
						class="daoying_img" src="img/daoying2.png" /></a></li>
				<li id="third"><a href="sharesList.jsp"><span class="glyphicon glyphicon-th-list"></span> 股票信息查询<img
						class="daoying_img" src="img/daoying3.png" /></a></li>
				<!--下拉菜单-->
				<li id="four"><a href="collectionList.jsp"><span class="glyphicon glyphicon-cog"></span> 我的收藏<img
						class="daoying_img" src="img/daoying5.png" /></a></li>
			</ul>
</div>

<div id="body1">
			<div id="part1">
				<div id="cont" class="container">
                     <hr />
					<table class="table table-striped">
						<caption>股票列表</caption>
						<thead>
     					<tr>
                        	<th>股票代号</th>
    						<th>股票名称</th>
        					<th>所属行业</th>
                        	<th>所属模块</th>
        					<th>主要业务</th>
                        	<th>付业务</th>
        					<th>核心产品</th>
                        	<th>利好因素</th>
                            <th>利好因素</th>
                        	<th>利好月份</th>
        					<th>操作</th>
      					</tr>
    					</thead>
    					<tbody id="shares">
    			</tbody>
			</table>
					<div id= img1></div>
				</div>
				<!--end of cont-->
			</div>
			<!--end of part 1-->
			<div id="img"></div>

</div>

 <div id="footer" class="center-block navbar-fixed-bottom">
			<div class="container">
        		<p class="footer">版权所有：大连理工大学软件学院白晨阳</p>
   		 	</div>
</div>
<script type="text/javascript" src="js/jquery-1.12.1development.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
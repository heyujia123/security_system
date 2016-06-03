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
	$(document)
			.ready(
					function() {
						var id = $('#id').val();
						$.ajax({
									type : "post",
									url : "getSharesById",
									dataType : "json",
									data : {
										"id" : id
									},
									success : function(data) {
										var result = JSON.parse(data.result);
										var li = "<div class='form-group'><label class='col-sm-2 control-label '>股票代号:</label><div class='col-sm-5'><input type='text' class='form-control' id='number' value='"+result.number+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>股票名称:</label><div class='col-sm-5'><input type='text' class='form-control' id='name' value='"+result.name+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>所属行业:</label><div class='col-sm-5'><input type='text' class='form-control' id='category' value='"+result.category+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>所属模块:</label><div class='col-sm-5'><input type='text' class='form-control' id='module' value='"+result.module+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>主要业务:</label><div class='col-sm-5'><input type='text' class='form-control' id='service' value='"+result.service+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>副业务:</label><div class='col-sm-5'><input type='text' class='form-control' id='subService' value='"+result.subService+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>核心产品:</label><div class='col-sm-5'><input type='text' class='form-control' id='coreProduct' value='"+result.coreProduct+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>利好因素:</label><div class='col-sm-5'><input type='text' class='form-control' id='positiveFactors' value='"+result.positiveFactors+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>利空因素:</label><div class='col-sm-5'><input type='text' class='form-control' id='nagetiveFactors' value='"+result.nagetiveFactors+"'></div></div>"
										+"<div class='form-group'><label class='col-sm-2 control-label '>利好月份:</label><div class='col-sm-5'><input type='text' class='form-control' id='positiveMonth' value='"+result.positiveMonth+"'></div></div>"
										$('#shares').append(li);
									}
								});
						$('#update')
								.click(
										function() {
											var number = $('#number').val();
											var name = $('#name').val();
											var category = $('#category').val();
											var module = $('#module').val();
											var service = $('#service').val();
											var subService = $('#subService').val();
											var coreProduct = $('#coreProduct').val();
											var positiveFactors = $('#positiveFactors').val();
											var nagetiveFactors = $('#nagetiveFactors').val();
											var positiveMonth = $('#positiveMonth').val();
											if (news_title == null|| news_content == null|| publish_time == null)
												alert('输入错误，不能为空');
											else {
												$.ajax({
															type : "post",
															url : "updateShares",
															dataType : "json",
															data : {
																"number" : number,
																"name" : name,
																"category" : category,
																"module" : module,
																"service" : service,
																"subService" : subService,
																"coreProduct" : coreProduct,
																"positiveFactors" : positiveFactors,
																"nagetiveFactors" : nagetiveFactors,
																"positiveMonth" : positiveMonth
															},
															success : function(
																	data) {
																if (data.result == true
																		|| data.result == "true") {
																	alert('修改成功 ');
																	window.location.href = "manager.jsp";
																} else
																	alert("网络连接异常,请稍后重试!");
															}
														});
											}
										});

						$('#delete').click(
										function() {
											var id = $('#id').val();
											$.ajax({
														type : "post",
														url : "deleteShares",
														dataType : "json",
														data : {
															"id" : id
														},
														success : function(data) {
															if (data.result == true
																	|| data.result == "true") {
																alert('删除成功 ');
																window.location.href = "manager.jsp";
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
		<a href="login.jsp">管理员登陆</a> <a href="#">加入我们</a>
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
					<input class="btn btn-danger" type="button" id="delete" name="delete" value="删除">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success" type="button" id="update" name="update" value="修改">
				</div>
                <hr />
				<div id="cont">
					<h3>股票详情</h3>
					<div id="shares" class="form-horizontal">
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加股票</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/basic.css" />
<link rel="stylesheet" href="css/share_manager.css" /><script type="text/javascript" src="js/jquery.min.js"></script>
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
		$('#submit').click(function() {
			var number = $('#number').val();
			var name = $('#name').val();
			var category = $('#category').val();
			var module=$('#module').val();
			var service=$('#service').val();
			var subService=$('#subService').val();
			var coreProduct=$('#coreProduct').val();
			var positiveFactors=$('#positiveFactors').val();
			var nagetiveFactors=$('#nagetiveFactors').val();
			var positiveMonth=$('#positiveMonth').val();
			if (number == null || name == null || category == null || module ==null || service==null ||subService==null ||coreProduct==null || positiveFactors==null ||nagetiveFactors==null || positiveMonth==null) {
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
<div id="header">
	<p id="reg">
		<a href="css/login.jsp">注销</a> <a href="#">加入我们</a>
	</p>
</div>
<div id="navigation">
			<ul>
				<li id="first"><a href="index_manager.html"><span class="glyphicon glyphicon-home"></span> 网站首页<img
						class="daoying_img" src="img/daoying6.png" /></a></li>
				<li id="second"><a href="search_manager.jsp"><span class="glyphicon glyphicon-search"></span> 实时数据<img
						class="daoying_img" src="img/daoying2.png" /></a></li>
				<li id="third"><a href="sharesList_manager.jsp"><span class="glyphicon glyphicon-th-list"></span> 股票信息查询<img
						class="daoying_img" src="img/daoying3.png" /></a></li>
				<!--下拉菜单-->
				<li id="four" class="nav_active"><a href="manager.jsp"><span class="glyphicon glyphicon-cog"></span> 股票管理<img
						class="daoying_img" src="img/daoying5.png" /></a></li>
			</ul>
</div>

<div id="body1" class="container">
			<div id="part1">
				<h2>添加股票</h2>
                <hr />
				<div id="cont">
					<h3>股票详情</h3>
					<div id="shares" class="form-horizontal">
                    	<div class="form-group">
    						<label class="col-sm-2 control-label ">股票代号：</label>
        					<div class="col-sm-5">
								<input id="number" type="text" class="form-control" />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">股票名称：</label>
        					<div class="col-sm-5">
								<input id="name" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">所属行业：</label>
        					<div class="col-sm-5">
								<input id="category" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">所属模块：</label>
        					<div class="col-sm-5">
								<input id="module" type="text" class="form-control" />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">主要业务：</label>
        					<div class="col-sm-5">
								<input id="service" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">副业务：</label>
        					<div class="col-sm-5">
								<input id="subService" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">核心产品：</label>
        					<div class="col-sm-5">
								<input id="coreProduct" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">利好因素：</label>
        					<div class="col-sm-5">
								<input id="positiveFactors" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">利空因素：</label>
        					<div class="col-sm-5">
								<input id="nagetiveFactors" type="text" class="form-control"  />
        					</div>
  						</div>
                        <div class="form-group">
    						<label class="col-sm-2 control-label ">利好月份：</label>
        					<div class="col-sm-5">
								<input id="positiveMonth" type="text" class="form-control"  />
        					</div>
  						</div>
                    </div>
                    <input class="btn btn-success btn_submit" type="button" name="submit" id="submit" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="manager.jsp"><input class="btn btn-primary btn_submit2"type="button" name="submit" id="back" value="返回"></a>

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
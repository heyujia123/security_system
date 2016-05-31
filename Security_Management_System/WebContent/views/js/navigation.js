$(document).ready(function(e) {
	$(".daoying_img").hide();
	var i="";
    if($("title").html()=="首页"){i="#first";}
	if($("title").html()=="实验室概况"){i="#second";}
	if($("title").html()=="实验室成员"){i="#third";}
	if($("title").html()=="新闻"){i="#four";}
	if($("title").html()=="全文检索"){i="#five";}
	if($("title").html()=="进入论坛"){i="#six";}
	$("#navigation "+i).css({"font-size":"24px"});
	$("#navigation "+i).find(".daoying_img").show();
	$("#navigation li").hover(function(e) {
		$("#navigation"+i).css({"font-size":"24px"});
	   $("#navigation"+i).find(".daoying_img").show();
   		$(this).css({"font-size":"24px"	});
		$(this).find(".daoying_img").show();
	}); 
	$("#navigation li").mouseleave(function(e) {
		if(!(this.id==i))//获取id
		{
   	  	  $(this).css({"font-size":"18px"});
			$(this).find(".daoying_img").hide();
			$("#navigation "+i).css({"font-size":"24px"});
			$("#navigation "+i).find(".daoying_img").show();
		}
    });	
	
});
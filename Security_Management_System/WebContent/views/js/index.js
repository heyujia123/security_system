/*$(document).ready(function() {
    
 function rollright(){
	var move=0;
	function r(){
		if($("#pics").scrollLeft()>=3450){
	     	$("#pics").scrollLeft(0);
		}	
		else{
			move+=1150;
			$("#pics").scrollLeft(move);	
		}
	}
	TimerId=setInterval(r,1000);
 }
rollright();
});*/

function rollright()
{
	var scroll_begin=document.getElementById("scroll_begin");
	scroll_begin.scrollLeft=400;
	alert(scroll_begin.width.value());
	function r(){
		if(scroll_begin.scrollLeft>=3450)
			{scroll_begin.scrollLeft=0;
			alert("nihao");
			}
		else
			{scroll_begin.scrollLeft+=1150;
			alert(scroll_begin.scrollLeft);
			}		
	}
	//TimerId=setInterval(r,1000);
	
}
rollright();
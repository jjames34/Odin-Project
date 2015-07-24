<!DOCTYPE html>
<html>
	<head>
		<title>Jerry's pixel drawer</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script>
		var isClean = true;
		function populateWidth(width) {
		 var $div = $("div");
  		for(var i = 0; i < 16; i++){	
			$div.after("<div></div>");
			}
		}
		function populateHeight(height){
		var $div2 = $("div");
  		for(var i = 0; i < 16; i++){	
			$div2.append("<div></div>");
			}
		}
$(document).ready(function(){
while (isClean) {	
	populateWidth(20);
	populateHeight(20);
	isClean = false;
} 
$("div").hover(function(){
	$(this).css("background-color","red");
});

});


function functionOne() {  
	$("div").remove();
	var width = prompt("How wide do you want the board?");
 	var height = prompt("How high do you want the board?");
 	$
}
function functionTwo() { 
	alert('You clicked the bottom text'); 
	}
		</script>
		<link rel="stylesheet" type="text/css" href="script.css"/>
	</head>
<body>
<p><a href="#" onClick="functionOne();">Test me.</a></p>
 <p><a href="javascript:functionTwo();">Bottom Text</a></p>
<div id="main">
	<div></div>
</div>
</body>
</html>
/* 캐러셀 */
/*========================================================================*/
$(document).ready(function() {
	$("#pause").click(function(){
		$(".carousel").carousel("pause");
		$("#pause").css({"display" : "none"});
		$("#cycle").css({"display" : "inline-block"});
		console.log("일시정지 클릭");
	});
	
	$("#cycle").click(function(){
		$(".carousel").carousel("cycle");
		$("#cycle").css({"display" : "none"});
		$("#pause").css({"display" : "inline-block"});
		console.log("재생 클릭");
	});
});
/**/

/*function pauseFn(){
	$(".carousel").carousel("pause");
	$("#pause").css({"display" : "none"});
	$("#cycle").css({"display" : "inline-block"});
	console.log("일시정지 클릭");
}

function cycleFn(){
	$(".carousel").carousel("cycle");
	$("#cycle").css({"display" : "none"});
	$("#pause").css({"display" : "inline-block"});
	console.log("재생 클릭");
}*/
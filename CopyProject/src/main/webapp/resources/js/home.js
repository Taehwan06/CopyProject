/* 캐러셀 */
/*========================================================================*/
$("#pause").click(function(){
	$(".carousel").carousel("pause");
	$("#pause").css({"display" : "none"});
	$("#cycle").css({"display" : "inline-block"});
});

$("#cycle").click(function(){
	$(".carousel").carousel("cycle");
	$("#cycle").css({"display" : "none"});
	$("#pause").css({"display" : "inline-block"});
});
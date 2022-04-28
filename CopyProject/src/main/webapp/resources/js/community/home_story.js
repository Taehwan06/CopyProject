$(document).ready(function(){
	var boxWidth = $(".storyImg").width();
	$(".storyImg").height(boxWidth/4*3);
	
	boxWidth = $("#storyimg_area").width();
	$("#storyimg_area").height(boxWidth*0.6);
	
	if($(window).width()<576){
		$("#storyimg_area").height(boxWidth*0.8);
	}
	
	/* 스토어 서브 네비 */
	/*========================================================================*/
	$("#menuStore").mouseover(function(){
		$("#menuComm").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
			$("#subNav2").css({"display" : "none"});
		}
	});
	
	$("header").mouseover(function(){
		if($(window).width()>751){
			$("#subNav2").css({"display" : "block"});
			$("#subNav").css({"display" : "none"});
		}
	});
	
	$("#menuLogin").mouseover(function(){
		$("#subNav2").css({"display" : "none"});
	});
	
	$("#menuLogin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav2").css({"display" : "block"});
		}
	});
	
	$("#menuJoin").mouseover(function(){
		$("#subNav2").css({"display" : "none"});
	});
	
	$("#menuJoin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav2").css({"display" : "block"});
		}
	});
	
	$("#menuSearchlist").mouseover(function(){
		$("#subNav2").css({"display" : "none"});
	});
	
	$("#menuSearchlist").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav2").css({"display" : "block"});
		}
	});
	
	/* 커뮤니티 서브네비 */
	/*========================================================================*/
	$("#menuComm").mouseover(function(){
		$("#menuComm").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "block"});
		}
	});

	$("#subNav").mouseover(function(){
		if($(window).width()>751){
			$("#menuStore").css({"color" : "#ffb6c1"});
		}
	});

	$("#subNav").mouseleave(function(){
		$("#menuStore").css({"color" : "black"});
		$("#menuComm").css({"color" : "#ffb6c1"});
		$("#subNav").css({"display" : "none"});
		$("#subNav2").css({"display" : "block"});
	});
	
	$("#community").mouseover(function(){
		$("#community").css({"color" : "#ffb6c1"});
	});
	
	/* 카테고리 */
	/*========================================================================*/
	
	$("#category").mouseover(function(){
		$("#categoryLi").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$(".categoryDiv").css({"display" : "block"});
		}
	});

	$("#category").mouseleave(function(){
		$("#categoryLi").css({"color" : "black"});
		$(".categoryDiv").css({"display" : "none"});
		
	});

	$(".categoryDiv").mouseover(function(){
		if($(window).width()>751){
			$("#categoryLi").css({"color" : "#ffb6c1"});
			$(".categoryDiv").css({"display" : "block"});
		}
	});

	$(".categoryDiv").mouseleave(function(){
		$("#categoryLi").css({"color" : "black"});
		$(".categoryDiv").css({"display" : "none"});
	});
});	

$(window).resize(function() {
	var boxWidth = $(".storyImg").width();
	$(".storyImg").height(boxWidth/4*3);
	
	if($(window).width()<751 && $(window).width()>576){
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "none"});
			$(".storyImg").height(boxWidth/4*3);
	}
	
	boxWidth = $("#storyimg_area").width();
	$("#storyimg_area").height(boxWidth*0.6);
	
	if($(window).width()<576){
		$("#storyimg_area").height(boxWidth*0.8);
	}
});
function writeFn(){
	swal({
		text : "로그인 후 이용 가능합니다.",
		button : "확인",
		closeOnClickOutside : false
	}).then(function(){
		location.href='home_insert.do';
	});
}
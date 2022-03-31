$(document).ready(function(){
	/* 스토어 서브 네비 */
	/*========================================================================*/
	$("#menuStore").mouseover(function(){
		$("#menuStore").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
			$("#subNav2").css({"display" : "none"});
		}
	});
	
	$("header").mouseover(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});

	$("#subNav").mouseover(function(){
		if($(window).width()>751){
			$("#menuStore").css({"color" : "#ffb6c1"});
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuLogin").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuLogin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuJoin").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuJoin").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	$("#menuSearchlist").mouseover(function(){
		$("#subNav").css({"display" : "none"});
	});
	
	$("#menuSearchlist").mouseleave(function(){
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
		}
	});
	
	/* 커뮤니티 서브네비 */
	/*========================================================================*/
	$("#menuComm").mouseover(function(){
		$("#menuComm").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "block"});
		}else{
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "none"});
		}
	});

	$("#menuComm").mouseleave(function(){
		$("#menuComm").css({"color" : "black"});
		$("#menuStore").css({"color" : "#ffb6c1"});
		$("#subNav2").css({"display" : "none"});
	});

	$("#subNav2").mouseover(function(){
		if($(window).width()>751){
			$("#menuComm").css({"color" : "#ffb6c1"});
			$("#subNav2").css({"display" : "block"});
		}
	});

	$("#subNav2").mouseleave(function(){
		$("#menuComm").css({"color" : "black"});
		$("#menuStore").css({"color" : "#ffb6c1"});
		$("#subNav2").css({"display" : "none"});
		$("#subNav").css({"display" : "block"});
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
	
	/* 상품정보 */
	/*========================================================================*/
	
	$("#shop_information_area_header").mouseover(function(){
		$("._product").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#shop_information_area_header").mouseleave(function(){
		$("._product").css({"border" : "none", "color" : "black"});
	});
	
	$("#shop_information_area").mouseover(function(){
		$("._product").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#shop_information_area").mouseleave(function(){
		$("._product").css({"border" : "none", "color" : "black"});
	});
	
	$("#review_area_header").mouseover(function(){
		$("._review").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#review_area_header").mouseleave(function(){
		$("._review").css({"border" : "none", "color" : "black"});
	});
	
	$("#review_area").mouseover(function(){
		$("._review").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#review_area").mouseleave(function(){
		$("._review").css({"border" : "none", "color" : "black"});
	});
	
	$("#QnA_area_header").mouseover(function(){
		$("._QnA").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#QnA_area_header").mouseleave(function(){
		$("._QnA").css({"border" : "none", "color" : "black"});
	});
	
	$("#QnA_area").mouseover(function(){
		$("._QnA").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#QnA_area").mouseleave(function(){
		$("._QnA").css({"border" : "none", "color" : "black"});
	});
	
	$("#delivery_area_header").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#delivery_area_header").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#delivery_area").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#delivery_area").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_area_header").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_area_header").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_area").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_area").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
	$("#change_content").mouseover(function(){
		$("._change").css({"border-bottom" : "4px solid #ffb6c1", "color" : "#ffb6c1"});
	});

	$("#change_content").mouseleave(function(){
		$("._change").css({"border" : "none", "color" : "black"});
	});
	
});

$(window).resize(function() {
	if($(window).width()<751 && $(window).width()>576){
			$("#subNav").css({"display" : "none"});
			$("#subNav2").css({"display" : "none"});
	}
});
$(document).ready( function(){
	
	/* 실시간 검색어 */
   	/*========================================================================*/   	
	$(".searchListUl").mouseover(function(){
		$("#searchListUlHidden").css("display", "inline-block");
		$(".searchListUl").css("border", "2px solid #ffb6c1");
		$(".searchListUl").css("background-color", "white");
		$(".searchListUl").css("box-shadow", "0px 0px 10px #ffb6c1");
		$("#searchListLiTitle").css("border-bottom","1px solid lightgray");
		$("#searchListLiTitle").css("margin-bottom","20px");
		$("#searchListLiTitle").css("padding-bottom","20px");
	});

	$(".searchListUl").mouseleave(function(){
		$("#searchListUlHidden").css("display", "none");
		$(".searchListUl").css("border", "none");
		$(".searchListUl").css("background", "none");
		$(".searchListUl").css("box-shadow", "none");
		$("#searchListLiTitle").css("border-bottom","none");
		$("#searchListLiTitle").css("margin-bottom","0px");
		$("#searchListLiTitle").css("padding-bottom","0px");
	});
				
	
	
	/* 스토어 서브 네비 */
   	/*========================================================================*/
	$("#menuStore").mouseover(function(){
		$("#menuStore").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav").css({"display" : "block"});
			$("#subNav2").css({"display" : "none"});
		}
	});

	$("#menuStore").mouseleave(function(){
		$("#menuStore").css({"color" : "black"});
		$("#subNav").css({"display" : "none"});
		
	});

	$("#subNav").mouseover(function(){
		if($(window).width()>751){
			$("#menuStore").css({"color" : "#ffb6c1"});
			$("#subNav").css({"display" : "block"});
		}
	});

	$("#subNav").mouseleave(function(){
		if($(window).width()>751){
			$("#menuStore").css({"color" : "black"});
			$("#subNav").css({"display" : "none"});
		}
	});

	/* 커뮤니티 서브네비 */
   	/*========================================================================*/
	$("#menuComm").mouseover(function(){
		$("#menuComm").css({"color" : "#ffb6c1"});
		if($(window).width()>751){
			$("#subNav2").css({"display" : "block"});
			$("#subNav").css({"display" : "none"});
		}
	});

	$("#menuComm").mouseleave(function(){
		$("#menuComm").css({"color" : "black"});
		$("#subNav2").css({"display" : "none"});
	});

	$("#subNav2").mouseover(function(){
		if($(window).width()>751){
			$("#menuComm").css({"color" : "#ffb6c1"});
			$("#subNav2").css({"display" : "block"});
		}
	});

	$("#subNav2").mouseleave(function(){
		if($(window).width()>751){
			$("#menuComm").css({"color" : "black"});
			$("#subNav2").css({"display" : "none"});
		}
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
		if($(window).width()>751){
			$("#categoryLi").css({"color" : "black"});
			$(".categoryDiv").css({"display" : "none"});
		}
	});

});
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.Top_btn').css({"visibility" : "visible"});
		$('.Top_btn').show();
	}else{
		$('.Top_btn').hide();
	}
});

function locationFn(type){
	if(type == 'Top'){
		$("html, body").animate({scrollTop: 0},400);
	}else if(type == 'product'){
		offset = $("#shop_information_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'review'){
		offset = $("#review_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'QnA'){
		offset = $("#QnA_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}else if(type == 'change'){
		offset = $("#delivery_area_header").offset();
		$("html, body").animate({scrollTop: offset.top - 200},400);
	}
}
$(document).ready( function(){
	//카테고리 클릭시 페이지 이동
	$(".category_link").click(function(){
		var id = $(this).attr('id');
		location.href = 'store_list.do?category='+id;
	});
	
	//화면시작시 카테고리 이미지크기맞게 조정
	$(".img_box").height($("#big_img").height());
	
	//창크기 변화시 이미지크기조절
	$(window).resize(function() {
		var img_h = $("#big_img").height();
		$(".img_box").height(img_h);
	});
	
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('.write_btn').css({"visibility" : "visible"});
			$('.write_btn').show();
		} else{
			$('.write_btn').hide();
		}
	});
	
	$(".write_btn_").on('click',function(){
		location.href = 'store_insert.do';
	});
	$(".write_btn").on('click',function(){
		location.href = 'store_insert.do';
	});
});
function follow(midx){
	$.ajax({
		type : 'post',
		url : contextPath+'/community/follow',
		data : 'midx='+midx,
		success : function(result){
			if(result == "FollowOK"){
				location.reload();
				
			}
		}
	});
	
}	
	
function unfollow(midx){
	$.ajax({
			type : 'post',
			url : contextPath+'/follow/unfollow',
			data : 'midx='+midx,
			success : function(result){
				if(result == "UnFollowOK"){
					location.reload();
					
				}
			}	
		});
}

function login(){
	swal({
		text : "로그인 후 이용 가능합니다.",
		button : "확인",
		closeOnClickOutside : false
	}).then(function(){
		location.href=contextPath+"/login/login.do"
	})
}

$(document).ready(function(){
	var img = document.getElementsByTagName("img");
	$(".com_content").children().find(img).css("width", "100%");
	
	var boxWidth = $(".followingImg").width();
	$(".followingImg").height(boxWidth/4*3);
});

$(window).resize(function() {
	var boxWidth = $(".followingImg").width();
	$(".followingImg").height(boxWidth/4*3);
});

$(document).ready(function(){
	$(".followingButton").on("click", function(){
		follow(true);
		console.log("click");
	})
	$(".unfollowingButton").on("click", function(){
		follow(false);
	})
		
});

function follow(check){
	if(check){
		$.ajax({
			type : 'post',
			url : '/controller/follow/follow',
			success : function(result){
				console.log("result = "+result);
				if(result == "FollowOK"){
					$(".followingButtonArea").html("<button type='button' calss='unfollowingButton'>언팔로우</button>");
					
				}
			}
		});
	}else{
		$.ajax({
			type : 'post',
			url : '/controller/follow/unfollow',
			success : function(result){
				console.log("result = "+result);
				if(result == "UnFollowOK"){
					$(".followingButtonArea").html("<button type='button' calss='followingButton'>팔로우</button>");
					
				}
			}	
		});
	}
}

function login(){
	alert("로그인 후 이용 가능합니다.");
	location.href="/controller/login/login.do"
}
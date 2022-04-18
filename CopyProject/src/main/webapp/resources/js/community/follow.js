function follow(midx){
	console.log(midx)
	$.ajax({
		type : 'post',
		url : '/controller/community/follow',
		data : 'midx='+midx,
		success : function(result){
			console.log("result = "+result);
			if(result == "FollowOK"){
				location.reload();
				
			}
		}
	});
	
}	
	
function unfollow(midx){
	$.ajax({
			type : 'post',
			url : '/controller/follow/unfollow',
			data : 'midx='+midx,
			success : function(result){
				console.log("result = "+result);
				if(result == "UnFollowOK"){
					location.reload();
					
				}
			}	
		});
}

function login(){
	alert("로그인 후 이용 가능합니다.");
	location.href="/controller/login/login.do"
}
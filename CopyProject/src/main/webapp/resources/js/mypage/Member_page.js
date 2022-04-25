/* 팔로우 요청 */
function follow(fmidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/mypage/followC',
		data : 'fmidx='+fmidx,
		success : function(result){
			if(result == "FollowOK"){
				location.reload();
				
			}
		}
	})
}

/* 언팔로우 요청 */
function unfollow(fmidx){
	$.ajax({
		type : 'post',
		url : contextPath+'/mypage/unfollowC',
		data : 'fmidx='+fmidx,
		success : function(result){
			if(result == "UnFollowOK"){
				location.reload();
				
				
			}
		}	
	});
}

/*비로그인 시*/
function ReNot(){
	swal({
		text : "로그인 후 이용 가능합니다.",
		button : "확인",
		closeOnClickOutside : false
	}).then(function(){
		location.href = contextPath+"/login/login.do"
	});
}
function loginFn(){
	document.loginFrm.method = "post";
	document.loginFrm.action = "login.do";
	document.loginFrm.submit();
}

function enterkey() {
    if (window.event.keyCode == 13) {
         loginFn();
    }
}


/*Kakao.init("473ca00dc030c2f1282ad75e7ce958a3"); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단*/

//카카오로그인
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope: "profile_nickname, profile_image, account_email, birthday, age_range",
		success: function(response){
			
			window.Kakao.API.request({
				url: "/v2/user/me",
				success: (res) => {
					kakao_account = res.kakao_account;
					
					$("#nick_name").val(kakao_account.profile.nickname);
					document.kakaoFrm.method = "post";
					document.kakaoFrm.action = "kakaoLogin.do";
					document.kakaoFrm.submit();
				}
			});
			// window.location.href = "/ex/kakao_login.html"   // 리다이렉트 되는 코드
		},
		fail: function (error){
			console.log(error);
		}
	});
}

/*//카카오로그아웃
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }*/
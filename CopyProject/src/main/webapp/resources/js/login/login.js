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
					document.subLoginFrm.method = "post";
					document.subLoginFrm.action = "kakaoLogin.do";
					document.subLoginFrm.submit();
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
  
  
//페이스북 (로그인) 기본 설정
/*window.fbAsyncInit = function () {
    //페이스북 로그인 기능 클라이언트 설정
    FB.init({
        appId: '1616647815383805',
        autoLogAppEvents: true,
        xfbml: true,
        version: 'v10.0'
    });

    //페이스북 로그인 여부 확인
    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
};*/

//로그인 상태에 따라 로그인 / 로그아웃 구분
/*const statusChangeCallback = (res)=>{
    if(res.status === 'connected')
        document.querySelector('#logBtn').value="로그아웃";
    else document.querySelector('#logBtn').value= "로그인";
}*/

//페이스북 (로그인)
function facebookLogin() {
    //로그인 정보 GET
    FB.login((res)=>{
        //사용자 정보 GET
        FB.api(
            `/${res.authResponse.userID}/`, 
            'GET',
            {"fields":"id,name,email"},
            (res2) => {
            //res.authResponse.accessToken : 엑세스 토큰
            //res.authResponse.graphDomain : 공급자 (페이스북)
            //res.authResponse.userID : 유저 아이디 구분 (숫자)
            //res2.name : 유저 이름
            //res2.email : 유저 이메일 정보
            
            $("#nick_name").val(res2.name);
			document.subLoginFrm.method = "post";
			document.subLoginFrm.action = "facebookLogin.do";
			document.subLoginFrm.submit();
            
        });
    });

}

//페이스북 (로그아웃)
/*function facebookLogout() {
    FB.logout((res)=>{
        
    });
}*/


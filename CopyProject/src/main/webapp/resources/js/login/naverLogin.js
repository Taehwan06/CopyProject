// 네이버 로그인 기본 설정
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "s1bTLaA8BW2sgPEscAbW", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
		callbackUrl: "http://localhost:8080/controller/login/naverLogin.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
		isPopup: false,
		callbackHandle: true
	}
);

naverLogin.init();

// 네이버 로그인

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			var birthday = naverLogin.user.getBirthday();
			var birthyear = naverLogin.user.getBirthyear();
			var birthdayAry = birthday.split("-");
			
			var gender = naverLogin.user.getGender();
			var mobile = naverLogin.user.getMobile();
			var name = naverLogin.user.getName();
			var nick_name = naverLogin.user.getNickName();
			var profile_system = naverLogin.user.getProfileImage();
			var Uid = naverLogin.user.getId();
			
			$("#nick_name").val(nick_name);
			$("#birthday").val(birthyear+"년 "+birthdayAry[0]+"월 "+birthdayAry[1]+"일");
			$("#id").val(email);
			$("#gender").val(gender);
			$("#phone").val(mobile);
			$("#mambername").val(name);
			$("#profile_system").val(profile_system);
			$("#Uid").val(Uid);
			
			document.subLoginFrm.method = "post";
			document.subLoginFrm.action = "naverLogin.do";
			document.subLoginFrm.submit();
			
		} else {
			//console.log("callback 처리에 실패하였습니다.");
		}
	});
});


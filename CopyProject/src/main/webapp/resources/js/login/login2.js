
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
function naverLoginFn(){
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
				var birthday = naverLogin.user.getBirthday();
				var birthyear = naverLogin.user.getBirthyear();
				var birthdayAry = birthday.split("-");
				var birth = birthyear+"년 "+birthdayAry[0]+"월 "+birthdayAry[1]+"일";
				
				var gender = naverLogin.user.getGender();
				var mobile = naverLogin.user.getMobile();
				var name = naverLogin.user.getName();
				var nick_name = naverLogin.user.getNickName();
				var profile_system = naverLogin.user.getProfileImage();
				var Uid = naverLogin.user.getId();
				
				$("#nick_name").val(nick_name);
				$("#birthday").val(birth);
				$("#id").val(email);
				$("#gender").val(gender);
				$("#phone").val(mobile);
				$("#mambername").val(name);
				$("#profile_system").val(profile_system);
				$("#Uid").val(Uid);
	    		
	    		
	            if(email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(birthday == undefined || birthday == null){
					alert("생일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(birthyear == undefined || birthyear == null){
					alert("출생년도는 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(gender == undefined || gender == null){
					alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(mobile == undefined || mobile == null){
					alert("연락처는 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(name == undefined || name == null){
					alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(nick_name == undefined || nick_name == null){
					alert("닉네임은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}else if(profile_system == undefined || profile_system == null){
					alert("프로필 사진은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
				
			} else {
				//console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
}

// 네이버 로그아웃 관련
//var testPopUp;
//function openPopUp() {
//    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
//}
//function closePopUp(){
//    testPopUp.close();
//}

// 네이버 로그아웃
//function naverLogout() {
	/* openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 10); */
//		naverLogin.logout();
//	location.replace("http://localhost:8080/controller/test.do");
//}

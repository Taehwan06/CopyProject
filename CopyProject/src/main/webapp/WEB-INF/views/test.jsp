<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- 부트스트랩 -->
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- Bootstrap icon CSS-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	<!-- kakao SDK -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		
	<title>홈 프렌즈에 오신걸 환영합니다.</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/home.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	<!-- naver SDK -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>
		

	</script>
	
	<style>
		
	</style>
	
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %> 
	

	<!-- 본문 영역 -->
	<section>
	
	
		<ul>
			<li>
		      <!-- 아래와같이 아이디를 꼭 써준다. -->
		      <a id="naverIdLogin_loginButton" href="#">
		          <span>네이버 로그인</span>
		      </a>
			</li>
			<li onclick="naverLogout(); return false;">
		      <a href="#">
		          <span>네이버 로그아웃</span>
		      </a>
			</li>
		</ul>
		
		
		
		<script>
		
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "s1bTLaA8BW2sgPEscAbW", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
					callbackUrl: "http://localhost:8080/controller/test.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
					isPopup: false,
					callbackHandle: true
				}
			);	
		
		naverLogin.init();
		
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
					
		    		
					console.log(naverLogin.user); 
					
					console.log("id="+email); 
					console.log("birthday="+birthyear+"년 "+birthdayAry[0]+"월 "+birthdayAry[1]+"일"); 
					console.log("gender="+gender); 
					console.log("phone="+mobile); 
					console.log("mambername="+name); 
					console.log("nick_name="+nick_name); 
					console.log("profile_system="+profile_system); 
					console.log("UID="+naverLogin.user.getId()); 
					
		    		
		            if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					//console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
		
		var testPopUp;
		function openPopUp() {
		    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp(){
		    testPopUp.close();
		}
		
		function naverLogout() {
			/* openPopUp();
			setTimeout(function() {
				closePopUp();
				}, 10); */
			
		
			naverLogin.logout();
			
			location.replace("http://localhost:8080/controller/test.do");
		}
		</script>
			
	
	
	
	
	
	
	
	
	
	
		
		 <script>
	        /* //페이스북 (로그인) 기본 설정
	        window.fbAsyncInit = function () {
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
	        };
	
	        //로그인 상태에 따라 로그인 / 로그아웃 구분
	        const statusChangeCallback = (res)=>{
	            if(res.status === 'connected')
	                document.querySelector('#logBtn').value="로그아웃";
	            else document.querySelector('#logBtn').value= "로그인";
	        }
	
	        //페이스북 (로그인)
	        const facebookLogin = ()=>{
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
	        const facebookLogout = ()=>{
	            FB.logout((res)=>{
	                
	            });
	        } */
	    </script>
	   <!--  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script> -->
	
	    <!-- <input type="button" id="logBtn" /> -->
	    <!--UI 관련 스크립트-->
	    <script>
	        /*  //로그인 버튼 클릭시
	         document.querySelector('#logBtn').addEventListener('click',e=>{
	            if(e.target.value === '로그인'){
	                facebookLogin();
	            } else {
	                facebookLogout();
	            }
	        }); */
	    </script>
		
	</section>


	
	<%@ include file="footer.jsp" %>
	<!-- 부트스트랩 -->	

	<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
</body>
</html>

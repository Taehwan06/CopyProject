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
	<!-- facebook SDK -->
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
	<!-- naver SDK -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<title>로그인 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/login/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->	
	<section>
		<div class="login_vacant" id="vacant1"></div>
		<div class="login_wrap container-fluid">  
			<div class="row">
				<div id="loginArea" class="col-12 col-sm-8" style="float: none; margin:0 auto;">
					<img class="login_logo" width="180px" src="${pageContext.request.contextPath}/image/mainLogo.png">
					<c:if test="${facebookUser != null or kakaoUser != null or naverUser != null }">
						<div id="sectionTitle">
							회원가입 후 이용하실 수 있습니다.
						</div>
					</c:if>
					<form name="loginFrm" id="loginFrm">
						<div>
							<input type="text" name="id" id="id" placeholder="  이메일" onkeyup="enterkey();">
						</div>
						<div> 
							<input type="password" name="pass" id="pwd" placeholder="  비밀번호" onkeyup="enterkey();">
						</div>
						<div>
							<input type="button" id="loginButton" value="로그인" onclick="loginFn()">
						</div>
					</form>
					<div>
						<a href="${pageContext.request.contextPath}/login/find_id.do">아이디 찾기 |</a>
						<a href="${pageContext.request.contextPath}/login/find_pwd.do">비밀번호 찾기 |</a>
						<a href="${pageContext.request.contextPath}/login/join.do">회원가입</a>
					</div>
					<hr>
					<div> 
						<p class="SNS_login">SNS계정으로 간편 로그인/회원가입</p>
						<div>
							<div id="naver_id_login" class="snsLoginButton" style="text-align:center">
								<a href="${url}">
									<img id=""naver src="${pageContext.request.contextPath}/image/naverButton2.png">
								</a>
							</div>
							<div class="snsLoginButton">
								<img id="kakao" onclick="kakaoLogin();" src="${pageContext.request.contextPath}/image/kakaoButton2.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="login_vacant"></div>
		
		<form id="subLoginFrm" name="subLoginFrm">
			<input type="hidden" id="nick_name" name="nick_name" value="">
		</form>
	</section>
	
	<script src="${pageContext.request.contextPath}/js/login/login2.js"></script>
	<%@ include file="../footer.jsp" %>
	
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
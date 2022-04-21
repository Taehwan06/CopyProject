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
	
	<title>비밀번호 찾기 - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/login/find_pwd.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/login/find_pwd.js"></script>
	<script src="/controller/js/footer.js"></script>
	

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<div class="contents">
			<form name="findFrm" id="findFrm" class="findFrm" method="post">
				<!-- 이름 -->
				<div class="nameArea border">
					<label for="name" class="label">
						<div name="nameHead" id="nameHead" class="head">이름</div>
					</label>
					<input type="text" name="membername" id="name" class="input value"onblur="onBlurFn(this)" placeholder="예) 이지은">
				</div>
				<label for="name">
					<div id="nameFoot" class="foot">이름을 입력하세요</div>
				</label>
				
				<!-- 아이디 -->
				<div class="idbtnDiv">
				</div>
				<div class="idArea border">
					<label for="id" class="label">
						<div name="idHead" id="idHead" class="head">아이디</div>
					</label>
					<input type="text" name="id" id="id" class="input value" onblur="onBlurFn(this)" placeholder="예) IU@hanmail.net">
				</div>
				
				<label for="id">
					<div id="idFoot" class="foot">아이디를 입력하세요</div>
				</label>
				
				
				<div class="sectionBtnArea">
					<input type="button" name="sectionFindBtn" id="sectionFindBtn" class="sectionFindBtn" value="임시 비밀번호 발송" 
					onclick="findPwdFn()"><br>
					<div>
						<a href="${pageContext.request.contextPath}/login/login.do">로그인 |</a>
						<a href="${pageContext.request.contextPath}/login/join.do">회원 가입 |</a>
						<a href="${pageContext.request.contextPath}/login/find_id.do">아이디 찾기</a>
					</div>
				</div>
				
			</form>
		</div>
		
	</section>


	
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

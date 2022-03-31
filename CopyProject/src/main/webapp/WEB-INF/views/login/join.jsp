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
	
	<title>회원 가입 - 홈 프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/login/join.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/login/join1.js"></script>
	<script src="/controller/js/footer.js"></script>


</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->	
	<section>

		<form name="joinFrm" id="joinFrm" class="joinFrm" method="post">
			<div class="title">회원 가입</div>
			
			<!-- 아이디 -->
			<div class="idbtnDiv">
			</div>
			<div class="idArea border">
				<label for="id" class="label">
					<div name="idHead" id="idHead" class="head">아이디</div>
				</label>
				<input type="text" name="id" id="id" class="input value" onblur="onBlurFn(this)" placeholder="예) IU@hanmail.net">
				<input type="button" name="idbtn" id="idbtn" class="idbtn button" value="인증메일 발송" onclick="sendMailFn()">
			</div>
			
			<label for="id">
				<div id="idFoot" class="foot">아이디를 입력하세요</div>
			</label>
			
			<!-- 인증번호 입력 -->
			<div class="emailArea border">
				<label for="emailcheck" class="label">
					<div name="emailcheckHead" id="emailcheckHead" class="head">인증번호</div>
				</label>
				<input type="text" name="emailcheck" id="emailcheck" class="emailcheck input value" onblur="onBlurFn(this)">
				<input type="button" name="emailbtn" id="emailbtn" class="emailbtn button" value="인증번호 확인" onclick="tempNumCheckFn()">
			</div>
			
			<label for="emailcheck">
				<div id="emailFoot" class="foot">이메일로 발송된 인증번호를 입력해주세요</div>
			</label>
	
			<!-- 비밀번호 -->
			<div class="pwdArea border">
				<label for="pwd" class="label">
					<div name="pwdHead" id="pwdHead" class="head">비밀번호</div>
				</label>
				<input type="password" name="pass" id="pwd" class="input value" onblur="onBlurFn(this)" placeholder="예) abc123!@">
			</div>
			<label for="pwd">
				<div id="pwdFoot" class="foot">비밀번호를 입력하세요</div>
			</label>
	
			<!-- 비밀번호 확인 -->
			<div class="pwdcheckArea border">
				<label for="pwdcheck" class="label">
					<div name="pwdcheckHead" id="pwdcheckHead" class="head">비밀번호 확인</div>
				</label>
				<input type="password" name="pwdcheck" id="pwdcheck" class="input value" onblur="onBlurFn(this)" placeholder="예) abc123!@">
			</div>
			<label for="pwdcheck">
				<div id="pwdcheckFoot" class="foot">비밀번호를 다시 입력하세요</div>
			</label>
	
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
	
			<!-- 닉네임 -->
			<div class="nickArea border">
				<label for="nick" class="label">
					<div name="nickHead" id="nickHead" class="head">닉네임</div>
				</label>
				<input type="text" name="nick_name" id="nick" class="input value" onblur="onBlurFn(this)" placeholder="예) 아이유">
			</div>
			<label for="nick">
				<div id="nickFoot" class="foot">닉네임을 입력하세요</div>
			</label>
	
			<!-- 주소찾기 -->
			<div class="addrArea border">
				<input type="text" name="addr1" id="sample2_postcode" class="addr addr1 input value" onblur="onBlurFn(this)" placeholder="우편번호" readonly>
				<input type="button" id="addrbtn" class="addrbtn button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
			</div>
			
			<input type="text" name="addr2" id="sample2_address" class="addr addr2 input value" onblur="onBlurFn(this)" placeholder="주소" readonly><br>
			<input type="text" name="addr3" id="sample2_detailAddress" class="addr addr3 input value" onblur="onBlurFn(this)" placeholder="상세주소">
			<input type="text" name="addr4" id="sample2_extraAddress" class="addr addr4 input value" onblur="onBlurFn(this)" placeholder="참고항목" readonly>
			
			<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
	
			
			
			<label for="addrbtn">
				<div id="addrFoot" class="foot">우편번호 찾기를 이용하세요</div>
			</label>
	
			<!-- 연락처 -->
			<div class="phoneArea border">
				<label for="phone2" class="label">
					<div name="phoneHead" id="phoneHead" class="head">연락처</div>
				</label>
				<select name="phone1" id="phone1" class="phone value">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> -
				<input type="text" name="phone2" id="phone2" class="phone value" onblur="onBlurFn(this)" placeholder=""> -
				<input type="text" name="phone3" id="phone3" class="phone value" onblur="onBlurFn(this)" placeholder="">
			</div>
			<label for="phone2">
				<div class="foot" id="phoneFoot">연락처를 입력하세요</div>
			</label>
	
			<!-- 생년월일 -->
			<div class="birthArea border">
				<label for="birth1" class="label">
					<div name="birthHead" id="birthHead" class="head">생년월일</div>
				</label>
				<input type="text" name="birth1" id="birth1" class="birth value" onblur="onBlurFn(this)" placeholder="">년
				<input type="text" name="birth2" id="birth2" class="birth value" onblur="onBlurFn(this)" placeholder="">월
				<input type="text" name="birth3" id="birth3" class="birth value" onblur="onBlurFn(this)" placeholder="">일
			</div>
			<label for="birth1">
				<div id="birthFoot" class="foot">생년월일을 입력하세요</div>
			</label>
	
			<!-- 성별 -->
			<div class="genderArea border">
				<label for="" class="label">
					<div name="genderHead" id="genderHead" class="head">성별</div>
				</label>
				<label for="gender1" class="labelGender">
					<input type="radio" name="gender" id="gender1" class="input value gender" value="M" onblur="onBlurFn(this)" placeholder="">남성
				</label>
				<label for="gender2" class="labelGender">
					<input type="radio" name="gender" id="gender2" class="input value gender" value="F" onblur="onBlurFn(this)" placeholder="">여성
				</label>
				<label for="gender3" class="labelGender">
					<input type="radio" name="gender" id="gender3" class="input value gender" value="N" onblur="onBlurFn(this)" placeholder="">선택 안 함
				</label>
			</div>
			<label for="gender">
				<div id="genderFoot" class="foot">성별을 입력하세요</div>
			</label>
	
			<!-- 추천인 -->
			<div class="recommendArea border">
				<label for="recommend" class="label">
					<div name="recommendHead" id="recommendHead" class="head">추천인</div>
				</label>
				<input type="text" name="recommender" id="recommend" class="input value"onblur="onBlurFn(this)" placeholder="예) abc123@naver.com">
			</div>
			<label for="recommend">
				<div id="recommendFoot" class="foot">유효하지 않은 회원입니다</div>
			</label>
	
			<!-- 버튼 영역 -->
			<div class="submitArea">
				<input type="button" name="submitbtn" id="submitbtn" class="submitbtn button" onclick="joinSubmitFn()" value="회원 가입"><br>
				<div>
					<a href="${pageContext.request.contextPath}/login/find_id.do">아이디 찾기 |</a>
					<a href="${pageContext.request.contextPath}/login/find_pwd.do">비밀번호 찾기 |</a>
					<a href="${pageContext.request.contextPath}/login/login.do">로그인</a>
				</div>
			</div>
		</form>	
		
	</section>
	
	<!-- 우편번호 찾기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/controller/js/login/join2.js"></script>

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
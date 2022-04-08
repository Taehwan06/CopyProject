<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 부트스트랩 -->
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- Bootstrap icon CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<title>비밀번호 변경</title>
	
		
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/member_modify.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/mypage/password_modify.js"></script>
	<script src="/controller/js/login/join1.js"></script>
	<!-- SweetAlert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %> 
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container">
			<div class="row">
				<div class="col-12 coll-pull-12 coll-md-12 col-lg-12 col-xl-12 member_modiv">
					<div class="membermodiv_title">
						비밀번호 변경
					</div>
					<div id="memberEdit_wrap">
						<form name="modifyFrm"><!-- form태그 위치 -->
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									새 비밀번호
								</div>
								<div class="Edit edit_member_form">
									<input type="password" id="newpass" value="" name="pass">
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									비밀번호 확인
								</div>
								<div class="Edit edit_member_form">
									<input type="password" id="newpassre" value="" name="passre">
								</div>
								<div class="text-span">	
									<div class="Edit vacantSpan"></div><span id="guideSpan">&nbsp;&nbsp;</span>
								</div>
							</div>
							<div class="memberEditSubmit">
								<input type="button" id = "passChangeBtn" value="비밀번호 변경" onclick="checkSubmitFn()">
								<input type="hidden" value="${loginUser.midx}" name="midx">
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	
	</section>
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
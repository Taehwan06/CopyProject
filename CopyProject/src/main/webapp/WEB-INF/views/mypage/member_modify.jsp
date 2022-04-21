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
	
	<title>회원정보수정 - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/mypage/member_modify.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/mypage/member_modify.js"></script>


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
						회원정보수정
					</div>
					<div class="withdrawal">
						<a href='${pageContext.request.contextPath}/mypage/password_check.do'>비밀번호 변경</a>&nbsp;|
						<a href='${pageContext.request.contextPath}/mypage/addr_modify.do'>주소변경</a>&nbsp;|
						<a href='${pageContext.request.contextPath}/mypage/member_delete.do'>탈퇴하기</a>
					</div>
					<div id="memberEdit_wrap">
						<form name="memberModifyFrm"><!-- form태그 위치 -->
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									이메일
								</div>
								<div class="Edit edit_member_form">
									<input type="text" id="emailInput" value="${vo.id}" name="id" readonly onclick="impossible('email')">
								</div>
								<div class="text-span">
									<div class="Edit vacantSpan"></div><span id="impossibleSpan">&nbsp;  이메일은 수정이 불가합니다</span>
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									닉네임
								</div>
								<div class="Edit edit_member_form">
									<input type="text" id="nickInput" value="${vo.nick_name}" name="nick_name" onchange="guide('nickname')" pattern="^[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$">
								</div>
								<div class="text-span">
									<div class="Edit vacantSpan"></div><span id="guideSpan">&nbsp;&nbsp;</span>
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
								성별
								</div>
								<c:set var="genderInfo" value="${vo.gender}"/>
								<div class="Edit edit_member_form radio-wrap">
									<input type="radio" name="gender" value="F" <c:if test="${genderInfo =='F'}">checked</c:if>>&nbsp;&nbsp;여성&nbsp;&nbsp;
									<input type="radio" name="gender" value="M" <c:if test="${genderInfo =='M'}">checked</c:if>>&nbsp;&nbsp;남성&nbsp;&nbsp;
									<input type="radio" name="gender" value="N"  <c:if test="${genderInfo =='N'}">checked</c:if>>&nbsp;선택 안 함
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									연락처
								</div>
								<!-- jstl-->
									<c:set var = "phoneInfo" value = "${vo.phone}"/>
									<c:set var = "phone1" value = "${fn:substring(phoneInfo,0,3)}"/>
									<c:set var = "phone2" value = "${fn:substring(phoneInfo,4,8)}"/>
									<c:set var = "phone3" value = "${fn:substring(phoneInfo,9,13)}"/>
								<!-- jstl-->
								<div class="Edit edit_member_form">
									<select name="phone1" id="phone1" class="phoneInput">
										<option value="010" <c:if test="${phone1 == '010'}">selected</c:if>>010</option>
										<option value="011" <c:if test="${phone1 == '011'}">selected</c:if>>011</option>
										<option value="016" <c:if test="${phone1 == '016'}">selected</c:if>>016</option>
									</select>
									<input type="text" class="phoneInput" name="phone2" id="phone2" maxlength="4" value="${phone2}" onchange="guide('phone')"  pattern="[0-9]+">
									<input type="text" class="phoneInput" name="phone3" id="phone3" maxlength="4" value="${phone3}" onchange="guide('phone')"  pattern="[0-9]+">
								</div>
								<div class="text-span">
									<div class="Edit vacantSpan"></div><span id="guideSpan2">&nbsp; 가이드스판2</span>
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
									생년월일
								</div>
								<div class="Edit edit_member_form">
									<input type="text" id="BirthInput" value="${vo.birthday}" name="birthday" readonly onclick="impossible('birth')">
								</div>
								<div class="text-span">
									<div class="Edit vacantSpan"></div><span id="impossibleSpan2">&nbsp;  생년월일은 수정이 불가합니다</span>
								</div>
							</div>
							<div class="edit_dummy2">
								<div class="Edit edit_member_info">
									주소
								</div>
								<div class="Edit edit_member_form">
									<input type="text" id="AddrInput1" value="${vo.post_code}" name="post_code" readonly>
								</div>
							</div>
							<div class="edit_dummy">
								<div class="Edit edit_member_info">
								</div>
								<div class="Edit edit_member_form">
									<input type="text" id="AddrInput3" value="${vo.addr}" name="addr" readonly>
								</div>
							</div>
							
							<input type="hidden" name="profile_origin" id="profile_origin" value="">
							<input type="hidden" name="profile_system" id="profile_system" value="">
							<input type="hidden" value="${vo.midx}" name="midx">
							
							<div class="edit_dummy">
							
								<div class="Edit edit_member_info imageDiv">
									프로필 이미지
								</div>
								
								<label for="imgUpload" id="imgLabel">
									<div id="imgArea" class="Edit edit_member_form imageDiv">
										<img id="coverImg" name="coverImg" alt="" onclick="imgValCheckFn()"
										src="/controller/image/${vo.profile_system}" width="180px">
									</div>
								</label>
								
							</div>
							
						</form>
						
						<form name="uploadForm" id="uploadForm" method="post" action="/uploadFile.do" enctype="multipart/form-data">
							<div id="imgUploadArea">
								<input type="file" id="imgUpload" name="imgFile">
							</div>
						</form>	
						
						<div class="memberEditSubmit">
							<input type="button" id="submitButton" value="회원 정보 수정" onclick="checkForm();">
						</div>
						
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
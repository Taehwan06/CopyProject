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
	<!-- sweet alert SDK -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<title>회원 정보 수정 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/management/member_modify.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/management/member_modify.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		
		<div class="sectionTitle">
			회원 정보
		</div>
		
		<form name="memberModifyFrm">
			<div id="sectionContent" class="row">
				
				<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">회원번호</div>
					<div class="col-8 data right midxArea">
						<input type="text" name="midx" id="midx" value="${selectMember.midx }" readonly>
					</div>
				</div>
			</div>
						
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">아이디</div>
					<div class="col-8 data right">${selectMember.id }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">닉네임</div>
					<div class="col-8 data right nickArea">
						<input type="text" name="nick_name" id="nick" value="${selectMember.nick_name }">
					</div>
				</div>
			</div>
						
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">이름</div>
					<div class="col-8 data right nameArea">
						<input type="text" name="membername" id="name" value="${selectMember.membername }">
					</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">생년월일</div>
					<div class="col-8 data right">${selectMember.birthday }</div>
				</div>
			</div>
		
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">연락처</div>
					<div class="col-8 data right">${selectMember.phone }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left" id="addrTitle">주소</div>
					<div class="col-8 data right" id="addrContent">(${selectMember.post_code }) ${selectMember.addr }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">성별</div>
					<div class="col-8 data right genderArea">
						<select id="grade" name="gender">
							<option value="M" <c:if test="${selectMember.gender eq 'M'}">selected</c:if>>남성</option>
							<option value="F" <c:if test="${selectMember.gender eq 'F'}">selected</c:if>>여성</option>
							<option value="N" <c:if test="${selectMember.gender eq 'N'}">selected</c:if>>비공개</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">가입일</div>
					<div class="col-8 data right">${selectMember.join_date }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">추천인</div>
					<div class="col-8 data right">${selectMember.recommender }</div>
				</div>
			</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">회원 등급</div>
						<div class="col-8 data right gradeArea">
							<select id="grade" name="grade">
								<option value="G" <c:if test="${selectMember.grade eq 'G'}">selected</c:if>>일반회원</option>
								<option value="M" <c:if test="${selectMember.grade eq 'M'}">selected</c:if>>매니저</option>
								<option value="A" <c:if test="${selectMember.grade eq 'A'}">selected</c:if>>관리자</option>	
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">탈퇴 여부</div>
						<div class="col-8 data right">${selectMember.del_yn }</div>
					</div>
				</div>
									
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">탈퇴일</div>
						<div class="col-8 data right">${selectMember.del_date }</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">탈퇴 사유</div>
						<div class="col-8 data right">${selectMember.del_cause }</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">블랙리스트 여부</div>
						<div class="col-8 data right blackYnArea">
							<select id="blackYn" name="blacklist_yn">
								<option value="Y" <c:if test="${selectMember.blacklist_yn eq 'Y'}">selected</c:if>>Y</option>
								<option value="N" <c:if test="${selectMember.blacklist_yn eq 'N'}">selected</c:if>>N</option>
							</select>
						</div>
					</div>
				</div>
							
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">블랙리스트 등록일</div>
						<div class="col-8 data right">${selectMember.blacklist_date }</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">블랙리스트 사유</div>
						<div class="col-8 data right blackCauseArea">
							<input type="text" name="black_cause" id="blackCause" value="${selectMember.black_cause }">
						</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left">팔로워 수</div>
						<div class="col-8 data right">${selectMember.follower_cnt }</div>
					</div>
				</div>
				
				<div class="col-12 borderDiv">
					<div class="row">
						<div class="col-4 data left" id="profileImgTitle">프로필 이미지</div>
						<div class="col-8 data right" id="profileImgContent">
							<img src="${pageContext.request.contextPath}/image/${selectMember.profile_system }" id="profileImg">
						</div>
					</div>
				</div>
			
			</div>
			
			<input type="hidden" name="nowPage" id="nowPage">
			<input type="hidden" name="searchType" id="searchType">
			<input type="hidden" name="searchValue" id="searchValue">
			<input type="hidden" name="cntPerPage" id="cntPerPage">
		</form>
		
		<div id="buttonArea">
			<input type="button" name="saveButton" id="saveButton" class="button" value="저장" 
			onclick="modifyFn(${memberPagingvo.nowPage }, '${memberPagingvo.searchType }', '${memberPagingvo.searchValue }', ${memberPagingvo.cntPerPage})">
			<input type="button" name="cancelButton" id="cancelButton" class="button" value="취소" 
			onclick="cancelFn(${memberPagingvo.nowPage }, '${memberPagingvo.searchType }', '${memberPagingvo.searchValue }', ${memberPagingvo.cntPerPage})">
			<input type="button" name="imgDelButton" id="imgDelButton" class="button" value="프로필 이미지 삭제" 
			onclick="imgDelFn(${memberPagingvo.nowPage }, '${memberPagingvo.searchType }', '${memberPagingvo.searchValue }', '${selectMember.membername }', ${memberPagingvo.cntPerPage})">
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

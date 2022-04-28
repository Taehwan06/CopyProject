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
	
	<title>회원 상세 정보 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/management/member_view.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/management/member_view.js"></script>
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
		
		<div id="sectionContent" class="row">
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">회원번호</div>
					<div class="col-8 data right">${selectMember.midx }</div>
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
					<div class="col-8 data right">${selectMember.nick_name }</div>
				</div>
			</div>
						
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">이름</div>
					<div class="col-8 data right">${selectMember.membername }</div>
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
					<div class="col-8 data right">
						<c:if test="${selectMember.gender != null && selectMember.gender eq 'F' }">
							여성
						</c:if>
						<c:if test="${selectMember.gender != null && selectMember.gender eq 'M' }">
							남성
						</c:if>
						<c:if test="${selectMember.gender != null && selectMember.gender eq 'N' }">
							비공개
						</c:if>
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
					<div class="col-8 data right">
						<c:if test="${selectMember.grade != null && selectMember.grade eq 'G' }">
							일반회원
						</c:if>
						<c:if test="${selectMember.grade != null && selectMember.grade eq 'M' }">
							매니저
						</c:if>
						<c:if test="${selectMember.grade != null && selectMember.grade eq 'A' }">
							관리자
						</c:if>
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
					<c:if test="${selectMember.del_yn eq 'Y' || (selectMember.del_yn eq 'N' && selectMember.del_date == null) }">
						<div class="col-4 data left">탈퇴일</div>
					</c:if>
					<c:if test="${selectMember.del_yn eq 'N' && selectMember.del_date != null }">
						<div class="col-4 data left">복구일</div>
					</c:if>
					<div class="col-8 data right">${selectMember.del_date }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<c:if test="${selectMember.del_yn eq 'Y' || (selectMember.del_yn eq 'N' && selectMember.del_date == null) }">
						<div class="col-4 data left">탈퇴 사유</div>
					</c:if>
					<c:if test="${selectMember.del_yn eq 'N' && selectMember.del_date != null }">
						<div class="col-4 data left">복구 사유</div>
					</c:if>
					<div class="col-8 data right">${selectMember.del_cause }</div>
				</div>
			</div>
			
			<div class="col-12 borderDiv">
				<div class="row">
					<div class="col-4 data left">블랙리스트 여부</div>
					<div class="col-8 data right">${selectMember.blacklist_yn }</div>
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
					<div class="col-8 data right">${selectMember.black_cause }</div>
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
		
		<div id="buttonArea">
			<c:if test="${selectMember.grade ne 'A'}">
				<input type="button" name="modifyButton" id="modifyButton" class="button" value="수정" 
				onclick="modifyFn(${selectMember.midx },${memberPagingvo.nowPage},'${memberPagingvo.searchType}','${memberPagingvo.searchValue}',${memberPagingvo.cntPerPage})">
			</c:if>			
			
			<input type="button" name="listButton" id="listButton" class="button" value="목록" 
			onclick="listFn(${selectMember.midx },${memberPagingvo.nowPage},'${memberPagingvo.searchType}','${memberPagingvo.searchValue}',${memberPagingvo.cntPerPage})">
			
			<c:if test="${selectMember.grade ne 'A' && selectMember.del_yn eq 'N' }">
				<input type="button" name="withdrawButton" id="withdrawButton" class="button" value="강제 탈퇴" 
				onclick="withdrawFn(${selectMember.midx },'${selectMember.membername }',${memberPagingvo.nowPage},'${memberPagingvo.searchType}','${memberPagingvo.searchValue}',${memberPagingvo.cntPerPage})">
			</c:if>
			
			<c:if test="${selectMember.grade ne 'A' && selectMember.del_yn eq 'Y' }">
				<input type="button" name="restoreButton" id="restoreButton" class="button" value="탈퇴 복구" 
				onclick="restoreFn(${selectMember.midx },'${selectMember.membername }',${memberPagingvo.nowPage},'${memberPagingvo.searchType}','${memberPagingvo.searchValue}',${memberPagingvo.cntPerPage})">
			</c:if>
		</div>
		<form name="inifoFrm">
			<input type="hidden" name="midx" id="midx">
			<input type="hidden" name="nowPage" id="nowPage">
			<input type="hidden" name="searchType" id="searchType">
			<input type="hidden" name="searchValue" id="searchValue">
			<input type="hidden" name="cntPerPage" id="cntPerPage">
		</form>
	
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

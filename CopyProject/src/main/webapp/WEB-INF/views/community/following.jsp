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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<!-- sweet alert SDK -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- facebook SDK -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <!-- naver SDK -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<title>팔로잉 - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/community/following.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/community/follow.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/footer.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>

	<!-- 본문 영역 -->
	<section>
		<c:if test="${loginUser == null || flist == null}">
			<div class="followingTitle">
				<span class="bold">홈프렌즈 유저를 팔로우해보세요!</span><br>
				유저의 최신 소식을 한눈에 모아볼 수 있습니다.
			</div>
		</c:if>
		<c:if test="${loginUser != null && flist != null }">
			<div class="followingUser row">
				<c:forEach items="${followlist}" var="blist">
					<div class="community row">
						<div class="profile">
							<img src="/controller/image/${blist.profile_system }" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="location.href='/controller/mypage/Member_page.do?midx=${blist.midx}'">
							<div class="nick" onclick="location.href='/controller/mypage/Member_page.do?midx=${blist.midx}'">${blist.writer }</div>
							<button type="button" class="followingButton1" onclick="unfollow('${blist.midx}')">언팔로우</button>
						</div>
					</div>
					<div class="com_title row" onclick="location.href='home_view.do?cbidx=${blist.cbidx}&fmidx=${blist.midx }&nowPage=1'">
						${blist.title }
					</div>
					<div class="com_content row" onclick="location.href='home_view.do?cbidx=${blist.cbidx}&fmidx=${blist.midx }&nowPage=1'">
						${blist.content }
					</div>
				</c:forEach>
			</div>
		</c:if>
		<div class="recommend">추천 목록</div>
		<div class="followingUserList row">
			<c:if test="${loginUser == null}">
				<c:forEach items="${memberlist }" var="mlist">
					<input type="hidden" name="midx" value="${mlist.midx }">
					<div class="followingUsers col-12 col-lg-6">
						<div class="row">
							<div class="followingTextArea col-12">
								<div class="row">
									<div class="profile col-2">
										<img src="/controller/image/${mlist.profile_system }" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="location.href='/controller/mypage/Member_page.do?midx=${mlist.midx}'">
									</div>
									<div class="userName col-7" onclick="location.href='/controller/mypage/Member_page.do?midx=${mlist.midx}'">
										<span class="nick">${mlist.nick_name }
									</div>
									<div class="followingButtonArea followingButtonArea${mlist.midx } col-3">
										<c:if test="${loginUser != null }">
											<button type="button" class="followingButton" onclick="follow('${mlist.midx}')">팔로우</button>
										</c:if>
										<c:if test="${loginUser == null }">
											<button type="button" class="followingButton" onclick="login()">팔로우</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="followingImgArea col-12">
							<div class="row">
								<c:forEach items="${mlist.bvo }" var="blist" end="3">
									<div class="followingImgDiv col-3">
										<img src="/controller/upload/${blist.img_system }" alt="게시글 사진" class="followingImg" onclick="location.href='home_view.do?cbidx=${blist.cbidx}&fmidx=${blist.midx }&nowPage=1'">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${loginUser != null }">
				<c:forEach items="${memberlist }" var="mlist">
					<input type="hidden" name="midx" value="${mlist.midx }">
					<div class="followingUsers col-12 col-lg-6">
						<div class="row">
							<div class="followingTextArea col-12">
								<div class="row">
									<div class="profile col-2">
										<img src="/controller/image/${mlist.profile_system }" class="profileImg" alt="팔로잉 유저 프로필 사진" onclick="location.href='/controller/mypage/Member_page.do?midx=${mlist.midx}'">
									</div>
									<div class="userName col-7" onclick="location.href='/controller/mypage/Member_page.do?midx=${mlist.midx}'">
										<span class="nick">${mlist.nick_name }
									</div>
									<div class="followingButtonArea followingButtonArea${mlist.midx } col-3">
										<c:if test="${loginUser != null }">
											<button type="button" class="followingButton" onclick="follow('${mlist.midx}')">팔로우</button>
										</c:if>
										<c:if test="${loginUser == null }">
											<button type="button" class="followingButton" onclick="login()">팔로우</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div class="followingImgArea col-12">
							<div class="row">
								<c:forEach items="${mlist.bvo }" var="blist" end="3">
									<div class="followingImgDiv col-3">
										<img src="/controller/upload/${blist.img_system }" alt="게시글 사진" class="followingImg" onclick="location.href='home_view.do?cbidx=${blist.cbidx}&fmidx=${blist.midx }&nowPage=1'">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
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

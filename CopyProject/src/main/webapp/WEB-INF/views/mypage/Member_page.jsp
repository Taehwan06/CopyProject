<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap icon CSS-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
   <!-- kakao SDK -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- naver SDK -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- facebook SDK -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

	<title>멤버페이지 - 홈프렌즈</title>

	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/mypage/Member_page.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/mypage/Member_page.js"></script>
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->	
	<section>
	<div class="container-fluid align-items-center" >
		<div class="row">
			<div class="col-12 col-lg-3 mydiv1">
				<div id="mypage_profile_box" class="row">
					<div class="col-3 col-lg-12" id="profile_image">
						<img src="${pageContext.request.contextPath}/image/${vo.profile_system}">
					</div>
					<div class="col-9 col-lg-12" id="profile_id">
						<div id="profile_name">
							${vo.nick_name}
						</div>
						<div id="profile_follow">
							<p>	
							   팔로워 <strong>${follower}</strong> | 
							   팔로잉 <strong>${following}</strong>
							</p>
						</div>
						<div id="profile_btn">
							<c:choose>
								<c:when test="${vo.midx eq login_midx }">								
									
								</c:when>
								<c:when test="${vo.midx ne login_midx }">
									<c:if test="${isFollow eq 0}">
										<button onclick="follow(${vo.midx})" class="followBtn">+ 팔로우</button>
									</c:if>
									<c:if test="${isFollow ne 0}">
										<button onclick="unfollow(${vo.midx})" class="unfollowBtn">- 언팔로우</button>
									</c:if>
								</c:when>
							</c:choose>
						</div>
						<br>
					</div>
				</div>
			</div>
<!-- ===============================================================프로필영역================================================================ -->
<!-- ==================================================================================================================================== -->
			<div class="col-12 col-lg-9 mydiv2">
				<div class="mydivtitle mydiv2-2">${vo.nick_name}님의 홈스토리</div>
				<br><br>
				<c:set var="length" value="${fn:length(Storylist)}" />
				<c:choose>
					<c:when test="${length eq 0}">
					<div id="AllstoryDiv">	
						<div class="row">
							<p class="no">아직 등록된 글이 없습니다.</p>
						</div>
					</div>
					</c:when>
					<c:when test="${length ne 0}">
					<div id="AllstoryDiv">	
						<c:forEach items="${Storylist}" var="vo" varStatus="cnt">
							<div id ="myStoryDiv">
								<input type="hidden" value="${vo.cbidx}">
								<a href="${pageContext.request.contextPath}/community/home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx}&nowPage=1"><img class="all_homestroy_img" src="${pageContext.request.contextPath}/upload/${vo.img_system}"><br><span>${vo.title} </span></a>
							</div>	
						</c:forEach>	
					</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<br><br><br><br>
	</div>	
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	

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
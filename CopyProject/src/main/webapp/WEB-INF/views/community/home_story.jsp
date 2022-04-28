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
	
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
	
	<title>홈 스토리 - 홈프렌즈 </title>
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/community/home_story.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/community/home_story.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
		
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	
	<!-- 본문 영역 -->
	<c:if test="${loginUser == null }">
		<button class="write_btn" onclick="writeFn()">
			글쓰기
		</button>
	</c:if>
	<c:if test="${loginUser != null }">
		<button class="write_btn" onclick="location.href='home_insert.do'">
			글쓰기
		</button>
	</c:if>
	<section id="story_area">
		<div class="row" id="storyimg">
			<div class="col-12 col-sm-9 col-md-9 col-xg-9 col-xl-9" id="storyimg_area">
				<img src="${pageContext.request.contextPath}/upload/${CommMain.img_system}" id="MainImg" onclick="location.href='home_view.do?cbidx=${CommMain.cbidx}&fmidx=${CommMain.midx }&nowPage=1'" alt="${CommMain.title}">
				<div id="absolute_">
					<div id="story_title" onclick="location.href='home_view.do?cbidx=${CommMain.cbidx}&fmidx=${CommMain.midx }&nowPage=1'">
						${CommMain.title}
					</div>
					<div id="profile" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${CommMain.midx}'">
						<img class="writerImg" src="${pageContext.request.contextPath}/image/${CommMain.profile_system }" alt="게시글 작성자 프로필 사진">${CommMain.writer}
					</div>
				</div>
				<div id="btn_absolute" onclick="location.href='home_view.do?cbidx=${CommMain.cbidx}&fmidx=${CommMain.midx }&nowPage=1'">
					<button>보러가기</button>
				</div>
			</div>
			<div class="col-sm-3 col-md-3 col-xg-3 col-xl-3" id="slide_area">
			
				<!-- 캐러셀 영역 -->
				<!-- ====================================================================================== -->
				<div id="carouselExampleIndicators" class="carousel slide mainCarousel carousel-fade" data-bs-ride="carousel">
					<div class="carousel-indicators">
							
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active pt10" aria-current="true" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="pt10" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" class="pt10" aria-label="Slide 3"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" class="pt10" aria-label="Slide 4"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" class="pt10" aria-label="Slide 5"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" class="pt10" aria-label="Slide 6"></button>
						
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/image/slide01.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/image/slide02.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/image/slide03.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/image/slide04.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/image/slide05.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/image/slide06.webp" class="d-block w-100" alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 오늘의 스토리 영역 -->
		<!-- ====================================================================================== -->
		<!-- ====================================================================================== -->
		<div class="row storyList">
			<div class="col-6 storyListTitle">
				오늘의 스토리
			</div>
			<div class="col-6 float">
				<c:if test="${loginUser == null }">
					<button class="write_btn_" onclick="writeFn()">
						글쓰기
					</button>
				</c:if>
				<c:if test="${loginUser != null }">
					<button class="write_btn_" onclick="location.href='home_insert.do'">
						글쓰기
					</button>
				</c:if>
				<span id="moreview" onclick="location.href='home_list.do?&sort=recent'">더보기</span>
			</div>
			<c:forEach items="${list}" var="vo" varStatus="cnt" end="7">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
					<img src="${pageContext.request.contextPath}/upload/${vo.img_system}" class="storyImg" onclick="location.href='home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx }&nowPage=1'" alt="${vo.title }">
					<div class="storyText">
						<!-- ${vo.title} -->
						<div class="storyTitle" onclick="location.href='home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx }&nowPage=1'">${vo.title }</div>
						<div class="storyWriter" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}'">
							<img class="writerImg" src="${pageContext.request.contextPath}/image/${vo.profile_system }" onclick="${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}" alt="게시글 작성자 프로필 사진">${vo.writer }
						</div>
					</div>
				</div>
			</c:forEach>
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
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
	
	<title>홈 프렌즈에 오신걸 환영합니다.</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/home.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>

</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %> 

	<!-- 본문 영역 -->
	<section>
		<!-- 캐러셀 영역 -->
		<!-- ====================================================================================== -->
		<!-- ====================================================================================== -->
		<div id="carouselExampleIndicators" class="carousel slide mainCarousel carousel-fade" data-bs-ride="carousel">
			<div class="carousel-indicators">
				
				<button class="carButton" id="pause">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pause-fill" viewBox="0 0 16 16">
						<path d="M5.5 3.5A1.5 1.5 0 0 1 7 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5zm5 0A1.5 1.5 0 0 1 12 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5z"/>
					</svg>
				</button>
				<button class="carButton" id="cycle">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16">
						<path d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"/>
					</svg>
				</button>
							
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active pt10" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="pt10" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" class="pt10" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" class="pt10" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" class="pt10" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" class="pt10" aria-label="Slide 6"></button>
				
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/image/home01.jpg" class="d-block w-100" alt="메인 캐러셀 배너 이미지1">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/image/home02.jpg" class="d-block w-100" alt="메인 캐러셀 배너 이미지2">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/image/home03.jpg" class="d-block w-100" alt="메인 캐러셀 배너 이미지3">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/image/home04.jpg" class="d-block w-100" alt="메인 캐러셀 배너 이미지4">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/image/home05.jpg" class="d-block w-100" alt="메인 캐러셀 배너 이미지5">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/image/home06.png" class="d-block w-100" alt="메인 캐러셀 배너 이미지6">
				</div>
		
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- 오늘의 스토리 영역 -->
		<!-- ====================================================================================== -->
		<!-- ====================================================================================== -->
		<div class="row storyList">
			<div class="storyListTitle">
				오늘의 스토리
				<span class="moreview" onclick="location.href='community/home_list.do?&sort=recent'">더보기</span>
				<div class="clear"></div>
			</div>
			<c:forEach items="${list}" var="vo" varStatus="cnt">
				<div id="storyList${cnt.count }" class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
					<img src="${pageContext.request.contextPath}/upload/${vo.img_system }" class="storyImg" onclick="location.href='${pageContext.request.contextPath}/community/home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx }&nowPage=1'" alt="${vo.title }">
					<div class="storyText">
						<div class="storyTitle" onclick="location.href='${pageContext.request.contextPath}/community/home_view.do?cbidx=${vo.cbidx}&fmidx=${vo.midx }&nowPage=1'">${vo.title }</div>
						<div class="storyWriter" onclick="location.href='${pageContext.request.contextPath}/mypage/Member_page.do?midx=${vo.midx}'">
							<img class="writerImg" src="${pageContext.request.contextPath}/image/${vo.profile_system }" alt="게시글 작성자 사진">${vo.writer }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 추천 상품 영역 -->
		<!-- ====================================================================================== -->
		<!-- ====================================================================================== -->
		<div class="row shopList">
			<div class="shopListTitle">
				추천 상품
				<span class="moreview" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do?type=review_cnt'">더보기</span>
				<div class="clear"></div>
			</div>
		
			<c:forEach items="${storeList}" end="3" var="storeListvo" varStatus="cnt">
				<div id="storeList${cnt.count }" class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop">
					<img src="${pageContext.request.contextPath}/image/${storeListvo.img_system }" class="shopImg" onclick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${storeListvo.spidx}'">
					<div class="shopText" onclick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${storeListvo.spidx}'">
						<div class="shopTitle">
							<div class="brand">${storeListvo.brand}</div>
							${storeListvo.title}
						</div>
						<div class="shopPrice row">
							<div class="discount_area col-4"><span class="red discount">${storeListvo.discount}%</span></div><div class="price_area col-8"><span class="origin">${storeListvo.origin_price}원</span><br>
							${storeListvo.view_price}원</div>
						</div>
						<span class="sky">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
								<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							</svg>
						</span>
						<b>${storeListvo.score}</b> <span class="gray">리뷰 ${storeListvo.review_cnt}</span>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</section>


	
	<%@ include file="footer.jsp" %>
	
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

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
	
	<title>홈 프렌즈에 오신걸 환영합니다.</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/home.js"></script>
	<script src="/controller/js/footer.js"></script>
	
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
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" class="pt10" aria-label="Slide 7"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" class="pt10" aria-label="Slide 8"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8" class="pt10" aria-label="Slide 9"></button>
				
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="image/IU01.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU02.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU03.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU04.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU05.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU06.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU07.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU08.jfif" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/IU09.jfif" class="d-block w-100" alt="...">
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
	            <span class="moreview" onclick="location.href='home_list.do'">더보기</span>
	            <div class="clear"></div>
	         </div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
				<img src="image/story02.webp" class="storyImg" onclick="">
				<div class="storyText" onclick="">
					<div class="storyTitle">내추럴 모던 홈 스타일링</div>
					<div class="storyWriter">
						<img class="writerImg" src="image/winter.png">Winter
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
				<img src="image/story01.webp" class="storyImg" onclick="">
				<div class="storyText" onclick="">
					<div class="storyTitle">맥시멀리스트의 싱글라이프</div>
					<div class="storyWriter">
						<img class="writerImg" src="image/karina.png">Karina
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
				<img src="image/story03.webp" class="storyImg" onclick="">
				<div class="storyText" onclick="">
					<div class="storyTitle">넓은 거실이 있는 30평대 신혼집</div>
					<div class="storyWriter">
						<img class="writerImg" src="image/iu.png">IU
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story hiddenStory">
				<img src="image/story02.webp" class="storyImg" onclick="">
				<div class="storyText" onclick="">
					<div class="storyTitle">내추럴 모던 홈 스타일링</div>
					<div class="storyWriter">
						<img class="writerImg" src="image/winter.png">Winter
					</div>
				</div>
			</div>
		</div>


		<!-- 오늘의 딜 영역 -->
		<!-- ====================================================================================== -->
		<!-- ====================================================================================== -->
		<div class="row shopList">
			<div class="shopListTitle">
	            오늘의 딜
	            <span class="moreview" onclick="location.href='store_list.do'">더보기</span>
	            <div class="clear"></div>
	         </div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop">
				<img src="image/shop01.webp" class="shopImg" onclick="">
				<div class="shopText" onclick="">
					<div class="shopTitle">
						<div class="brand">코코도르</div>
						(1+1) 코코도르 인기 디퓨저 14종
					</div>
					<div class="shopPrice">
						<span class="red">72%</span> 10,900
					</div>
					<span class="sky">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
							<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
					</span>
					<b>4.7</b> <span class="gray">리뷰 7,391</span>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop">
				<img src="image/shop02.webp" class="shopImg" onclick="">
				<div class="shopText" onclick="">
					<div class="shopTitle">
						<div class="brand">픽켄드</div>
						[10%쿠폰/단독컬러] 정말정말 부드러운 두부이불 차렵이불 세트(SS/Q)
					</div>
					<div class="shopPrice">
						<span class="red">47%</span> 46,700
					</div>
					<span class="sky">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
							<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
					</span>
					<b>4.7</b> <span class="gray">리뷰 2,732</span>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop">
				<img src="image/shop03.webp" class="shopImg" onclick="">
				<div class="shopText" onclick="">
					<div class="shopTitle">
						<div class="brand">미닉스</div>
						[2만쿠폰] 미닉스 미니건조기
					</div>
					<div class="shopPrice">
						<span class="red">31%</span> 319,000
					</div>
					<span class="sky">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
							<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
					</span>
					<b>4.8</b> <span class="gray">리뷰 4,432</span>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop hiddenShop">
				<img src="image/shop04.webp" class="shopImg" onclick="">
				<div class="shopText" onclick="">
					<div class="shopTitle">
						<div class="brand">노와</div>
						독일IH 쿡웨어 7P세트 외 주방용품 베스트 모음전
					</div>
					<div class="shopPrice">
						<span class="red">76%</span> 68,900 외
					</div>
					<span class="sky">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
							<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
					</span>
					<b>4.6</b> <span class="gray">리뷰 6,568</span>
				</div>
			</div>
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

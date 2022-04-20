<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL사용하기위한 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
	<title>스토어 - 홈프렌즈</title>
	
	<link href="/controller/css/header.css" rel="stylesheet">
	<link href="/controller/css/nav.css" rel="stylesheet">
	<link href="/controller/css/home.css" rel="stylesheet">
	<link href="/controller/css/footer.css" rel="stylesheet">
	<link href="/controller/css/store/store.css" rel="stylesheet">
	<script src="/controller/js/jquery-3.6.0.min.js"></script>
	<script src="/controller/js/nav.js"></script>
	<script src="/controller/js/header.js"></script>
	<script src="/controller/js/home.js"></script>
	<script src="/controller/js/store/store.js"></script>
	<script src="/controller/js/footer.js"></script>
	
	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	<!-- 본문내용 -->
	<c:if test="${loginUser.grade eq 'A'}">
		<button class="write_btn">
			상품등록
		</button>
	</c:if>
	<section>
		<c:if test="${loginUser.grade eq 'A'}">
		<div class="content_right">
			<button class="write_btn_">
				상품등록
			</button>
		</div>
		</c:if>
		<!-- 이벤트 베너 -->
		<div class="row">
			<img class="col-12" src="/controller/image/store_van.jpg">
		</div>

		<!-- 상품 카테고리 -->
		<div class="row category">
			<div id="10" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img class="category_img" src="/controller/image/furniture.png"><br>
				</div>
				가구
			</div>
			<div id="30" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img class="category_img" src="/controller/image/bedding.png"><br>
				</div>
				침구
			</div>
			<div id="40" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img id="big_img" class="category_img" src="/controller/image/appliances.png"><br>
				</div>
				가전
			</div>
			<div id="20" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img class="category_img" src="/controller/image/light.png"><br>
				</div>
				조명
			</div>
			<div id="50" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img class="category_img" src="/controller/image/kitchen.png"><br>
				</div>
				주방
			</div>
			<div id="60" class="category_link col-4 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				<div class="img_box">
					<img class="category_img" src="/controller/image/daily.png"><br>
				</div>
				생활
			</div>

		</div>

		<!-- 컨텐츠 오늘의 딜 -->
		<div id="deal">
			
			<div class="row shopList">
				<div class="storyListTitle">
		        오늘의 딜
			        <span class="moreview" onClick="location.href='store_list.do?type=Discount'">더보기</span>
			        <div class="clear"></div>
		        </div>
		       <c:forEach items="${list.get(0)}" var="vo" end="3" varStatus="cnt">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" <c:if test="${cnt.last}">id="mdlg_display_none"</c:if> onClick="location.href='/controller/store/store_view.do?spidx=${vo.spidx}'">
					<img src="${vo.img_origin}" class="shopImg" onClick="">
					<div class="shopText" onClick="">
						<div class="shopTitle">
							<div class="brand">${vo.brand}</div>
							${vo.title}
						</div>
						<div class="shopPrice">
							<span class="red">${vo.discount}%</span> ${vo.sale_price}원
						</div>
						<span class="sky">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
								<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							</svg>
						</span>
						<b>${vo.score}</b> <span class="gray">리뷰 ${vo.review_cnt}</span>
					</div>
				</div>
				</c:forEach>
			</div>	
			
		</div>

		<!-- 컨텐츠 베스트 상품 -->
		<div id="deal">
			<div class="row shopList">
				<div class="storyListTitle">
		        Bast
			        <span class="moreview" onClick="location.href='store_list.do?type=sell_cnt'">더보기</span>
			        <div class="clear"></div>
		        </div>
				 <c:forEach items="${list.get(1)}" var="vo" end="3" varStatus="cnt">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" <c:if test="${cnt.last}">id="mdlg_display_none"</c:if> onClick="location.href='/controller/store/store_view.do?spidx=${vo.spidx}'">
					<img src="${vo.img_origin}" class="shopImg" onClick="">
					<div class="shopText" onClick="">
						<div class="shopTitle">
							<div class="brand">${vo.brand}</div>
							${vo.title}
						</div>
						<div class="shopPrice">
							<span class="red">${vo.discount}%</span> ${vo.sale_price}
						</div>
						<span class="sky">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
								<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							</svg>
						</span>
						<b>${vo.score}</b> <span class="gray">리뷰 ${vo.review_cnt}</span>
					</div>
				</div>
				</c:forEach>
				
			</div>
		</div>

		<!-- 컨텐츠 추천 상품 -->
		<div id="deal">
			<div class="row shopList">
				<div class="storyListTitle">
		        추천상품
			        <span class="moreview" onClick="location.href='store_list.do?type=select'">더보기</span>
			        <div class="clear"></div>
		        </div>
				 <c:forEach items="${list.get(2)}" var="vo" end="3" varStatus="cnt">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" <c:if test="${cnt.last}">id="mdlg_display_none"</c:if> onClick="location.href='/controller/store/store_view.do?spidx=${vo.spidx}'">
					<img src="${vo.img_origin}" class="shopImg" onClick="">
					<div class="shopText" onClick="">
						<div class="shopTitle">
							<div class="brand">${vo.brand}</div>
							${vo.title}
						</div>
						<div class="shopPrice">
							<span class="red">${vo.discount}%</span> ${vo.sale_price}
						</div>
						<span class="sky">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
								<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							</svg>
						</span>
						<b>${vo.score}</b> <span class="gray">리뷰 ${vo.review_cnt}</span>
					</div>
				</div>
				</c:forEach>
				
			</div>
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
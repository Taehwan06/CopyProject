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
	<!-- kakao SDK -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <!-- facebook SDK -->
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
   <!-- naver SDK -->
   <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   <!-- sweet alert SDK -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   <!-- 페이지 경로가져오기 -->
   <script>var contextPath = "${pageContext.request.contextPath}"</script>
    
	<title>상품 좋아요 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/store/store_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/store/store.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/home.js"></script>
	<script src="${pageContext.request.contextPath}/js/store/store.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	
   	
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%@ include file="../nav.jsp" %>
	<!-- 본문내용 -->
	<section>
		<!-- 이벤트 베너 -->
		<div class="row" style="margin-bottom: 100px; ">
			<img class="col-12" src="${pageContext.request.contextPath}/image/store_van.jpg">
		</div>


		<!-- 좋아요 상품 -->
		<div id="deal">
			
			<div class="row shopList">
				<div class="storyListTitle">
		        좋아요 상품 목록
			        <div class="clear"></div>
		        </div>
		       <c:forEach items="${likelist}" var="vo" varStatus="cnt">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" onClick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}'">
					<img src="${pageContext.request.contextPath}/image/${vo.img_system}" class="shopImg" onClick="">
					<div class="shopText" onClick="">
						<div class="shopTitle">
							<div class="brand">${vo.brand}</div>
							${vo.title}
						</div>
						<div class="shopPrice row">
							<div class="discount_area col-4"><span class="red discount">${vo.discount}%</span></div><div class="price_area col-8"><span class="origin">${vo.origin_price}원</span><br>
							${vo.view_price}원</div>
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
				 <c:forEach items="${list}" var="vo" end="3" varStatus="cnt">
				<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop" <c:if test="${cnt.count==4}">id="mdlg_display_none"</c:if> onClick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${vo.spidx}'">
					<img src="${pageContext.request.contextPath}/image/${vo.img_system}" class="shopImg" onClick="">
					<div class="shopText" onClick="">
						<div class="shopTitle">
							<div class="brand">${vo.brand}</div>
							${vo.title}
						</div>
						<div class="shopPrice row">
							<div class="discount_area col-4"><span class="red discount">${vo.discount}%</span></div><div class="price_area col-8"><span class="origin">${vo.origin_price}원</span><br>
							${vo.view_price}원</div>
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
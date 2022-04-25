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
	
	<title>검색 결과 - 홈프렌즈</title>
	
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/search_result.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script src="${pageContext.request.contextPath}/js/nav.js"></script>
	<script src="${pageContext.request.contextPath}/js/footer.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>	

</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>

	<!-- 본문 영역 -->
	<section>

		<div class="eventDiv">
			<img src="image/bannerSample1.png" alt="" class="eventImg">
		</div>

		<div class="searchTitle">
			<span class="bold">${searchvo.search_value}</span>에 대한 검색 결과
		</div>

		<!-- 홈 스토리 영역 -->
		<!-- ================================================================================ -->
		<c:if test="${storyList.size() > 0}">
			<div class="row">
				<div class="searchType bold col-8">홈 스토리</div>
				<div class="col-4 moreButtonDiv">
					<span class="moreview" onclick="location.href='${pageContext.request.contextPath}/community/home_list.do?searchValue=${searchvo.search_value}'">더보기</span>
		           	<div class="clear"></div>
				</div>
			</div>
			
			<div class="row storyList">
				<c:forEach items="${storyList}" end="7" var="storyListVO" varStatus="cnt">
					<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 story">
						<img src="${pageContext.request.contextPath}/upload/${storyListVO.img_system}" class="storyImg" 
						onclick="location.href='${pageContext.request.contextPath}/community/home_view.do?cbidx=${storyListVO.cbidx}&nowPage=1'">
						<div class="storyText" onclick="${pageContext.request.contextPath}/community/location.href='home_view.do?cbidx=${storyListVO.cbidx}&nowPage=1'">
							<div class="storyTitle">${storyListVO.title}</div>
							<div class="storyWriter">
								<img class="writerImg" src="${pageContext.request.contextPath}/image/${storyListVO.profile_system}">${storyListVO.writer}
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
			
		</c:if>


		<!-- 스토어 영역 -->
		<!-- ================================================================================ -->
		<c:if test="${storeList.size() > 0}">
			<div class="row">
				<div class="searchType bold col-8">스토어</div>
				<div class="col-4 moreButtonDiv">
					<span class="moreview" onclick="location.href='${pageContext.request.contextPath}/store/store_list.do?searchValue=${searchvo.search_value}'">더보기</span>
		           	<div class="clear"></div>
				</div>
			</div>
				
				<div class="row shopList">
					<c:forEach items="${storeList}" end="7" var="storeListVO" varStatus="cnt">
						<div class="col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 shop">
							<img src="${pageContext.request.contextPath}/image/${storeListVO.img_system }" class="shopImg" 
							onclick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${storeListVO.spidx}'">
							<div class="shopText" onclick="location.href='${pageContext.request.contextPath}/store/store_view.do?spidx=${storeListVO.spidx}'">
								<div class="shopTitle">
									<div class="brand">${storeListVO.brand}</div>
									${storeListVO.title}
								</div>
								<div class="shopPrice">
									<c:if test="${storeListVO.discount > 0}">
										<span class="red">${storeListVO.discount}%</span>
									</c:if>
									${storeListVO.sale_price}
								</div>
								<span class="sky">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
										<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
								</span>
								<b>${storeListVO.score}</b> <span class="gray">리뷰 ${storeListVO.review_cnt}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			
		</c:if>
		
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
